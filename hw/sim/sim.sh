#! /bin/sh

OPTIONS="-93 -quiet +acc +cover=bcesfx -coveropt 1"

rm -rf rtl_work
vlib rtl_work

rm -rf ieee_proposed
vlib ieee_proposed
vcom $OPTIONS -work ieee_proposed ../src/fpu/float_pkg/fixed_float_types_c.vhdl
vcom $OPTIONS -work ieee_proposed ../src/fpu/float_pkg/fixed_pkg_c.vhdl
vcom $OPTIONS -work ieee_proposed ../src/fpu/float_pkg/float_pkg_c.vhdl

rm -rf work
vlib work
vcom $OPTIONS ../src/core_pack.vhd
vcom $OPTIONS ../src/reg_pack.vhd
vcom $OPTIONS ../src/flag_pack.vhd
vcom $OPTIONS ../src/mem_pack.vhd
vcom $OPTIONS ../src/op_pack.vhd
vcom $OPTIONS ../src/jmp_pack.vhd
vcom $OPTIONS ../src/io_pack.vhd
vcom $OPTIONS ../src/io/pin_pack.vhd
vcom $OPTIONS ../src/fpu/fpu_pack.vhd
vcom $OPTIONS ../src/fetch.vhd
vcom $OPTIONS ../src/imem_block.vhd
vcom $OPTIONS ../src/imem.vhd
vcom $OPTIONS ../src/icache.vhd
vcom $OPTIONS ../src/inflate.vhd
vcom $OPTIONS ../src/regfile.vhd
vcom $OPTIONS ../src/decode.vhd
vcom $OPTIONS ../src/flags.vhd
vcom $OPTIONS ../src/forward.vhd
vcom $OPTIONS ../src/alu.vhd
vcom $OPTIONS ../src/memunit.vhd
vcom $OPTIONS ../src/jumpunit.vhd
vcom $OPTIONS ../src/cache/sdpram.vhd
vcom $OPTIONS ../src/cache/directmapped.vhd
vcom $OPTIONS ../src/cache/lru.vhd
vcom $OPTIONS ../src/cache/stack.vhd
vcom $OPTIONS ../src/cache/datacache.vhd
vcom $OPTIONS ../src/fpu/cmp.vhd
vcom $OPTIONS ../src/fpu/cvt.vhd
vcom $OPTIONS ../src/fpu/mac.vhd
vcom $OPTIONS ../src/fpu/fpu.vhd
vcom $OPTIONS ../src/core.vhd
vcom $OPTIONS ../src/iomux.vhd
vcom $OPTIONS ../src/io/sc_ssram32.vhd
vcom $OPTIONS ../src/io/sc_sysinfo.vhd
vcom $OPTIONS ../src/io/sc_timer.vhd
vcom $OPTIONS ../src/io/fifo.vhd
vcom $OPTIONS ../src/io/sc_uart.vhd
vcom $OPTIONS ../bootrom/sim_bootrom.vhd
vcom $OPTIONS ../src/io/sc_io.vhd
vcom $OPTIONS sim_pll.vhd
vcom $OPTIONS ../src/cpu.vhd
vcom $OPTIONS conversions.vhd
vcom $OPTIONS gen_utils.vhd
vcom $OPTIONS sim_ssram_512x36.vhd
vcom $OPTIONS cpu_tb.vhd

vsim -coverage -voptargs="+cover=bcesfx" -i -do sim.do cpu_tb
