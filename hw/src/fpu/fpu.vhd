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
	signal double_rddataA, double_rddataB, double_rddataC : float64;

	type single_result_type is array (0 to STAGES) of float32;
	signal single_result : single_result_type;
	type double_result_type is array (0 to STAGES) of float64;
	signal double_result : double_result_type;

	signal single_cmpvec, double_cmpvec : std_logic_vector(13 downto 0);
	signal rnd_result, si2sf_result, sf2si_result, df2si_result : float32;
	signal ext_result, si2df_result : float64;	
	signal single_mac_result : float32;
	signal double_mac_result : float64;
	
	signal op_reg : fpop_arr_type;
	signal op_next : fpop_type;
	type op_pipe_type is array (STAGES downto 1) of fpop_type;
	signal op_pipe : op_pipe_type;
	
begin  -- behavior

	single_mac: entity work.mac
		generic map (
			fraction_width => SINGLE_FRACTION_WIDTH,
			exponent_width => SINGLE_EXPONENT_WIDTH,
			stages => 6)
		port map (
			clk		=> clk,
			reset	=> reset,
			ena     => ena,
			rddataA => single_rddataA,
			rddataB => single_rddataB,
			rddataC => single_rddataC,
			result  => single_mac_result);

	double_mac: entity work.mac
		generic map (
			fraction_width => DOUBLE_FRACTION_WIDTH,
			exponent_width => DOUBLE_EXPONENT_WIDTH,
			stages => 7)
		port map (
			clk		=> clk,
			reset	=> reset,
			ena     => ena,
			rddataA => double_rddataA,
			rddataB => double_rddataB,
			rddataC => double_rddataC,
			result  => double_mac_result);

	single_cmp: entity work.cmp
		generic map (
			stages => 1,
			fraction_width => SINGLE_FRACTION_WIDTH,
			exponent_width => SINGLE_EXPONENT_WIDTH)
		port map (
			clk => clk,
			ena => ena,
			a	=> single_rddataA,
			b	=> single_rddataB,
			cmp => single_cmpvec);

	double_cmp: entity work.cmp
		generic map (
			stages => 2,
			fraction_width  => DOUBLE_FRACTION_WIDTH,
			exponent_width => DOUBLE_EXPONENT_WIDTH)
		port map (
			clk => clk,
			ena => ena,
			a	=> double_rddataA,
			b	=> double_rddataB,
			cmp => double_cmpvec);

	rnd: entity work.rnd
		port map (
			clk => clk,
			ena => ena,
			i => double_rddataA,
			o => rnd_result);

	ext: entity work.ext
		port map (
			clk => clk,
			ena => ena,
			i => single_rddataA,
			o => ext_result);

	si2sf: entity work.si2sf
		port map (
			clk => clk,
			ena => ena,
			i => single_rddataA,
			o => si2sf_result);

	si2df: entity work.si2df
		port map (
			clk => clk,
			ena => ena,
			i => single_rddataA,
			o => si2df_result);

	sf2si: entity work.sf2si
		port map (
			clk => clk,
			ena => ena,
			i => single_rddataA,
			o => sf2si_result);

	df2si: entity work.df2si
		port map (
			clk => clk,
			ena => ena,
			i => double_rddataA,
			o => df2si_result);

	sync: process (clk, reset)
		variable wra : std_logic_vector(FPREG_BITS-2 downto 0);
		variable wren, wrhi, wrdbl : std_logic;
		variable r0, r1 : std_logic_vector(31 downto 0);
	begin  -- process sync
		if reset = '0' then
			regfile_hi <= (others => (others => '0'));
			regfile_lo <= (others => (others => '0'));
			
			op_reg <= (others => FPOP_NOP);
			op_pipe <= (others => FPOP_NOP);

		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then

				----------------------------------------------------------------
				-- latch operation
				----------------------------------------------------------------
				op_reg <= op;
				op_pipe(1) <= op_next;
				op_pipe(STAGES downto 2) <= op_pipe(STAGES-1 downto 1);

				----------------------------------------------------------------
				-- handle writes
				----------------------------------------------------------------
				wren  := '0';
				wra   := (others => '0');
				wrhi  := '0';
				wrdbl := '0';
				r0    := (others => '0');
				r1    := (others => '0');
				
				if get_latency(op_next.op) = 0 then
					-- fast operation

					wren := '1';
					wra  := op_next.wraddr(FPREG_BITS-1 downto 1);
					wrhi := op_next.wraddr(0);
					
					if returns_double(op_next.op) then
						wrdbl := '1';
						r1 := to_slv(double_result(0)(DOUBLE_EXPONENT_WIDTH
													  downto DOUBLE_EXPONENT_WIDTH-31));
						r0 := to_slv(double_result(0)(DOUBLE_EXPONENT_WIDTH-32
													  downto DOUBLE_EXPONENT_WIDTH-63));
					else
						r0 := to_slv(single_result(0));
					end if;
				end if;
				
				for i in 1 to STAGES loop
					if get_latency(op_pipe(i).op) = i then

						wren := '1';
						wra  := wra  or op_pipe(i).wraddr(FPREG_BITS-1 downto 1);			
						wrhi := wrhi or op_pipe(i).wraddr(0);

						if returns_double(op_pipe(i).op) then
							wrdbl := '1';
							r1 := to_slv(double_result(i)(DOUBLE_EXPONENT_WIDTH
														  downto DOUBLE_EXPONENT_WIDTH-31));
							r0 := to_slv(double_result(i)(DOUBLE_EXPONENT_WIDTH-32
														  downto DOUBLE_EXPONENT_WIDTH-63));
						else
							r0 := r0 or to_slv(single_result(i));
						end if;
					end if;
				end loop;  -- i

				if wren = '1' then
					if wrdbl = '1' then
						regfile_lo(to_integer(unsigned(wra))) <= r0;
						regfile_hi(to_integer(unsigned(wra))) <= r1;
					else
						if wrhi = '0' then							
							regfile_lo(to_integer(unsigned(wra))) <= r0;
						else
							regfile_hi(to_integer(unsigned(wra))) <= r0;
						end if;
					end if;
				end if;
				
			end if;
		end if;
	end process sync;

	read: process (op_reg, op_pipe, fl_in, wrdata,
				   regfile_lo, regfile_hi,
				   single_cmpvec, double_cmpvec,
				   rnd_result, ext_result,
				   si2sf_result, si2df_result, sf2si_result, df2si_result,
				   single_mac_result, double_mac_result)

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

		single_result <= (others => zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH));
		double_result <= (others => zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH));
		-- a few default results to minimize multiplexing
		single_result(0) <= singleA;
		double_result(0) <= doubleA;
		single_result(1) <= float32(resize(unsigned(single_cmpvec), 32));
		single_result(2) <= float32(resize(unsigned(double_cmpvec), 32));
		double_result(2) <= si2df_result;
		double_result(3) <= ext_result;
		single_result(4) <= rnd_result;
		single_result(6) <= single_mac_result;
		double_result(7) <= double_mac_result;

		rddata <= (others => '0');
		
		case op_reg(idx).op is

			----------------------------------------------------------------
			-- Transfer operations
			----------------------------------------------------------------
			when FPU_STX =>
				single_result(0) <= float32(wrdata(idx));
			when FPU_LDX =>
				rddata <= to_slv(singleA);

			----------------------------------------------------------------
			-- Single operations
			----------------------------------------------------------------
			when FPU_FMOV =>
				single_result(0) <= singleA;
			when FPU_FNEG =>
				single_result(0) <= -singleA;
			when FPU_FABS =>
				single_result(0) <= abs(singleA);

			when FPU_FZERO =>
				single_result(0) <= zerofp(SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH);
				
			when FPU_FCMP =>
				single_rddataA <= singleA;
				single_rddataB <= singleB;

			-- FADD == A * 1.0 + B
			when FPU_FADD =>
				single_rddataA <= singleA;
				single_rddataB <= float32(to_std_logic_vector(X"3F800000"));
				single_rddataC <= singleB;
			-- FSUB == A * -1.0 + B
			when FPU_FSUB => 
				single_rddataA <= singleA;
				single_rddataB <= float32(to_std_logic_vector(X"3F800000"));
				single_rddataC <= -singleB;
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
				double_result(0) <= doubleA;
			when FPU_DNEG =>
				double_result(0) <= -doubleA;
			when FPU_DABS =>
				double_result(0) <= abs(doubleA);

			when FPU_DZERO =>
				double_result(0) <= zerofp(DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH);

			when FPU_DCMP =>
				double_rddataA <= doubleA;
				double_rddataB <= doubleB;				
				
			-- DADD == A * 1.0 + B
			when FPU_DADD => 
				double_rddataA <= doubleA;
				double_rddataB <= float64(to_std_logic_vector(X"3FF0000000000000"));
				double_rddataC <= doubleB;
			-- DSUB == A * -1.0 + B
			when FPU_DSUB => 
				double_rddataA <= doubleA;
				double_rddataB <= float64(to_std_logic_vector(X"3FF0000000000000"));
				double_rddataC <= -doubleB;
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
			-- Conversions
			----------------------------------------------------------------
			when FPU_RND | FPU_DF2SI =>
				double_rddataA <= doubleA;
			when FPU_EXT | FPU_SI2SF | FPU_SI2DF | FPU_SF2SI =>
				single_rddataA <= singleA;
				
			when others => null;						   
		end case;

		case op_pipe(1).op is
			----------------------------------------------------------------
			-- Single precision comparison, fetch results
			----------------------------------------------------------------
			when FPU_FCMP =>
				single_result(1) <= float32(resize(unsigned(single_cmpvec), 32));
			when others => null;
		end case;

		case op_pipe(2).op is
			----------------------------------------------------------------
			-- Double precision comparison, fetch results
			----------------------------------------------------------------
			when FPU_DCMP =>
				single_result(2) <= float32(resize(unsigned(double_cmpvec), 32));
			----------------------------------------------------------------
			-- Cheap conversions, fetch results
			----------------------------------------------------------------
			when FPU_SI2SF =>
				single_result(2) <= si2sf_result;
			when FPU_SI2DF =>
				double_result(2) <= si2df_result;
			when FPU_SF2SI =>
				single_result(2) <= sf2si_result;
			when FPU_DF2SI =>
				single_result(2) <= df2si_result;
			when others => null;
		end case;

		case op_pipe(3).op is
			----------------------------------------------------------------
			-- Expensive conversion, fetch results
			----------------------------------------------------------------
			when FPU_EXT =>
				double_result(3) <= ext_result;
			when others => null;						   
		end case;

		case op_pipe(4).op is
			----------------------------------------------------------------
			-- Expensive conversion, fetch results
			----------------------------------------------------------------
			when FPU_RND =>
				single_result(4) <= rnd_result;
			when others => null;						   
		end case;

		case op_pipe(6).op is
			----------------------------------------------------------------
			-- Fetch results from single precision MAC unit
			----------------------------------------------------------------
			when FPU_FADD | FPU_FSUB | FPU_FMUL | FPU_FMAC =>
				single_result(6) <= single_mac_result;
			when others => null;						   
		end case;

		case op_pipe(7).op is
			----------------------------------------------------------------
			-- Fetch results from double precision MAC unit
			----------------------------------------------------------------
			when FPU_DADD | FPU_DSUB | FPU_DMUL | FPU_DMAC =>
				double_result(7) <= double_mac_result;
			when others => null;						   
		end case;

	end process read;

end behavior;
