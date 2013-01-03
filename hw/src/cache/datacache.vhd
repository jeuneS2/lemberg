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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.core_pack.all;
use work.mem_pack.all;

entity datacache is
	generic (
		dm_bits		 : integer := 8;
		fa_bits		 : integer := 5;
		fa_line_bits : integer := 2;
		stack_bits	 : integer := 9);
	port (
		clk, reset:		in std_logic;

		inval:			in std_logic;

		cpu_out:		in sc_out_type;
		cpu_in:			out sc_in_type;

		mem_out:		out sc_out_type;
		mem_in:			in sc_in_type);
end datacache;

architecture rtl of datacache is

	type mux_type is (BP, DM, FA, STACK);
	signal mux_reg, next_mux : mux_type;	
	signal dmux_reg, next_dmux : mux_type;	
	
	signal dm_cpu_in, fa_cpu_in, stack_cpu_in : sc_in_type;
	signal dm_mem_out, fa_mem_out, stack_mem_out : sc_out_type;

begin  -- rtl

	cmp_dm: entity work.directmapped
		generic map (
			index_bits => dm_bits,
			cache_type => DIRECTMAP)
		port map (
			clk		=> clk,
			reset	=> reset,
			inval	=> inval,
			cpu_in	=> dm_cpu_in,
			cpu_out => cpu_out,
			mem_in	=> mem_in,
			mem_out => dm_mem_out);

	cmp_fa: entity work.lru
		generic map (
			index_bits => fa_bits-fa_line_bits,
			line_bits => fa_line_bits,
			cache_type => FULLASSOC)
		port map (
			clk		=> clk,
			reset	=> reset,
			inval	=> inval,
			cpu_in	=> fa_cpu_in,
			cpu_out => cpu_out,
			mem_in	=> mem_in,
			mem_out => fa_mem_out);

	cmp_stack: entity work.stackcache
		generic map (
			index_bits => stack_bits,
			cache_type => STACK)
		port map (
			clk		=> clk,
			reset	=> reset,
			inval	=> inval,
			cpu_in	=> stack_cpu_in,
			cpu_out => cpu_out,
			mem_in	=> mem_in,
			mem_out => stack_mem_out);

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then				-- asynchronous reset (active low)
			mux_reg <= BP;
			dmux_reg <= BP;
		elsif clk'event and clk = '1' then	-- rising clock edge
			mux_reg <= next_mux;
			dmux_reg <= next_dmux;
		end if;
	end process sync;

	async: process (cpu_out, mem_in,
					mux_reg, dmux_reg,
					dm_mem_out, fa_mem_out, stack_mem_out,
					dm_cpu_in, fa_cpu_in, stack_cpu_in)

		variable bp_rd, bp_wr : std_logic;
		variable rdy_cnt : unsigned(RDY_CNT_WIDTH-1 downto 0);
		
	begin  -- process async
		
		-- aggregate rdy_cnt from caches
		-- precondition: all caches assert rdy_cnt only when necessary		
		rdy_cnt := dm_cpu_in.rdy_cnt
				   or fa_cpu_in.rdy_cnt
				   or stack_cpu_in.rdy_cnt;
		
		case mux_reg is
			when DM =>
				mem_out <= dm_mem_out;
				cpu_in.rdy_cnt <= rdy_cnt;
			when FA =>
				mem_out <= fa_mem_out;
				cpu_in.rdy_cnt <= rdy_cnt;
			when STACK =>
				mem_out <= stack_mem_out;
				cpu_in.rdy_cnt <= rdy_cnt;
			when others =>
				mem_out <= cpu_out;
				cpu_in.rdy_cnt <= mem_in.rdy_cnt;
		end case;

		case dmux_reg is
			when DM =>
				cpu_in.rd_data <= dm_cpu_in.rd_data;
			when FA =>
				cpu_in.rd_data <= fa_cpu_in.rd_data;					   
			when STACK =>
				cpu_in.rd_data <= stack_cpu_in.rd_data;					   
			when others =>
				cpu_in.rd_data <= mem_in.rd_data;
		end case;
		
		next_mux <= mux_reg;
		next_dmux <= dmux_reg;

		bp_rd := '0';
		bp_wr := '0';

		if cpu_out.rd = '1' or cpu_out.wr = '1' then
			case cpu_out.cache is
				when DIRECTMAP =>
					next_mux <= DM;
				when FULLASSOC =>
					next_mux <= FA;
				when STACK =>
					next_mux <= STACK;
				when others =>
					next_mux <= BP;
					-- immediate bypassing
					mem_out <= cpu_out;
					bp_rd := cpu_out.rd;
					bp_wr := cpu_out.wr;
			end case;
		end if;

		if cpu_out.rd = '1' then
			case cpu_out.cache is
				when DIRECTMAP =>
					next_dmux <= DM;
				when FULLASSOC =>
					next_dmux <= FA;
				when STACK =>
					next_dmux <= STACK;
				when others =>
					next_dmux <= BP;
			end case;
		end if;

		-- simplify rd/wr path
		-- precondition: caches assert rd/wr only when necessary
		mem_out.rd <= dm_mem_out.rd
					  or fa_mem_out.rd
					  or stack_mem_out.rd
					  or bp_rd;
		mem_out.wr <= dm_mem_out.wr
					  or fa_mem_out.wr
					  or stack_mem_out.wr
					  or bp_wr;

	end process async;
	
end rtl;
