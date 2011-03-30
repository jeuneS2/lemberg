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

entity cpu_tb is	
end cpu_tb;

architecture sim of cpu_tb is

	signal clk		: std_logic := '1';
	signal ram_a	: std_logic_vector(18 downto 0);
	signal ram_d	: std_logic_vector(31 downto 0);
	signal ram_clk  : std_logic;
	signal ram_nsc  : std_logic;
	signal ram_ncs	: std_logic;
	signal ram_cs	: std_logic;
	signal ram_noe	: std_logic;
	signal ram_nwe	: std_logic;
	signal ram_nbw	: std_logic_vector(3 downto 0);
	signal txd      : std_logic;
	signal rxd      : std_logic;
	signal high     : std_logic;
	signal low      : std_logic;

	signal pull_down    : std_logic;
	
begin  -- sim

	cpu: entity work.cpu
		port map (
			clk_pin => clk,
			ram_a	=> ram_a,
			ram_d	=> ram_d,
			ram_clk => ram_clk,
			ram_nsc => ram_nsc,
			ram_ncs => ram_ncs,
			ram_cs  => ram_cs,
			ram_noe => ram_noe,
			ram_nwe => ram_nwe,
			ram_nbw => ram_nbw,
			txd     => txd,
			rxd     => rxd,
			high    => high,
			low     => low);

	pull_down <= ram_d(0);

	main_mem: entity work.memory
		port map(
		A0 => ram_a(0),
		A1 => ram_a(1),
		A2 => ram_a(2),
		A3 => ram_a(3),
		A4 => ram_a(4),
		A5 => ram_a(5),
		A6 => ram_a(6),
		A7 => ram_a(7),
		A8 => ram_a(8),
		A9 => ram_a(9),
		A10 => ram_a(10),
		A11 => ram_a(11),
		A12 => ram_a(12),
		A13 => ram_a(13),
		A14 => ram_a(14),
		A15 => ram_a(15),
		A16 => ram_a(16),
		A17 => ram_a(17),
		A18 => ram_a(18),
		
		DQA0 => ram_d(0),
		DQA1 => ram_d(1),
		DQA2 => ram_d(2),
		DQA3 => ram_d(3),
		DQA4 => ram_d(4),
		DQA5 => ram_d(5),
		DQA6 => ram_d(6),
		DQA7 => ram_d(7),
		DPA => pull_down,
		DQB0 => ram_d(8),
		DQB1 => ram_d(9),
		DQB2 => ram_d(10),
		DQB3 => ram_d(11),
		DQB4 => ram_d(12),
		DQB5 => ram_d(13),
		DQB6 => ram_d(14),
		DQB7 => ram_d(15),
		DPB => pull_down,
		DQC0 => ram_d(16),
		DQC1 => ram_d(17),
		DQC2 => ram_d(18),
		DQC3 => ram_d(19),
		DQC4 => ram_d(20),
		DQC5 => ram_d(21),
		DQC6 => ram_d(22),
		DQC7 => ram_d(23),
		DPC => pull_down,
		DQD0 => ram_d(24),
		DQD1 => ram_d(25),
		DQD2 => ram_d(26),
		DQD3 => ram_d(27),
		DQD4 => ram_d(28),
		DQD5 => ram_d(29),
		DQD6 => ram_d(30),
		DQD7 => ram_d(31),
		DPD => pull_down,

		BWANeg => ram_nbw(0),
		BWBNeg => ram_nbw(1),
		BWCNeg => ram_nbw(2),
		BWDNeg => ram_nbw(3),
		GWNeg => high,
		BWENeg => ram_nwe,
		CLK => ram_clk,
		CE1Neg => ram_ncs,
		CE2 => ram_cs,
		CE3Neg =>  ram_ncs,
		OENeg => ram_noe,
		ADVNeg => high,
		ADSPNeg => high,
		ADSCNeg => ram_nsc,
		MODE => '1',
		ZZ => '0'
		);

	--	100 MHz clock		
	clock : process
	begin
		wait for 25 ns; clk  <= not clk;
	end process clock;

	sim: process
	begin  -- process sim

		rxd <= '1';
		
		wait for 1000 ms;

		assert false report "simulation finished" severity failure;

	end process sim;

end sim;
