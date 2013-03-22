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
use work.mem_pack.all;
use work.io_pack.all;
use work.pin_pack.all;

entity cpu is
	
	port (
		clk_pin        : in    std_logic;

		sram_pin_out   : out   sram_pin_out_type;
		sram_pin_inout : inout sram_pin_inout_type;

		io_pin_out     : out   io_pin_out_type;
		io_pin_in      : in    io_pin_in_type);
	
end cpu;

architecture behavior of cpu is

	signal clk         : std_logic;
	signal int_reset   : std_logic;
	signal pll_locked  : std_logic;
	
	signal res_cnt     : unsigned(2 downto 0) := "111";
	signal reset       : std_logic;

	signal intr        : std_logic;
	signal intraddr    : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal intrcall    : std_logic;
	signal intrret     : std_logic;
    
	signal sc_out      : sc_out_type;
	signal sc_in       : sc_in_type;

	signal sram_out    : sc_out_type;
	signal sram_in     : sc_in_type;
	signal io_out      : sc_out_type;
	signal io_in       : sc_in_type;
	
begin  -- behavior

	core: entity work.core
		port map (
			clk	     => clk,
			reset    => reset,
			sc_out   => sc_out,
			sc_in    => sc_in,
			intr     => intr,
			intraddr => intraddr,
			intrcall => intrcall,
			intrret  => intrret);

	iomux: entity work.iomux
		port map (
			clk		  => clk,
			reset	  => reset,
			cpu_out	  => sc_out,
			cpu_in	  => sc_in,
			sram_out  => sram_out,
			sram_in	  => sram_in,
			dram_out  => open,
			dram_in	  => ((others => '0'), (others => '0')),
			flash_out => open,
			flash_in  => ((others => '0'), (others => '0')),
			io_out	  => io_out,
			io_in	  => io_in);
	
	sc_mem_if: entity work.sc_mem_if
		generic map (
			ram_ws_rd   => 2,
			ram_ws_wr   => 0,
			addr_bits   => SRAM_ADDR_WIDTH)
		port map (
			clk         => clk,
			reset       => reset,
			clk_pin     => clk_pin,
			sc_mem_out  => sram_out,
			sc_mem_in   => sram_in,
			ram_out     => sram_pin_out,
			ram_inout   => sram_pin_inout);

	sc_io: entity work.sc_io
		port map (
			clk		  => clk,
			reset	  => reset,
			int_reset => int_reset,
			cpu_out   => io_out,
			cpu_in 	  => io_in,
			intr      => intr,
			intraddr  => intraddr,
			intrcall  => intrcall,
			intrret   => intrret,
			io_out    => io_pin_out,
			io_in     => io_pin_in);
		
	pll: entity work.pll
		port map (
			inclk0 => clk_pin,
			c0	   => clk,
			locked => pll_locked);

	-- synchronize external reset
	sync: process (clk)
	begin  -- process sync
		if clk'event and clk = '1' then  -- rising clock edge
			if res_cnt = "000" then
				reset <= '1';
			else
				reset <= '0';
				if pll_locked = '1' then
					res_cnt <= res_cnt-1;					
				end if;
			end if;

			if (int_reset = '0') or (pll_locked = '0') then
				res_cnt <= "111";
			end if;
		end if;
	end process sync;

end behavior;
