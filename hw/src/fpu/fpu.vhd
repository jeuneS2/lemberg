----------------------------------------------------------------------------
-- This file is part of Lemberg.
-- Copyright (C) 2011 Wolfgang Puffitsch
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

use work.core_pack.all;
use work.op_pack.all;
use work.fpu_pack.all;

entity fpu is
	
	port (
		clk     : in  std_logic;		
		reset   : in  std_logic;
		op      : in  fpop_arr_type;
		fl_in   : in  std_logic_vector(FLAG_COUNT-1 downto 0);
		ena     : in  std_logic;
		wrdata  : in  fpu_wrdata_type;
		rddata  : out std_logic_vector(DATA_WIDTH-1 downto 0));

end fpu;

architecture behavior of fpu is

--	attribute multstyle : string;
--	attribute multstyle of behavior : architecture is "logic";

	type regfile_type is array (0 to FPREG_COUNT/2-1) of std_logic_vector(31 downto 0);
	signal regfile_lo : regfile_type;
	signal regfile_hi : regfile_type;

	signal single_rddataA, single_rddataB, single_rddataC : float32;
	signal single_rddataA_reg : float32;
	
	signal single_cmpvec, double_cmpvec : std_logic_vector(13 downto 0);
	
	signal single_result0 : float32;
	signal single_result1, single_result1_0_reg : float32;
	signal single_result3, single_result3_0_reg, single_result3_1_reg : float32;
	signal single_macresult : float32;
	
	signal double_rddataA, double_rddataB, double_rddataC : float64;
	signal double_rddataA_reg : float64;

	signal double_result0 : float64;
	signal double_result1, double_result1_0_reg : float64;
	signal double_result3, double_result3_0_reg, double_result3_1_reg : float64;
	signal double_macresult : float64;

	signal op_reg : fpop_arr_type;
	signal op_next : fpop_type;
	type op_pipe_type is array (STAGES downto 1) of fpop_type;
	signal op_pipe : op_pipe_type;
	
begin  -- behavior

	single_mac: entity work.mac
		generic map (
			fraction_width => SINGLE_FRACTION_WIDTH,
			exponent_width => SINGLE_EXPONENT_WIDTH,
			stages => STAGES)
		port map (
			clk		=> clk,
			reset	=> reset,
			ena     => ena,
			rddataA => single_rddataA,
			rddataB => single_rddataB,
			rddataC => single_rddataC,
			result  => single_macresult);

	double_mac: entity work.mac
		generic map (
			fraction_width => DOUBLE_FRACTION_WIDTH,
			exponent_width => DOUBLE_EXPONENT_WIDTH,
			stages => STAGES)
		port map (
			clk		=> clk,
			reset	=> reset,
			ena     => ena,
			rddataA => double_rddataA,
			rddataB => double_rddataB,
			rddataC => double_rddataC,
			result  => double_macresult);

	single_cmp: entity work.cmp
		generic map (
			fraction_width => SINGLE_FRACTION_WIDTH,
			exponent_width => SINGLE_EXPONENT_WIDTH)
		port map (
			a	=> single_rddataA,
			b	=> single_rddataB,
			cmp => single_cmpvec);

	double_cmp: entity work.cmp
		generic map (
			fraction_width  => DOUBLE_FRACTION_WIDTH,
			exponent_width => DOUBLE_EXPONENT_WIDTH)
		port map (
			a	=> double_rddataA,
			b	=> double_rddataB,
			cmp => double_cmpvec);

	sync: process (clk, reset)
		variable wra : std_logic_vector(FPREG_BITS-2 downto 0);
		variable wren, wrhi, wrdbl : std_logic;
	begin  -- process sync
		if reset = '0' then
			regfile_hi <= (others => (others => '0'));
			regfile_lo <= (others => (others => '0'));
			
			op_reg <= (others => FPOP_NOP);
			op_pipe <= (others => FPOP_NOP);

			single_rddataA_reg <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
			double_rddataA_reg <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);
			
			single_result1_0_reg <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
			double_result1_0_reg <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);

			single_result3_0_reg <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
			single_result3_1_reg <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
			double_result3_0_reg <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);
			double_result3_1_reg <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);

		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then

				----------------------------------------------------------------
				-- pipelining (allows register retiming)
				----------------------------------------------------------------			
				single_rddataA_reg <= single_rddataA;
				double_rddataA_reg <= double_rddataA;
				
				single_result1_0_reg <= single_result1;
				double_result1_0_reg <= double_result1;

				single_result3_0_reg <= single_result3;
				single_result3_1_reg <= single_result3_0_reg;
				double_result3_0_reg <= double_result3;
				double_result3_1_reg <= double_result3_0_reg;
				
				----------------------------------------------------------------
				-- latch operation
				----------------------------------------------------------------
				op_reg <= op;
				op_pipe(1) <= op_next;
				op_pipe(STAGES downto 2) <= op_pipe(STAGES-1 downto 1);

				----------------------------------------------------------------
				-- handle writes
				----------------------------------------------------------------
				if get_latency(op_next.op) = 0 then
					-- fast operation
					
					wra := op_next.wraddr(FPREG_BITS-1 downto 1);
					wrhi := op_next.wraddr(0);

					if returns_double(op_next.op) then
						regfile_hi(to_integer(unsigned(wra)))
							<= to_slv(double_result0(DOUBLE_EXPONENT_WIDTH
													 downto DOUBLE_EXPONENT_WIDTH-31));
						regfile_lo(to_integer(unsigned(wra)))
							<= to_slv(double_result0(DOUBLE_EXPONENT_WIDTH-32
													 downto DOUBLE_EXPONENT_WIDTH-63));
					else
						if wrhi = '0' then
							regfile_lo(to_integer(unsigned(wra)))
								<= to_slv(single_result0);
						else
							regfile_hi(to_integer(unsigned(wra)))
								<= to_slv(single_result0);	
						end if;
					end if;

				elsif get_latency(op_pipe(1).op) = 1 then
					-- one cycle latency
					
					wra := op_pipe(1).wraddr(FPREG_BITS-1 downto 1);			
					wrhi := op_pipe(1).wraddr(0);

					if returns_double(op_pipe(1).op) then
						regfile_hi(to_integer(unsigned(wra)))
							<= to_slv(double_result1_0_reg(DOUBLE_EXPONENT_WIDTH
														   downto DOUBLE_EXPONENT_WIDTH-31));
						regfile_lo(to_integer(unsigned(wra)))
							<= to_slv(double_result1_0_reg(DOUBLE_EXPONENT_WIDTH-32
														   downto DOUBLE_EXPONENT_WIDTH-63));
					else
						if wrhi = '0' then
							regfile_lo(to_integer(unsigned(wra)))
								<= to_slv(single_result1_0_reg);
						else
							regfile_hi(to_integer(unsigned(wra)))
								<= to_slv(single_result1_0_reg);
						end if;
					end if;

				elsif get_latency(op_pipe(3).op) = 3 then
					-- two cycles latency
					
					wra := op_pipe(3).wraddr(FPREG_BITS-1 downto 1);
					wrhi := op_pipe(3).wraddr(0);

					if returns_double(op_pipe(3).op) then
						regfile_hi(to_integer(unsigned(wra)))
							<= to_slv(double_result3_1_reg(DOUBLE_EXPONENT_WIDTH
														   downto DOUBLE_EXPONENT_WIDTH-31));
						regfile_lo(to_integer(unsigned(wra)))
							<= to_slv(double_result3_1_reg(DOUBLE_EXPONENT_WIDTH-32
														   downto DOUBLE_EXPONENT_WIDTH-63));
					else
						if wrhi = '0' then
							regfile_lo(to_integer(unsigned(wra)))
								<= to_slv(single_result3_1_reg);
						else
							regfile_hi(to_integer(unsigned(wra)))
								<= to_slv(single_result3_1_reg);
						end if;
					end if;

				elsif get_latency(op_pipe(STAGES).op) = STAGES then
					-- fully pipelined operation

					wra := op_pipe(STAGES).wraddr(FPREG_BITS-1 downto 1);			
					wrhi := op_pipe(STAGES).wraddr(0);

					if returns_double(op_pipe(STAGES).op) then
						regfile_hi(to_integer(unsigned(wra)))
							<= to_slv(double_macresult(DOUBLE_EXPONENT_WIDTH
													   downto DOUBLE_EXPONENT_WIDTH-31));
						regfile_lo(to_integer(unsigned(wra)))
							<= to_slv(double_macresult(DOUBLE_EXPONENT_WIDTH-32
													   downto DOUBLE_EXPONENT_WIDTH-63));
					else
						if wrhi = '0' then
							regfile_lo(to_integer(unsigned(wra)))
								<= to_slv(single_macresult);	
						else
							regfile_hi(to_integer(unsigned(wra)))
								<= to_slv(single_macresult);	
						end if;
					end if;				
				end if;
			end if;
		end if;
	end process sync;

	read: process (op_reg, op_pipe, fl_in, wrdata,
				   regfile_lo, regfile_hi,
				   single_cmpvec, double_cmpvec,
				   single_rddataA_reg, double_rddataA_reg)

		variable idx : integer;
		variable valid : std_logic;

		variable loA, hiA, loB, hiB, loC, hiC : std_logic_vector(31 downto 0);
		variable A, B, C : std_logic_vector(63 downto 0);
		
		variable singleA, singleB, singleC : float32;
		variable doubleA, doubleB, doubleC : float64;
		
	begin  -- process read

		idx := 0;
		valid := '0';
		for i in 0 to CLUSTERS-1 loop
			case op_reg(i).cond is
				when COND_TRUE =>
					if unsigned(op_reg(i).flag and fl_in) /= 0 then
						idx := i;
						valid := '1';
					end if;
				when COND_FALSE =>
					if unsigned(op_reg(i).flag and not fl_in) /= 0 then
						idx := i;
						valid := '1';
					end if;						
				when others => null;
			end case;
		end loop;  -- i

		if valid = '1' then
			op_next <= op_reg(idx);
		else
			op_next <= FPOP_NOP;			
		end if;
		
		loA := regfile_lo(to_integer(unsigned(op_reg(idx).rdaddrA(FPREG_BITS-1 downto 1))));
		hiA := regfile_hi(to_integer(unsigned(op_reg(idx).rdaddrA(FPREG_BITS-1 downto 1))));
		loB := regfile_lo(to_integer(unsigned(op_reg(idx).rdaddrB(FPREG_BITS-1 downto 1))));
		hiB := regfile_hi(to_integer(unsigned(op_reg(idx).rdaddrB(FPREG_BITS-1 downto 1))));
		loC := regfile_lo(to_integer(unsigned(op_reg(idx).rdaddrC(FPREG_BITS-1 downto 1))));
		hiC := regfile_hi(to_integer(unsigned(op_reg(idx).rdaddrC(FPREG_BITS-1 downto 1))));
		
		if op_reg(idx).rdaddrA(0) = '0'
		then singleA := float32(loA);
		else singleA := float32(hiA);
		end if;
		if op_reg(idx).rdaddrB(0) = '0'
		then singleB := float32(loB);
		else singleB := float32(hiB);
		end if;
		if op_reg(idx).rdaddrC(0) = '0'
		then singleC := float32(loC);
		else singleC := float32(hiC);
		end if;

		A(31 downto 0)  := loA;
		A(63 downto 32) := hiA;
		B(31 downto 0)  := loB;
		B(63 downto 32) := hiB;
		C(31 downto 0)  := loC;
		C(63 downto 32) := hiC;
		
		doubleA := float64(A);
		doubleB := float64(B);
		doubleC := float64(C);

		--single_rddataA <= singleA;
		--single_rddataB <= singleB;
		--single_rddataC <= singleC;

		--double_rddataA <= doubleA;
		--double_rddataB <= doubleB;
		--double_rddataC <= doubleC;

		single_rddataA <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
		single_rddataB <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
		single_rddataC <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);

		double_rddataA <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);
		double_rddataB <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);
		double_rddataC <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);
		
		single_result0 <= singleA;
		double_result0 <= doubleA;
		single_result1 <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
		double_result1 <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);
		single_result3 <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
		double_result3 <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);

		rddata <= (others => '0');
		
		case op_reg(idx).op is

			----------------------------------------------------------------
			-- Transfer operations
			----------------------------------------------------------------
			when FPU_STX =>
				single_result0 <= float32(wrdata(idx));
			when FPU_LDX =>
				rddata <= to_slv(singleA);

			----------------------------------------------------------------
			-- Single operations
			----------------------------------------------------------------
			when FPU_FMOV =>
				single_result0 <= singleA;
			when FPU_FNEG =>
				single_result0 <= -singleA;
			when FPU_FABS =>
				single_result0 <= abs(singleA);

			when FPU_FZERO =>
				single_result0 <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
				
			when FPU_FCMP =>
				single_rddataA <= singleA;
				single_rddataB <= singleB;
				single_result1 <= float32(resize(unsigned(single_cmpvec), 32));

			-- FADD == A * 1.0 + B
			when FPU_FADD =>
				single_rddataA <= singleA;
				single_rddataB <= float32(to_std_logic_vector(X"3F800000"));
				single_rddataC <= singleB;
			-- FSUB == A * -1.0 + B
			when FPU_FSUB => 
				single_rddataA <= singleA;
				single_rddataB <= float32(to_std_logic_vector(X"BF800000"));
				single_rddataC <= singleB;
			-- FMUL == A * B + 0.0
			when FPU_FMUL => 
				single_rddataA <= singleA;
				single_rddataB <= singleB;
				single_rddataC <= float32(to_std_logic_vector(X"00000000"));
			-- FMAC == A * B + C
			when FPU_FMAC =>
				single_rddataA <= singleA;
				single_rddataB <= singleB;
				single_rddataC <= singleC;

			----------------------------------------------------------------
			-- Double operations
			----------------------------------------------------------------
			when FPU_DMOV =>
				double_result0 <= doubleA;
			when FPU_DNEG =>
				double_result0 <= -doubleA;
			when FPU_DABS =>
				double_result0 <= abs(doubleA);

			when FPU_DZERO =>
				double_result0 <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);

			when FPU_DCMP =>
				double_rddataA <= doubleA;
				double_rddataB <= doubleB;				
				single_result1 <= float32(resize(unsigned(double_cmpvec), 32));
				
			-- DADD == A * 1.0 + B
			when FPU_DADD => 
				double_rddataA <= doubleA;
				double_rddataB <= float64(to_std_logic_vector(X"3FF0000000000000"));
				double_rddataC <= doubleB;
			-- DSUB == A * -1.0 + B
			when FPU_DSUB => 
				double_rddataA <= doubleA;
				double_rddataB <= float64(to_std_logic_vector(X"BFF0000000000000"));
				double_rddataC <= doubleB;
			-- DMUL == A * B + 0.0
			when FPU_DMUL => 
				double_rddataA <= doubleA;
				double_rddataB <= doubleB;
				double_rddataC <= float64(to_std_logic_vector(X"0000000000000000"));
			-- DMAC == A * B + C
			when FPU_DMAC => 
				double_rddataA <= doubleA;
				double_rddataB <= doubleB;
				double_rddataC <= doubleC;

			----------------------------------------------------------------
			-- Conversions, just register inputs
			----------------------------------------------------------------
			when FPU_RND | FPU_DF2SI =>
				double_rddataA <= doubleA;
			when FPU_EXT | FPU_SI2SF | FPU_SI2DF | FPU_SF2SI =>
				single_rddataA <= singleA;
				
			when others => null;						   
		end case;

		case op_pipe(1).op is
			----------------------------------------------------------------
			-- Conversions, compute outputs
			----------------------------------------------------------------
			when FPU_RND =>
				single_result3 <= to_float32(double_rddataA_reg, round_nearest);
			when FPU_EXT =>
				double_result3 <= to_float64(single_rddataA_reg, round_nearest);
				
			when FPU_SI2SF =>
				single_result3 <= to_float(signed(to_slv(single_rddataA_reg)),
										   SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH, round_nearest);
			when FPU_SI2DF =>
				double_result3 <= to_float(signed(to_slv(single_rddataA_reg)),
										   DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH, round_nearest);

			when FPU_SF2SI =>
				single_result3 <= float32(to_signed(single_rddataA_reg, 32, round_zero));
			when FPU_DF2SI =>
				single_result3 <= float32(to_signed(double_rddataA_reg, 32, round_zero));

			when others => null;						   
		end case;
		
	end process read;

end behavior;
