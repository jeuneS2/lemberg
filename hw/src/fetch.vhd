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
use work.op_pack.all;

entity fetch is
	
	port (
		clk	     : in  std_logic;
		reset    : in  std_logic;
		raw_in   : in  std_logic_vector(0 to FETCHBUF_WIDTH-1);
		ena      : in  std_logic;
		xnop     : in  std_logic;
		raw_out  : out std_logic_vector(0 to FETCH_WIDTH-1);
		pc_out   : out std_logic_vector(PC_WIDTH-1 downto 0);
		vpc0_out : out std_logic_vector(PC_WIDTH-1 downto 0);
		vpc1_out : out std_logic_vector(PC_WIDTH-1 downto 0);
		pc_wr    : in  std_logic;
		pc0_in   : in  std_logic_vector(PC_WIDTH-1 downto 0);
		pc1_in   : in  std_logic_vector(PC_WIDTH-1 downto 0));

end fetch;

architecture behavior of fetch is

	-- virtual PC for fetching
	signal vpc0_reg, vpc0_next : unsigned(PC_WIDTH-1 downto 0);
	signal vpc1_reg, vpc1_next : unsigned(PC_WIDTH-1 downto 0);

	-- real PC for branching
	signal pc_reg, pc_next : unsigned(PC_WIDTH-1 downto 0);

	signal start_pos, start_next : unsigned(FETCHBUF_BITS-1 downto 0);
	signal fetch_pos, fetch_next : unsigned(FETCHBUF_BITS-1 downto 0);
	signal wrap_reg, wrap_next : std_logic;
	
	signal raw_reg, raw_next : std_logic_vector(0 to FETCHBUF_WIDTH-1);

	type maskvec_type is array (0 to FETCHBUF_BYTES-1) of std_logic_vector(CLUSTERS-1 downto 0);
	type opcntvec_type is array (0 to FETCHBUF_BYTES-1) of integer range 0 to CLUSTERS;
	
	type startvec_type is array (0 to CLUSTERS) of unsigned(FETCHBUF_BITS-1 downto 0);
	type pcvec_type is array (0 to CLUSTERS) of unsigned(PC_WIDTH-1 downto 0);

	-- precomputed values for next PC value
	signal vpc0_inc, vpc1_inc : unsigned(PC_WIDTH-1 downto 0);
	signal vpc0_stall, vpc1_stall : unsigned(PC_WIDTH-1 downto 0);

begin  -- behavior

	assert (CLUSTERS+CLUSTERS*SYLLABLE_WIDTH <= FETCH_WIDTH)
		report "Fetch width too small for length of bundles"
		severity error;
	
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)

			vpc0_reg <= to_unsigned(0, PC_WIDTH);
			vpc1_reg <= to_unsigned(FETCHBUF_BYTES/2, PC_WIDTH);
			pc_reg <= to_unsigned(0, PC_WIDTH);
			start_pos <= (others => '0');
			fetch_pos <= (others => '0');
			wrap_reg <= '0';
			raw_reg <= (others => '0');

			vpc0_inc <= (others => '0');
			vpc1_inc <= (others => '0');
			vpc0_stall <= (others => '0');
			vpc1_stall <= (others => '0');
			
		elsif clk'event and clk = '1' then  -- rising clock edge

			vpc0_reg <= vpc0_next;
			vpc1_reg <= vpc1_next;
			pc_reg <= pc_next;
			start_pos <= start_next;
			fetch_pos <= fetch_next;
			wrap_reg <= wrap_next;
			raw_reg <= raw_next;

			-- precompute values
			vpc0_inc <= vpc0_next+start_next;
			vpc1_inc <= vpc1_next+start_next;
			vpc0_stall <= vpc0_next+fetch_next;
			vpc1_stall <= vpc1_next+fetch_next;
			
		end if;
	end process sync;

	width: process (raw_in, raw_next, raw_reg, ena, xnop,
					vpc0_reg, vpc1_reg,
					pc_reg, pc_wr, pc0_in, pc1_in,
					start_pos, fetch_pos, wrap_reg,
					vpc0_inc, vpc1_inc,
					vpc0_stall, vpc1_stall)
		variable maskvec : maskvec_type;
		variable opcntvec : opcntvec_type;
		variable opcnt : integer range 0 to CLUSTERS;
		variable startvec : startvec_type;
		variable pcvec : pcvec_type;

	begin  -- process width

		for i in 0 to CLUSTERS loop			
			startvec(i) := start_pos + to_unsigned((CLUSTERS+i*SYLLABLE_WIDTH+BYTE_WIDTH-1)/BYTE_WIDTH, FETCHBUF_BITS);
			pcvec(i) := pc_reg + to_unsigned((CLUSTERS+i*SYLLABLE_WIDTH+BYTE_WIDTH-1)/BYTE_WIDTH, FETCHBUF_BITS);
		end loop;  -- i

		for i in 0 to FETCHBUF_BYTES-1 loop
			maskvec(i) := raw_next(i*BYTE_WIDTH to i*BYTE_WIDTH+CLUSTERS-1);
			opcntvec(i) := count_bits(maskvec(i));			
		end loop;  -- i
		opcnt := opcntvec(to_integer(start_pos));
		
		start_next <= startvec(opcnt);
		pc_next <= pcvec(opcnt);
		pc_out <= std_logic_vector(pcvec(opcnt));

		wrap_next <= '0';		
		raw_next <= raw_reg;
		fetch_next <= start_pos;

		if start_pos = fetch_pos or wrap_reg='1' then
			raw_next <= raw_in;
			fetch_next <= fetch_pos;
			vpc0_next <= vpc0_reg+FETCHBUF_BYTES;
			vpc1_next <= vpc1_reg+FETCHBUF_BYTES;
			vpc0_out <= std_logic_vector(vpc0_inc+FETCHBUF_BYTES);
			vpc1_out <= std_logic_vector(vpc1_inc+FETCHBUF_BYTES);
		elsif fetch_pos > start_pos then
			for i in 0 to FETCHBUF_WIDTH-1 loop
				if i >= to_integer(fetch_pos*BYTE_WIDTH) or i < to_integer(start_pos*BYTE_WIDTH)then
					raw_next(i) <= raw_in(i);
				end if;
			end loop;  -- i
			vpc0_next <= vpc0_reg+FETCHBUF_BYTES;
			vpc1_next <= vpc1_reg+FETCHBUF_BYTES;
			vpc0_out <= std_logic_vector(vpc0_inc+FETCHBUF_BYTES);
			vpc1_out <= std_logic_vector(vpc1_inc+FETCHBUF_BYTES);
		else
			for i in 0 to FETCHBUF_WIDTH-1 loop
				if i >= to_integer(fetch_pos*BYTE_WIDTH) and i < to_integer(start_pos*BYTE_WIDTH) then
					raw_next(i) <= raw_in(i);
				end if;
			end loop;  -- i
			vpc0_next <= vpc0_reg;
			vpc1_next <= vpc1_reg;
			vpc0_out <= std_logic_vector(vpc0_inc);
			vpc1_out <= std_logic_vector(vpc1_inc);
		end if;
				
		if pc_wr = '1' then
			start_next <= unsigned(pc0_in(FETCHBUF_BITS-1 downto 0));
			if unsigned(pc0_in(FETCHBUF_BITS-1 downto 0)) < FETCHBUF_BYTES/2 then
				fetch_next <= to_unsigned(0, FETCHBUF_BITS);
				wrap_next <= '1';
			else
				fetch_next <= to_unsigned(FETCHBUF_BYTES/2, FETCHBUF_BITS);
				wrap_next <= '1';
			end if;
			pc_next <= unsigned(pc0_in);
			vpc0_next <= unsigned(pc0_in(PC_WIDTH-1 downto FETCHBUF_BITS)) & to_unsigned(0, FETCHBUF_BITS);
			vpc1_next <= unsigned(pc0_in(PC_WIDTH-1 downto FETCHBUF_BITS)) & to_unsigned(FETCHBUF_BYTES/2, FETCHBUF_BITS);
			vpc0_out <= pc0_in;
			vpc1_out <= pc1_in;
		end if;

		if xnop = '1' then
			pc_out <= std_logic_vector(pc_reg);				
		end if;

		if ena = '0' or (xnop = '1' and pc_wr = '0') then
			start_next <= start_pos;
			fetch_next <= fetch_pos;
			wrap_next <= wrap_reg;
			pc_next <= pc_reg;
			vpc0_next <= vpc0_reg;
			vpc1_next <= vpc1_reg;
			vpc0_out <= std_logic_vector(vpc0_stall);
			vpc1_out <= std_logic_vector(vpc1_stall);
		end if;

	end process width;

	mux: process (raw_next, start_pos)
	begin  -- process mux
        for i in 0 to FETCH_WIDTH-1 loop
            -- wrap around
            if to_integer(start_pos*BYTE_WIDTH)+i < FETCHBUF_WIDTH then
                raw_out(i) <= raw_next(to_integer(start_pos*BYTE_WIDTH)+i);
            else
                raw_out(i) <= raw_next(to_integer(start_pos*BYTE_WIDTH)+i-FETCHBUF_WIDTH);
            end if;
        end loop;  -- i
	end process mux;
	
end behavior;
