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

package mem_pack is

	constant RDY_CNT_WIDTH : integer := 2;

	type sc_cache_type is (BYPASS,
						   ALL_CACHES,
						   DIRECTMAP,
						   FULLASSOC,
						   STACK);

	type sc_out_type is
	record
		address  : std_logic_vector(ADDR_WIDTH-1 downto 0);
		wr_data	 : std_logic_vector(DATA_WIDTH-1 downto 0);
		rd		 : std_logic;
		wr		 : std_logic;
		byte_ena : std_logic_vector(BYTES_PER_WORD-1 downto 0);
		cache	 : sc_cache_type;
	end record;

	type sc_in_type is
	record
		rd_data : std_logic_vector(DATA_WIDTH-1 downto 0);
		rdy_cnt : unsigned(RDY_CNT_WIDTH-1 downto 0);
	end record;

	type imem_write_type is
	record
		wren   : std_logic;
		wraddr : std_logic_vector(PC_WIDTH-3 downto 0);
		wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
	end record;
	
end mem_pack;
