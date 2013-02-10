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

entity lru is
generic (
	index_bits : integer := 5;
	line_bits  : integer := 2;
	fast_lines : integer := 2;
	cache_type : sc_cache_type);
port (
	clk, reset:		in std_logic;

	inval:			in std_logic;

	cpu_out:		in sc_out_type;
	cpu_in:			out sc_in_type;

	mem_out:		out sc_out_type;
	mem_in:			in sc_in_type);
end lru;

architecture rtl of lru is

	constant mem_bits : integer := ADDR_WIDTH;
	constant line_width : integer := 2**line_bits;
	constant line_cnt : integer := 2**index_bits;
	
	type cache_line_type is record
		index	: std_logic_vector(index_bits-1 downto 0);
		tag		: std_logic_vector(mem_bits-1 downto line_bits);
		valid	: std_logic;
	end record;

	type cache_line_array is array (integer range <>) of cache_line_type;

	type cache_data_type is array (0 to BYTES_PER_WORD-1)
		of std_logic_vector(BYTE_WIDTH-1 downto 0);
	
	signal ram_data : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ram_data_bytes : cache_data_type;
	signal ram_wraddress: std_logic_vector(index_bits+line_bits-1 downto 0);
	signal ram_rdaddress: std_logic_vector(index_bits+line_bits-1 downto 0);
	signal ram_wren : std_logic_vector(BYTES_PER_WORD-1 downto 0);
	signal ram_dout : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ram_dout_bytes : cache_data_type;
	
	signal int_reset : std_logic;
	
	-- what state we're in
	type STATE_TYPE is (idle, rd0, rd1, rd2, rd3, rd4);
	signal state, next_state : state_type;
	
	-- enabling data shifting
	signal enable :		std_logic_vector(0 to line_cnt-1);
	-- connecting cache lines
	signal data :		cache_line_array(-1 to line_cnt-1);
	-- signaling hits
	signal hit :		std_logic_vector(0 to line_cnt-1);

	-- register data from CPU
	signal cpu_out_reg, next_cpu_out : sc_out_type;
	-- register data to CPU
	signal rd_data_reg, next_rd_data : std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal crd_reg, next_crd : std_logic;
	signal early_reg, next_early : std_logic;

	signal rdoff, next_rdoff : std_logic_vector(line_bits-1 downto 0);
	signal wroff, next_wroff : std_logic_vector(line_bits-1 downto 0);

    --pragma synthesis off
    signal hits : integer := 0;
    type hit_cnt_type is array (0 to line_cnt-1) of integer;
    signal hit_cnt : hit_cnt_type := (others => 0);
   	--pragma synthesis on

begin

	int_reset <= reset and not inval;

	lines: for i in 0 to line_cnt-1 generate
		cache_line: block
			generic (
				index : unsigned(index_bits-1 downto 0));
			generic map (
				index => to_unsigned(i, index_bits));
			port (
				clk, reset:	in std_logic;				
				enable:		in std_logic;
				data_in:	in cache_line_type;
				data_out:	out cache_line_type;
				address:	in std_logic_vector(mem_bits-1 downto line_bits);
				hit:		out std_logic
				);
			port map (
				clk		 => clk,
				reset	 => int_reset,
				enable	 => enable(i),
				data_in	 => data(i-1),
				data_out => data(i),
				address	 => cpu_out_reg.address(mem_bits-1 downto line_bits),
				hit		 => hit(i));			
			signal data: cache_line_type;
		begin
			sync: process(clk, reset)
			begin
				if reset = '0' then
					data <= (std_logic_vector(index), (others => '0'), '0');
				elsif rising_edge(clk) then
					if enable = '1' then
						data <= data_in;
					end if;			
				end if;
			end process;
			async: process (data, address)
			begin
				data_out <= data;
				if data.tag = address and data.valid='1' then
					hit <= '1';
				else
					hit <= '0';
				end if;
			end process;
		end block cache_line;
	end generate lines;

	splitjoin: process (ram_data, ram_dout_bytes)
	begin  -- process splitjoin
		for i in 0 to BYTES_PER_WORD-1 loop
			ram_data_bytes(i) <= ram_data(BYTE_WIDTH*(i+1)-1 downto BYTE_WIDTH*i);			
		end loop;  -- i
		for i in 0 to BYTES_PER_WORD-1 loop
			ram_dout(BYTE_WIDTH*(i+1)-1 downto BYTE_WIDTH*i) <= ram_dout_bytes(i);
		end loop;  -- i
	end process splitjoin;

	gen_cache_ram: for i in 0 to BYTES_PER_WORD-1 generate
		cache_ram: entity work.sdpram
		generic map (
			width	   => BYTE_WIDTH,
			addr_width => index_bits+line_bits)
		port map (
			wrclk	   => clk,
			data	   => ram_data_bytes(i),
			wraddress  => ram_wraddress,
			wren	   => ram_wren(i),
			
			rdclk	   => clk,
			dout	   => ram_dout_bytes(i),
			rdaddress  => ram_rdaddress,
			rden	   => '1');
	end generate gen_cache_ram;

	sync: process (clk, int_reset)
	begin  -- process sync
		if int_reset = '0' then	 -- asynchronous reset (active low)
			cpu_out_reg <= ((others => '0'), (others => '0'), '0', '0', "1111", bypass);
			rd_data_reg <= (others => '0');
			crd_reg <= '0';
            early_reg <= '0';
            
			rdoff <= (others => '0');
			wroff <= (others => '0');
			state <= idle;

		elsif clk'event and clk = '1' then	-- rising clock edge
			cpu_out_reg <= next_cpu_out;				
			rd_data_reg <= next_rd_data;
			crd_reg <= next_crd;
            early_reg <= next_early;
            
			rdoff <= next_rdoff;
			wroff <= next_wroff;
			state <= next_state;

		end if;
	end process sync;
	
	async: process (cpu_out, cpu_out_reg, mem_in,
					ram_dout, rd_data_reg, crd_reg, early_reg,
					rdoff, wroff, state, data, hit)

		variable merged_index : std_logic_vector(index_bits-1 downto 0);
		variable merged_hit : std_logic;
		variable ena : std_logic_vector(0 to line_cnt-1);
		
	begin  -- process async

		-- gate data, depending on hit
		merged_hit := '0';
		ena := (others => '0');
		merged_index := (others => '0');
		for i in 0 to line_cnt-1 loop
			merged_hit := merged_hit or hit(i);
			if hit(i) = '1' then
				for k in 0 to i loop
					ena(k) := ena(k) or '1';
				end loop;  -- k
				merged_index := merged_index or data(i).index;
			end if;
		end loop;  -- i
		
		-- hit data that goes to cache line 0
		data(-1) <= (merged_index, cpu_out_reg.address(mem_bits-1 downto line_bits), '0');
		-- nothing is enabled by default
		enable <= (others => '0');

		-- register data from CPU
		if cpu_out.rd = '1' or cpu_out.wr = '1' then
			next_cpu_out <= cpu_out;
		else
			next_cpu_out <= cpu_out_reg;
		end if;

		-- default values to CPU
		cpu_in.rdy_cnt <= "00";
		if crd_reg = '1' then
			cpu_in.rd_data <= ram_dout;
			next_rd_data <= ram_dout;
		else
			cpu_in.rd_data <= rd_data_reg;
			next_rd_data <= rd_data_reg;
		end if;
		next_crd <= '0';
        next_early <= '0';
		
		-- default outputs to memory
		mem_out.address <= cpu_out_reg.address(ADDR_WIDTH-1 downto line_bits) & rdoff;
		mem_out.wr_data <= cpu_out_reg.wr_data;
		mem_out.rd <= '0';
		mem_out.wr <= '0';
		mem_out.byte_ena <= cpu_out_reg.byte_ena;
		mem_out.cache <= cpu_out_reg.cache;
		
		-- signals for ram block
		ram_data <= cpu_out_reg.wr_data;
		ram_wraddress <= merged_index & cpu_out_reg.address(line_bits-1 downto 0);
		ram_rdaddress <= merged_index & cpu_out_reg.address(line_bits-1 downto 0);
		ram_wren <= (others => '0');

		next_rdoff <= rdoff;
		next_wroff <= wroff;
		-- we're idle unless we know better
		next_state <= state;

		case state is

			when idle => null;			-- handled below

			-- memory read sequence, updating cache
			when rd0 =>
				cpu_in.rdy_cnt <= "11";
				mem_out.rd <= '1';
				-- shift cache lines
				enable <= (others => '1');
				data(-1) <= (data(line_cnt-1).index,
							 cpu_out_reg.address(mem_bits-1 downto line_bits), '1');
				next_rdoff <= std_logic_vector(unsigned(rdoff)+1);
				next_state <= rd1;
				
			when rd1 =>					-- wait for memory
				cpu_in.rdy_cnt <= "11";
				if mem_in.rdy_cnt <= 1 then
					mem_out.rd <= '1';
					next_state <= rd2;
				else
					next_state <= rd1;
				end if;

			when rd2 =>					-- write back data to cache
				cpu_in.rdy_cnt <= "11";
				ram_data <= mem_in.rd_data;
				ram_wraddress <= data(0).index & wroff;
				ram_wren <= (others => '1');
				if cpu_out_reg.address(line_bits-1 downto 0) = wroff then
					next_rd_data <= mem_in.rd_data;
				end if;
				next_wroff <= rdoff;
				next_rdoff <= std_logic_vector(unsigned(rdoff)+1);
				if rdoff = std_logic_vector(to_unsigned(line_width-1, line_bits)) then
					next_state <= rd3;
				else
					next_state <= rd1;
				end if;

			when rd3 =>					-- wait for memory
				cpu_in.rdy_cnt <= "11";
				if mem_in.rdy_cnt <= 1 then
					next_state <= rd4;
				else
					next_state <= rd3;
				end if;

			when rd4 =>					-- write back data to cache
				cpu_in.rdy_cnt <= "11";
				ram_data <= mem_in.rd_data;
				ram_wraddress <= data(0).index & wroff;
				ram_wren <= (others => '1');
				if cpu_out_reg.address(line_bits-1 downto 0) = wroff then
					next_rd_data <= mem_in.rd_data;
				end if;
				next_wroff <= rdoff;
				next_state <= idle;

			when others => null;
		end case;

		-- start a new transaction
		if cpu_out_reg.wr = '1' and cpu_out_reg.cache = ALL_CACHES then

			-- do not update on writes
			enable <= (others => '0');

			next_cpu_out.wr <= cpu_out.wr;

			if merged_hit = '1' then
				-- write new data on hit
				ram_data <= cpu_out_reg.wr_data;
				ram_wraddress <= merged_index & cpu_out_reg.address(line_bits-1 downto 0);
				ram_wren <= cpu_out_reg.byte_ena;
			end if;

			next_state <= idle;
		end if;

        -- early reads
        if cpu_out.rd = '1' then
			if cpu_out.cache = cache_type then
                for i in 0 to fast_lines-1 loop
                    if cpu_out.address(mem_bits-1 downto line_bits) = data(i).tag
                        and data(i).valid='1' then
                        ram_rdaddress <= data(i).index & cpu_out.address(line_bits-1 downto 0);
                        next_crd <= '1';
                        next_early <= '1';
                    end if;
                end loop;  -- i
            end if;
        end if;

		if cpu_out_reg.rd = '1' then

			if cpu_out_reg.cache = cache_type then
				-- set enables for shifting lines
				enable <= ena;
				
				next_cpu_out.rd <= cpu_out.rd;

				if merged_hit = '1' then
					
					-- shift in new data
					data(-1) <= (merged_index, cpu_out_reg.address(mem_bits-1 downto line_bits), '1');
					-- read from cache if not already read
                    if early_reg = '0' then
                        ram_rdaddress <= merged_index & cpu_out_reg.address(line_bits-1 downto 0);
                        cpu_in.rdy_cnt <= "11";                        
                        next_crd <= '1';
                    end if;

				else

					-- trigger a read
					cpu_in.rdy_cnt <= "11";
					next_state <= rd0;
				end if;
			end if;
			
		end if;	
				
	end process async;

    	----------------------------------------------------------------
	-- gather statistics
	----------------------------------------------------------------
	--pragma synthesis off
	stat: process (clk)
	begin  -- process
		if clk'event and clk = '1' then	 -- rising clock edge
            for i in 0 to line_cnt-1 loop
                if cpu_out.rd = '1' and cpu_out_reg.cache = cache_type then
                    if cpu_out.address(mem_bits-1 downto line_bits) = data(i).tag then
                        hits <= hits + 1;
                        hit_cnt(i) <= hit_cnt(i) + 1;
                    end if;
                end if;
            end loop;  -- i
		end if;
	end process;
	--pragma synthesis on

end rtl;
