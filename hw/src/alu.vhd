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
		memdata    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
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

	signal mul_reg, mul_next : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal add_tmp, sub_tmp: std_logic_vector(DATA_WIDTH downto 0);
	signal eq_tmp : std_logic;

	-- extract and mask bytes and halfwords from word
	function mask (
		data    : std_logic_vector(DATA_WIDTH-1 downto 0);
		pattern : std_logic_vector(2 downto 0);
		offset  : std_logic_vector(1 downto 0))
		return std_logic_vector is

	variable result : std_logic_vector(DATA_WIDTH-1 downto 0);

	begin
		case pattern is
			when "000" => -- extract unsigned byte
				result := (others => '0');
				case offset is
					when "00" =>
						result(BYTE_WIDTH-1 downto 0) := data(BYTE_WIDTH-1 downto 0);
					when "01" =>
						result(BYTE_WIDTH-1 downto 0) := data(2*BYTE_WIDTH-1 downto BYTE_WIDTH);
					when "10" =>
						result(BYTE_WIDTH-1 downto 0) := data(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH);
					when "11" =>
						result(BYTE_WIDTH-1 downto 0) := data(DATA_WIDTH-1 downto 3*BYTE_WIDTH);
					when others => null;
				end case;
			when "001" => -- extract unsigned halfword
				result := (others => '0');
				case offset(1) is
					when '0' =>
						result(2*BYTE_WIDTH-1 downto 0) := data(2*BYTE_WIDTH-1 downto 0);
					when '1' =>
						result(2*BYTE_WIDTH-1 downto 0) := data(DATA_WIDTH-1 downto 2*BYTE_WIDTH);
					when others => null;
				end case;
			when "010" => -- extract signed byte
				case offset is
					when "00" =>
						result := (others => data(BYTE_WIDTH-1));
						result(BYTE_WIDTH-1 downto 0) := data(BYTE_WIDTH-1 downto 0);
					when "01" =>
						result := (others => data(2*BYTE_WIDTH-1));
						result(BYTE_WIDTH-1 downto 0) := data(2*BYTE_WIDTH-1 downto BYTE_WIDTH);
					when "10" =>
						result := (others => data(3*BYTE_WIDTH-1));
						result(BYTE_WIDTH-1 downto 0) := data(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH);
					when "11" =>
						result := (others => data(DATA_WIDTH-1));
						result(BYTE_WIDTH-1 downto 0) := data(DATA_WIDTH-1 downto 3*BYTE_WIDTH);
					when others => null;
				end case;
			when "011" => -- extract signed halfword
				case offset(1) is
					when '0' =>
						result := (others => data(2*BYTE_WIDTH-1));
						result(2*BYTE_WIDTH-1 downto 0) := data(2*BYTE_WIDTH-1 downto 0);
					when '1' =>
						result := (others => data(DATA_WIDTH-1));
						result(2*BYTE_WIDTH-1 downto 0) := data(DATA_WIDTH-1 downto 2*BYTE_WIDTH);
					when others => null;
				end case;
			when "100" => -- shift in byte
				result := (others => '0');
				case offset is
					when "00" =>
						result(BYTE_WIDTH-1 downto 0) := data(BYTE_WIDTH-1 downto 0);
					when "01" =>
						result(2*BYTE_WIDTH-1 downto BYTE_WIDTH) := data(BYTE_WIDTH-1 downto 0);
					when "10" =>
						result(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH) := data(BYTE_WIDTH-1 downto 0);
					when "11" =>
						result(DATA_WIDTH-1 downto 3*BYTE_WIDTH) := data(BYTE_WIDTH-1 downto 0);
					when others => null;
				end case;
			when "101" => -- shift in halfword
				result := (others => '0');
				case offset(1) is
					when '0' =>
						result(2*BYTE_WIDTH-1 downto 0) := data(2*BYTE_WIDTH-1 downto 0);
					when '1' =>
						result(DATA_WIDTH-1 downto 2*BYTE_WIDTH) := data(2*BYTE_WIDTH-1 downto 0);
					when others => null;
				end case;
			when "110" => -- mask out byte
				result := data;
				case offset is
					when "00" =>
						result(BYTE_WIDTH-1 downto 0) := (others => '0');
					when "01" =>
						result(2*BYTE_WIDTH-1 downto BYTE_WIDTH) := (others => '0');
					when "10" =>
						result(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH) := (others => '0');
					when "11" =>
						result(DATA_WIDTH-1 downto 3*BYTE_WIDTH) := (others => '0');
					when others => null;
				end case;
			when "111" => -- mask out halfword
				result := data;
				case offset(1) is
					when '0' =>
						result(2*BYTE_WIDTH-1 downto 0) := (others => '0');
					when '1' =>
						result(DATA_WIDTH-1 downto 2*BYTE_WIDTH) := (others => '0');
					when others => null;
				end case;
			when others => null;
		end case;

		return result;
		
	end mask;
	
begin  -- behavior

	assert(BYTES_PER_WORD = 4)
		report "ALU assumes that there are 4 bytes per word"
		severity error;
	
	wraddr <= op.wraddr;				

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			mul_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				mul_reg <= mul_next;
			end if;
		end if;
	end process sync;
	
	alu: process (op, fl_in, mul_reg, rb_in, ro_in, ba, memdata,
				  add_tmp, sub_tmp, eq_tmp, fpu_rddata)
		variable valid : std_logic;
		variable mul_tmp : std_logic_vector(2*DATA_WIDTH-1 downto 0);
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

		fpu_wrdata <= op.rddata0;

		rb_wren <= '0';
		rb_out <= op.rddata0(ADDR_WIDTH-1 downto 0);
		ro_wren <= '0';
		ro_out <= op.rddata0(PC_WIDTH-1 downto 0);
		
		mul_next <= mul_reg;
		
		case op.op is
			when ALU_ADD =>
				wren <= valid;
				wrdata <= add_tmp(DATA_WIDTH-1 downto 0);
			when ALU_SUB =>
				wren <= valid;
				wrdata <= sub_tmp(DATA_WIDTH-1 downto 0);
			when ALU_S2ADD =>
				wren <= valid;
				wrdata <= std_logic_vector(unsigned(op.rddata0)
										   + unsigned(op.rddata1(DATA_WIDTH-3 downto 0)&'0'&'0'));
			when ALU_AND =>
				wren <= valid;
				wrdata <= op.rddata0 and op.rddata1;
			when ALU_OR =>
				wren <= valid;
				wrdata <= op.rddata0 or op.rddata1;
			when ALU_XOR =>
				wren <= valid;
				wrdata <= op.rddata0 xor op.rddata1;
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
				mul_tmp := std_logic_vector(unsigned(op.rddata0) * unsigned(op.rddata1));
				mul_next <= mul_tmp(DATA_WIDTH-1 downto 0);
			when ALU_CARR =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(0) <= add_tmp(DATA_WIDTH_BITS);
			when ALU_BORR =>
				wren <= valid;
				wrdata <= (others => '0');
				wrdata(0) <= sub_tmp(DATA_WIDTH_BITS);
			when ALU_MASK =>
				wren <= valid;
				wrdata <= mask(op.rddata0, op.rddata1(4 downto 2), op.rddata1(1 downto 0));
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
					<= (op.rddata0(DATA_WIDTH-1) and not op.rddata1(DATA_WIDTH-1))
					or (sub_tmp(DATA_WIDTH-1)
						and (op.rddata0(DATA_WIDTH-1) xnor op.rddata1(DATA_WIDTH-1)));
			when ALU_CMPLE =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= (op.rddata0(DATA_WIDTH-1) and not op.rddata1(DATA_WIDTH-1))
					or (sub_tmp(DATA_WIDTH-1)
						and (op.rddata0(DATA_WIDTH-1) xnor op.rddata1(DATA_WIDTH-1)))
					or eq_tmp;
			when ALU_CMPULT =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0))))
					<= sub_tmp(DATA_WIDTH);
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
					<= op.rddata0(to_integer(unsigned(op.rddata1(DATA_WIDTH_BITS-1 downto 0))));
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
			when ALU_LDMEM =>
				wren <= valid;
				wrdata <= memdata;
			when ALU_LDMEMHU =>
				wren <= valid;
				wrdata <= (others => '0');				
				if op.rddata1(1) = '0' then
					wrdata(2*BYTE_WIDTH-1 downto 0) <= memdata(2*BYTE_WIDTH-1 downto 0);
				else
					wrdata(2*BYTE_WIDTH-1 downto 0) <= memdata(DATA_WIDTH-1 downto 2*BYTE_WIDTH);
				end if;
			when ALU_LDMEMHS =>
				wren <= valid;
				if op.rddata1(1) = '0' then
					wrdata <= (others => memdata(2*BYTE_WIDTH-1));
					wrdata(2*BYTE_WIDTH-1 downto 0) <= memdata(2*BYTE_WIDTH-1 downto 0);
				else
					wrdata <= (others => memdata(DATA_WIDTH-1));
					wrdata(2*BYTE_WIDTH-1 downto 0) <= memdata(DATA_WIDTH-1 downto 2*BYTE_WIDTH);
				end if;
			when ALU_LDMEMBU =>
				wren <= valid;
				wrdata <= (others => '0');
				case op.rddata1(1 downto 0) is
					when "00" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(BYTE_WIDTH-1 downto 0);
					when "01" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(2*BYTE_WIDTH-1 downto BYTE_WIDTH);
					when "10" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH);
					when "11" =>
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(DATA_WIDTH-1 downto 3*BYTE_WIDTH);
					when others => null;
				end case;
			when ALU_LDMEMBS =>
				wren <= valid;
				case op.rddata1(1 downto 0) is
					when "00" =>
						wrdata <= (others => memdata(BYTE_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(BYTE_WIDTH-1 downto 0);
					when "01" =>
						wrdata <= (others => memdata(2*BYTE_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(2*BYTE_WIDTH-1 downto BYTE_WIDTH);
					when "10" =>
						wrdata <= (others => memdata(3*BYTE_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(3*BYTE_WIDTH-1 downto 2*BYTE_WIDTH);
					when "11" =>
						wrdata <= (others => memdata(DATA_WIDTH-1));
						wrdata(BYTE_WIDTH-1 downto 0)
							<= memdata(DATA_WIDTH-1 downto 3*BYTE_WIDTH);
					when others => null;
				end case;
			when ALU_LDMUL =>
				wren <= valid;
				wrdata <= mul_reg;
			when ALU_LDFP =>
				-- just fetch data, actual reading is done in FPU
				wren <= valid;
				wrdata <= fpu_rddata;
			when ALU_STCOND =>
				fl_wren <= (others => '0');
				fl_wren(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= valid;
				fl_out <= (others => '0');
				fl_out(to_integer(unsigned(op.wraddr(FLAG_BITS-1 downto 0)))) <= op.rddata0(0);
			when ALU_STMUL =>
				if valid = '1' then
					mul_next <= op.rddata0;
				end if;
			when ALU_STFP =>
				-- just deliver data, actual writing is done in FPU
				fpu_wrdata <= op.rddata0;
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
		eq_tmp <= '0';
		if op.rddata0 = op.rddata1 then
			eq_tmp <= '1';
		end if;
	end process addsub;

end behavior;
