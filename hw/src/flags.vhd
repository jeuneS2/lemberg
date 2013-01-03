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
		clk	   : in	 std_logic;
		reset  : in	 std_logic;
		ena	   : in	 std_logic;
		rddata : out std_logic_vector(FLAG_COUNT-1 downto 0);
		wren   : in	 flag_wren_type;
		wrdata : in	 flag_wrdata_type);
end flags;

architecture behavior of flags is

	signal flags : flag_wrdata_type;

	type src_type is array (1 to FLAG_COUNT-1) of integer range 0 to CLUSTERS-1;
	signal src : src_type;
	
begin  -- behavior

	sync: process (clk, reset)
		variable en, fl : std_logic_vector(FLAG_COUNT-1 downto 1);
	begin  -- process sync
		if reset = '0' then				-- asynchronous reset (active low)
			flags <= (others => (others => '0'));
			for i in 1 to FLAG_COUNT-1 loop
				src(i) <= 0;
			end loop;  -- i
		elsif clk'event and clk = '1' then	-- rising clock edge
			for k in 1 to FLAG_COUNT-1 loop
				for i in 0 to CLUSTERS-1 loop
					if wren(i)(k) = '1' and ena = '1' then
						src(k) <= i;
						flags(i)(k) <= wrdata(i)(k);
					end if;
				end loop;  -- i
			end loop;  -- k			   
		end if;
	end process sync;

	async: process (flags, src)
	begin  -- process async
		for k in 1 to FLAG_COUNT-1 loop
			rddata(k) <= flags(src(k))(k);
		end loop;  -- k
		-- condition flag zero is read-only and always true
		rddata(0) <= '1';	 
	end process async;
	
end behavior;
