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

use work.config.all;
use work.core_pack.all;

entity imem_block is
	port (
		clk			: in  std_logic;
		reset		: in  std_logic;
		rden        : in  std_logic;
		rdaddress	: in  std_logic_vector(PC_WIDTH-6 downto 0);
		q			: out std_logic_vector(FETCH_WIDTH-1 downto 0);
		wren		: in  std_logic;
		wraddress	: in  std_logic_vector(PC_WIDTH-4 downto 0);
		data		: in  std_logic_vector(DATA_WIDTH-1 downto 0)
		);
end imem_block;

architecture rtl of imem_block is

	constant rdwidth : integer := FETCH_WIDTH;
	constant wrwidth : integer := DATA_WIDTH;
	constant rdaddr_width : integer := PC_WIDTH-5;
	constant wraddr_width : integer := PC_WIDTH-3;
									   
	constant nwords : integer := 2**(wraddr_width-2);
	
	subtype word is std_logic_vector(wrwidth-1 downto 0);
	type block_type is array (0 to nwords-1) of word;

	signal rdaddress_reg : std_logic_vector(PC_WIDTH-6 downto 0);
	
	signal block0 : block_type := (others => (others => '0'));
	signal block1 : block_type := (others => (others => '0'));
	signal block2 : block_type := (others => (others => '0'));
	signal block3 : block_type := (others => (others => '0'));

begin

	-- sanity check
	assert rdwidth/wrwidth = 4
		report "Data widths do not match block count" severity error;

	wr: process (clk)
	begin
		if rising_edge(clk) then
			if wren='1' then
				case wraddress(1 downto 0) is
					when "00" =>
						block0(to_integer(unsigned(wraddress(wraddr_width-1 downto 2)))) <= data;
					when "01" =>
						block1(to_integer(unsigned(wraddress(wraddr_width-1 downto 2)))) <= data;
					when "10" =>
						block2(to_integer(unsigned(wraddress(wraddr_width-1 downto 2)))) <= data;
					when "11" =>
						block3(to_integer(unsigned(wraddress(wraddr_width-1 downto 2)))) <= data;
					when others => null;
				end case;
			end if;
		end if;
	end process;

	rd: process (clk, reset)
	begin
		if reset = '0' then
			rdaddress_reg <= (others => '0');
		elsif rising_edge(clk) then
			if rden = '1' then
				rdaddress_reg <= rdaddress;
			end if;
		end if;
	end process;

	asynrd: process (rdaddress_reg, block0, block1, block2, block3)
	begin  -- process asynrd
		q(wrwidth-1 downto 0)           <= block3(to_integer(unsigned(rdaddress_reg)));
		q(2*wrwidth-1 downto wrwidth)   <= block2(to_integer(unsigned(rdaddress_reg)));
		q(3*wrwidth-1 downto 2*wrwidth) <= block1(to_integer(unsigned(rdaddress_reg)));
		q(4*wrwidth-1 downto 3*wrwidth) <= block0(to_integer(unsigned(rdaddress_reg)));		
	end process asynrd;
	
end rtl;
