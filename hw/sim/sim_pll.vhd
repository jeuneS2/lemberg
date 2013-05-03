----------------------------------------------------------------------------
-- This file is part of Lemberg.
-- Copyright (C) 2001-2011 Martin Schoeberl
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

--
--	dummy PLL for the simulation
--

library ieee;
use ieee.std_logic_1164.all;

entity pll is
	generic (
        infreq : real;
        mul_by : natural;
        div_by : natural);
	port (
		inclk0  : in std_logic  := '0';
		c0		: out std_logic;
		locked  : out std_logic);
end pll;

architecture sim of pll is
begin
	c0 <= inclk0;
	locked <= '1';
end sim;
