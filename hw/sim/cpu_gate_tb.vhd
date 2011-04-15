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

		type io_pin_out_type is
	record
		txd : std_logic;
	end record;

	type io_pin_in_type is
	record
		rxd : std_logic;
	end record;

	type sram_pin_out_type is
	record
		addr  : std_logic_vector(18 downto 0);
		clk   : std_logic;
		nsc   : std_logic;
		noe	  : std_logic;
		nwe	  : std_logic;
		nbw	  : std_logic_vector(3 downto 0);
		ngw   : std_logic;
		nce1  : std_logic;
		ce2	  : std_logic;
		nce3  : std_logic;
		nadsp : std_logic;
		nadv  : std_logic;
	end record;

	type sram_pin_inout_type is
	record
		d   : std_logic_vector(31 downto 0);
	end record;
 
	signal clk	     : std_logic := '1';
	signal ram_out   : sram_pin_out_type;
	signal ram_inout : sram_pin_inout_type;
	signal io_out    : io_pin_out_type;
	signal io_in     : io_pin_in_type;

	signal pull_down : std_logic;
	
begin  -- sim

	cpu: entity work.cpu
		port map (
			clk_pin             => clk,
			sram_pin_out_anadv  => ram_out.nadv,
			sram_pin_out_anadsp => ram_out.nadsp,
			sram_pin_out_ance3  => ram_out.nce3,
			sram_pin_out_ace2   => ram_out.ce2,
			sram_pin_out_ance1  => ram_out.nce1,
			sram_pin_out_angw   => ram_out.ngw,
			sram_pin_out_anbw   => ram_out.nbw,
			sram_pin_out_anwe   => ram_out.nwe,
			sram_pin_out_anoe   => ram_out.noe,			
			sram_pin_out_ansc   => ram_out.nsc,
			sram_pin_out_aclk   => ram_out.clk,
			sram_pin_out_aaddr  => ram_out.addr,
			sram_pin_inout_ad   => ram_inout.d,
			io_pin_out_atxd     => io_out.txd,
			io_pin_in_arxd      => io_in.rxd);

	pull_down <= ram_inout.d(0);

	main_mem: entity work.memory
		port map(
		A0 => ram_out.addr(0),
		A1 => ram_out.addr(1),
		A2 => ram_out.addr(2),
		A3 => ram_out.addr(3),
		A4 => ram_out.addr(4),
		A5 => ram_out.addr(5),
		A6 => ram_out.addr(6),
		A7 => ram_out.addr(7),
		A8 => ram_out.addr(8),
		A9 => ram_out.addr(9),
		A10 => ram_out.addr(10),
		A11 => ram_out.addr(11),
		A12 => ram_out.addr(12),
		A13 => ram_out.addr(13),
		A14 => ram_out.addr(14),
		A15 => ram_out.addr(15),
		A16 => ram_out.addr(16),
		A17 => ram_out.addr(17),
		A18 => ram_out.addr(18),
		
		DQA0 => ram_inout.d(0),
		DQA1 => ram_inout.d(1),
		DQA2 => ram_inout.d(2),
		DQA3 => ram_inout.d(3),
		DQA4 => ram_inout.d(4),
		DQA5 => ram_inout.d(5),
		DQA6 => ram_inout.d(6),
		DQA7 => ram_inout.d(7),
		DPA => pull_down,
		DQB0 => ram_inout.d(8),
		DQB1 => ram_inout.d(9),
		DQB2 => ram_inout.d(10),
		DQB3 => ram_inout.d(11),
		DQB4 => ram_inout.d(12),
		DQB5 => ram_inout.d(13),
		DQB6 => ram_inout.d(14),
		DQB7 => ram_inout.d(15),
		DPB => pull_down,
		DQC0 => ram_inout.d(16),
		DQC1 => ram_inout.d(17),
		DQC2 => ram_inout.d(18),
		DQC3 => ram_inout.d(19),
		DQC4 => ram_inout.d(20),
		DQC5 => ram_inout.d(21),
		DQC6 => ram_inout.d(22),
		DQC7 => ram_inout.d(23),
		DPC => pull_down,
		DQD0 => ram_inout.d(24),
		DQD1 => ram_inout.d(25),
		DQD2 => ram_inout.d(26),
		DQD3 => ram_inout.d(27),
		DQD4 => ram_inout.d(28),
		DQD5 => ram_inout.d(29),
		DQD6 => ram_inout.d(30),
		DQD7 => ram_inout.d(31),
		DPD => pull_down,

		BWANeg => ram_out.nbw(0),
		BWBNeg => ram_out.nbw(1),
		BWCNeg => ram_out.nbw(2),
		BWDNeg => ram_out.nbw(3),
		GWNeg => ram_out.ngw,
		BWENeg => ram_out.nwe,
		CLK => ram_out.clk,
		CE1Neg => ram_out.nce1,
		CE2 => ram_out.ce2,
		CE3Neg =>  ram_out.nce3,
		OENeg => ram_out.noe,
		ADVNeg => ram_out.nadv,
		ADSPNeg => ram_out.nadsp,
		ADSCNeg => ram_out.nsc,
		MODE => '1',
		ZZ => '0'
		);

	--	50 MHz external clock		
	clock : process
	begin
		wait for 10 ns; clk  <= not clk;
	end process clock;

	sim: process
		variable data : std_logic_vector(9 downto 0);
	begin  -- process sim

		io_in.rxd <= '1';
		
        wait for 10 us;

		data := "1000000000";
		for k in 0 to 7 loop
			for i in 0 to 9 loop
				wait for 8.68 us;
				io_in.rxd <= data(i);
			end loop;			
		end loop;  -- k

		wait for 10000 ms;
		
	end process sim;

end sim;
