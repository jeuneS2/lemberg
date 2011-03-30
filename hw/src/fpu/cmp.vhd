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

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

entity cmp is
	generic (
		fraction_width : integer := float_fraction_width;
		exponent_width : integer := float_exponent_width);
	port (
		a, b : in  float(exponent_width downto -fraction_width);
		cmp	 : out std_logic_vector(13 downto 0));
end cmp;

architecture behavior of cmp is
begin  -- behavior
	process (a, b)
		variable cmpunord, cmpeq, cmplt, cmpgt : std_logic;
	begin  -- process
		if Unordered(b, a) then cmpunord := '1'; else cmpunord := '0'; end if;
		cmpeq := \?=\ (b, a);
		cmplt := \?<\ (b, a);
		cmpgt := not (cmpeq or cmplt);

		cmp(0)  <= cmpeq and not cmpunord;
		cmp(1)  <= not cmpeq and not cmpunord;
		cmp(2)  <= cmplt and not cmpunord;
		cmp(3)  <= not cmpgt and not cmpunord;
		cmp(4)  <= cmpgt and not cmpunord;
		cmp(5)  <= not cmplt and not cmpunord;
		cmp(6)  <= not cmpunord;
		cmp(7)  <= cmpunord;
		cmp(8)  <= cmpeq or cmpunord;
		cmp(9)  <= not cmpeq or cmpunord;
		cmp(10) <= cmplt or cmpunord;
		cmp(11) <= not cmpgt or cmpunord;
		cmp(12) <= cmpgt or cmpunord;
		cmp(13) <= not cmplt or cmpunord;
	end process;	
end behavior;
