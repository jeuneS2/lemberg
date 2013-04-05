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
use work.config.all;
use work.core_pack.all;
use work.op_pack.all;
use work.flag_pack.all;
use work.mem_pack.all;
use work.jmp_pack.all;

entity jumpunit is
	port (
		clk       : in  std_logic;
		reset     : in  std_logic;
		op        : in  jmpop_arr_type;
		fl_in     : in  std_logic_vector(FLAG_COUNT-1 downto 0);
		zero      : in  std_logic_vector(CLUSTERS-1 downto 0);
		neg       : in  std_logic_vector(CLUSTERS-1 downto 0);
		ena       : in  std_logic;
		flush     : out std_logic;
		pc_in     : in  std_logic_vector(PC_WIDTH-1 downto 0);
		pcoff     : in  std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0);
		ro_out    : out std_logic_vector(PC_WIDTH-1 downto 0);
		ro_wren   : in  std_logic_vector(CLUSTERS-1 downto 0);
		ro_in     : in  ro_wrdata_type;
		iro_out   : out std_logic_vector(PC_WIDTH-1 downto 0);
		iro_wren  : in  std_logic_vector(CLUSTERS-1 downto 0);
		iro_in    : in  ro_wrdata_type;
		itmp_out  : out std_logic_vector(DATA_WIDTH-1 downto 0);
		itmp_wren : in  std_logic_vector(CLUSTERS-1 downto 0);
		itmp_in   : in  tmp_wrdata_type;
		branch    : out std_logic;
		br_taken  : out std_logic;
		br_src    : out std_logic_vector(PC_WIDTH-1 downto 0);
		bt0       : out std_logic_vector(PC_WIDTH-1 downto 0);
		bt1       : out std_logic_vector(PC_WIDTH-1 downto 0);
		bt_clear  : out std_logic;
		pc_wr     : out std_logic;
		pc0_out   : out std_logic_vector(PC_WIDTH-1 downto 0);
		pc1_out   : out std_logic_vector(PC_WIDTH-1 downto 0));
end jumpunit;

architecture behavior of jumpunit is

	signal pc_wr_reg, pc_wr_next : std_logic;
	signal pc0_out_reg, pc0_out_next : std_logic_vector(PC_WIDTH-1 downto 0);
	signal pc1_out_reg, pc1_out_next : std_logic_vector(PC_WIDTH-1 downto 0);
	
	signal ro0_reg, ro0_next : std_logic_vector(PC_WIDTH-1 downto 0);
	signal ro1_reg, ro1_next : std_logic_vector(PC_WIDTH-1 downto 0);

	signal iro0_reg, iro0_next : std_logic_vector(PC_WIDTH-1 downto 0);
	signal iro1_reg, iro1_next : std_logic_vector(PC_WIDTH-1 downto 0);

	signal itmp_reg, itmp_next : std_logic_vector(DATA_WIDTH-1 downto 0);
    
	signal off_reg, off_next, off_prev : std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0);

	signal flush_reg, flush_next : std_logic;
    
	signal fetch_reg, fetch_next : std_logic;

	type rovec_type is array (CLUSTERS-1 downto 0) of std_logic_vector(PC_WIDTH-1 downto 0);

begin  -- behavior

	assert FETCH_WIDTH/BYTE_WIDTH < 2**(PC_WIDTH-ICACHE_BLOCK_BITS)
		report "fetch offset larger than icache block width"
		severity failure;
	
	ro_out <= ro0_reg;
	iro_out <= iro0_reg;
	itmp_out <= itmp_reg;
    
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			ro0_reg <= (others => '0');
			ro1_reg <= (others => '0');
			iro0_reg <= (others => '0');
			iro1_reg <= (others => '0');
			itmp_reg <= (others => '0');
			off_reg <= (others => '0');
			off_prev <= (others => '0');
			flush_reg <= '0';
			fetch_reg <= '0';
			pc_wr_reg <= '0';
			pc0_out_reg <= (others => '0');
			pc1_out_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				ro0_reg <= ro0_next;
				ro1_reg <= ro1_next;
				iro0_reg <= iro0_next;
				iro1_reg <= iro1_next;
				itmp_reg <= itmp_next;
				off_reg <= off_next;
				off_prev <= off_reg;
				flush_reg <= flush_next;
				fetch_reg <= fetch_next;
				pc_wr_reg <= pc_wr_next;
				pc0_out_reg <= pc0_out_next;
				pc1_out_reg <= pc1_out_next;
			end if;
		end if;
	end process sync;

	async: process (op, fl_in, zero, neg, ro0_reg, ro1_reg, pc_in,
					pcoff, off_reg, off_prev, ro_in, ro_wren,
					iro0_reg, iro1_reg, iro_in, iro_wren, itmp_reg, itmp_in, itmp_wren,
					flush_reg, fetch_reg, pc_wr_reg, pc0_out_reg, pc1_out_reg)
		variable idx : integer range 0 to CLUSTERS-1;
		variable valid : std_logic;

		variable ro0vec, ro1vec : rovec_type;
		variable iro0vec, iro1vec : rovec_type;

		variable pc0_out_brind, pc1_out_brind : std_logic_vector(PC_WIDTH-1 downto 0);
		variable pc0_out_ret, pc1_out_ret : std_logic_vector(PC_WIDTH-1 downto 0);
		variable pc0_out_iret, pc1_out_iret : std_logic_vector(PC_WIDTH-1 downto 0);
		
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

			ro0vec(i) := std_logic_vector(unsigned(ro_in(i)));
			ro1vec(i) := std_logic_vector(unsigned(ro_in(i))+FETCH_WIDTH/BYTE_WIDTH);
			iro0vec(i) := std_logic_vector(unsigned(iro_in(i)));
			iro1vec(i) := std_logic_vector(unsigned(iro_in(i))+FETCH_WIDTH/BYTE_WIDTH);

		end loop;  -- i

		ro0_next <= ro0_reg;
		ro1_next <= std_logic_vector(unsigned(ro0_reg)+FETCH_WIDTH/BYTE_WIDTH);
		iro0_next <= iro0_reg;
		iro1_next <= std_logic_vector(unsigned(iro0_reg)+FETCH_WIDTH/BYTE_WIDTH);
		itmp_next <= itmp_reg;
        
		off_next <= off_reg;        
        
		for i in CLUSTERS-1 downto 0 loop
			if ro_wren(i) = '1' then
				ro0_next <= ro0vec(i);
				ro1_next <= ro1vec(i);
			end if;
			if iro_wren(i) = '1' then
				iro0_next <= iro0vec(i);
				iro1_next <= iro1vec(i);
			end if;
			if itmp_wren(i) = '1' then
				itmp_next <= itmp_in(i);
			end if;
		end loop;  -- i

		if fetch_reg = '1' then
			ro0_next <= std_logic_vector(unsigned(pc_in) -
										 (unsigned(off_prev) &
										  to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));
		end if;
		fetch_next <= '0';

		branch <= '0';
		br_taken <= '0';
		br_src <= (others => '0');
		bt0 <= (others => '0');
		bt1 <= (others => '0');
		bt_clear <= '0';
		
		pc_wr <= pc_wr_reg;
		pc0_out <= pc0_out_reg;
		pc1_out <= pc1_out_reg;
		
		pc_wr_next <= '0';
		pc0_out_next <= pcoff & std_logic_vector(to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS));
		pc1_out_next <= pcoff & std_logic_vector(to_unsigned(FETCH_WIDTH/BYTE_WIDTH,
															 PC_WIDTH-ICACHE_BLOCK_BITS));

		pc0_out_brind := std_logic_vector(unsigned(op(idx).rddata) +
										  (unsigned(off_reg) &
										   to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));		
		pc1_out_brind := std_logic_vector(unsigned(op(idx).rddata) +
												 (unsigned(off_reg) &
												  to_unsigned(FETCH_WIDTH/BYTE_WIDTH, PC_WIDTH-ICACHE_BLOCK_BITS)));

		pc0_out_ret := std_logic_vector(unsigned(ro0_reg) +
										(unsigned(pcoff) &
										 to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));
		pc1_out_ret := std_logic_vector(unsigned(ro1_reg) +
										(unsigned(pcoff) &
										 to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));

		pc0_out_iret := std_logic_vector(unsigned(iro0_reg) +
                                         (unsigned(pcoff) &
                                          to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));
		pc1_out_iret := std_logic_vector(unsigned(iro1_reg) +
                                         (unsigned(pcoff) &
                                          to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));

		flush <= flush_reg;
		flush_next <= '0';        

		case op(idx).op is
			when JMP_NOP =>
				-- nothing to do
			when JMP_BR =>
				branch <= not op(idx).delayed;
				br_taken <= valid;
				br_src <= op(idx).spec_src;
				bt0 <= op(idx).target0;
				bt1 <= op(idx).target1;
				if op(idx).spec = '0' then
					-- no speculation, maybe delayed branch
					pc_wr <= valid;
					flush <= valid and not op(idx).delayed;
					pc0_out <= op(idx).target0;
					pc1_out <= op(idx).target1;
				elsif op(idx).target0 = op(idx).spec_bt then
					-- speculated, target ok
					pc_wr <= not valid;
					flush <= not valid;
					pc0_out <= op(idx).specpc0;
					pc1_out <= op(idx).specpc1;
				else
					-- speculated, target mismatch
					pc_wr <= '1';
					flush <= '1';
					if valid = '1' then
						pc0_out <= op(idx).target0;
						pc1_out <= op(idx).target1;
					else
						pc0_out <= op(idx).specpc0;
						pc1_out <= op(idx).specpc1;
					end if;
					assert false
						report "Target mismatch, more than one branch in bundle?"
						severity warning;
				end if;
			when JMP_BRZ =>
				case op(idx).zop is
					when CMP_EQ => valid := zero(idx);
					when CMP_NE => valid := not zero(idx);
					when CMP_LT => valid := neg(idx);
					when CMP_GE => valid := not neg(idx);
					when CMP_GT => valid := not (zero(idx) or neg(idx));
					when CMP_LE => valid := zero(idx) or neg(idx);
					when others =>
						assert false report "Invalid BRZ sub-operation" severity error;
				end case;
				branch <= not op(idx).delayed;
				br_taken <= valid;
				br_src <= op(idx).spec_src;
				bt0 <= op(idx).target0;
				bt1 <= op(idx).target1;
				if op(idx).spec = '0' then
					-- no speculation, maybe delayed branch
					pc_wr <= valid;
					flush <= valid and not op(idx).delayed;
					pc0_out <= op(idx).target0;
					pc1_out <= op(idx).target1;
				elsif op(idx).target0 = op(idx).spec_bt then
					-- speculated, target ok
					pc_wr <= not valid;
					flush <= not valid;
					pc0_out <= op(idx).specpc0;
					pc1_out <= op(idx).specpc1;
				else
					-- speculated, target mismatch
					pc_wr <= '1';
					flush <= '1';
					if valid = '1' then
						pc0_out <= op(idx).target0;
						pc1_out <= op(idx).target1;
					else
						pc0_out <= op(idx).specpc0;
						pc1_out <= op(idx).specpc1;
					end if;
				end if;
			when JMP_BRIND =>
				pc_wr_next <= valid;
				flush <= valid;
				flush_next <= valid;
				pc0_out_next <= pc0_out_brind;
				pc1_out_next <= pc1_out_brind;
			when JMP_CALL =>
				pc_wr_next <= valid;
				fetch_next <= valid;
				bt_clear <= valid;
				if valid = '1' then
					off_next <= pcoff;
				end if;
			when JMP_RET =>
				pc_wr_next <= valid;
				pc0_out_next <= pc0_out_ret;
				pc1_out_next <= pc1_out_ret;
				bt_clear <= valid;
				if valid = '1' then
					off_next <= pcoff;
				end if;
			when JMP_INTR =>
				pc_wr_next <= valid;
				flush <= valid;
				flush_next <= valid;
				iro0_next <= std_logic_vector(unsigned(op(idx).target0) -
                                              (unsigned(off_reg) &
                                               to_unsigned(0, PC_WIDTH-ICACHE_BLOCK_BITS)));
                
				bt_clear <= valid;
				if valid = '1' then
					off_next <= pcoff;
				end if;
			when JMP_IRET =>
				pc_wr_next <= valid;
				pc0_out_next <= pc0_out_iret;
				pc1_out_next <= pc1_out_iret;
				bt_clear <= valid;
				if valid = '1' then
					off_next <= pcoff;
				end if;
			when others =>
				assert false report "Invalid JMPUNIT operation" severity error;
		end case;

	end process async;
	
end behavior;
