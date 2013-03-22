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
use work.config.all;
use work.core_pack.all;

package jmp_pack is

	type ro_wrdata_type is
		array (0 to CLUSTERS-1) of std_logic_vector(PC_WIDTH-1 downto 0);
	type rb_wrdata_type is
		array (0 to CLUSTERS-1) of std_logic_vector(ADDR_WIDTH-1 downto 0);
	type tmp_wrdata_type is
		array (0 to CLUSTERS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

end jmp_pack;
