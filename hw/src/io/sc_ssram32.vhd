----------------------------------------------------------------------------
-- This file is part of Lemberg.
-- Copyright (C) 2001-2011 Martin Schoeberl
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

--
--	sc_ssram32.vhd
--
--	SimpCon compliant external memory interface
--	for 32-bit SSRAM (e.g. Altera DE2-70 board)
--
--	Connection between mem_sc and the external memory bus
--
--	memory mapping
--	
--		000000-x7ffff	external SRAM (w mirror)	max. 512 kW (4*4 MBit)
--
--	RAM: 32 bit word
--
--
--	2005-11-22	first version
--	2007-03-17	changed SimpCon to records
--	2008-05-29	nwe on pos edge, additional wait state for write
--	2010-06-25  adapted from sc_sram32.vhd for synchronous SRAM
--

Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mem_pack.all;
use work.pin_pack.all;

entity sc_mem_if is
generic (ram_ws : integer; addr_bits : integer);

port (

	clk, reset	: in std_logic;

--
--	SimpCon memory interface
--
	sc_mem_out		: in sc_out_type;
	sc_mem_in		: out sc_in_type;

-- memory interface

	ram_out     : out   sram_pin_out_type;
	ram_inout   : inout sram_pin_inout_type
);
end sc_mem_if;

architecture rtl of sc_mem_if is

--
--	signals for mem interface
--
	type state_type		is (
							idl, rd1, rd2,
							wr1, wr2
						);
	signal state 		: state_type;
	signal next_state	: state_type;

	signal wait_state	: unsigned(3 downto 0);
	signal cnt			: unsigned(1 downto 0);

	signal cs           : std_logic;
	signal dout_ena		: std_logic;
	signal rd_data_ena	: std_logic;
	
	signal ram_ws_wr	: integer;

	signal ram_dout     : std_logic_vector(31 downto 0);
	signal ram_din      : std_logic_vector(31 downto 0);
	signal ram_din_reg  : std_logic_vector(31 downto 0);
	
begin
	
	ram_ws_wr <= ram_ws; -- no additional wait state for SSRAM

	sc_mem_in.rdy_cnt <= cnt;

--
--	Register memory address, write data and read data
--
process(clk, reset)
begin
	if reset='0' then

		ram_out.addr <= (others => '0');
		ram_dout <= (others => '0');
		sc_mem_in.rd_data <= (others => '0');

	elsif rising_edge(clk) then

		if sc_mem_out.rd='1' or sc_mem_out.wr='1' then
			ram_out.addr <= sc_mem_out.address(addr_bits-1 downto 0);
		end if;
		if sc_mem_out.wr='1' then
			ram_dout <= sc_mem_out.wr_data;
		end if;
		if rd_data_ena='1' then
			sc_mem_in.rd_data <= ram_din_reg;
		end if;

	end if;
end process;

-- inverted clock to have some setup time
ram_out.clk <= not clk;

process(clk, reset)
begin
	-- latch input data on negative edge to help hold time
	if reset='0' then
		ram_din_reg <= (others => '0');
	elsif falling_edge(clk) then
		ram_din_reg <= ram_din;
	end if;
end process;

--
--	next state logic
--
process(state, sc_mem_out, wait_state)

begin

	next_state <= state;

	case state is

		when idl =>

		-- the read address state
		when rd1 =>
			next_state <= rd2;

		-- the read fetch state
		when rd2 =>
			if wait_state=1 then
				next_state <= idl;
			end if;
			
		-- the write address/data state
		when wr1 =>
			next_state <= wr2;
		
		-- the write enable state
		when wr2 =>
			if wait_state=1 then
				next_state <= idl;
			end if;
			
	end case;

	-- a pipeline level of 2 should be okay
	if sc_mem_out.rd='1' then
		next_state <= rd1;
	elsif sc_mem_out.wr='1' then
		next_state <= wr1;
	end if;

end process;

--
--	state machine register
--	output register
--
process(clk, reset)

begin
	if (reset='0') then
		state <= idl;
		dout_ena <= '0';
		cs <= '0';
		ram_out.nsc <= '1';
		ram_out.noe <= '1';
		ram_out.nwe <= '1';
		ram_out.nbw <= (others => '1');
		rd_data_ena <= '0';

	elsif rising_edge(clk) then

		state <= next_state;
		dout_ena <= '0';
		cs <= '0';
		ram_out.nsc <= '1';
		ram_out.noe <= '1';
		ram_out.nwe <= '1';
		ram_out.nbw <= (others => '1');
		rd_data_ena <= '0';

		case next_state is

			when idl =>

			-- the wait state
			when rd1 =>
				cs <= '1';
				ram_out.nsc <= '0';
				ram_out.noe <= '0';

			-- last read state
			when rd2 =>
				ram_out.noe <= '0';
				if wait_state=2 then
					rd_data_ena <= '1';					
				end if;
				
			-- write address/data state
			when wr1 =>
				cs <= '1';
				ram_out.nsc <= '0';
				ram_out.nwe <= '0';
				ram_out.nbw <= not sc_mem_out.byte_ena;
				dout_ena <= '1';
			
			-- write enable state	
			when wr2 =>
				dout_ena <= '1';

		end case;
					
	end if;
end process;

--
-- wait_state processing
--
process(clk, reset)
begin
	if (reset='0') then
		wait_state <= (others => '0');
		cnt <= "00";
	elsif rising_edge(clk) then

		if wait_state /= 0 then
			wait_state <= wait_state-1;			
		end if;

		cnt <= "11";
		if wait_state(3 downto 2)="00" then
			if wait_state=0 then
				cnt <= "00";
			else
				cnt <= wait_state(1 downto 0)-1;
			end if;
		end if;

		if sc_mem_out.rd='1' then
			wait_state <= to_unsigned(ram_ws+1, 4);
			if ram_ws<3 then
				cnt <= to_unsigned(ram_ws+1, 2);
			else
				cnt <= "11";
			end if;
		end if;
		
		if sc_mem_out.wr='1' then
			wait_state <= to_unsigned(ram_ws_wr+1, 4);
			if ram_ws_wr<3 then
				cnt <= to_unsigned(ram_ws_wr+1, 2);
			else
				cnt <= "11";
			end if;
		end if;

	end if;
end process;

-- handle ram connection
process(dout_ena, ram_dout)
begin
	if dout_ena='1' then
		ram_inout.d <= ram_dout;
	else
		ram_inout.d <= (others => 'Z');
	end if;
end process;
ram_din <= ram_inout.d;

ram_out.ngw   <= '1';
ram_out.nce1  <= not cs;
ram_out.ce2   <= cs;
ram_out.nce3  <= not cs;
ram_out.nadsp <= '1';
ram_out.nadv  <= '1';

end rtl;
