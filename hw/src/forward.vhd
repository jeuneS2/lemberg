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
use work.op_pack.all;
use work.reg_pack.all;
use work.mem_pack.all;
use work.io_pack.all;

entity forward is
	
	port (
		clk	        : in  std_logic;
		reset       : in  std_logic;
		ena         : in  std_logic;
		wren        : in  reg_wren_type;
		wraddr      : in  reg_wraddr_type;
		wrdata      : in  reg_wrdata_type;
		op_in       : in  op_arr_type;
		op_out      : out op_arr_type;
		memop_in    : in  memop_arr_type;
		memop_out   : out memop_arr_type;
		stallop_in  : in  stallop_arr_type;
		stallop_out : out stallop_arr_type;
		jmpop_in    : in  jmpop_arr_type;
		jmpop_out   : out jmpop_arr_type);
	
end forward;

architecture behavior of forward is

	signal wren_reg : reg_wren_type;
	signal wraddr_reg : reg_wraddr_type;
	signal wrdata_reg : reg_wrdata_type;
	signal wrdata_jmp_reg : reg_wrdata_type;
	signal op_reg : op_arr_type;
	signal memop_reg : memop_arr_type;
	signal stallop_reg : stallop_arr_type;
	signal jmpop_reg : jmpop_arr_type;
	
begin  -- behavior

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)

			wren_reg <= (others => '0');
			wraddr_reg <= (others => (others => '0'));
			wrdata_reg <= (others => (others => '0'));
			wrdata_jmp_reg <= (others => (others => '0'));
			
			for i in 0 to CLUSTERS-1 loop
				op_reg(i) <= OP_NOP;
			end loop;  -- i

			for i in 0 to CLUSTERS-1 loop
				memop_reg(i) <= MEMOP_NOP;
			end loop;  -- i
			-- first thing to do is to call boot procedure
			memop_reg(0).op <= MEM_CALL;
			memop_reg(0).cond <= COND_TRUE;
			memop_reg(0).flag <= (others => '0');
			memop_reg(0).flag(0) <= '1';
			-- boot ROM is at bottom of IO space
			memop_reg(0).address <= (others => '0');
			memop_reg(0).address(ADDR_WIDTH-1+2 downto ADDR_WIDTH-AREAMUX_BITS+2) <= IO_SELECT;

			for i in 0 to CLUSTERS-1 loop
				stallop_reg(i) <= STALLOP_NOP;				
			end loop;  -- i			

			for i in 0 to CLUSTERS-1 loop
				jmpop_reg(i) <= JMPOP_NOP;				
			end loop;  -- i

		elsif clk'event and clk = '1' then  -- rising clock edge

			if ena = '1' then
				wren_reg <= wren;
				wraddr_reg <= wraddr;
				wrdata_reg <= wrdata;
				for i in 0 to CLUSTERS-1 loop
					wrdata_jmp_reg(i) <= std_logic_vector(unsigned(wrdata(i))
														  +FETCH_WIDTH/BYTE_WIDTH);
				end loop;  -- i
				
				op_reg <= op_in;
				memop_reg <= memop_in;
				stallop_reg <= stallop_in;
				jmpop_reg <= jmpop_in;
			end if;

		end if;
	end process sync;

	async: process (wren_reg, wraddr_reg, wrdata_reg, wrdata_jmp_reg,
					op_reg, memop_reg, stallop_reg, jmpop_reg)
	begin  -- process async
		op_out <= op_reg;
		memop_out <= memop_reg;
		stallop_out <= stallop_reg;
		jmpop_out <= jmpop_reg;

		for i in 0 to CLUSTERS-1 loop
			if op_reg(i).fwd0 = '1' then
				if op_reg(i).rdaddr0(REG_BITS-1) = '1' then
					if wren_reg(i) = '1' and wraddr_reg(i) = op_reg(i).rdaddr0 then
						op_out(i).rddata0 <= wrdata_reg(i);
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren_reg(k) = '1' and wraddr_reg(k) = op_reg(i).rdaddr0 then
							op_out(i).rddata0 <= wrdata_reg(k);
						end if;
					end loop;  -- k
				end if; 
			end if;
			if op_reg(i).fwd1 = '1' then
				if op_reg(i).rdaddr1(REG_BITS-1) = '1' then
					if wren_reg(i) = '1' and wraddr_reg(i) = op_reg(i).rdaddr1 then
						op_out(i).rddata1 <= wrdata_reg(i);
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren_reg(k) = '1' and wraddr_reg(k) = op_reg(i).rdaddr1 then
							op_out(i).rddata1 <= wrdata_reg(k);
						end if;
					end loop;  -- k
				end if; 
			end if;
			if memop_reg(i).fwdA = '1' then
				if memop_reg(i).rdaddrA(REG_BITS-1) = '1' then
					if wren_reg(i) = '1' and wraddr_reg(i) = memop_reg(i).rdaddrA then
						memop_out(i).address <= wrdata_reg(i)(ADDR_WIDTH+1 downto 0);
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren_reg(k) = '1' and wraddr_reg(k) = memop_reg(i).rdaddrA then
							memop_out(i).address <= wrdata_reg(k)(ADDR_WIDTH+1 downto 0);
						end if;
					end loop;  -- k
				end if; 
			end if;
			if memop_reg(i).fwdD = '1' then
				if memop_reg(i).rdaddrD(REG_BITS-1) = '1' then
					if wren_reg(i) = '1' and wraddr_reg(i) = memop_reg(i).rdaddrD then
						memop_out(i).wrdata <= wrdata_reg(i);
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren_reg(k) = '1' and wraddr_reg(k) = memop_reg(i).rdaddrD then
							memop_out(i).wrdata <= wrdata_reg(k);
						end if;
					end loop;  -- k
				end if; 
			end if;
			if jmpop_reg(i).fwd = '1' then
				if jmpop_reg(i).rdaddr(REG_BITS-1) = '1' then
					if wren_reg(i) = '1' and wraddr_reg(i) = jmpop_reg(i).rdaddr then
						jmpop_out(i).target0 <= wrdata_reg(i)(PC_WIDTH-1 downto 0);
						jmpop_out(i).target1 <= wrdata_jmp_reg(i)(PC_WIDTH-1 downto 0);
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren_reg(k) = '1' and wraddr_reg(k) = jmpop_reg(i).rdaddr then
							jmpop_out(i).target0 <= wrdata_reg(k)(PC_WIDTH-1 downto 0);
							jmpop_out(i).target1 <= wrdata_jmp_reg(k)(PC_WIDTH-1 downto 0);
						end if;
					end loop;  -- k
				end if; 
			end if;
		end loop;  -- i
		
	end process async;
	
end behavior;
