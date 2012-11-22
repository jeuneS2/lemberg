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
use work.core_pack.all;
use work.reg_pack.all;
use work.op_pack.all;

entity alu is
	
	port (
		clk	       : in  std_logic;
		reset      : in  std_logic;
		op   	   : in  op_type;
		ena        : in  std_logic;
		wren       : out std_logic;
		wraddr     : out std_logic_vector(REG_BITS-1 downto 0);
		wrdata     : out std_logic_vector(DATA_WIDTH-1 downto 0);
		zero       : out std_logic;
		neg        : out std_logic;
		ba         : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
		rb_in      : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
		rb_wren    : out std_logic;
		rb_out     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		ro_in      : in  std_logic_vector(PC_WIDTH-1 downto 0);
		ro_wren    : out std_logic;
		ro_out     : out std_logic_vector(PC_WIDTH-1 downto 0);
		fl_in      : in  std_logic_vector(FLAG_COUNT-1 downto 0);
		fl_wren    : out std_logic_vector(FLAG_COUNT-1 downto 0);
		fl_out     : out std_logic_vector(FLAG_COUNT-1 downto 0);
		fpu_rddata : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		fpu_wrdata : out std_logic_vector(DATA_WIDTH-1 downto 0));

end alu;

architecture behavior of alu is

	signal mul0_reg, mul0_next : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mul1_reg, mul1_next : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal add_tmp, sub_tmp: std_logic_vector(DATA_WIDTH downto 0);
	signal eq_tmp, lt_tmp : std_logic;

	function popcount (
		data : std_logic_vector)
		return integer is
		variable half : integer;
	begin  -- popcount
		if data'length = 1 then
			return to_integer(unsigned(data));
		else
			half := data'length/2 + data'right;
			return popcount(data(data'left downto half))
				+ popcount(data(half-1 downto data'right));
		end if;
	end popcount;
    
begin  -- behavior

	assert(BYTES_PER_WORD = 4)
		report "ALU assumes that there are 4 bytes per word"
		severity error;
	
	wraddr <= op.wraddr;				

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			mul0_reg <= (others => '0');
			mul1_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				mul0_reg <= mul0_next;
				mul1_reg <= mul1_next;
			end if;
		end if;
	end process sync;
	
	alu: process (op, fl_in, mul0_reg, mul1_reg, rb_in, ro_in, ba,
				  add_tmp, sub_tmp, eq_tmp, lt_tmp, fpu_rddata)
		variable valid : std_logic;
		variable mul_tmp : std_logic_vector(2*DATA_WIDTH-1 downto 0);
		variable popcnt : integer range 0 to 32;
		variable parity : std_logic;
	begin  -- process alu

		case op.cond is
			when COND_TRUE =>
				if unsigned(op.flag and fl_in) /= 0 then
					valid := '1';
				else
					valid := '0';
				end if;
			when COND_FALSE =>
				if unsigned(op.flag and not fl_in) /= 0 then
					valid := '1';
				else
					valid := '0';
				end if;
			when others =>
				valid := '0';
		end case;

		wren <= '0';
		wrdata <= add_tmp(DATA_WIDTH-1 downto 0);  -- a nice default value

		fl_wren <= (others => '0');
		fl_out <= (others => '0');

		fpu_wrdata <= op.rdmemd0;

		rb_wren <= '0';
		rb_out <= op.rdmemd0(ADDR_WIDTH-1 downto 0);
		ro_wren <= '0';
		ro_out <= op.rdmemd0(PC_WIDTH-1 downto 0);
		
		mul0_next <= mul0_reg;
		mul1_next <= mul1_reg;
		mul_tmp := std_logic_vector(unsigned(op.rddata0) * unsigned(op.rddata1));

		if unsigned(op.rddata0) = 0 then
			zero <= '1';
		else
			zero <= '0';
		end if;
		neg <= op.rddata0(DATA_WIDTH-1);
		
		case op.op is
			when ALU_ADD =>
				wren <= valid;
				wrdata <= add_tmp(DATA_WIDTH-1 downto 0);
			when ALU_SUB =>
				wren <= valid;
				wrdata <= sub_tmp(DATA_WIDTH-1 downto 0);
			when ALU_S1ADD =>
				wren <= valid;
				wrdata <= std_logic_vector(unsigned(op.rddata0)
										   + unsigned(op.rddata1(DATA_WIDTH-2 downto 0)&'0'));
			when ALU_S2ADD =>
				wren <= valid;
				wrdata <= std_logic_vector(unsigned(op.rddata0)
										   + unsigned(op.rddata1(DATA_WIDTH-3 downto 0)&'0'&'0'));
			when ALU_AND =>
				wren <= valid;
				wrdata <= op.rdmemd0 and op.rdmemd1;
			when ALU_OR =>
				wren <= valid;
				wrdata <= op.rdmemd0 or op.rdmemd1;
			when ALU_XOR =>
				wren <= valid;
				wrdata <= op.rdmemd0 xor op.rdmemd1;
			when ALU_SL =>
				wren <= valid;
				wrdata <= std_logic_vector
						  (SHIFT_LEFT(unsigned(op.rddata0),
									  to_integer(unsigned(op.rddata1(DATA_WIDTH_BITS-1 downto 0)))));
			when ALU_SR =>
				wren <= valid;
				wrdata <= std_logic_vector
						  (SHIFT_RIGHT(unsigned(op.rddata0),
									   to_integer(unsigned(op.rddata1(DATA_WIDTH_BITS-1 downto 0)))));
			when ALU_SAR =>
				wren <= valid;
				wrdata <= std_logic_vector
						  (SHIFT_RIGHT(signed(op.rddata0),
									   to_integer(unsigned(op.rddata1(DATA_WIDTH_BITS-1 downto 0)))));
			when ALU_RL =>
				wren <= valid;
				wrdata <= std_logic_vector
						  (ROTATE_LEFT(unsigned(op.rddata0),
									   to_integer(unsigned(op.rddata1(DATA_WIDTH_BITS-1 downto 0)))));
			when ALU_MUL =>
				if op.wraddr(0) = '0' then
					mul0_next <= mul_tmp(DATA_WIDTH-1 downto 0);
				else
					mul1_next <= mul_tmp(DATA_WIDTH-1 downto 0);
				end if;
			when ALU_CARR =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(0) <= add_tmp(DATA_WIDTH);
			when ALU_BORR =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(0) <= sub_tmp(DATA_WIDTH);
			when ALU_SEXT8 =>
				wren <= valid;
                wrdata <= std_logic_vector(
                    resize(signed(op.rdmemd1(BYTE_WIDTH-1 downto 0)), DATA_WIDTH));
            when ALU_SEXT16 =>
				wren <= valid;
                wrdata <= std_logic_vector(
                    resize(signed(op.rdmemd1(2*BYTE_WIDTH-1 downto 0)), DATA_WIDTH));
            when ALU_ZEXT8 =>
				wren <= valid;
                wrdata <= std_logic_vector(
                    resize(unsigned(op.rdmemd1(BYTE_WIDTH-1 downto 0)), DATA_WIDTH));
            when ALU_ZEXT16 =>
				wren <= valid;
                wrdata <= std_logic_vector(
                    resize(unsigned(op.rdmemd1(2*BYTE_WIDTH-1 downto 0)), DATA_WIDTH));
            when ALU_CLZ =>
				wren <= valid;
                wrdata <= (others => '0');
                for i in 1 to DATA_WIDTH loop
                    if op.rddata1(DATA_WIDTH-i) = '0' then
                        wrdata <= std_logic_vector(to_unsigned(i, DATA_WIDTH));
                    else
                        exit;
                    end if;
                end loop;  -- i
            when ALU_CTZ =>
				wren <= valid;
                wrdata <= (others => '0');
                for i in 1 to DATA_WIDTH loop
                    if op.rddata1(i-1) = '0' then
                        wrdata <= std_logic_vector(to_unsigned(i, DATA_WIDTH));
                    else
                        exit;
                    end if;
                end loop;  -- i
            when ALU_POP | ALU_PAR =>
				wren <= valid;
                popcnt := popcount(op.rddata1);
                if op.op = ALU_POP then
                    wrdata <= std_logic_vector(to_unsigned(popcnt, DATA_WIDTH));
                else
                    wrdata <= std_logic_vector(to_unsigned(popcnt mod 2, DATA_WIDTH));
                end if;
			when ALU_MSEXT8 =>
				wren <= valid;
				case op.rdmemd1(1 downto 0) is
					when "00" =>
						wrdata <= (others => op.rdmemd0(BYTE_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(BYTE_WIDTH-1 downto 0);
					when "01" =>
						wrdata <= (others => op.rdmemd0(2*BYTE_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(2*BYTE_WIDTH-1 downto BYTE_WIDTH);
					when "10" =>
						wrdata <= (others => op.rdmemd0(3*BYTE_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH);
					when "11" =>
						wrdata <= (others => op.rdmemd0(DATA_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(DATA_WIDTH-1 downto 3*BYTE_WIDTH);
					when others => null;
				end case;
			when ALU_MSEXT16 =>
				wren <= valid;
				if op.rdmemd1(1) = '0' then
					wrdata <= (others => op.rdmemd0(2*BYTE_WIDTH-1));
					wrdata(2*BYTE_WIDTH-1 downto 0) <= op.rdmemd0(2*BYTE_WIDTH-1 downto 0);
				else
					wrdata <= (others => op.rdmemd0(DATA_WIDTH-1));
					wrdata(2*BYTE_WIDTH-1 downto 0) <= op.rdmemd0(DATA_WIDTH-1 downto 2*BYTE_WIDTH);
				end if;
			when ALU_MZEXT8 =>
				wren <= valid;
				wrdata <= (others => '0');
				case op.rdmemd1(1 downto 0) is
					when "00" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(BYTE_WIDTH-1 downto 0);
					when "01" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(2*BYTE_WIDTH-1 downto BYTE_WIDTH);
					when "10" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH);
					when "11" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= op.rdmemd0(DATA_WIDTH-1 downto 3*BYTE_WIDTH);
					when others => null;
				end case;
			when ALU_MZEXT16 =>
				wren <= valid;
				wrdata <= (others => '0');				
				if op.rdmemd1(1) = '0' then
					wrdata(2*BYTE_WIDTH-1 downto 0) <= op.rdmemd0(2*BYTE_WIDTH-1 downto 0);
				else
					wrdata(2*BYTE_WIDTH-1 downto 0) <= op.rdmemd0(DATA_WIDTH-1 downto 2*BYTE_WIDTH);
				end if;

			when ALU_LDI =>
				wren <= valid;
				wrdata <= op.rddata1;  -- beware: we're moving in the second operand!
			when ALU_CMPEQ =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= eq_tmp;
			when ALU_CMPNE =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= not eq_tmp;
			when ALU_CMPLT =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= lt_tmp;
			when ALU_CMPGE =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= not lt_tmp;
			when ALU_CMPGT =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= not (lt_tmp or eq_tmp);
			when ALU_CMPLE =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= lt_tmp or eq_tmp;
			when ALU_CMPULT =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= sub_tmp(DATA_WIDTH);
			when ALU_CMPUGE =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= not sub_tmp(DATA_WIDTH);
			when ALU_CMPUGT =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= not (sub_tmp(DATA_WIDTH) or eq_tmp);
			when ALU_CMPULE =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= sub_tmp(DATA_WIDTH) or eq_tmp;
			when ALU_BTEST =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= op.wraddr(FLAG_BITS) xor
					op.rddata0(to_integer(unsigned(op.rddata1(DATA_WIDTH_BITS-1 downto 0))));
			when ALU_CCAND =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <=
					(op.rddata1(1) xor fl_in(to_integer(unsigned(op.rddata1(FLAG_BITS+5 downto 6)))))
					and (op.rddata1(0) xor fl_in(to_integer(unsigned(op.rddata1(FLAG_BITS+1 downto 2)))));
			when ALU_CCOR =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <=
					(op.rddata1(1) xor fl_in(to_integer(unsigned(op.rddata1(FLAG_BITS+5 downto 6)))))
					or (op.rddata1(0) xor fl_in(to_integer(unsigned(op.rddata1(FLAG_BITS+1 downto 2)))));
			when ALU_CCXOR =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <=
					(op.rddata1(1) xor fl_in(to_integer(unsigned(op.rddata1(FLAG_BITS+5 downto 6)))))
					xor (op.rddata1(0) xor fl_in(to_integer(unsigned(op.rddata1(FLAG_BITS+1 downto 2)))));
			when ALU_LDCOND =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(0) <= fl_in(to_integer(unsigned(op.rdaddr0(FLAG_BITS-1 downto 0))));
			when ALU_LDMUL =>
				wren <= valid;
				if op.rdaddr0(0) = '0' then
					wrdata <= std_logic_vector(unsigned(mul0_reg)+unsigned(op.rddata1));
				else
					wrdata <= std_logic_vector(unsigned(mul1_reg)+unsigned(op.rddata1));
				end if;
			when ALU_LDFP =>
				-- just fetch data, actual reading is done in FPU
				wren <= valid;
				wrdata <= fpu_rddata;
			when ALU_STCOND =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= op.rdmemd0(0);
			when ALU_STMUL =>
				if valid = '1' then
					if op.wraddr(0) = '0' then
						mul0_next <= op.rdmemd0;
					else
						mul1_next <= op.rdmemd0;
					end if;
				end if;
			when ALU_STFP =>
				-- just deliver data, actual writing is done in FPU
				fpu_wrdata <= op.rdmemd0;
			when ALU_LDRB =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(ADDR_WIDTH-1 downto 0) <= rb_in;
			when ALU_STRB =>
				rb_wren <= valid;
			when ALU_LDRO =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(PC_WIDTH-1 downto 0) <= ro_in;
			when ALU_STRO =>
				ro_wren <= valid;
			when ALU_LDBA =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(ADDR_WIDTH-1 downto 0) <= ba;
			when others =>
				assert false report "Invalid ALU operation" severity error;
		end case;
	end process alu;

	addsub: process (op)
	begin  -- process addsub
		add_tmp <= std_logic_vector(resize(unsigned(op.rddata0), DATA_WIDTH+1)
									+ resize(unsigned(op.rddata1), DATA_WIDTH+1));
		sub_tmp <= std_logic_vector(resize(unsigned(op.rddata0), DATA_WIDTH+1)
									- resize(unsigned(op.rddata1), DATA_WIDTH+1));

		lt_tmp <= '0';
		if signed(op.rddata0) < signed(op.rddata1) then
			lt_tmp <= '1';
		end if;

		eq_tmp <= '0';
		if op.rddata0 = op.rddata1 then
			eq_tmp <= '1';
		end if;
	end process addsub;

end behavior;
