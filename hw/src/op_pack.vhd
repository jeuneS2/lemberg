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
use work.core_pack.all;
use work.reg_pack.all;
use work.mem_pack.all;

package op_pack is

	---------------------------------------------------------------------------
	-- definitions for the ISA-level
	---------------------------------------------------------------------------

	type syllable_type is
	record
		op	 : std_logic_vector(OP_BITS-1 downto 0);
		src1 : std_logic_vector(REG_BITS-1 downto 0);
		src2 : std_logic_vector(REG_BITS-1 downto 0);
		dest : std_logic_vector(REG_BITS-1 downto 0);
		imm  : std_logic;
		cond : std_logic;
		flag : std_logic_vector(FLAG_BITS-1 downto 0);
	end record;

	constant SYLLABLE_WIDTH : integer := OP_BITS+3*REG_BITS+2+FLAG_BITS;

	constant COND_TRUE  : std_logic := '1';
	constant COND_FALSE : std_logic := '0';

	constant SYLLABLE_NOP : syllable_type :=
		( "000100", (others => '1'), (others => '1'), (others => '1'),
		  '0', COND_FALSE, (others => '0'));

	function to_syllable (
		raw : in std_logic_vector(0 to SYLLABLE_WIDTH-1))
		return syllable_type;
	
	function to_raw_op (syllable : syllable_type)
		return std_logic_vector;	

	type bundle_type is array (0 to CLUSTERS-1) of syllable_type;

	-- TODO: define constants for ISA-level operation encoding
	
	-- use OR and read from local register as NOP to minimize power
	constant BUNDLE_NOP : bundle_type := (others => SYLLABLE_NOP);

	---------------------------------------------------------------------------
	-- definitions that are processor-internal
	---------------------------------------------------------------------------
	
	type alu_type is (ALU_ADD,
					  ALU_SUB,
					  ALU_S2ADD,
					  ALU_AND,
					  ALU_OR,
					  ALU_XOR,
					  ALU_SL,
					  ALU_SR,
					  ALU_SAR,
					  ALU_RL,
					  ALU_MUL,
					  ALU_CARR,
					  ALU_BORR,
					  ALU_BBH,
					  ALU_CMPEQ,
					  ALU_CMPNE,
					  ALU_CMPLT,
					  ALU_CMPLE,
					  ALU_CMPULT,
					  ALU_CMPULE,
					  ALU_BTEST,
					  ALU_CCAND,
					  ALU_CCOR,
					  ALU_CCXOR,
					  ALU_LDI,
					  ALU_LDCOND,
					  ALU_LDMEM,
					  ALU_LDMEMHU,
					  ALU_LDMEMHS,
					  ALU_LDMEMBU,
					  ALU_LDMEMBS,
					  ALU_LDMUL,
					  ALU_LDRB,
					  ALU_LDRO,
					  ALU_LDBA,
					  ALU_LDFP,
					  ALU_STCOND,
					  ALU_STMUL,
					  ALU_STRB,
					  ALU_STRO,
					  ALU_STFP);
	
	type op_type is
	record
		rddata0 : std_logic_vector(DATA_WIDTH-1 downto 0);
		rdaddr0 : std_logic_vector(REG_BITS-1 downto 0);
		rddata1 : std_logic_vector(DATA_WIDTH-1 downto 0);
		rdaddr1 : std_logic_vector(REG_BITS-1 downto 0);
		fwd1    : std_logic;
		op		: alu_type;
		wraddr	: std_logic_vector(REG_BITS-1 downto 0);
		cond    : std_logic;
		flag    : std_logic_vector(FLAG_COUNT-1 downto 0);
	end record;

	constant OP_NOP : op_type :=
		((others => '0'), (others => '0'),
		 (others => '0'), (others => '0'), '0',
		 ALU_OR,
		 (others => '0'),
		 COND_FALSE, (others => '0'));
	
	type op_arr_type is array (0 to CLUSTERS-1) of op_type;

	type mem_type is (MEM_NOP,
					  MEM_STM_A,
					  MEM_STMH_A,
					  MEM_STMB_A,
					  MEM_STM_S,
					  MEM_STMH_S,
					  MEM_STMB_S,
					  MEM_LDM_B,
					  MEM_LDM_D,
					  MEM_LDM_F,
					  MEM_LDM_S,
					  MEM_WB_S,
					  MEM_CALL,
					  MEM_RET);

	constant INDEX_WIDTH      : integer := 2*REG_BITS+1;

	type memop_type is
	record
		address : std_logic_vector(ADDR_WIDTH+1 downto 0);
		rdaddrA : std_logic_vector(REG_BITS-1 downto 0);
		fwdA    : std_logic;
		index   : std_logic_vector(INDEX_WIDTH downto 0);
		op	    : mem_type;
		wrdata  : std_logic_vector(DATA_WIDTH-1 downto 0);
		rdaddrD : std_logic_vector(REG_BITS-1 downto 0);
		fwdD    : std_logic;
		cond    : std_logic;
		flag    : std_logic_vector(FLAG_COUNT-1 downto 0);		
	end record;

	constant MEMOP_NOP : memop_type :=
		((others => '0'), (others => '0'), '0',
		 (others => '0'),
		 MEM_NOP,
		 (others => '0'), (others => '0'), '0',
		 COND_FALSE, (others => '0'));
	
	type memop_arr_type is array (0 to CLUSTERS-1) of memop_type;

	type stall_type is (STALL_NOP,
						STALL_SOFTWAIT,
						STALL_WAIT);
	
	type stallop_type is
	record
		value   : std_logic_vector(RDY_CNT_WIDTH-1 downto 0);
		op	    : stall_type;
		cond    : std_logic;
		flag    : std_logic_vector(FLAG_COUNT-1 downto 0);		
	end record;

	constant STALLOP_NOP : stallop_type :=
		((others => '0'),
		 STALL_NOP,
		 COND_FALSE, (others => '0'));
	
	type stallop_arr_type is array (0 to CLUSTERS-1) of stallop_type;
	
	type jmp_type is (JMP_NOP,
					  JMP_BR,
					  JMP_BRZ,
					  JMP_BRIND,
					  JMP_CALL,
					  JMP_RET);

	type brz_type is (BRZ_EQ,
					  BRZ_NE,
					  BRZ_LT,
					  BRZ_GE,
					  BRZ_LE,
					  BRZ_GT);

	type jmpop_type is
	record
		target0 : std_logic_vector(PC_WIDTH-1 downto 0);
		target1 : std_logic_vector(PC_WIDTH-1 downto 0);
        rddata  : std_logic_vector(PC_WIDTH-1 downto 0);
		rdaddr  : std_logic_vector(REG_BITS-1 downto 0);
		op	    : jmp_type;
		zop     : brz_type;
		delayed : std_logic;
		cond    : std_logic;
		flag    : std_logic_vector(FLAG_COUNT-1 downto 0);		
	end record;

	constant JMPOP_NOP : jmpop_type :=
		((others => '0'), (others => '0'), (others => '0'), (others => '0'),
		 JMP_NOP, BRZ_EQ,
		 '0', COND_FALSE, (others => '0'));

	type jmpop_arr_type is array (0 to CLUSTERS-1) of jmpop_type;
	
end op_pack;

package body op_pack is

	function to_syllable (
		raw : in std_logic_vector(0 to SYLLABLE_WIDTH-1))
		return syllable_type is
		variable retval : syllable_type;
	begin  -- to_syllable
		retval.op := raw(0 to OP_BITS-1);
		retval.src1 := raw(OP_BITS to
						   OP_BITS+REG_BITS-1);
		retval.src2 := raw(OP_BITS+REG_BITS to
						   OP_BITS+2*REG_BITS-1);
		retval.dest := raw(OP_BITS+2*REG_BITS to
						   OP_BITS+3*REG_BITS-1);
		retval.imm := raw(OP_BITS+3*REG_BITS);
		retval.cond := raw(OP_BITS+3*REG_BITS+1);
		retval.flag := raw(OP_BITS+3*REG_BITS+2 to
						   SYLLABLE_WIDTH-1);
		return retval;
	end to_syllable;

	function to_raw_op (syllable : syllable_type)
		return std_logic_vector is
	begin  -- to_raw
		return syllable.src1 & syllable.src2 & syllable.dest & syllable.imm;
	end to_raw_op;

end op_pack;
