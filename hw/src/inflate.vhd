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
use work.core_pack.all;
use work.reg_pack.all;
use work.op_pack.all;

entity inflate is
	
	port (
		clk        : in  std_logic;
		reset      : in  std_logic;
		raw        : in  std_logic_vector(0 to FETCH_WIDTH-1);
		pc_in      : in  std_logic_vector(PC_WIDTH-1 downto 0);
		ena        : in  std_logic;
		flush      : in  std_logic;
		bundle     : out bundle_type;
		pc_out     : out std_logic_vector(PC_WIDTH-1 downto 0);
		xnop       : out std_logic);

end inflate;

architecture behavior of inflate is

	constant ENABLE_XNOP : boolean := false;
	
	signal raw_reg : std_logic_vector(0 to FETCH_WIDTH-1);
	signal nop_cnt_reg, nop_cnt_next : unsigned(8-CLUSTERS-1 downto 0);

	--pragma synthesis off
	signal nop_cnt : integer := 0;
	signal ena_cnt : integer := 0;
	--pragma synthesis on
	
begin  -- behavior	
		
	sync: process (clk, reset, raw, pc_in)
	begin  -- process sync
		if ENABLE_XNOP then
			if reset = '0' then  			-- asynchronous reset (active low)
				raw_reg <= (others => '0');
				pc_out <= (others => '0');
				nop_cnt_reg <= (others => '0');
			elsif clk'event and clk = '1' then  -- rising clock edge
				if ena = '1' then
					raw_reg <= raw;
					pc_out <= pc_in;					
					nop_cnt_reg <= nop_cnt_next;
					if flush = '1' then
						raw_reg <= (others => '0');
					end if;
				end if;
			end if;
		else
			raw_reg <= raw;
			pc_out <= pc_in;
		end if;
	end process sync;

	-- this needs to be adapted when changing the number of clusters
	inflate: process (raw_reg, nop_cnt_reg, nop_cnt_next)
		variable syll : bundle_type;
	begin  -- process inflate
		bundle <= BUNDLE_NOP;

		for i in 0 to CLUSTERS-1 loop
			syll(i) := to_syllable(raw_reg(CLUSTERS+i*SYLLABLE_WIDTH
										   to CLUSTERS+(i+1)*SYLLABLE_WIDTH-1));
		end loop;  -- i
		
		if ENABLE_XNOP and nop_cnt_reg /= 0 then
			nop_cnt_next <= nop_cnt_reg-1;
		else
			nop_cnt_next <= (others => '0');
			case raw_reg(0 to CLUSTERS-1) is
				when "0000" =>
					nop_cnt_next <= unsigned(raw_reg(CLUSTERS to 8-1));
				when "0001" =>
					bundle(0) <= syll(0);
				when "0010" =>
					bundle(1) <= syll(0);
				when "0100" =>
					bundle(2) <= syll(0);
				when "1000" =>
					bundle(3) <= syll(0);
				when "0011" =>
					bundle(0) <= syll(0);
					bundle(1) <= syll(1);
				when "0101" =>
					bundle(0) <= syll(0);
					bundle(2) <= syll(1);
				when "1001" =>
					bundle(0) <= syll(0);
					bundle(3) <= syll(1);
				when "0110" =>
					bundle(1) <= syll(0);
					bundle(2) <= syll(1);
				when "1010" =>
					bundle(1) <= syll(0);
					bundle(3) <= syll(1);
				when "1100" =>
					bundle(2) <= syll(0);
					bundle(3) <= syll(1);
				when "0111" =>
					bundle(0) <= syll(0);
					bundle(1) <= syll(1);
					bundle(2) <= syll(2);
				when "1011" =>
					bundle(0) <= syll(0);
					bundle(1) <= syll(1);
					bundle(3) <= syll(2);
				when "1101" =>
					bundle(0) <= syll(0);
					bundle(2) <= syll(1);
					bundle(3) <= syll(2);
				when "1110" =>
					bundle(1) <= syll(0);
					bundle(2) <= syll(1);
					bundle(3) <= syll(2);
				when "1111" =>
					bundle(0) <= syll(0);
					bundle(1) <= syll(1);
					bundle(2) <= syll(2);
					bundle(3) <= syll(3);
				when others => null;
			end case;
		end if;

		if ENABLE_XNOP and nop_cnt_next /= 0 then
			xnop <= '1';
		else
			xnop <= '0';
		end if;

	end process inflate;

	----------------------------------------------------------------
	-- gather statistics
	----------------------------------------------------------------
	--pragma synthesis off
	stat: process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				if raw(0 to CLUSTERS-1) = "0000" or
					(ENABLE_XNOP and nop_cnt_reg /= 0) then
					nop_cnt <= nop_cnt + 1;
				end if;
			else
				ena_cnt <= ena_cnt + 1;
			end if;
		end if;
	end process;
	--pragma synthesis on

end behavior;
	
