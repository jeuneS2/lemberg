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
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.	 If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pack.all;
use work.op_pack.all;
use work.reg_pack.all;
use work.mem_pack.all;
use work.io_pack.all;

entity forward is
	
	port (
		clk			: in  std_logic;
		reset		: in  std_logic;
		ena			: in  std_logic;
		flush		: in  std_logic;
		memdata		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wren		: in  reg_wren_type;
		wraddr		: in  reg_wraddr_type;
		wrdata		: in  reg_wrdata_type;
		op_in		: in  op_arr_type;
		op_out		: out op_arr_type;
		memop_in	: in  memop_arr_type;
		memop_out	: out memop_arr_type;
		stallop_in	: in  stallop_arr_type;
		stallop_out : out stallop_arr_type;
		jmpop_in	: in  jmpop_arr_type;
		jmpop_out	: out jmpop_arr_type);
	
end forward;

architecture behavior of forward is

	signal memdata_reg : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal wrdata_reg : reg_wrdata_type;
	signal op_reg : op_arr_type;
	signal memop_reg : memop_arr_type;
	signal stallop_reg : stallop_arr_type;
	signal jmpop_reg : jmpop_arr_type;

	type fwd_mux_type is array (0 to CLUSTERS-1) of std_logic_vector(0 to CLUSTERS-1);
	signal op_fwd0_reg, op_fwd0_next : fwd_mux_type;
	signal op_fwd1_reg, op_fwd1_next : fwd_mux_type;
	signal memop_fwdA_reg, memop_fwdA_next : fwd_mux_type;
	signal memop_fwdD_reg, memop_fwdD_next : fwd_mux_type;
	signal memop_fwdI_reg, memop_fwdI_next : fwd_mux_type;
	signal jmpop_fwd_reg, jmpop_fwd_next : fwd_mux_type;
	
begin  -- behavior

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then				-- asynchronous reset (active low)
			memdata_reg <= (others => '0');
			wrdata_reg <= (others => (others => '0'));

			op_fwd0_reg <= (others => (others => '0'));
			op_fwd1_reg <= (others => (others => '0'));
			memop_fwdA_reg <= (others => (others => '0'));
			memop_fwdD_reg <= (others => (others => '0'));
			memop_fwdI_reg <= (others => (others => '0'));
			jmpop_fwd_reg <= (others => (others => '0'));
			
			for i in 0 to CLUSTERS-1 loop
				op_reg(i) <= OP_NOP;
				memop_reg(i) <= MEMOP_NOP;
				stallop_reg(i) <= STALLOP_NOP;				
				jmpop_reg(i) <= JMPOP_NOP;				
			end loop;  -- i

			-- first thing to do is to call boot procedure
			memop_reg(0).op <= MEM_CALL;
			memop_reg(0).cond <= COND_TRUE;
			memop_reg(0).flag <= (others => '0');
			memop_reg(0).flag(0) <= '1';
			-- boot ROM is at bottom of IO space
			memop_reg(0).address <= (others => '0');
			memop_reg(0).address(ADDR_WIDTH-1+2 downto ADDR_WIDTH-AREAMUX_BITS+2) <= IO_SELECT;

		elsif clk'event and clk = '1' then	-- rising clock edge
			
			memdata_reg <= memdata;

			if ena = '1' then				 
				wrdata_reg <= wrdata;
				
				op_fwd0_reg <= op_fwd0_next;
				op_fwd1_reg <= op_fwd1_next;
				memop_fwdA_reg <= memop_fwdA_next;
				memop_fwdD_reg <= memop_fwdD_next;
				memop_fwdI_reg <= memop_fwdI_next;
				jmpop_fwd_reg <= jmpop_fwd_next;
				
				op_reg <= op_in;
				memop_reg <= memop_in;
				stallop_reg <= stallop_in;
				jmpop_reg <= jmpop_in;

				if flush = '1' then
					for i in 0 to CLUSTERS-1 loop
						op_reg(i).flag <= (others => '0');
						memop_reg(i).flag <= (others => '0');
						stallop_reg(i).flag <= (others => '0');
						-- not all jumps use the flags
						jmpop_reg(i).op <= JMP_NOP;
					end loop;  -- i
				end if;			
			end if;
		end if;
	end process sync;

	comp: process (wraddr, wren, op_in, memop_in, jmpop_in)
	begin  -- process comp
		op_fwd0_next <= (others => (others => '0'));
		op_fwd1_next <= (others => (others => '0'));		
		memop_fwdA_next <= (others => (others => '0'));
		memop_fwdD_next <= (others => (others => '0'));		   
		memop_fwdI_next <= (others => (others => '0'));		   
		jmpop_fwd_next <= (others => (others => '0'));
		
		for i in 0 to CLUSTERS-1 loop
			if op_in(i).rdaddr0(REG_BITS-1) = '1' then
				if wren(i) = '1' and wraddr(i) = op_in(i).rdaddr0 then
					op_fwd0_next(i)(i) <= '1';
				end if;
			else
				for k in 0 to CLUSTERS-1 loop
					if wren(k) = '1' and wraddr(k) = op_in(i).rdaddr0 then
						op_fwd0_next(i)(k) <= '1';
					end if;
				end loop;  -- k
			end if;
			if op_in(i).fwd1 = '1' then
				if op_in(i).rdaddr1(REG_BITS-1) = '1' then
					if wren(i) = '1' and wraddr(i) = op_in(i).rdaddr1 then
						op_fwd1_next(i)(i) <= '1';
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren(k) = '1' and wraddr(k) = op_in(i).rdaddr1 then
							op_fwd1_next(i)(k) <= '1';
						end if;
					end loop;  -- k
				end if; 
			end if;
			if memop_in(i).fwdA = '1' then
				if memop_in(i).rdaddrA(REG_BITS-1) = '1' then
					if wren(i) = '1' and wraddr(i) = memop_in(i).rdaddrA then
						memop_fwdA_next(i)(i) <= '1';
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren(k) = '1' and wraddr(k) = memop_in(i).rdaddrA then
							memop_fwdA_next(i)(k) <= '1';
						end if;
					end loop;  -- k
				end if; 
			end if;
			if memop_in(i).fwdD = '1' then
				if memop_in(i).rdaddrD(REG_BITS-1) = '1' then
					if wren(i) = '1' and wraddr(i) = memop_in(i).rdaddrD then
						memop_fwdD_next(i)(i) <= '1';
					end if;
				else
					for k in 0 to CLUSTERS-1 loop
						if wren(k) = '1' and wraddr(k) = memop_in(i).rdaddrD then
							memop_fwdD_next(i)(k) <= '1';
						end if;
					end loop;  -- k
				end if; 
			end if;
			if memop_in(i).fwdI = '1' then
                if memop_in(i).rdaddrI(REG_BITS-1) = '1' then
                    if wren(i) = '1' and wraddr(i) = memop_in(i).rdaddrI then
                        memop_fwdI_next(i)(i) <= '1';
                    end if;
                else
                    for k in 0 to CLUSTERS-1 loop
                        if wren(k) = '1' and wraddr(k) = memop_in(i).rdaddrI then
                            memop_fwdI_next(i)(k) <= '1';
                        end if;
                    end loop;  -- k
                end if;
            end if;
			if jmpop_in(i).rdaddr(REG_BITS-1) = '1' then
				if wren(i) = '1' and wraddr(i) = jmpop_in(i).rdaddr then
					jmpop_fwd_next(i)(i) <= '1';
				end if;
			else
				for k in 0 to CLUSTERS-1 loop
					if wren(k) = '1' and wraddr(k) = jmpop_in(i).rdaddr then
						jmpop_fwd_next(i)(k) <= '1';
					end if;
				end loop;  -- k
			end if;		   end loop;  -- i
	end process comp;
	
	fwd: process (wrdata_reg, memdata_reg, memdata,
				  op_fwd0_reg, op_fwd1_reg,
                  memop_fwdA_reg, memop_fwdD_reg, memop_fwdI_reg,
                  jmpop_fwd_reg,
				  op_reg, memop_reg, stallop_reg, jmpop_reg)
	begin  -- process fwd
		op_out <= op_reg;
		memop_out <= memop_reg;
		stallop_out <= stallop_reg;
		jmpop_out <= jmpop_reg;

		for i in 0 to CLUSTERS-1 loop
			if op_reg(i).mem0 = '1' then
				op_out(i).rddata0 <= memdata_reg;
				op_out(i).rdmemd0 <= memdata;
			else
				for k in 0 to CLUSTERS-1 loop
					if op_fwd0_reg(i)(k) = '1' then
						op_out(i).rddata0 <= wrdata_reg(k);
						op_out(i).rdmemd0 <= wrdata_reg(k);
					end if;
				end loop;  -- k
			end if; 
			if op_reg(i).mem1 = '1' then
				op_out(i).rddata1 <= memdata_reg;
				op_out(i).rdmemd1 <= memdata;
			else
				for k in 0 to CLUSTERS-1 loop
					if op_fwd1_reg(i)(k) = '1' then
						op_out(i).rddata1 <= wrdata_reg(k);
						op_out(i).rdmemd1 <= wrdata_reg(k);
					end if;
				end loop;  -- k
			end if; 
			if memop_reg(i).memA = '1' then
				memop_out(i).address <= memdata_reg(ADDR_WIDTH+1 downto 0);
			else
				for k in 0 to CLUSTERS-1 loop
					if memop_fwdA_reg(i)(k) = '1' then
						memop_out(i).address <= wrdata_reg(k)(ADDR_WIDTH+1 downto 0);
					end if;
				end loop;  -- k
			end if;
			if memop_reg(i).memD = '1' then
				memop_out(i).wrdata <= memdata;
			else
				for k in 0 to CLUSTERS-1 loop
					if memop_fwdD_reg(i)(k) = '1' then
						memop_out(i).wrdata <= wrdata_reg(k);
					end if;
				end loop;  -- k
			end if;
			if memop_reg(i).memI = '1' then
				memop_out(i).index <= memdata_reg(ADDR_WIDTH+1 downto 0);
			else
				for k in 0 to CLUSTERS-1 loop
					if memop_fwdI_reg(i)(k) = '1' then
						memop_out(i).index <= wrdata_reg(k)(ADDR_WIDTH+1 downto 0);
					end if;
				end loop;  -- k
			end if;
			if jmpop_reg(i).rdmem = '1' then
				jmpop_out(i).rddata <= memdata_reg(PC_WIDTH-1 downto 0);
			else
				for k in 0 to CLUSTERS-1 loop
					if jmpop_fwd_reg(i)(k) = '1' then
						jmpop_out(i).rddata <= wrdata_reg(k)(PC_WIDTH-1 downto 0);
					end if;
				end loop;  -- k
			end if;
		end loop;  -- i
		
	end process fwd;
	
end behavior;
