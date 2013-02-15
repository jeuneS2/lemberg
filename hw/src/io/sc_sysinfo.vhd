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
use work.io_pack.all;
use work.mem_pack.all;
use work.fpu_pack.all;

entity sc_sysinfo is
	
	generic (
		addr_width : integer;
		clk_freq : integer);

	port (
		clk, reset : in  std_logic;
		address    : in  std_logic_vector(addr_width-1 downto 0);
		wr_data    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		rd         : in  std_logic;
		wr         : in  std_logic;
		rd_data    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		rdy_cnt    : out unsigned(1 downto 0);
		int_reset  : out std_logic
		);	

end sc_sysinfo;

architecture rtl of sc_sysinfo is

	signal rdy_reg : unsigned(RDY_CNT_WIDTH-1 downto 0);
	
begin  -- rtl

	assert addr_width = 4 report "Wrong address width" severity failure;

	rdy_cnt <= rdy_reg;
	
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then
			int_reset <= '1';
			rdy_reg <= "00";
		elsif clk'event and clk = '1' then  -- rising clock edge
			int_reset <= '1';
			if rd = '1' then
				case address(3 downto 0) is
					when "0000" =>
						rd_data <= VERSION;
					when "0001" =>
						rd_data <= std_logic_vector(to_unsigned(clk_freq, DATA_WIDTH));
					when "0010" =>
						rd_data <= (others => '0');
						if ENABLE_SINGLE then rd_data(0) <= '1'; end if;
						if ENABLE_DOUBLE then rd_data(1) <= '1'; end if;
					when "0011" =>
						rd_data <= std_logic_vector(to_unsigned(ADDR_WIDTH, DATA_WIDTH));

					when "0100" =>
						rd_data <= std_logic_vector(to_unsigned(SRAM_ADDR_WIDTH, DATA_WIDTH));
					when "0101" =>
						rd_data <= std_logic_vector(to_unsigned(DRAM_ADDR_WIDTH, DATA_WIDTH));
					when "0110" =>
						rd_data <= std_logic_vector(to_unsigned(FLASH_ADDR_WIDTH, DATA_WIDTH));
					when "0111" =>
						rd_data <= std_logic_vector(to_unsigned(IO_ADDR_WIDTH, DATA_WIDTH));
								   
					when "1000" =>
						rd_data <= std_logic_vector(to_unsigned(PC_WIDTH, DATA_WIDTH));
					when "1001" =>
						rd_data <= std_logic_vector(to_unsigned(DM_ADDR_WIDTH, DATA_WIDTH));
					when "1010" =>
						rd_data <= std_logic_vector(to_unsigned(FA_ADDR_WIDTH, DATA_WIDTH));
					when "1011" =>
						rd_data <= std_logic_vector(to_unsigned(STACK_ADDR_WIDTH, DATA_WIDTH));
						
					when "1111" => -- halt
						rd_data <= (others => '0');
						rdy_reg   <= "11";

					when others =>
						rd_data <= (others => '0');
				end case;
			end if;
			if wr = '1' then
				case address(3 downto 0) is
					when "1111" =>
						int_reset <= '0';  -- reset						
					when others => null;
				end case;
			end if;
		end if;
	end process sync;
	

end rtl;
