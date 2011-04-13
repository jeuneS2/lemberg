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
		dm_bits    : integer := 8;
		fa_bits	   : integer := 5;
		stack_bits : integer := 9);
	port (
		clk, reset:	    in std_logic;

		inval:			in std_logic;

		cpu_out:		in sc_out_type;
		cpu_in:			out sc_in_type;

		mem_out:		out sc_out_type;
		mem_in:			in sc_in_type);
end datacache;

architecture rtl of datacache is

	type mux_type is (bp, dm, dmcc, fa, stack);
	signal out_mux_reg, next_out_mux : mux_type;	
	signal in_mux_reg, next_in_mux : mux_type;	
	
	signal dm_cpu_in, fa_cpu_in, stack_cpu_in : sc_in_type;
	signal dm_mem_out, fa_mem_out, stack_mem_out : sc_out_type;

	signal bp_fetch, next_bp_fetch : std_logic;
	signal bp_rd_data, next_bp_rd_data : std_logic_vector(DATA_WIDTH-1 downto 0);
	
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
			index_bits => fa_bits,
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
		if reset = '0' then  			-- asynchronous reset (active low)
			out_mux_reg <= BP;
			in_mux_reg <= BP;
			bp_fetch <= '0';
			bp_rd_data <= (others => '0');			
		elsif clk'event and clk = '1' then  -- rising clock edge
			out_mux_reg <= next_out_mux;
			in_mux_reg <= next_in_mux;
			bp_fetch <= next_bp_fetch;
			bp_rd_data <= next_bp_rd_data;
		end if;
	end process sync;

	async: process (cpu_out, mem_in,
					out_mux_reg, in_mux_reg,
					bp_rd_data, bp_fetch,
					dm_mem_out, fa_mem_out, stack_mem_out,
					dm_cpu_in, fa_cpu_in, stack_cpu_in)

		variable bp_rd, bp_wr : std_logic;
		variable rdy_cnt : unsigned(RDY_CNT_WIDTH-1 downto 0);
		
	begin  -- process async
		
		next_out_mux <= out_mux_reg;
		next_in_mux <= in_mux_reg;
		next_bp_fetch <= '0';
		next_bp_rd_data <= bp_rd_data;

		-- aggregate rdy_cnt from caches
		-- precondition: all caches assert rdy_cnt only when necessary
		
		rdy_cnt := dm_cpu_in.rdy_cnt
				   or fa_cpu_in.rdy_cnt
				   or stack_cpu_in.rdy_cnt;
		
		case out_mux_reg is
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

		bp_rd := '0';
		bp_wr := '0';

		if cpu_out.rd = '1' or cpu_out.wr = '1' then
			case cpu_out.cache is
				when DIRECTMAP =>
					next_out_mux <= DM;									  
				when FULLASSOC =>
					next_out_mux <= FA;
				when STACK =>
					next_out_mux <= STACK;
				when others =>
					next_out_mux <= BP;
					-- immediate bypassing
					mem_out <= cpu_out;
					bp_rd := cpu_out.rd;
					bp_wr := cpu_out.wr;
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

		case in_mux_reg is
			when DM =>
				cpu_in.rd_data <= dm_cpu_in.rd_data;
			when FA =>
				cpu_in.rd_data <= fa_cpu_in.rd_data;					   
			when STACK =>
				cpu_in.rd_data <= stack_cpu_in.rd_data;					   
			when others =>
				cpu_in.rd_data <= bp_rd_data;
		end case;

		if bp_fetch = '1' then
			cpu_in.rd_data <= mem_in.rd_data;
			next_bp_rd_data <= mem_in.rd_data;
		end if;		

		case out_mux_reg is
			when DM =>
				if dm_cpu_in.rdy_cnt(1) = '0' then
					next_in_mux <= DM;
				end if;
				if dm_cpu_in.rdy_cnt = 0 then
					cpu_in.rd_data <= dm_cpu_in.rd_data;
				end if;
			when FA =>
				if fa_cpu_in.rdy_cnt(1) = '0' then
					next_in_mux <= FA;
				end if;
				if fa_cpu_in.rdy_cnt = 0 then
					cpu_in.rd_data <= fa_cpu_in.rd_data;
				end if;
			when STACK =>
				if stack_cpu_in.rdy_cnt(1) = '0' then
					next_in_mux <= STACK;
				end if;
				if stack_cpu_in.rdy_cnt = 0 then
					cpu_in.rd_data <= stack_cpu_in.rd_data;
				end if;
			when others =>
				if mem_in.rdy_cnt(1) = '0' then
					next_in_mux <= BP;
					next_bp_fetch <= '1';
				end if;
				if mem_in.rdy_cnt = 0 then
					cpu_in.rd_data <= mem_in.rd_data;
				end if;
		end case;
		
	end process async;
	
end rtl;
