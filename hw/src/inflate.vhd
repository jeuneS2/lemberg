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
		bundle     : out bundle_type;
		pc_out     : out std_logic_vector(PC_WIDTH-1 downto 0);
		xnop       : out std_logic);

end inflate;

architecture behavior of inflate is

	signal raw_reg : std_logic_vector(0 to FETCH_WIDTH-1);
	signal nop_cnt_reg, nop_cnt_next : unsigned(8-CLUSTERS-1 downto 0);
	
begin  -- behavior	
	
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			raw_reg <= (others => '0');
			pc_out <= (others => '0');
			nop_cnt_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				raw_reg <= raw;
				pc_out <= pc_in;					
				nop_cnt_reg <= nop_cnt_next;
			end if;
		end if;
	end process sync;

	-- this needs to be adapted when changing the number of clusters
	inflate: process (raw_reg, nop_cnt_reg, nop_cnt_next)
	begin  -- process inflate
		bundle <= BUNDLE_NOP;

		if nop_cnt_reg /= 0 then
			nop_cnt_next <= nop_cnt_reg-1;
		else
			nop_cnt_next <= (others => '0');
			case raw_reg(0 to CLUSTERS-1) is
				when "0000" =>
					nop_cnt_next <= unsigned(raw_reg(CLUSTERS to 8-1));
				when "0001" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
				when "0010" =>
					bundle(1) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
				when "0100" =>
					bundle(2) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
				when "1000" =>
					bundle(3) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
				when "0011" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(1) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
				when "0101" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(2) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
				when "1001" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
				when "0110" =>
					bundle(1) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(2) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
				when "1010" =>
					bundle(1) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
				when "1100" =>
					bundle(2) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
				when "0111" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(1) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
					bundle(2) <= to_syllable(raw_reg(CLUSTERS+2*SYLLABLE_WIDTH to CLUSTERS+3*SYLLABLE_WIDTH-1));
				when "1011" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(1) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+2*SYLLABLE_WIDTH to CLUSTERS+3*SYLLABLE_WIDTH-1));
				when "1101" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(2) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+2*SYLLABLE_WIDTH to CLUSTERS+3*SYLLABLE_WIDTH-1));
				when "1110" =>
					bundle(1) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(2) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+2*SYLLABLE_WIDTH to CLUSTERS+3*SYLLABLE_WIDTH-1));
				when "1111" =>
					bundle(0) <= to_syllable(raw_reg(CLUSTERS to CLUSTERS+SYLLABLE_WIDTH-1));
					bundle(1) <= to_syllable(raw_reg(CLUSTERS+SYLLABLE_WIDTH to CLUSTERS+2*SYLLABLE_WIDTH-1));
					bundle(2) <= to_syllable(raw_reg(CLUSTERS+2*SYLLABLE_WIDTH to CLUSTERS+3*SYLLABLE_WIDTH-1));
					bundle(3) <= to_syllable(raw_reg(CLUSTERS+3*SYLLABLE_WIDTH to CLUSTERS+4*SYLLABLE_WIDTH-1));
				when others => null;
			end case;
		end if;

		if nop_cnt_next = 0 then
			xnop <= '0';
		else
			xnop <= '1';
		end if;

	end process inflate;
	

end behavior;
	
