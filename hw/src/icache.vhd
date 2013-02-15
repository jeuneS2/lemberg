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
use work.mem_pack.all;

entity icache is
	
	port (
		clk	    : in std_logic;
		reset   : in std_logic;

		detect  : in std_logic;
		update  : in std_logic;
		clear   : in std_logic;
		
		address : in std_logic_vector(ADDR_WIDTH-1 downto 0);
		hit     : out std_logic;
		offset  : out std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0));

end icache;

architecture behavior of icache is

	type tag_array_type is array (0 to ICACHE_BLOCKS-1) of std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal tag_array_reg, tag_array_next : tag_array_type;
	signal valid_reg, valid_next : std_logic_vector(ICACHE_BLOCKS-1 downto 0);
	
	signal nxt_reg, nxt_next : unsigned(ICACHE_BLOCK_BITS-1 downto 0);

	signal tag_reg : std_logic_vector(ADDR_WIDTH-1 downto 0);
	
begin  -- behavior

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			tag_array_reg <= (others => (others => '0'));
			valid_reg <= (others => '0');
			nxt_reg <= (others => '0');
			tag_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			tag_array_reg <= tag_array_next;
			valid_reg <= valid_next;
			nxt_reg <= nxt_next;
			if detect = '1' or update = '1' then
				tag_reg <= address;				
			end if;
		end if;
	end process sync;

	async: process (update, clear, address,
					tag_array_reg, valid_reg, nxt_reg, tag_reg)
		variable h : std_logic;
		variable o : std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0);
	begin  -- process async
		tag_array_next <= tag_array_reg;
		valid_next <= valid_reg;
		nxt_next <= nxt_reg;
		
		h := '0';
		o := (others => '0');
		for i in 0 to ICACHE_BLOCKS-1 loop
			if valid_reg(i) = '1' and tag_array_reg(i) = address then
				h := h or '1';
				o := o or std_logic_vector(to_unsigned(i, ICACHE_BLOCK_BITS));
			end if;
		end loop;  -- i		
		if h = '0' then
			o := std_logic_vector(nxt_reg);			
		end if;
		
		hit <= h;
		offset <= o;

		if update = '1' then
			tag_array_next(to_integer(nxt_reg)) <= tag_reg;
			valid_next(to_integer(nxt_reg)) <= '1';
			nxt_next <= nxt_reg+1;			
		end if;

		if clear = '1' then
			valid_next(to_integer(nxt_reg)) <= '0';
			nxt_next <= nxt_reg+1;			
		end if;

	end process async;

end behavior;
