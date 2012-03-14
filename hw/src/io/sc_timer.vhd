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

entity sc_timer is
	
	generic (
		addr_width : integer;
		clk_freq : integer);

	port (
		clk, reset : in std_logic;
		address    : in  std_logic_vector(addr_width-1 downto 0);
		rd         : in  std_logic;
		rd_data    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		rdy_cnt    : out unsigned(1 downto 0)
		);	

end sc_timer;

architecture rtl of sc_timer is

	signal rd_data_buf : std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal cycles      : std_logic_vector(2*DATA_WIDTH-1 downto 0);

	constant NANO_PREC : integer := 20;
	constant NANOS_PER_CYCLE  : integer :=
		(10**3*2**NANO_PREC+((clk_freq+10**3/2)/10**3)/2)/((clk_freq+10**3/2)/10**3)*10**3;
	
	signal nanos : std_logic_vector(2*DATA_WIDTH+NANO_PREC-1 downto 0);
	
	signal usecs        : std_logic_vector(19 downto 0);
	signal us_modcycles : std_logic_vector(11+NANO_PREC-1 downto 0);

	signal secs         : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal s_modcycles  : integer range 0 to clk_freq;

	signal hireg       : std_logic_vector(DATA_WIDTH-1 downto 0);
	
begin  -- rtl

	assert addr_width = 3 report "Wrong address width" severity failure;

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)

			rdy_cnt <= "00";
			rd_data <= (others => '0');
			rd_data_buf <= (others => '0');
			
			cycles <= (others => '0');
			usecs <= (others => '0');
			us_modcycles <= (others => '0');
			secs <= (others => '0');
			s_modcycles <= 0;
			nanos <= (others => '0');
			hireg <= (others => '0');
			
		elsif clk'event and clk = '1' then  -- rising clock edge
			
			rdy_cnt <= '0' & rd;
			rd_data <= rd_data_buf;

			if rd = '1' then
				case address(2 downto 0) is
					when "000" =>
						rd_data_buf <= cycles(DATA_WIDTH-1 downto 0);
						hireg   <= cycles(2*DATA_WIDTH-1 downto DATA_WIDTH);
					when "001" =>
						rd_data_buf <= hireg;
					when "010" =>
						rd_data_buf <= nanos(DATA_WIDTH+NANO_PREC-1 downto NANO_PREC);
						hireg   <= nanos(2*DATA_WIDTH+NANO_PREC-1 downto DATA_WIDTH+NANO_PREC);
					when "011" =>
						rd_data_buf <= hireg;
					when "100" =>
						rd_data_buf <= (others => '0');
						rd_data_buf(19 downto 0) <= usecs;
						hireg <= secs;
					when "101" =>
						rd_data_buf <= hireg;						
					when others =>
						rd_data_buf <= (others => '0');
				end case;
			end if;
			
			cycles <= std_logic_vector(unsigned(cycles)+1);
						
			nanos <= std_logic_vector(unsigned(nanos)+NANOS_PER_CYCLE);
			
			us_modcycles <=  std_logic_vector(unsigned(us_modcycles)+NANOS_PER_CYCLE);
			if unsigned(us_modcycles(11+NANO_PREC-1 downto NANO_PREC)) >= 1000 then
				usecs <= std_logic_vector(unsigned(usecs)+1);
				us_modcycles <= std_logic_vector(unsigned(us_modcycles)+NANOS_PER_CYCLE-1000*2**NANO_PREC);
			end if;
			
			s_modcycles <= s_modcycles+1;
			if s_modcycles = clk_freq-1 then
				secs <= std_logic_vector(unsigned(secs)+1);
				s_modcycles <= 0;
				usecs <= (others => '0');
				us_modcycles <= (others => '0');
			end if;			
		end if;
	end process sync;
	
end rtl;
