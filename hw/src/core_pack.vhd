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

package core_pack is

	-- width of a word
	constant DATA_WIDTH_BITS  : integer := 5;
	constant DATA_WIDTH       : integer := 2**DATA_WIDTH_BITS;

	constant BYTE_WIDTH       : integer := 8;
	constant BYTES_PER_WORD : integer := (DATA_WIDTH+BYTE_WIDTH-1)/BYTE_WIDTH;
		
	-- number of clusters
	constant CLUSTERS         : integer := 4;

	-- regfile properties
	constant REG_BITS         : integer := 5;
	constant REG_COUNT        : integer := 2**REG_BITS;

	-- flag properties
	constant FLAG_BITS        : integer := 2;
	constant FLAG_COUNT       : integer := 2**FLAG_BITS;

	-- number of bits for fetching
	constant FETCHBUF_BITS    : integer := 5;
	constant FETCHBUF_BYTES   : integer := 2**FETCHBUF_BITS;
	constant FETCHBUF_WIDTH   : integer := FETCHBUF_BYTES*BYTE_WIDTH;
	constant FETCH_WIDTH      : integer := 2**(FETCHBUF_BITS-1)*BYTE_WIDTH;
	
	-- bits to address memory
	constant ADDR_WIDTH       : integer := 21;

	-- width of pc, determines size of method cache
	constant PC_WIDTH         : integer := 15;

	-- method cache properties
	constant ICACHE_BLOCK_BITS : integer := 7;
	constant ICACHE_BLOCKS : integer := 2**ICACHE_BLOCK_BITS;	

	-- data cache sizes
	constant DM_ADDR_WIDTH    : integer := 10;
	constant FA_ADDR_WIDTH    : integer := 7;
	constant STACK_ADDR_WIDTH : integer := 10;
	
	-- bits for en-/decoding
	constant OP_BITS          : integer := 6;
	
	function count_bits (
		value : in std_logic_vector)
		return integer;
	
end core_pack;

package body core_pack is

	function count_bits (
		value : in std_logic_vector)
		return integer is
		variable retval : integer := 0;
	begin  -- count_bits
		for i in value'range loop
			if value(i) = '1' then
				retval := retval+1;
			end if;
		end loop;  -- i
		return retval;
	end count_bits;

end core_pack;
