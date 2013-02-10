----------------------------------------------------------------------------
-- This file is part of Lemberg.
-- Copyright (C) 2012 Wolfgang Puffitsch
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
use work.core_pack.all;
use work.op_pack.all;

entity btb is

	port (
		clk		   : in	 std_logic;
		reset	   : in	 std_logic;
		ena		   : in	 std_logic;
		clear      : in  std_logic;
		source	   : in	 std_logic_vector(PC_WIDTH-1 downto 0);
		predict	   : out std_logic;
		target0	   : out std_logic_vector(PC_WIDTH-1 downto 0);
		target1	   : out std_logic_vector(PC_WIDTH-1 downto 0);
		branch	   : in	 std_logic;
		br_source  : in	 std_logic_vector(PC_WIDTH-1 downto 0);
		br_taken   : in	 std_logic;
		br_target0 : in	 std_logic_vector(PC_WIDTH-1 downto 0);
		br_target1 : in	 std_logic_vector(PC_WIDTH-1 downto 0));

end btb;

architecture behavior of btb is

	signal source_reg  : std_logic_vector(PC_WIDTH-1 downto 0);
	
	type bt_line is record
		source  : std_logic_vector(PC_WIDTH-1 downto 0);
		predict : std_logic;
		target0 : std_logic_vector(PC_WIDTH-1 downto 0);
		target1 : std_logic_vector(PC_WIDTH-1 downto 0);
	end record;

	type buffer_type is array (0 to BTB_SIZE-1) of bt_line;
	signal buffer_reg, buffer_next : buffer_type;

begin  -- behavior

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			source_reg <= (others => '0');
			buffer_reg <= (others => ((others => '0'), '0',
									  (others => '0'), (others => '0')));
		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				source_reg <= source;
				buffer_reg <= buffer_next;
			end if;
		end if;
	end process sync;

	pred: process (buffer_reg, source_reg)
	begin  -- process predict
		predict <= '0';
		target0 <= (others => '0');
		target1 <= (others => '0');
		for i in BTB_SIZE-1 downto 0 loop
			if ENABLE_BTB and buffer_reg(i).source = source_reg then
				predict <= buffer_reg(i).predict;
				target0 <= buffer_reg(i).target0;
				target1 <= buffer_reg(i).target1;
			end if;
		end loop;  -- i
	end process pred;

	update: process (buffer_reg, branch, br_source,
					 br_taken, br_target0, br_target1,
					 clear)
		variable hit : boolean;
	begin  -- process update
		buffer_next <= buffer_reg;
		if branch = '1' then
			for i in 0 to BTB_SIZE-2 loop
				buffer_next(i+1) <= buffer_reg(i);
			end loop;  -- i
			buffer_next(0).source <= br_source;
			buffer_next(0).predict <= br_taken;
			buffer_next(0).target0 <= br_target0;
			buffer_next(0).target1 <= br_target1;
		end if;
		if clear = '1' then
			for i in 0 to BTB_SIZE-1 loop
				buffer_next(i).predict <= '0';
			end loop;  -- i
		end if;
	end process update;
	
end behavior;
