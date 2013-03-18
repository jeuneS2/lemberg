#! /bin/sh

OPTIONS="-93 -quiet"

rm -rf rtl_work
vlib rtl_work

rm -rf ieee_proposed
vlib ieee_proposed
vcom $OPTIONS -work ieee_proposed \
	../src/fpu/float_pkg/fixed_float_types_c.vhdl \
	../src/fpu/float_pkg/fixed_pkg_c.vhdl \
	../src/fpu/float_pkg/float_pkg_c.vhdl

rm -rf work
vlib work
vcom $OPTIONS \
	../src/config.vhd \
	../src/core_pack.vhd \
	../src/reg_pack.vhd \
	../src/flag_pack.vhd \
	../src/mem_pack.vhd \
	../src/op_pack.vhd \
	../src/jmp_pack.vhd \
	../src/io_pack.vhd \
	../src/io/pin_pack.vhd \
	../src/fpu/fpu_pack.vhd \
	../src/fetch.vhd \
	../src/btb.vhd \
	../src/imem_block.vhd \
	../src/imem.vhd \
	../src/icache.vhd \
	../src/inflate.vhd \
	../src/regfile.vhd \
	../src/decode.vhd \
	../src/flags.vhd \
	../src/forward.vhd \
	../src/alu.vhd \
	../src/memunit.vhd \
	../src/jumpunit.vhd \
	../src/cache/sdpram.vhd \
	../src/cache/directmapped.vhd \
	../src/cache/lru.vhd \
	../src/cache/stack.vhd \
	../src/cache/datacache.vhd \
	../src/fpu/cmp.vhd \
	../src/fpu/cvt.vhd \
	../src/fpu/mac.vhd \
	../src/fpu/fpu.vhd \
	../src/core.vhd \
	../src/iomux.vhd \
	sim_ssram_pll.vhd \
	../src/io/sc_ssram32.vhd \
	../src/io/sc_sysinfo.vhd \
	../src/io/sc_timer.vhd \
	../src/io/fifo.vhd \
	../src/io/sc_uart.vhd \
	../bootrom/sim_bootrom.vhd \
	../src/io/sc_io.vhd \
	sim_pll.vhd \
	../src/cpu.vhd \
	conversions.vhd \
	gen_utils.vhd \
	sim_ssram_512x36.vhd

vcom -2008 -quiet cpu_tb.vhd

if [ x$1 = "x-nox" ]; then
	vsim -quiet -c -t 100ps -do sim-nox.do cpu_tb
else
	vsim -i -t 100ps -do sim.do cpu_tb
fi
