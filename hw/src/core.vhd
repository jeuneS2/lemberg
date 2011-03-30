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
use work.flag_pack.all;
use work.op_pack.all;
use work.mem_pack.all;
use work.jmp_pack.all;
use work.fpu_pack.all;

entity core is
	
	port (
		clk     : in  std_logic;
		reset   : in  std_logic;
		sc_out  : out sc_out_type;
		sc_in   : in  sc_in_type);
	
end core;

architecture behavior of core is

	signal ena		   : std_logic;
	signal xnop        : std_logic;

	signal fetch_raw   : std_logic_vector(0 to FETCH_WIDTH-1);
	signal fetch_vpc0  : std_logic_vector(PC_WIDTH-1 downto 0);
	signal fetch_vpc1  : std_logic_vector(PC_WIDTH-1 downto 0);
	signal fetch_pc    : std_logic_vector(PC_WIDTH-1 downto 0);

	signal imem_raw    : std_logic_vector(0 to 2*FETCH_WIDTH-1);
	signal imem_write  : imem_write_type;
	
	signal jmp_ro 	   : std_logic_vector(PC_WIDTH-1 downto 0);
	signal jmp_pc_wr   : std_logic;
	signal jmp_pc0 	   : std_logic_vector(PC_WIDTH-1 downto 0);
	signal jmp_pc1 	   : std_logic_vector(PC_WIDTH-1 downto 0);

	signal infl_bundle : bundle_type;
	signal infl_pc     : std_logic_vector(PC_WIDTH-1 downto 0);
	
	signal dec_op	   : op_arr_type;
	signal dec_memop   : memop_arr_type;
	signal dec_stallop : stallop_arr_type;
	signal dec_jmpop   : jmpop_arr_type;
	signal dec_fpop    : fpop_arr_type;

	signal fwd_op	   : op_arr_type;
	signal fwd_memop   : memop_arr_type;
	signal fwd_stallop : stallop_arr_type;
	signal fwd_jmpop   : jmpop_arr_type;

	signal alu_wren	   : reg_wren_type;
	signal alu_wraddr  : reg_wraddr_type;
	signal alu_wrdata  : reg_wrdata_type;

	signal rb_wren     : std_logic_vector(CLUSTERS-1 downto 0);
	signal rb_wrdata   : rb_wrdata_type;

	signal ro_wren     : std_logic_vector(CLUSTERS-1 downto 0);
	signal ro_wrdata   : ro_wrdata_type;
	
	signal fl_rddata   : std_logic_vector(FLAG_COUNT-1 downto 0);
	signal fl_wren     : flag_wren_type;
	signal fl_wrdata   : flag_wrdata_type;

	signal fpu_rddata  : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal fpu_wrdata  : fpu_wrdata_type;

	signal mem_memdata : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_ba      : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal mem_rb 	   : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal mem_pcoff   : std_logic_vector(ICACHE_BLOCK_BITS-1 downto 0);
	signal mem_inval   : std_logic;
	signal mem_out	   : sc_out_type;
	signal mem_in	   : sc_in_type;

begin  -- behavior

	fetch: entity work.fetch
		port map (
			clk	     => clk,
			reset    => reset,
			raw_in   => imem_raw,
			ena      => ena,
			xnop     => xnop,
			raw_out  => fetch_raw,
			vpc0_out => fetch_vpc0,
			vpc1_out => fetch_vpc1,
			pc_out   => fetch_pc,
			pc_wr    => jmp_pc_wr,
			pc0_in   => jmp_pc0,
			pc1_in   => jmp_pc1);

	imem: entity work.imem
		port map (
			clk	    => clk,
			reset   => reset,
			ena     => ena,
			rdaddr0 => fetch_vpc0,
			rdaddr1 => fetch_vpc1,
			rddata  => imem_raw,
			write   => imem_write);

	inflate: entity work.inflate
		port map (
			clk		   => clk,
			reset	   => reset,
			raw        => fetch_raw,
			pc_in	   => fetch_pc,
			ena		   => ena,
			bundle     => infl_bundle,
			pc_out	   => infl_pc,
			xnop       => xnop);
	
	decode: entity work.decode
		port map (
			clk	     => clk,
			reset    => reset,
			bundle   => infl_bundle,
			pc       => infl_pc,
			ena      => ena,
			op	     => dec_op,
			memop    => dec_memop,
			stallop  => dec_stallop,
			jmpop    => dec_jmpop,
			fpop     => dec_fpop,
			wren     => alu_wren,
			wraddr   => alu_wraddr,
			wrdata   => alu_wrdata);

	forward: entity work.forward
		port map (
			clk			=> clk,
			reset		=> reset,
			ena			=> ena,
			wren        => alu_wren,
			wraddr      => alu_wraddr,
			wrdata      => alu_wrdata,
			op_in		=> dec_op,
			op_out		=> fwd_op,
			memop_in	=> dec_memop,
			memop_out	=> fwd_memop,
			stallop_in	=> dec_stallop,
			stallop_out => fwd_stallop,
			jmpop_in	=> dec_jmpop,
			jmpop_out	=> fwd_jmpop);
	
	gen_alu: for i in 0 to CLUSTERS-1 generate
		alu: entity work.alu
			port map (
				clk     => clk,
				reset   => reset,
				op      => fwd_op(i),
				ena     => ena,
				wren    => alu_wren(i),
				wraddr  => alu_wraddr(i),
				wrdata  => alu_wrdata(i),
				memdata => mem_memdata,
				rb_in   => mem_rb,
				rb_wren => rb_wren(i),
				rb_out  => rb_wrdata(i),
				ro_in   => jmp_ro,
				ro_wren => ro_wren(i),
				ro_out  => ro_wrdata(i),
				ba      => mem_ba,
				fl_in   => fl_rddata,
				fl_wren => fl_wren(i),
				fl_out  => fl_wrdata(i),
				fpu_rddata => fpu_rddata,
				fpu_wrdata => fpu_wrdata(i));
	end generate;

	memunit: entity work.memunit
		port map (
			clk	       => clk,
			reset      => reset,
			op         => fwd_memop,
			stallop    => fwd_stallop,
			fl_in      => fl_rddata,
			ena        => ena,
			memdata    => mem_memdata,
			ba         => mem_ba,
			rb_out     => mem_rb,
			rb_wren    => rb_wren,
			rb_in      => rb_wrdata,
			pcoff      => mem_pcoff,
			inval      => mem_inval,
			imem_write => imem_write,
			mem_out    => mem_out,
			mem_in     => mem_in);

	jumpunit: entity work.jumpunit
		port map (
			clk		=> clk,
			reset	=> reset,
			op		=> fwd_jmpop,
			fl_in	=> fl_rddata,
			ena     => ena,
			pc_in   => fetch_pc,
			pcoff   => mem_pcoff,
			ro_out  => jmp_ro,
			ro_wren => ro_wren,
			ro_in   => ro_wrdata,
			pc_wr	=> jmp_pc_wr,
			pc0_out => jmp_pc0,
			pc1_out => jmp_pc1);

	fpu: entity work.fpu
		port map (
			clk	       => clk,
			reset      => reset,
			op         => dec_fpop,
			fl_in      => fl_rddata,
			ena        => ena,
			wrdata     => fpu_wrdata,
			rddata     => fpu_rddata);
	
	flags: entity work.flags
		port map (
			clk	   => clk,
			reset  => reset,
			ena    => ena,
			rddata => fl_rddata,
			wren   => fl_wren,
			wrdata => fl_wrdata);

	datacache: entity work.datacache
		generic map (
			dm_bits	  => DM_ADDR_WIDTH,
			fa_bits	  => FA_ADDR_WIDTH,
			stack_bits => STACK_ADDR_WIDTH)
		port map (
			clk		=> clk,
			reset	=> reset,
			inval	=> mem_inval,
			cpu_out => mem_out,
			cpu_in	=> mem_in,
			mem_out => sc_out,
			mem_in	=> sc_in);

end behavior;
