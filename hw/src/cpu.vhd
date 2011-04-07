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

entity cpu is
	
	port (
		clk_pin : in  std_logic;

		ram_a	: out std_logic_vector(SRAM_ADDR_WIDTH-1 downto 0);
		ram_d	: inout std_logic_vector(31 downto 0);
		ram_clk : out std_logic;
		ram_nsc : out std_logic;
		ram_ncs	: out std_logic;
		ram_cs	: out std_logic;
		ram_noe	: out std_logic;
		ram_nwe	: out std_logic;
		ram_nbw	: out std_logic_vector(3 downto 0);
		
		txd     : out std_logic;
		rxd     : in  std_logic;

		-- helper signals for fixed values
		high    : out std_logic;
		low     : out std_logic);
	
end cpu;

architecture behavior of cpu is

	signal clk         : std_logic;
	signal pll_locked  : std_logic;
	
	signal res_cnt     : unsigned(2 downto 0) := "111";
	signal reset       : std_logic;

	signal sc_out      : sc_out_type;
	signal sc_in       : sc_in_type;

	signal sram_out    : sc_out_type;
	signal sram_in     : sc_in_type;
	signal io_out      : sc_out_type;
	signal io_in       : sc_in_type;

	signal ram_dout	   : std_logic_vector(31 downto 0);
	signal ram_din	   : std_logic_vector(31 downto 0);
	signal ram_dout_en : std_logic;	
	signal ram_ncs_int : std_logic;
	
begin  -- behavior

	core: entity work.core
		port map (
			clk	   => clk,
			reset  => reset,
			sc_out => sc_out,
			sc_in  => sc_in);

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
			ram_ws	    => 2,
			addr_bits   => SRAM_ADDR_WIDTH)
		port map (
			clk         => clk,
			reset       => reset,
			sc_mem_out  => sram_out,
			sc_mem_in   => sram_in,
			ram_addr    => ram_a,
			ram_dout    => ram_dout,
			ram_din     => ram_din,
			ram_dout_en => ram_dout_en,
			ram_clk     => ram_clk,
			ram_nsc     => ram_nsc,
			ram_ncs     => ram_ncs_int,
			ram_noe     => ram_noe,
			ram_nwe     => ram_nwe,
			ram_nbw     => ram_nbw);

	sc_io: entity work.sc_io
		port map (
			clk		=> clk,
			reset	=> reset,
			cpu_out => io_out,
			cpu_in	=> io_in,
			rxd		=> rxd,
			txd		=> txd);
		
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
		end if;
	end process sync;

	-- helper levels
	high <= '1';
	low <= '0';
	
	-- handle ram connection
	process(ram_dout_en, ram_dout)
	begin
		if ram_dout_en='1' then
			ram_d <= ram_dout;
		else
			ram_d <= (others => 'Z');
		end if;
	end process;
	ram_din <= ram_d;
	
	ram_ncs <= ram_ncs_int;
	ram_cs <= not ram_ncs_int;

end behavior;
