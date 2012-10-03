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
use work.mem_pack.all;
use work.op_pack.all;
use work.fpu_pack.all;

entity decode is
	
	port (
		clk     : in  std_logic;
		reset   : in  std_logic;
		bundle  : in  bundle_type;
		pc      : in  std_logic_vector(PC_WIDTH-1 downto 0);
		ena     : in  std_logic;
		flush   : in  std_logic;
		op   	: out op_arr_type;
		memop   : out memop_arr_type;
		stallop : out stallop_arr_type;
		jmpop   : out jmpop_arr_type;
		fpop    : out fpop_arr_type;
		wren    : in  reg_wren_type;
		wraddr  : in  reg_wraddr_type;
		wrdata  : in  reg_wrdata_type);

end decode;

architecture behavior of decode is

	signal bundle_reg : bundle_type;
	signal rdaddr : reg_rdaddr_type;
	signal rddata : reg_rddata_type;

	signal pc_reg : std_logic_vector(PC_WIDTH-1 downto 0);

	--pragma synthesis off
	type op_cnt_slice is array (0 to 63) of integer;
	type op_cnt_type is array (0 to 3) of op_cnt_slice;
	signal op_cnt : op_cnt_type := (others => (others => 0));
	signal ena_cnt : integer := 0;
	signal flush_cnt : integer := 0;
	signal br_cnt, br_uncond_cnt : integer := 0;
	--pragma synthesis on
	
begin  -- behavior

	rf : entity work.regfile port map (
		clk	   => clk,
		reset  => reset,
		ena    => ena,
		
		rdaddr => rdaddr,
		rddata => rddata,
		
		wren   => wren,
		wraddr => wraddr,
		wrdata => wrdata);

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then
			bundle_reg <= BUNDLE_NOP;
			pc_reg <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				bundle_reg <= bundle;
				pc_reg <= pc;
				if flush = '1' then
					bundle_reg <= BUNDLE_NOP;
				end if;
			end if;
	   end if;
	end process sync;

	decode: process (bundle_reg, rddata, pc_reg)

		variable always_imm : std_logic;
		variable imm        : std_logic_vector(DATA_WIDTH-1 downto 0);
		variable imm_ldi    : std_logic_vector(2*REG_BITS downto 0);
		variable idx_stm    : std_logic_vector(INDEX_WIDTH downto 0);
		variable idx_ldm    : std_logic_vector(INDEX_WIDTH downto 0);
		variable idx        : std_logic_vector(INDEX_WIDTH downto 0);
		variable use_glob   : std_logic;
		variable glob       : std_logic_vector(ADDR_WIDTH+1 downto 0);
		variable target     : std_logic_vector(PC_WIDTH-1 downto 0);
		variable ztarget    : std_logic_vector(PC_WIDTH-1 downto 0);
		variable raw_op     : std_logic_vector(3*REG_BITS downto 0);
		
	begin  -- process async

		for i in 0 to CLUSTERS-1 loop

			raw_op := to_raw_op(bundle_reg(i));

			op(i).wraddr <= bundle_reg(i).dest;
			op(i).op <= ALU_OR;
			op(i).cond <= COND_FALSE;
			op(i).flag <= (others => '0');			
			op(i).rdaddr0 <= bundle_reg(i).src1;
			op(i).rdaddr1 <= bundle_reg(i).src2;
			op(i).fwd1 <= not bundle_reg(i).imm;

			memop(i).op <= MEM_NOP;
			memop(i).cond <= COND_FALSE;
			memop(i).flag <= (others => '0');			
			memop(i).rdaddrA <= bundle_reg(i).src1;
			memop(i).fwdA <= '1';
			memop(i).rdaddrD <= bundle_reg(i).src2;
			memop(i).fwdD <= not bundle_reg(i).imm;

			stallop(i).op <= STALL_NOP;
			stallop(i).cond <= COND_FALSE;
			stallop(i).flag <= (others => '0');			
			stallop(i).value <= (others => '1');
						
			jmpop(i).op <= JMP_NOP;
			jmpop(i).zop <= CMP_EQ;
			jmpop(i).delayed <= bundle_reg(i).imm;
			jmpop(i).cond <= COND_FALSE;
			jmpop(i).flag <= (others => '0');
			jmpop(i).rdaddr <= bundle_reg(i).src1;
			
			fpop(i).op <= FPU_NOP;
			fpop(i).wraddr <= raw_op(15 downto 12);
			fpop(i).cond <= COND_FALSE;
			fpop(i).flag <= (others => '0');
			fpop(i).rdaddrA <= raw_op(11 downto 8);
			fpop(i).rdaddrB <= raw_op(7 downto 4);
			fpop(i).rdaddrC <= raw_op(15 downto 12);

			always_imm := '0';
			imm := std_logic_vector(resize(unsigned(bundle_reg(i).src2), DATA_WIDTH));
			imm_ldi := bundle_reg(i).src2 & bundle_reg(i).dest & bundle_reg(i).imm;
			
			idx_stm := std_logic_vector(resize(unsigned(bundle_reg(i).dest), INDEX_WIDTH+1));
			idx_ldm := std_logic_vector(resize(signed(bundle_reg(i).src2
													  & bundle_reg(i).dest
													  & bundle_reg(i).imm), INDEX_WIDTH+1));
			idx := (others => '0');
			
			use_glob := '0';
			glob := std_logic_vector(resize(unsigned(bundle_reg(i).src1
													 & bundle_reg(i).src2
													 & bundle_reg(i).dest
													 & bundle_reg(i).imm
													 & bundle_reg(i).cond
													 & bundle_reg(i).flag
													 &'0'&'0'), ADDR_WIDTH+2));

			target := std_logic_vector(signed(pc_reg)
									   + resize(signed(bundle_reg(i).src1)
												& signed(bundle_reg(i).src2)
												& signed(bundle_reg(i).dest), PC_WIDTH));

			ztarget := std_logic_vector(signed(pc_reg)
										+ resize(signed(bundle_reg(i).src2)
												 & signed(bundle_reg(i).dest), PC_WIDTH));

            jmpop(i).target0 <= std_logic_vector(unsigned(target)+0);
            jmpop(i).target1 <= std_logic_vector(unsigned(target)
                                                 +FETCH_WIDTH/BYTE_WIDTH);

			case bundle_reg(i).op is
				when "000000" =>
					op(i).op <= ALU_ADD;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "000001" =>
					op(i).op <= ALU_SUB;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "000010" =>
					op(i).op <= ALU_S2ADD;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "000011" =>
					op(i).op <= ALU_AND;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "000100" =>
					op(i).op <= ALU_OR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "000101" =>
					op(i).op <= ALU_XOR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
				when "000110" =>
					op(i).op <= ALU_SL;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "000111" =>
					op(i).op <= ALU_SR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "001000" =>
					op(i).op <= ALU_SAR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "001001" =>
					op(i).op <= ALU_RL;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "001010" =>
					op(i).op <= ALU_MUL;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
				when "001011" =>
					op(i).op <= ALU_CARR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "001100" =>
					op(i).op <= ALU_BORR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "001101" =>
					op(i).op <= ALU_BBH;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "010100" =>
                    case bundle_reg(i).dest(REG_BITS-FLAG_BITS-1 downto 0) is
						when "000" => op(i).op <= ALU_CMPEQ;
						when "001" => op(i).op <= ALU_CMPNE;
						when "010" => op(i).op <= ALU_CMPLT;
						when "011" => op(i).op <= ALU_CMPGE;
						when "100" => op(i).op <= ALU_CMPGT;
						when "101" => op(i).op <= ALU_CMPLE;
						when others =>
							assert false report "Cannot decode CMP operation" severity error;
                    end case;
                    op(i).wraddr <= "000" & bundle_reg(i).dest(REG_BITS-1 downto REG_BITS-FLAG_BITS);
                    op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
				when "010101" =>
                    case bundle_reg(i).dest(REG_BITS-FLAG_BITS-1 downto 0) is
						when "000" => op(i).op <= ALU_CMPEQ;
						when "001" => op(i).op <= ALU_CMPNE;
						when "010" => op(i).op <= ALU_CMPULT;
						when "011" => op(i).op <= ALU_CMPUGE;
						when "100" => op(i).op <= ALU_CMPUGT;
						when "101" => op(i).op <= ALU_CMPULE;
						when others =>
							assert false report "Cannot decode CMPU operation" severity error;
                    end case;
                    op(i).wraddr <= "000" & bundle_reg(i).dest(REG_BITS-1 downto REG_BITS-FLAG_BITS);
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "010110" =>
					op(i).op <= ALU_BTEST;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "010111" =>
					case raw_op(1 downto 0) is
						when "00" => op(i).op <= ALU_CCAND;
						when "01" => op(i).op <= ALU_CCOR;
						when "10" => op(i).op <= ALU_CCXOR;
						when others =>
							assert false report "Cannot decode COMB operation" severity error;
					end case;
					-- rest of decoding of done in ALU
					imm := std_logic_vector(resize(unsigned(raw_op(11 downto 2)), DATA_WIDTH));
					always_imm := '1';
					
					op(i).wraddr <= '0' & raw_op(15 downto 12);
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "011000" =>
					op(i).op <= ALU_LDI;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					always_imm := '1';
					imm := std_logic_vector(resize(signed(imm_ldi), DATA_WIDTH));
					-- destination and source are the same
					op(i).wraddr <= bundle_reg(i).src1;
				when "011001" =>
					op(i).op <= ALU_LDI;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					always_imm := '1';
					imm := std_logic_vector(resize(unsigned(imm_ldi), DATA_WIDTH));
					-- destination and source are the same
					op(i).wraddr <= bundle_reg(i).src1;
				when "011010" =>
					op(i).op <= ALU_OR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					always_imm := '1';
					imm(10 downto 0) := (others => '0');
					imm(2*REG_BITS+11 downto 11) := imm_ldi;
					imm := std_logic_vector(resize(signed(imm(2*REG_BITS+11 downto 0)), DATA_WIDTH));
					-- destination and source are the same
					op(i).wraddr <= bundle_reg(i).src1;
				when "011011" =>
					op(i).op <= ALU_OR;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					always_imm := '1';
					imm(20 downto 0) := (others => '0');
					imm(2*REG_BITS+21 downto 21) := imm_ldi;
					imm := std_logic_vector(resize(signed(imm(2*REG_BITS+21 downto 0)), DATA_WIDTH));
					-- destination and source are the same
					op(i).wraddr <= bundle_reg(i).src1;
				when "011100" =>
					jmpop(i).op <= JMP_BR;
					jmpop(i).cond <= bundle_reg(i).cond;
					jmpop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';			
					jmpop(i).target0 <= std_logic_vector(unsigned(target)+0);
					jmpop(i).target1 <= std_logic_vector(unsigned(target)
														 +FETCH_WIDTH/BYTE_WIDTH);
				when "011101" =>
					jmpop(i).op <= JMP_BRZ;
					jmpop(i).cond <= '1';
					jmpop(i).flag(0) <= '1';
					case bundle_reg(i).cond & bundle_reg(i).flag is
						when "000" => jmpop(i).zop <= CMP_EQ;
						when "001" => jmpop(i).zop <= CMP_NE;
						when "010" => jmpop(i).zop <= CMP_LT;
						when "011" => jmpop(i).zop <= CMP_GE;
						when "100" => jmpop(i).zop <= CMP_GT;
						when "101" => jmpop(i).zop <= CMP_LE;
						when others =>
							assert false report "Cannot decode BRZ operation" severity error;
					end case;
					jmpop(i).target0 <= std_logic_vector(unsigned(ztarget)+0);
					jmpop(i).target1 <= std_logic_vector(unsigned(ztarget)
														 +FETCH_WIDTH/BYTE_WIDTH);
				when "011110" =>  		-- jump operation
					jmpop(i).cond <= bundle_reg(i).cond;
					jmpop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';			
					case bundle_reg(i).src2 is
						when "00000" =>
							jmpop(i).op <= JMP_BRIND;
						when "00001" | "00010" =>
							if bundle_reg(i).src2 = "00001" then
								jmpop(i).op <= JMP_CALL;
								memop(i).op <= MEM_CALL;
							else
								jmpop(i).op <= JMP_RET;
								memop(i).op <= MEM_RET;								
							end if;
							memop(i).cond <= bundle_reg(i).cond;
							memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
							stallop(i).op <= STALL_SOFTWAIT;
							stallop(i).cond <= bundle_reg(i).cond;				
							stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
							stallop(i).value <= (others => '0');
							stallop(i).value(1) <= '1';
						when others =>
							assert false report "Cannot decode JOP operation" severity error;
					end case;
				when "011111" =>  		-- call global
					jmpop(i).op <= JMP_CALL;
					jmpop(i).cond <= '1';
					jmpop(i).flag(0) <= '1';
					memop(i).op <= MEM_CALL;
					memop(i).cond <= '1';
					memop(i).flag(0) <= '1';
					use_glob := '1';
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= '1';
					stallop(i).flag(0) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(1) <= '1';
				when "100000" =>
					memop(i).op <= MEM_STM_A;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx(INDEX_WIDTH downto 2) := idx_stm(INDEX_WIDTH-2 downto 0);
					idx(1 downto 0) := "00";
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100001" =>
					memop(i).op <= MEM_STMH_A;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx(INDEX_WIDTH downto 1) := idx_stm(INDEX_WIDTH-1 downto 0);
					idx(0) := '0';
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100010" =>
					memop(i).op <= MEM_STMB_A;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_stm;
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100011" =>
					memop(i).op <= MEM_STM_S;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx(INDEX_WIDTH downto 2) := idx_stm(INDEX_WIDTH-2 downto 0);
					idx(1 downto 0) := "00";
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100100" =>
					memop(i).op <= MEM_STMH_S;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx(INDEX_WIDTH downto 1) := idx_stm(INDEX_WIDTH-1 downto 0);
					idx(0) := '0';
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100101" =>
					memop(i).op <= MEM_STMB_S;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_stm;
					imm := std_logic_vector(resize(signed(bundle_reg(i).src2), DATA_WIDTH));
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100110" =>
					memop(i).op <= MEM_WB_S;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_ldm;
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "100111" =>
					memop(i).op <= MEM_LDM_B;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_ldm;
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "101000" =>
					memop(i).op <= MEM_LDM_D;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_ldm;
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "101001" =>
					memop(i).op <= MEM_LDM_F;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_ldm;
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "101010" =>
					memop(i).op <= MEM_LDM_S;
					memop(i).cond <= bundle_reg(i).cond;
					memop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					idx := idx_ldm;
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= bundle_reg(i).cond;				
					stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "101011" =>
					memop(i).op <= MEM_LDM_D;
					memop(i).cond <= '1';
					memop(i).flag(0) <= '1';
					use_glob := '1';
					idx := (others => '0');
					stallop(i).op <= STALL_SOFTWAIT;
					stallop(i).cond <= '1';
					stallop(i).flag(0) <= '1';
					stallop(i).value <= (others => '0');
					stallop(i).value(0) <= '1';
				when "101100" =>
					-- decode LDX
					case bundle_reg(i).src1 is
						when "00000" | "00001" | "00010" | "00011" => op(i).op <= ALU_LDCOND;
						when "00100" => op(i).op <= ALU_LDMEM;
						when "00101" => op(i).op <= ALU_LDMEMHU;
						when "00110" => op(i).op <= ALU_LDMEMHS;
						when "00111" => op(i).op <= ALU_LDMEMBU;
						when "01000" => op(i).op <= ALU_LDMEMBS;
						when "01001" | "01010" => op(i).op <= ALU_LDMUL;
						when "01011" => op(i).op <= ALU_LDRB;
						when "01100" => op(i).op <= ALU_LDRO;
						when "01101" => op(i).op <= ALU_LDBA;
						when "10000" | "10001" | "10010" | "10011" |
							 "10100" | "10101" | "10110" | "10111" |
							 "11000" | "11001" | "11010" | "11011" |
							 "11100" | "11101" | "11110" | "11111" =>
							if ENABLE_SINGLE or ENABLE_DOUBLE then
								op(i).op <= ALU_LDFP;
								fpop(i).op <= FPU_LDX;
								fpop(i).rdaddrA <= bundle_reg(i).src1(FPREG_BITS-1 downto 0);
								fpop(i).cond <= bundle_reg(i).cond;
								fpop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
							else
								assert false report "FP operation not supported" severity error;
							end if;
						when others =>
							assert false report "Cannot decode LDX source" severity error;
					end case;
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
					-- wait until results are ready
					case bundle_reg(i).src1 is
						when "00100" | "00101" | "00110" | "00111" | "01000" =>
							stallop(i).op <= STALL_WAIT;
							stallop(i).cond <= bundle_reg(i).cond;				
							stallop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
							stallop(i).value <= (others => '0');  -- wait till data is ready
						when others => null;
					end case;
				when "101101" =>  		-- STX
					case bundle_reg(i).dest is
						when "00000" | "00001" | "00010" | "00011" => op(i).op <= ALU_STCOND;
						when "01001" | "01010" => op(i).op <= ALU_STMUL;
						when "01011" => op(i).op <= ALU_STRB;
						when "01100" => op(i).op <= ALU_STRO;
						when "10000" | "10001" | "10010" | "10011" |
							 "10100" | "10101" | "10110" | "10111" |
							 "11000" | "11001" | "11010" | "11011" |
							 "11100" | "11101" | "11110" | "11111" =>
							if ENABLE_SINGLE or ENABLE_DOUBLE then
								op(i).op <= ALU_STFP;
								fpop(i).op <= FPU_STX;							
								fpop(i).wraddr <= bundle_reg(i).dest(FPREG_BITS-1 downto 0);
								fpop(i).cond <= bundle_reg(i).cond;
								fpop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
							else
								assert false report "FP operation not supported" severity error;
							end if;
						when others =>
							assert false report "Cannot decode STX destination" severity error;
					end case;					
					op(i).cond <= bundle_reg(i).cond;
					op(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "101110" =>  		-- FOP
					assert ENABLE_SINGLE or ENABLE_DOUBLE
						report "FP operation not supported" severity error;
					if ENABLE_SINGLE then
						case raw_op(3 downto 0) is
							when "0000" => fpop(i).op <= FPU_FADD;
							when "0001" => fpop(i).op <= FPU_FSUB;
							when "0010" => fpop(i).op <= FPU_FMUL;
							when "0011" => fpop(i).op <= FPU_FMAC;
							when "1000" => fpop(i).op <= FPU_FCMP;
							when "1111" =>
								case raw_op(7 downto 4) is
									when "0000" => fpop(i).op <= FPU_FMOV;
									when "0001" => fpop(i).op <= FPU_FNEG;
									when "0010" => fpop(i).op <= FPU_FABS;
									when "0011" =>
										case raw_op(11 downto 8) is
											when "0000" => fpop(i).op <= FPU_FZERO;
											when "0001" => fpop(i).op <= FPU_FHALF;
											when "0010" => fpop(i).op <= FPU_FONE;
											when "0011" => fpop(i).op <= FPU_FTWO;
											when "1111" => fpop(i).op <= FPU_FNAN;
											when others =>
												assert false report "Cannot decode FP immediate" severity error;
										end case;										
									when "1010" => fpop(i).op <= FPU_SI2SF;
									when "1100" => fpop(i).op <= FPU_SF2SI;
									when others => null;
								end case;
							when others => null;
						end case;
					end if;
					if ENABLE_DOUBLE then
						case raw_op(3 downto 0) is
							when "0100" => fpop(i).op <= FPU_DADD;
							when "0101" => fpop(i).op <= FPU_DSUB;
							when "0110" => fpop(i).op <= FPU_DMUL;
							when "0111" => fpop(i).op <= FPU_DMAC;
							when "1001" => fpop(i).op <= FPU_DCMP;
							when "1111" =>
								case raw_op(7 downto 4) is
									when "0100" => fpop(i).op <= FPU_DMOV;
									when "0101" => fpop(i).op <= FPU_DNEG;
									when "0110" => fpop(i).op <= FPU_DABS;
									when "0111" =>
										case raw_op(11 downto 8) is
											when "0000" => fpop(i).op <= FPU_DZERO;
											when "0001" => fpop(i).op <= FPU_DHALF;
											when "0010" => fpop(i).op <= FPU_DONE;
											when "0011" => fpop(i).op <= FPU_DTWO;
											when "1111" => fpop(i).op <= FPU_DNAN;
											when others =>
												assert false report "Cannot decode FP immediate" severity error;
										end case;										
									when "1011" => fpop(i).op <= FPU_SI2DF;
									when "1101" => fpop(i).op <= FPU_DF2SI;
									when others => null;
								end case;
							when others => null;
						end case;
					end if;
					if ENABLE_SINGLE and ENABLE_DOUBLE then
						case raw_op(3 downto 0) is
							when "1111" =>
								case raw_op(7 downto 4) is
									when "1000" => fpop(i).op <= FPU_RND;
									when "1001" => fpop(i).op <= FPU_EXT;
									when others => null;
								end case;
							when others => null;
						end case;
					end if;
					-- TODO: assert correct decoding
					fpop(i).cond <= bundle_reg(i).cond;
					fpop(i).flag(to_integer(unsigned(bundle_reg(i).flag))) <= '1';
				when "110000" | "110001" | "110010" | "110011" |
					 "110100" | "110101" | "110110" | "110111" =>
					op(i).op <= ALU_LDI;
					op(i).cond <= '1';
					op(i).flag(0) <= '1';
					always_imm := '1';
					imm := std_logic_vector(resize(unsigned(glob), DATA_WIDTH));					
					-- destination needs some decoding
					op(i).wraddr <= (others => '0');
					op(i).wraddr(REG_BITS-1) <= bundle_reg(i).op(2);
					op(i).wraddr(1 downto 0) <= bundle_reg(i).op(1 downto 0);					
				when others =>
					assert false report "Cannot decode operation" severity error;
			end case;
			
			op(i).rddata0 <= rddata(2*i);
			if bundle_reg(i).imm = '1' or always_imm = '1' then
				op(i).rddata1 <= imm;
				op(i).fwd1 <= '0';
			else
				op(i).rddata1 <= rddata(2*i+1);
			end if;

			if use_glob = '1' then
				memop(i).address <= glob;
				memop(i).fwdA <= '0';
			else
				memop(i).address <= rddata(2*i)(ADDR_WIDTH+1 downto 0);				
			end if;
			memop(i).index <= idx;
			if bundle_reg(i).imm = '1' then
				memop(i).wrdata <= imm;				
			else
				memop(i).wrdata <= rddata(2*i+1);
			end if;			

			jmpop(i).rddata <= rddata(2*i)(PC_WIDTH-1 downto 0);

		end loop;  -- i
	end process decode;

	rdregs: process (bundle)
	begin  -- process rdregs
		for i in 0 to CLUSTERS-1 loop
			rdaddr(2*i) <= bundle(i).src1;
			rdaddr(2*i+1) <= bundle(i).src2;
		end loop;  -- i
	end process rdregs;

	----------------------------------------------------------------
	-- gather statistics
	----------------------------------------------------------------
	--pragma synthesis off
	stat: process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				if flush = '1' then
					flush_cnt <= flush_cnt + 1;
				else
					for i in 0 to 3 loop
						op_cnt(i)(to_integer(unsigned(bundle_reg(i).op)))
							<= op_cnt(i)(to_integer(unsigned(bundle_reg(i).op))) + 1;
						if bundle_reg(i).op = "011100"
							or bundle_reg(i).op = "011101" then
							br_cnt <= br_cnt + 1;
						end if;
						if bundle_reg(i).op = "011100" and
							bundle_reg(i).flag = "00" and
							bundle_reg(i).cond = '1' then
							br_uncond_cnt <= br_uncond_cnt + 1;
						end if;
					end loop;  -- i
				end if;
			else
				ena_cnt <= ena_cnt + 1;
			end if;
		end if;
	end process;
	--pragma synthesis on
	
end behavior;
