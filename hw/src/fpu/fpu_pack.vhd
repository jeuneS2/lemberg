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
use work.op_pack.all;

package fpu_pack is

	constant ENABLE_SINGLE : boolean := true;
	constant ENABLE_DOUBLE : boolean := true;
	
	constant FPREG_BITS : integer := 4;
	constant FPREG_COUNT : integer := 2**FPREG_BITS;
	
	constant STAGES : integer := 7;

	constant SINGLE_EXPONENT_WIDTH : integer := 8;
	constant SINGLE_FRACTION_WIDTH : integer := 23;

	constant DOUBLE_EXPONENT_WIDTH : integer := 11;
	constant DOUBLE_FRACTION_WIDTH : integer := 52;
	
	type fp_type is (FPU_NOP,
					 FPU_STX,  FPU_LDX,
					 FPU_FMOV, FPU_FNEG, FPU_FABS,
					 FPU_DMOV, FPU_DNEG, FPU_DABS, 
					 FPU_FADD, FPU_FSUB, FPU_FMUL, FPU_FMAC, FPU_FCMP,
					 FPU_DADD, FPU_DSUB, FPU_DMUL, FPU_DMAC, FPU_DCMP,
					 FPU_FZERO, FPU_DZERO,
					 FPU_RND,   FPU_EXT,
					 FPU_SI2SF, FPU_SI2DF,
					 FPU_SF2SI, FPU_DF2SI);

	type fpop_type is
	record
		rdaddrA : std_logic_vector(FPREG_BITS-1 downto 0);
		rdaddrB : std_logic_vector(FPREG_BITS-1 downto 0);
		rdaddrC : std_logic_vector(FPREG_BITS-1 downto 0);
		op	    : fp_type;
		wraddr  : std_logic_vector(FPREG_BITS-1 downto 0);
		cond    : std_logic;
		flag    : std_logic_vector(FLAG_COUNT-1 downto 0);		
	end record;

	constant FPOP_NOP : fpop_type :=
		((others => '0'), (others => '0'), (others => '0'),
		 FPU_NOP,
		 (others => '0'),
		 COND_FALSE, (others => '0'));
	
	type fpop_arr_type is array (0 to CLUSTERS-1) of fpop_type;

	type fpu_wrdata_type is
		array (0 to CLUSTERS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	
	function get_latency (op : fp_type)
		return integer;
	
	function returns_single (op : fp_type)
		return boolean;

	function returns_double (op : fp_type)
		return boolean;

end fpu_pack;

package body fpu_pack is

	function get_latency (
		op : fp_type)
		return integer is
	begin  -- get_latency
		case op is
			when FPU_STX |
				FPU_FMOV | FPU_FNEG | FPU_FABS |
				FPU_DMOV | FPU_DNEG | FPU_DABS |
				FPU_FZERO | FPU_DZERO =>
				return 0;
			when FPU_FCMP | FPU_DCMP =>
				return 1;
			when FPU_RND | FPU_EXT |
				FPU_SI2SF | FPU_SI2DF |
				FPU_SF2SI | FPU_DF2SI =>
				return 3;
			when FPU_FADD | FPU_FSUB | FPU_FMUL | FPU_FMAC |
				FPU_DADD | FPU_DSUB | FPU_DMUL | FPU_DMAC =>
				return STAGES;
			when FPU_NOP | FPU_LDX =>
				return -1;
			when others =>
				assert false report "Unknown latency for FPU operation";
		end case;
		return -1;
	end get_latency;
	
	function returns_single (
		op : fp_type)
		return boolean is
	begin  -- is_double
		case op is
			when FPU_STX |
				FPU_FMOV | FPU_FNEG | FPU_FABS | FPU_FZERO |
				FPU_FADD | FPU_FSUB | FPU_FMUL | FPU_FMAC | FPU_FCMP |
				FPU_DCMP |
				FPU_RND | FPU_SF2SI | FPU_DF2SI | FPU_SI2SF =>
				return true;
			when others =>
				return false;
		end case;
	end returns_single;

	function returns_double (
		op : fp_type)
		return boolean is
	begin  -- is_double
		case op is
			when FPU_DMOV | FPU_DNEG | FPU_DABS | FPU_DZERO |
				FPU_DADD | FPU_DSUB | FPU_DMUL | FPU_DMAC |
				FPU_EXT | FPU_SI2DF =>
				return true;
			when others =>
				return false;
		end case;
	end returns_double;

end fpu_pack;
