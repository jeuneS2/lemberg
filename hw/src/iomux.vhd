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
use work.io_pack.all;
use work.mem_pack.all;

entity iomux is
	
	port (
		clk, reset : in	 std_logic;
		cpu_out	   : in	 sc_out_type;
		cpu_in	   : out sc_in_type;
		sram_out   : out sc_out_type;
		sram_in	   : in	 sc_in_type;
		dram_out   : out sc_out_type;
		dram_in	   : in	 sc_in_type;
		flash_out  : out sc_out_type;
		flash_in   : in	 sc_in_type;
		io_out	   : out sc_out_type;
		io_in	   : in	 sc_in_type);
	
end iomux;

architecture rtl of iomux is

	signal cntmux_reg, cntmux_next : std_logic_vector(AREAMUX_BITS-1 downto 0);
	signal datamux_reg, datamux_next : std_logic_vector(AREAMUX_BITS-1 downto 0);
	
begin  -- iomux

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			cntmux_reg <= (others => '0');
			datamux_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			cntmux_reg <= cntmux_next;
			datamux_reg <= datamux_next;
		end if;
	end process sync;

	async: process (cpu_out, sram_in, dram_in, flash_in, io_in,
					cntmux_reg, datamux_reg)
	begin  -- process async

		sram_out <= cpu_out;
		sram_out.rd <= '0';
		sram_out.wr <= '0';

		dram_out <= cpu_out;
		dram_out.rd <= '0';
		dram_out.wr <= '0';

		flash_out <= cpu_out;
		flash_out.rd <= '0';
		flash_out.wr <= '0';

		io_out <= cpu_out;
		io_out.rd <= '0';
		io_out.wr <= '0';

		cntmux_next <= cntmux_reg;
		datamux_next <= datamux_reg;

		if cpu_out.rd = '1' or cpu_out.wr = '1' then
			case cpu_out.address(ADDR_WIDTH-1 downto ADDR_WIDTH-AREAMUX_BITS) is
				when SRAM_SELECT =>
					sram_out.rd <= cpu_out.rd;
					sram_out.wr <= cpu_out.wr;
					cntmux_next <= SRAM_SELECT;
				when DRAM_SELECT =>
					dram_out.rd <= cpu_out.rd;
					dram_out.wr <= cpu_out.wr;
					cntmux_next <= DRAM_SELECT;
				when FLASH_SELECT =>
					flash_out.rd <= cpu_out.rd;
					flash_out.wr <= cpu_out.wr;
					cntmux_next <= FLASH_SELECT;
				when IO_SELECT =>
					io_out.rd <= cpu_out.rd;
					io_out.wr <= cpu_out.wr;
					cntmux_next <= IO_SELECT;
				when others => null;
			end case;				
		end if;

		case datamux_reg is
			when SRAM_SELECT =>
				cpu_in.rd_data <= sram_in.rd_data;
			when DRAM_SELECT =>
				cpu_in.rd_data <= dram_in.rd_data;
			when FLASH_SELECT =>
				cpu_in.rd_data <= flash_in.rd_data;
			when IO_SELECT =>
				cpu_in.rd_data <= io_in.rd_data;
			when others => null;
		end case;

		-- simplify return of rdy_cnt; precondition: all areas assert rdy_cnt only when necessary
		cpu_in.rdy_cnt <= sram_in.rdy_cnt or dram_in.rdy_cnt or flash_in.rdy_cnt or io_in.rdy_cnt;
		
		case cntmux_reg is
			when SRAM_SELECT =>				
				if sram_in.rdy_cnt(1) = '0' then
					datamux_next <= cntmux_reg;
				end if;
				if sram_in.rdy_cnt = 0 then
					cpu_in.rd_data <= sram_in.rd_data;
				end if;
			when DRAM_SELECT =>
				if dram_in.rdy_cnt(1) = '0' then
					datamux_next <= cntmux_reg;
				end if;
				if dram_in.rdy_cnt = 0 then
					cpu_in.rd_data <= dram_in.rd_data;
				end if;
			when FLASH_SELECT =>
				if flash_in.rdy_cnt(1) = '0' then
					datamux_next <= cntmux_reg;
				end if;
				if flash_in.rdy_cnt = 0 then
					cpu_in.rd_data <= flash_in.rd_data;
				end if;
			when IO_SELECT =>
				if io_in.rdy_cnt(1) = '0' then
					datamux_next <= cntmux_reg;
				end if;
				if io_in.rdy_cnt = 0 then
					cpu_in.rd_data <= io_in.rd_data;
				end if;
			when others => null;
		end case;
		
	end process async;
	
end rtl;
