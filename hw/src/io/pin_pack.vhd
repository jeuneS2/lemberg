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

package pin_pack is

	type io_pin_out_type is
	record
		txd : std_logic;
	end record;

	type io_pin_in_type is
	record
		rxd : std_logic;
	end record;

	type sram_pin_out_type is
	record
		addr  : std_logic_vector(18 downto 0);
		clk   : std_logic;
		nsc   : std_logic;
		noe	  : std_logic;
		nwe	  : std_logic;
		nbw	  : std_logic_vector(3 downto 0);
		ngw   : std_logic;
		nce1  : std_logic;
		ce2	  : std_logic;
		nce3  : std_logic;
		nadsp : std_logic;
		nadv  : std_logic;
	end record;

	type sram_pin_inout_type is
	record
		d   : std_logic_vector(31 downto 0);
	end record;

end pin_pack;
