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
use std.env.all;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.pin_pack.all;
use work.reg_pack.all;

entity cpu_tb is	
end cpu_tb;

architecture sim of cpu_tb is

	signal halted    : boolean := false;

	signal clk	     : std_logic := '1';
	signal ram_out   : sram_pin_out_type;
	signal ram_inout : sram_pin_inout_type;
	signal io_out    : io_pin_out_type;
	signal io_in     : io_pin_in_type;

	signal pull_down : std_logic;
	
begin  -- sim

	cpu: entity work.cpu
		port map (
			clk_pin        => clk,
			sram_pin_out   => ram_out,
			sram_pin_inout => ram_inout,
			io_pin_out     => io_out,
			io_pin_in      => io_in);

	pull_down <= ram_inout.d(0);
	
	main_mem: entity work.memory
		generic map (
			TimingChecksOn => true,

			tperiod_CLK_posedge => 5.0 ns,
			tpw_CLK_posedge => 2.0 ns,
			tpw_CLK_negedge => 2.0 ns,
			
			tpd_CLK_DQA0 => (others => 3.1 ns),
			tpd_OENeg_DQA0 => (others => 3.1 ns),

			tsetup_A0_CLK => 1.4 ns,
			tsetup_DQA0_CLK => 1.4 ns,
			tsetup_ADVNeg_CLK => 1.4 ns,
			tsetup_ADSCNeg_CLK => 1.4 ns,
			tsetup_CE2_CLK => 1.4 ns,
			tsetup_BWANeg_CLK => 1.4 ns,
			
			thold_A0_CLK => 0.4 ns,
			thold_DQA0_CLK => 0.4 ns,
			thold_ADVNeg_CLK => 0.4 ns,
			thold_ADSCNeg_CLK => 0.4 ns,
			thold_CE2_CLK => 0.4 ns,
			thold_BWANeg_CLK => 0.4 ns,

			tipd_A0 => (3 ns, 3 ns),
			tipd_A1 => (3 ns, 3 ns),
			tipd_A2 => (3 ns, 3 ns),
			tipd_A3 => (3 ns, 3 ns),
			tipd_A4 => (3 ns, 3 ns),
			tipd_A5 => (3 ns, 3 ns),
			tipd_A6 => (3 ns, 3 ns),
			tipd_A7 => (3 ns, 3 ns),
			tipd_A8 => (3 ns, 3 ns),
			tipd_A9 => (3 ns, 3 ns),
			tipd_A10 => (3 ns, 3 ns),
			tipd_A11 => (3 ns, 3 ns),
			tipd_A12 => (3 ns, 3 ns),
			tipd_A13 => (3 ns, 3 ns),
			tipd_A14 => (3 ns, 3 ns),
			tipd_A15 => (3 ns, 3 ns),
			tipd_A16 => (3 ns, 3 ns),
			tipd_A17 => (3 ns, 3 ns),
			tipd_A18 => (3 ns, 3 ns),

			tipd_DQA0 => (3 ns, 3 ns),
			tipd_DQA1 => (3 ns, 3 ns),
			tipd_DQA2 => (3 ns, 3 ns),
			tipd_DQA3 => (3 ns, 3 ns),
			tipd_DQA4 => (3 ns, 3 ns),
			tipd_DQA5 => (3 ns, 3 ns),
			tipd_DQA6 => (3 ns, 3 ns),
			tipd_DQA7 => (3 ns, 3 ns),
			tipd_DPA  => (3 ns, 3 ns),
			tipd_DQB0 => (3 ns, 3 ns),
			tipd_DQB1 => (3 ns, 3 ns),
			tipd_DQB2 => (3 ns, 3 ns),
			tipd_DQB3 => (3 ns, 3 ns),
			tipd_DQB4 => (3 ns, 3 ns),
			tipd_DQB5 => (3 ns, 3 ns),
			tipd_DQB6 => (3 ns, 3 ns),
			tipd_DQB7 => (3 ns, 3 ns),
			tipd_DPB  => (3 ns, 3 ns),
			tipd_DQC0 => (3 ns, 3 ns),
			tipd_DQC1 => (3 ns, 3 ns),
			tipd_DQC2 => (3 ns, 3 ns),
			tipd_DQC3 => (3 ns, 3 ns),
			tipd_DQC4 => (3 ns, 3 ns),
			tipd_DQC5 => (3 ns, 3 ns),
			tipd_DQC6 => (3 ns, 3 ns),
			tipd_DQC7 => (3 ns, 3 ns),
			tipd_DPC  => (3 ns, 3 ns),
			tipd_DQD0 => (3 ns, 3 ns),
			tipd_DQD1 => (3 ns, 3 ns),
			tipd_DQD2 => (3 ns, 3 ns),
			tipd_DQD3 => (3 ns, 3 ns),
			tipd_DQD4 => (3 ns, 3 ns),
			tipd_DQD5 => (3 ns, 3 ns),
			tipd_DQD6 => (3 ns, 3 ns),
			tipd_DQD7 => (3 ns, 3 ns),
			tipd_DPD  => (3 ns, 3 ns),
			
			tipd_BWANeg  => (3 ns, 3 ns),
			tipd_BWBNeg  => (3 ns, 3 ns),
			tipd_BWCNeg  => (3 ns, 3 ns),
			tipd_BWDNeg  => (3 ns, 3 ns),
			tipd_GWNeg   => (3 ns, 3 ns),
			tipd_BWENeg  => (3 ns, 3 ns),
			tipd_CLK     => (3 ns, 3 ns),
			tipd_CE1Neg  => (3 ns, 3 ns),
			tipd_CE2     => (3 ns, 3 ns),
			tipd_CE3Neg  => (3 ns, 3 ns),
			tipd_OENeg   => (3 ns, 3 ns),
			tipd_ADVNeg  => (3 ns, 3 ns),
			tipd_ADSPNeg => (3 ns, 3 ns),
			tipd_ADSCNeg => (3 ns, 3 ns)			
			)
		port map (
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
			ADSCNeg => ram_out.nadsc,
			MODE => '1',
			ZZ => '0'
			);

	clock : process
	begin
		if halted then
			wait until not halted;			
		end if;
		wait for 7.5 ns; clk <= not clk;
	end process clock;
	
	sim: process
	begin  -- process sim
		io_in.rxd <= '1';
		wait until halted;
	end process sim;

	tick: process
		variable t : integer := 0;
		variable l : line;
	begin  -- process sim
		wait for 100 us;

		if halted then
			wait until not halted;			
		end if;

		t := t+100;
		write(l, string'("@"));
		write(l, t);
		write(l, string'("us"));
		writeline(output, l);
	end process tick;

	halt: process
		variable s : g_reg_src_type;
		variable r : g_reg_regfile_type;
		variable l : line;
	begin  -- process sim

		-- detect halt from CPU
		wait until <<signal .cpu_tb.cpu.sc_io.sc_sysinfo.rdy_reg : std_logic_vector(1 downto 0)>> = "11";
		-- wait for UART to complete
        if unsigned(<<signal .cpu_tb.cpu.sc_io.sc_uart.tf.f : std_logic_vector(31 downto 0)>>) /= 0 then
            wait until unsigned(<<signal .cpu_tb.cpu.sc_io.sc_uart.tf.f : std_logic_vector(31 downto 0)>>) = 0;
            wait for 11 * 8.68 us;
        end if;

		halted <= true;

		-- extract r0 and print
		s := <<signal .cpu_tb.cpu.core.decode.rf.g_regfile.src : g_reg_src_type>>;
		r := <<signal .cpu_tb.cpu.core.decode.rf.g_regfile.regfile : g_reg_regfile_type>>;
		write(l, string'("EXIT "));
		write(l, to_integer(signed(r(s(0))(0))));
		writeline(output, l);
		
		wait until not halted;
	end process halt;
	
	read_tx: process
		variable data : std_logic_vector(8 downto 0);
		variable l, m : line;
	begin
		wait until io_out.txd = '0' or halted;
		
		if halted then
			-- flush output
			if l /= null then
				write(m, string'("LINE "));
				write(m, l.all);
				writeline(output, m);
			end if;
			wait until not halted;
		end if;

		wait for 4.34 us;
		for i in 0 to 8 loop
			wait for 8.68 us;
			data(i) := io_out.txd;
		end loop;

		-- write each character
		write(m, string'(">"));
		write(m, character'val(to_integer(unsigned(data(7 downto 0)))));
		writeline(output, m);

		-- write full line
		write(l, character'val(to_integer(unsigned(data(7 downto 0)))));
		if data(7 downto 0) = X"0A" then
			write(m, string'("LINE "));
			write(m, l.all);
            deallocate(l);
			writeline(output, m);
		end if;

	end process read_tx;

end sim;
