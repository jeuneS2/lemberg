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
use work.mem_pack.all;

entity imem is
	port (
		clk			: in  std_logic;
		reset       : in  std_logic;
		ena         : in  std_logic;
		rdaddr0		: in  std_logic_vector(PC_WIDTH-1 downto 0);
		rdaddr1		: in  std_logic_vector(PC_WIDTH-1 downto 0);
		rddata		: out std_logic_vector(0 to 2*FETCH_WIDTH-1);
		write       : in  imem_write_type);
end imem;

architecture rtl of imem is

	signal q0, q1 : std_logic_vector(FETCH_WIDTH-1 downto 0);

	signal wren0, wren1 : std_logic;
	signal wraddr0, wraddr1 : std_logic_vector(PC_WIDTH-4 downto 0);
	
begin

	-- the "ahead" address (rdaddr1) is connected to the "lower" block to
	-- achieve wrap around
	
	ram_block0: entity work.imem_block
		port map (
			clk		  => clk,
			reset     => reset,
			rden      => ena,
			rdaddress => rdaddr1(PC_WIDTH-1 downto 5),
			q   	  => q0,
			wren	  => wren0,
			wraddress => wraddr0,
			data	  => write.wrdata);

	ram_block1: entity work.imem_block
		port map (
			clk		  => clk,
			reset     => reset,
			rden      => ena,
			rdaddress => rdaddr0(PC_WIDTH-1 downto 5),
			q   	  => q1,
			wren	  => wren1,
			wraddress => wraddr1,
			data	  => write.wrdata);

	wr: process (write)
	begin  -- process wr
		wren0 <= write.wren and not write.wraddr(2);
		wraddr0 <= write.wraddr(PC_WIDTH-3 downto 3) & write.wraddr(1 downto 0);
		wren1 <= write.wren and write.wraddr(2);
		wraddr1 <= write.wraddr(PC_WIDTH-3 downto 3) & write.wraddr(1 downto 0);
	end process wr;
	
	rd: process(q0, q1)
	begin
		rddata <=  q0(31 downto 0) & q0(63 downto 32) & q0(95 downto 64) & q0(127 downto 96)
				   & q1(31 downto 0) & q1(63 downto 32) & q1(95 downto 64) & q1(127 downto 96);
	end process;

end rtl;
