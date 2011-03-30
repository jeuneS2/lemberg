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
use work.flag_pack.all;

entity flags is
	port (
		clk    : in  std_logic;
		reset  : in  std_logic;
		ena    : in  std_logic;
		rddata : out std_logic_vector(FLAG_COUNT-1 downto 0);
		wren   : in	 flag_wren_type;
		wrdata : in	 flag_wrdata_type);
end flags;

architecture behavior of flags is

	signal flags : std_logic_vector(FLAG_COUNT-1 downto 0);
	
begin  -- behavior

	rddata <= flags;

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			flags <= (others => '0');
			flags(0) <= '1';  			-- flag zero is always true
		elsif clk'event and clk = '1' then  -- rising clock edge
			for i in 0 to CLUSTERS-1 loop
				for k in 0 to FLAG_COUNT-1 loop
					if wren(i)(k) = '1' and ena = '1' then
						flags(k) <= wrdata(i)(k);
					end if;
				end loop;  -- k
			end loop;  -- i
			-- condition flag zero is read-only and always true
			flags(0) <= '1';
		end if;
	end process sync;

end behavior;
