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
use work.core_pack.all;

package io_pack is

	constant AREAMUX_BITS     : integer := 2;

	constant SRAM_SELECT      : std_logic_vector(AREAMUX_BITS-1 downto 0) := "00";
	constant DRAM_SELECT      : std_logic_vector(AREAMUX_BITS-1 downto 0) := "01";
	constant FLASH_SELECT     : std_logic_vector(AREAMUX_BITS-1 downto 0) := "10";
	constant IO_SELECT        : std_logic_vector(AREAMUX_BITS-1 downto 0) := "11";
	
	constant SRAM_ADDR_WIDTH  : integer := 19;
	constant DRAM_ADDR_WIDTH  : integer := 0;
	constant FLASH_ADDR_WIDTH : integer := 0;
	constant IO_ADDR_WIDTH    : integer := 8;

end io_pack;
