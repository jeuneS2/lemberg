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
use work.reg_pack.all;
use work.op_pack.all;
use work.mem_pack.all;
use work.jmp_pack.all;
use work.io_pack.all;

entity memunit is
	
	port (
		clk	        : in  std_logic;
		reset       : in  std_logic;
		op	        : in  memop_arr_type;
		stallop     : in  stallop_arr_type;
		fl_in       : in  std_logic_vector(FLAG_COUNT-1 downto 0);
		ena		    : out std_logic;
		memdata     : out std_logic_vector(DATA_WIDTH-1 downto 0);
		ba          : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		rb_out      : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		rb_wren     : in  std_logic_vector(CLUSTERS-1 downto 0);
		rb_in       : in  rb_wrdata_type;
		pcoff       : out std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0);
		inval       : out std_logic;
		imem_write  : out imem_write_type;		
		mem_out     : out sc_out_type;
		mem_in      : in  sc_in_type);

end memunit;

architecture behavior of memunit is

	type IMEM_STATE_TYPE is (IDLE,
							 MISS,
							 SIZE_WAIT, SIZE_SKIP, SIZE_RD,
							 BODY_WAIT, BODY_SKIP, BODY_WR, BODY_LAST);

	signal imem_state_reg,  imem_state_next  : IMEM_STATE_TYPE;
	signal imem_addr_reg,   imem_addr_next   : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal imem_idx_reg,    imem_idx_next    : std_logic_vector(PC_WIDTH-3 downto 0);
	signal imem_size_reg,   imem_size_next   : std_logic_vector(PC_WIDTH-3 downto 0);

	signal icache_hit : std_logic;
	signal icache_detect, icache_update, icache_clear : std_logic;
	signal icache_offset : std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0);
	signal icache_address : std_logic_vector(ADDR_WIDTH-1 downto 0);
	
	signal ba_reg, ba_next : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal rb_reg, rb_next : std_logic_vector(ADDR_WIDTH-1 downto 0);

	signal ena_int, ena_init : std_logic;

	signal operation : MEM_TYPE;
	signal address   : std_logic_vector(ADDR_WIDTH+1 downto 0);
	signal wrdata    : std_logic_vector(DATA_WIDTH-1 downto 0);

	signal stalloperation : STALL_TYPE;
	signal ready          : std_logic;

	type addrvec_type is array (CLUSTERS-1 downto 0) of std_logic_vector(ADDR_WIDTH+1 downto 0);

begin  -- behavior

	icache: entity work.icache
		port map (
			clk		=> clk,
			reset	=> reset,
			detect  => icache_detect,
			update	=> icache_update,
			clear	=> icache_clear,
			address => icache_address,
			hit		=> icache_hit,
			offset	=> icache_offset);
	
	ena <= ena_int and ena_init;
	ba <= ba_reg;
	rb_out <= rb_reg;
	pcoff <= icache_offset;
	
	init: process (clk, reset)
	begin  -- process init
		if reset = '0' then  			-- asynchronous reset (active low)
			ena_init <= '0';
		elsif clk'event and clk = '1' then  -- rising clock edge
			ena_init <= '1';
		end if;
	end process init;
	
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)			
			-- booting!
			imem_state_reg <= IDLE;			
			
			imem_addr_reg <= (others => '0');
			imem_idx_reg <= (others => '0');
			imem_size_reg <= (others => '0');

			ba_reg <= (others => '0');
			rb_reg <= (others => '0');
			
		elsif clk'event and clk = '1' then  -- rising clock edge
			imem_state_reg <= imem_state_next;
			imem_addr_reg <= imem_addr_next;
			imem_idx_reg <= imem_idx_next;
			imem_size_reg <= imem_size_next;

			ba_reg <= ba_next;
			rb_reg <= rb_next;

			assert imem_state_reg /= SIZE_RD
				or unsigned(mem_in.rd_data(DATA_WIDTH-1 downto PC_WIDTH)) = 0
				report "Method size exceeds method cache capacity" severity error;
		end if;
	end process sync;

	async: process (op, fl_in, mem_in, ena_int,
					operation, address, wrdata,
					imem_state_reg, imem_addr_reg, imem_idx_reg, imem_size_reg,
					icache_hit, icache_offset, icache_address,
					ba_reg, rb_reg, rb_in, rb_wren)
		
		variable idx : integer range 0 to CLUSTERS-1;
		variable valid : std_logic;
		variable addrvec : addrvec_type;

	begin  -- process async

		idx := 0;
		valid := '0';
		for i in 0 to CLUSTERS-1 loop
			case op(i).cond is
				when COND_TRUE =>
					if unsigned(op(i).flag and fl_in) /= 0 then
						idx := i;
						valid := '1';
					end if;
				when COND_FALSE =>
					if unsigned(op(i).flag and not fl_in) /= 0 then
						idx := i;
						valid := '1';
					end if;
				when others => null;
			end case;

			addrvec(i) := std_logic_vector(unsigned(op(i).address)
										   +unsigned(op(i).index));

			-- addr+index must not cross memory area
			-- addrvec(i)(ADDR_WIDTH-1+2 downto ADDR_WIDTH-AREAMUX_BITS+2) :=
			--		op(i).address(ADDR_WIDTH-1+2 downto ADDR_WIDTH-AREAMUX_BITS+2);

		end loop;  -- i

		operation <= op(idx).op;
		address <= addrvec(idx);
		wrdata <= op(idx).wrdata;
		
		mem_out.address <= address(ADDR_WIDTH+1 downto 2);
		mem_out.rd <= '0';
		mem_out.wr <= '0';
		mem_out.wr_data <= wrdata;
		mem_out.byte_ena <= (others => '0');
		mem_out.cache <= BYPASS;
		
		memdata <= mem_in.rd_data;
		
		imem_write.wren <= '0';
		imem_write.wraddr <= imem_idx_reg;
		imem_write.wrdata <= mem_in.rd_data;

		imem_state_next <= imem_state_reg;
		imem_addr_next <= imem_addr_reg;
		imem_idx_next <= imem_idx_reg;
		imem_size_next <= imem_size_reg;

		icache_detect <= '0';
		icache_update <= '0';
		icache_clear <= '0';
		if operation = MEM_RET then
			icache_address <= rb_reg;
		else
			icache_address <= op(idx).address(ADDR_WIDTH+1 downto 2);
		end if;
		
		ba_next <= ba_reg;
		rb_next <= rb_reg;

		for i in CLUSTERS-1 downto 0 loop
			if rb_wren(i) = '1' then
				rb_next <= rb_in(i);
			end if;
		end loop;  -- i

		inval <= '0';

		case operation is
			when MEM_NOP =>
				-- nothing to do
			when MEM_STM_A =>
				mem_out.wr <= valid and ena_int;
				mem_out.cache <= ALL_CACHES;
				mem_out.byte_ena <= (others => '1');
			when MEM_STMH_A =>
				mem_out.wr <= valid and ena_int;
				mem_out.cache <= ALL_CACHES;
				if address(1) = '0' then
					mem_out.wr_data(15 downto 0) <= wrdata(15 downto 0);
					mem_out.byte_ena <= "0011";
				else
					mem_out.wr_data(31 downto 16) <= wrdata(15 downto 0);
					mem_out.byte_ena <= "1100";
				end if;
			when MEM_STMB_A =>
				mem_out.wr <= valid and ena_int;
				mem_out.cache <= ALL_CACHES;
				case address(1 downto 0) is
					when "00" =>
						mem_out.wr_data(7 downto 0) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "0001";
					when "01" =>
						mem_out.wr_data(15 downto 8) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "0010";
					when "10" =>
						mem_out.wr_data(23 downto 16) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "0100";
					when "11" =>
						mem_out.wr_data(31 downto 24) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "1000";
					when others => null;
				end case;
			when MEM_WB_S =>
				-- TODO: not implemented
			when MEM_STM_S =>
				mem_out.wr <= valid and ena_int;
				mem_out.cache <= STACK;
				mem_out.byte_ena <= (others => '1');
			when MEM_STMH_S =>
				mem_out.wr <= valid and ena_int;
				mem_out.cache <= STACK;
				if address(1) = '0' then
					mem_out.wr_data(15 downto 0) <= wrdata(15 downto 0);
					mem_out.byte_ena <= "0011";
				else
					mem_out.wr_data(31 downto 16) <= wrdata(15 downto 0);
					mem_out.byte_ena <= "1100";
				end if;
			when MEM_STMB_S =>
				mem_out.wr <= valid and ena_int;
				mem_out.cache <= STACK;
				case address(1 downto 0) is
					when "00" =>
						mem_out.wr_data(7 downto 0) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "0001";
					when "01" =>
						mem_out.wr_data(15 downto 8) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "0010";
					when "10" =>
						mem_out.wr_data(23 downto 16) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "0100";
					when "11" =>
						mem_out.wr_data(31 downto 24) <= wrdata(7 downto 0);
						mem_out.byte_ena <= "1000";
					when others => null;
				end case;
			when MEM_LDM_B =>
				mem_out.rd <= valid and ena_int;
				mem_out.cache <= BYPASS;
			when MEM_LDM_D =>
				mem_out.rd <= valid and ena_int;
				mem_out.cache <= DIRECTMAP;
			when MEM_LDM_F =>
				mem_out.rd <= valid and ena_int;
				mem_out.cache <= FULLASSOC;
			when MEM_LDM_S =>
				mem_out.rd <= valid and ena_int;
				mem_out.cache <= STACK;
			when MEM_CALL | MEM_RET =>
				if valid = '1' and ena_int = '1' then
					icache_detect <= '1';

					imem_idx_next <= (others => '0');
					imem_idx_next(PC_WIDTH-3 downto PC_WIDTH-ICACHE_BLOCK_BITS-2) <= icache_offset;

					if icache_hit = '1' then
						imem_state_next <= IDLE;
					else
						imem_state_next <= MISS;
					end if;

					if operation = MEM_RET then
						imem_addr_next <= rb_reg;
						ba_next <= rb_reg;
					else
						imem_addr_next <= icache_address;
						ba_next <= icache_address;
						rb_next <= ba_reg;
					end if;
				end if;
			when others =>
				assert false report "Invalid MEMUNIT operation" severity error;
		end case;

		case imem_state_reg is
			when IDLE =>
				-- nothing to do
			when MISS =>
				mem_out.rd <= '1';
				mem_out.address <= imem_addr_reg;
				mem_out.cache <= BYPASS;
				
				imem_state_next <= SIZE_WAIT;
				icache_update <= '1';
			when SIZE_WAIT =>
				if mem_in.rdy_cnt <= 2 then
					imem_addr_next <= std_logic_vector(unsigned(imem_addr_reg)+1);
					imem_state_next <= SIZE_SKIP;
				end if;
			when SIZE_SKIP =>
				mem_out.rd <= '1';
				mem_out.address <= imem_addr_reg;
				mem_out.cache <= BYPASS;
				imem_state_next <= SIZE_RD;
			when SIZE_RD =>
				imem_size_next <= mem_in.rd_data(PC_WIDTH-1 downto 2);
				imem_state_next <= BODY_WAIT;
			when BODY_WAIT =>
				if mem_in.rdy_cnt <= 2 then					
					imem_addr_next <= std_logic_vector(unsigned(imem_addr_reg)+1);
					if unsigned(imem_size_reg) /= 0 then
						imem_size_next <= std_logic_vector(unsigned(imem_size_reg)-1);
						imem_state_next <= BODY_SKIP;
					else
						imem_state_next <= BODY_LAST;
					end if;
				else
					imem_state_next <= BODY_WAIT;
				end if;
			when BODY_SKIP =>
				mem_out.rd <= '1';
				mem_out.address <= imem_addr_reg;
				mem_out.cache <= BYPASS;
				imem_state_next <= BODY_WR;
			when BODY_WR =>				
				imem_write.wren <= '1';
				imem_idx_next <= std_logic_vector(unsigned(imem_idx_reg)+1);
				imem_state_next <= BODY_WAIT;
				if signed(imem_idx_reg(PC_WIDTH-ICACHE_BLOCK_BITS-3 downto 0)) = -1 then
					icache_clear <= '1';
				end if;
			when BODY_LAST =>
				if mem_in.rdy_cnt = 0 then
					imem_write.wren <= '1';
					imem_state_next <= IDLE;
				else
					imem_state_next <= BODY_LAST;
				end if;
			when others => null;
		end case;

	end process async;

	stall: process (stallop, fl_in, mem_in,
					stalloperation, ready,
					imem_state_reg)

		variable idx : integer range 0 to CLUSTERS-1;
		variable valid : std_logic;
		variable readyvec : std_logic_vector(CLUSTERS-1 downto 0);
		
	begin  -- process stall

		idx := 0;
		valid := '0';
		readyvec := (others => '0');

		-- default operations
		for i in 0 to CLUSTERS-1 loop
			case stallop(i).cond is
				when COND_TRUE =>
					if unsigned(stallop(i).flag and fl_in) /= 0 then
						idx := i;
						valid := '1';
					end if;
				when COND_FALSE =>
					if unsigned(stallop(i).flag and not fl_in) /= 0 then
						idx := i;
						valid := '1';
					end if;
				when others => null;
			end case;

			if mem_in.rdy_cnt <= unsigned(stallop(i).value) then
				readyvec(i) := '1';
			end if;
		end loop;  -- i

		-- STALL_WAIT may override STALL_SOFT_WAIT
		for i in 0 to CLUSTERS-1 loop
			case stallop(i).cond is
				when COND_TRUE =>
					if unsigned(stallop(i).flag and fl_in) /= 0 then
						if stallop(i).op = STALL_WAIT then
							idx := i;
						end if;
					end if;
				when COND_FALSE =>
					if unsigned(stallop(i).flag and not fl_in) /= 0 then
						if stallop(i).op = STALL_WAIT then
							idx := i;
						end if;
					end if;
				when others => null;
			end case;
		end loop;  -- i

		stalloperation <= stallop(idx).op;
		ready <= readyvec(idx);

		ena_int <= '1';
		case stalloperation is
			when STALL_NOP =>
				-- nothing to do
			when STALL_SOFTWAIT | STALL_WAIT =>
				if valid = '1' then
					ena_int <= ready;
				end if;
			when others =>
				assert false report "Invalid STALLUNIT operation" severity error;
		end case;
		if imem_state_reg /= IDLE then
			ena_int <= '0';
		end if;
		
	end process stall;
	
end behavior;
