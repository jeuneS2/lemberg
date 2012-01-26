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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.core_pack.all;
use work.mem_pack.all;

entity stackcache is
generic (
	index_bits : integer := 9;
	cache_type : sc_cache_type);
port (
	clk, reset:	    in std_logic;

	inval:			in std_logic;

	cpu_out:		in sc_out_type;
	cpu_in:			out sc_in_type;

	mem_out:		out sc_out_type;
	mem_in:			in sc_in_type);
end stackcache;

architecture rtl of stackcache is

	constant mem_bits : integer := ADDR_WIDTH;
	constant line_cnt : integer := 2**index_bits;
	
	type cache_line_type is record
		data	: std_logic_vector(DATA_WIDTH-1 downto 0);
		tag		: std_logic_vector(mem_bits-index_bits-1 downto 0);
		valid   : std_logic;
	end record;

	type cache_data_type is array (0 to BYTES_PER_WORD-1)
		of std_logic_vector(BYTE_WIDTH-1 downto 0);

	signal ram_din : cache_line_type;
	signal ram_din_raw_tag : std_logic_vector(mem_bits-index_bits downto 0);
	signal ram_din_raw_data : cache_data_type;
	signal ram_wraddress : std_logic_vector(index_bits-1 downto 0);
	signal ram_wren_tag : std_logic;
	signal ram_wren_data : std_logic_vector(BYTES_PER_WORD-1 downto 0);

	signal ram_dout : cache_line_type;
	signal ram_dout_raw_tag : std_logic_vector(mem_bits-index_bits downto 0);
	signal ram_dout_raw_data : cache_data_type;
	signal ram_rdaddress : std_logic_vector(index_bits-1 downto 0);
	signal ram_rden_tag : std_logic;
	signal ram_rden_data : std_logic_vector(BYTES_PER_WORD-1 downto 0);
	
	signal cpu_out_reg, next_cpu_out : sc_out_type;

	signal rddata_reg, next_rddata : std_logic_vector(DATA_WIDTH-1 downto 0);

	type STATE_TYPE is (idle, rd0, rd1, wr0, wr1);
	signal state, next_state : STATE_TYPE;

begin

	splitjoin: process (ram_din, ram_dout_raw_data, ram_dout_raw_tag)
	begin  -- process splitjoin
		for i in 0 to BYTES_PER_WORD-1 loop
			ram_din_raw_data(i) <= ram_din.data(BYTE_WIDTH*(i+1)-1 downto BYTE_WIDTH*i);			
		end loop;  -- i	
		ram_din_raw_tag(mem_bits-index_bits downto 1) <= ram_din.tag;
		ram_din_raw_tag(0) <= ram_din.valid;

		for i in 0 to BYTES_PER_WORD-1 loop
			ram_dout.data(BYTE_WIDTH*(i+1)-1 downto BYTE_WIDTH*i) <= ram_dout_raw_data(i);
		end loop;  -- i	
		ram_dout.tag <= ram_dout_raw_tag(mem_bits-index_bits downto 1);
		ram_dout.valid <= ram_dout_raw_tag(0);	   
	end process splitjoin;

	cache_tram: entity work.sdpram
		generic map (
			width	   => mem_bits-index_bits+1,
			addr_width => index_bits)
		port map (
			wrclk	   => clk,
			data	   => ram_din_raw_tag,
			wraddress  => ram_wraddress,
			wren	   => ram_wren_tag,
			
			rdclk	   => clk,
			dout	   => ram_dout_raw_tag,
			rdaddress  => ram_rdaddress,
			rden	   => ram_rden_tag);

	gen_cache_dram: for i in 0 to BYTES_PER_WORD-1 generate
		cache_dram: entity work.sdpram
		generic map (
			width	   => BYTE_WIDTH,
			addr_width => index_bits)
		port map (
			wrclk	   => clk,
			data	   => ram_din_raw_data(i),
			wraddress  => ram_wraddress,
			wren	   => ram_wren_data(i),
			
			rdclk	   => clk,
			dout	   => ram_dout_raw_data(i),
			rdaddress  => ram_rdaddress,
			rden	   => ram_rden_data(i));
	end generate gen_cache_dram;
	
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  -- asynchronous reset (active low)			

			cpu_out_reg <= ((others => '0'), (others => '0'), '0', '0', "1111", bypass);
			rddata_reg <= (others => '0');
			state <= idle;

		elsif clk'event and clk = '1' then  -- rising clock edge

			cpu_out_reg <= next_cpu_out;
			rddata_reg <= next_rddata;
			state <= next_state;

		end if;
	end process sync;

	async: process (cpu_out, mem_in, ram_dout,
					cpu_out_reg, rddata_reg, state)
	begin  -- process

		next_cpu_out <= cpu_out_reg;
		next_rddata <= rddata_reg;
		next_state <= state;

		-- return data from on-chip memory
		cpu_in.rd_data <= rddata_reg;
		cpu_in.rdy_cnt <= "00";

		-- defaults to access on-chip memory
		ram_rdaddress <= cpu_out.address(index_bits-1 downto 0);
		ram_rden_tag <= '0';
		ram_rden_data <= (others => '0');
		ram_wraddress <= cpu_out_reg.address(index_bits-1 downto 0);
		ram_wren_tag <= '0';
		ram_wren_data <= (others => '0');

		ram_din.valid <= '1';
		ram_din.data <= cpu_out_reg.wr_data;
		ram_din.tag <= cpu_out_reg.address(mem_bits-1 downto index_bits);

		-- defaults to access RAM
		mem_out.address <= cpu_out_reg.address;
		mem_out.rd <= '0';
		mem_out.wr <= '0';
		mem_out.wr_data <= cpu_out_reg.wr_data;
		mem_out.byte_ena <= cpu_out_reg.byte_ena;

		case state is

			when rd0 =>
				cpu_in.rdy_cnt <= "11";
				if ram_dout.tag = cpu_out_reg.address(mem_bits-1 downto index_bits)
					and ram_dout.valid = '1' then
					next_rddata <= ram_dout.data;
					next_state <= idle;					
				else
					mem_out.rd <= '1';
					next_state <= rd1;
				end if;

			when rd1 =>
				cpu_in.rdy_cnt <= "11";

				ram_din.data <= mem_in.rd_data;
				next_rddata <= mem_in.rd_data;

				if mem_in.rdy_cnt = 0 then
					ram_wren_tag <= '1';
					ram_wren_data <= (others => '1');
					next_state <= idle;
				end if;

			when wr0 =>
				cpu_in.rdy_cnt <= "00";

				ram_wren_tag <= '1';
				ram_wren_data <= cpu_out_reg.byte_ena;					

				next_state <= idle;
				
			when wr1 =>
				cpu_in.rdy_cnt <= "00";

				-- update data only if we have a cache hit
				if ram_dout.tag = cpu_out_reg.address(mem_bits-1 downto index_bits)
					and ram_dout.valid = '1' then					
					ram_wren_tag <= '1';
					ram_wren_data <= cpu_out_reg.byte_ena;					
				end if;
				next_state <= idle;

			when others => null;
		end case;
		
		if cpu_out.rd = '1' or cpu_out.wr = '1' then
			next_cpu_out <= cpu_out;
		end if;

		-- enable write
		if cpu_out.wr = '1' and cpu_out.cache = cache_type then
			next_state <= wr0;
		end if;
		-- write to ALL_CACHES only updates existing values
		if cpu_out.wr = '1' and cpu_out.cache = ALL_CACHES then
			ram_rden_tag <= '1';
			next_state <= wr1;
		end if;
		-- enable read
		if cpu_out.rd = '1' and cpu_out.cache = cache_type then
			ram_rden_tag <= '1';
			ram_rden_data <= (others => '1');
			next_state <= rd0;
		end if;			
		
	end process;
	
end rtl;
