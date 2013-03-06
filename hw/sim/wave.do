onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/clk
add wave -noupdate /cpu_tb/cpu/core/reset
add wave -noupdate /cpu_tb/io_in.rxd
add wave -noupdate /cpu_tb/io_out.txd
add wave -noupdate -divider decoder
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/dec_op(0) -radix hexadecimal} {/cpu_tb/cpu/core/dec_op(1) -radix hexadecimal} {/cpu_tb/cpu/core/dec_op(2) -radix hexadecimal} {/cpu_tb/cpu/core/dec_op(3) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/dec_op(0) {-radix hexadecimal} /cpu_tb/cpu/core/dec_op(1) {-radix hexadecimal} /cpu_tb/cpu/core/dec_op(2) {-radix hexadecimal} /cpu_tb/cpu/core/dec_op(3) {-radix hexadecimal}} /cpu_tb/cpu/core/dec_op
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/decode/jmpop(0) -radix hexadecimal} {/cpu_tb/cpu/core/decode/jmpop(1) -radix hexadecimal} {/cpu_tb/cpu/core/decode/jmpop(2) -radix hexadecimal} {/cpu_tb/cpu/core/decode/jmpop(3) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/decode/jmpop(0) {-radix hexadecimal} /cpu_tb/cpu/core/decode/jmpop(1) {-radix hexadecimal} /cpu_tb/cpu/core/decode/jmpop(2) {-radix hexadecimal} /cpu_tb/cpu/core/decode/jmpop(3) {-radix hexadecimal}} /cpu_tb/cpu/core/decode/jmpop
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/decode/memop(0) -radix hexadecimal} {/cpu_tb/cpu/core/decode/memop(1) -radix hexadecimal} {/cpu_tb/cpu/core/decode/memop(2) -radix hexadecimal} {/cpu_tb/cpu/core/decode/memop(3) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/decode/memop(0) {-radix hexadecimal} /cpu_tb/cpu/core/decode/memop(1) {-radix hexadecimal} /cpu_tb/cpu/core/decode/memop(2) {-radix hexadecimal} /cpu_tb/cpu/core/decode/memop(3) {-radix hexadecimal}} /cpu_tb/cpu/core/decode/memop
add wave -noupdate -expand /cpu_tb/cpu/core/decode/stallop
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/decode/fpop(0) -radix hexadecimal} {/cpu_tb/cpu/core/decode/fpop(1) -radix hexadecimal} {/cpu_tb/cpu/core/decode/fpop(2) -radix hexadecimal} {/cpu_tb/cpu/core/decode/fpop(3) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/decode/fpop(0) {-radix hexadecimal} /cpu_tb/cpu/core/decode/fpop(1) {-radix hexadecimal} /cpu_tb/cpu/core/decode/fpop(2) {-radix hexadecimal} /cpu_tb/cpu/core/decode/fpop(3) {-radix hexadecimal}} /cpu_tb/cpu/core/decode/fpop
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/g_rdaddr
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/g_rddata
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/g_wraddr
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/g_wrdata
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/g_wren
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/rdaddr
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/rddata
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/decode/rf/g_regfile/regfile(0) -radix hexadecimal} {/cpu_tb/cpu/core/decode/rf/g_regfile/regfile(1) -radix hexadecimal} {/cpu_tb/cpu/core/decode/rf/g_regfile/regfile(2) -radix hexadecimal} {/cpu_tb/cpu/core/decode/rf/g_regfile/regfile(3) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/decode/rf/g_regfile/regfile(0) {-radix hexadecimal} /cpu_tb/cpu/core/decode/rf/g_regfile/regfile(1) {-radix hexadecimal} /cpu_tb/cpu/core/decode/rf/g_regfile/regfile(2) {-radix hexadecimal} /cpu_tb/cpu/core/decode/rf/g_regfile/regfile(3) {-radix hexadecimal}} /cpu_tb/cpu/core/decode/rf/g_regfile/regfile
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/gen_l_regfile(0)/l_regfile/regfile
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/gen_l_regfile(1)/l_regfile/regfile
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/gen_l_regfile(2)/l_regfile/regfile
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/decode/rf/gen_l_regfile(3)/l_regfile/regfile
add wave -noupdate -divider forwarding
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/jmpop_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/jmpop_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/memop_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/memop_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/op_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/op_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/reset
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/stallop_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/stallop_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/wraddr
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/wrdata
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/wrdata_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/forward/wren
add wave -noupdate -divider flags
add wave -noupdate /cpu_tb/cpu/core/flags/flags
add wave -noupdate /cpu_tb/cpu/core/flags/rddata
add wave -noupdate /cpu_tb/cpu/core/flags/wrdata
add wave -noupdate /cpu_tb/cpu/core/flags/wren
add wave -noupdate -divider fetch
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/vpc0_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/vpc0_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/vpc0_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/vpc1_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/vpc1_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/vpc1_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/pc_wr
add wave -noupdate -radix unsigned /cpu_tb/cpu/core/fetch/fetch_next
add wave -noupdate -radix unsigned /cpu_tb/cpu/core/fetch/fetch_pos
add wave -noupdate -radix unsigned /cpu_tb/cpu/core/fetch/start_next
add wave -noupdate -radix unsigned /cpu_tb/cpu/core/fetch/start_pos
add wave -noupdate /cpu_tb/cpu/core/fetch/wrap_next
add wave -noupdate /cpu_tb/cpu/core/fetch/wrap_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/raw_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/raw_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/raw_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fetch/raw_out
add wave -noupdate -divider imem
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/q0
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/q1
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/rdaddr0
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/rdaddr1
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/rddata
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/wraddr0
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/wraddr1
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/wren0
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/wren1
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/imem/write
add wave -noupdate -divider inflate
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/inflate/bundle
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/inflate/raw
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/inflate/raw_reg
add wave -noupdate -divider jumpunit
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/fl_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/op
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/pc_wr
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/pc_in
add wave -noupdate /cpu_tb/cpu/core/jumpunit/ena
add wave -noupdate /cpu_tb/cpu/core/jumpunit/flush
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/pc0_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/pc1_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/pcoff
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro0_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro0_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro1_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro1_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/jumpunit/ro_wren
add wave -noupdate -divider fpu
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/fpu/op(0) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op(1) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op(2) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op(3) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/fpu/op(0) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op(1) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op(2) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op(3) {-radix hexadecimal}} /cpu_tb/cpu/core/fpu/op
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/fpu/op_pipe(7) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op_pipe(6) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op_pipe(5) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op_pipe(4) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op_pipe(3) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op_pipe(2) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/op_pipe(1) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/fpu/op_pipe(7) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op_pipe(6) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op_pipe(5) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op_pipe(4) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op_pipe(3) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op_pipe(2) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/op_pipe(1) {-radix hexadecimal}} /cpu_tb/cpu/core/fpu/op_pipe
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/fpu/regfile_hi(0) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(1) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(2) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(3) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(4) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(5) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(6) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_hi(7) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/fpu/regfile_hi(0) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(1) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(2) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(3) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(4) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(5) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(6) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_hi(7) {-radix hexadecimal}} /cpu_tb/cpu/core/fpu/regfile_hi
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/fpu/regfile_lo(0) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(1) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(2) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(3) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(4) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(5) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(6) -radix hexadecimal} {/cpu_tb/cpu/core/fpu/regfile_lo(7) -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/fpu/regfile_lo(0) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(1) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(2) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(3) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(4) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(5) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(6) {-radix hexadecimal} /cpu_tb/cpu/core/fpu/regfile_lo(7) {-radix hexadecimal}} /cpu_tb/cpu/core/fpu/regfile_lo
add wave -noupdate /cpu_tb/cpu/core/fpu/fl_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fpu/op_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fpu/op_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fpu/rddata
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/fpu/wrdata
add wave -noupdate -divider memunit
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_addr_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_addr_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_idx_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_idx_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_size_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_size_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_state_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_state_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/imem_write
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/ba
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/ba_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/ba_reg
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/memunit/mem_in.rd_data -radix hexadecimal} {/cpu_tb/cpu/core/memunit/mem_in.rdy_cnt -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/memunit/mem_in.rd_data {-radix hexadecimal} /cpu_tb/cpu/core/memunit/mem_in.rdy_cnt {-radix hexadecimal}} /cpu_tb/cpu/core/memunit/mem_in
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/core/memunit/mem_out.address -radix hexadecimal} {/cpu_tb/cpu/core/memunit/mem_out.wr_data -radix hexadecimal} {/cpu_tb/cpu/core/memunit/mem_out.rd -radix hexadecimal} {/cpu_tb/cpu/core/memunit/mem_out.wr -radix hexadecimal} {/cpu_tb/cpu/core/memunit/mem_out.byte_ena -radix hexadecimal} {/cpu_tb/cpu/core/memunit/mem_out.cache -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/core/memunit/mem_out.address {-radix hexadecimal} /cpu_tb/cpu/core/memunit/mem_out.wr_data {-radix hexadecimal} /cpu_tb/cpu/core/memunit/mem_out.rd {-radix hexadecimal} /cpu_tb/cpu/core/memunit/mem_out.wr {-radix hexadecimal} /cpu_tb/cpu/core/memunit/mem_out.byte_ena {-radix hexadecimal} /cpu_tb/cpu/core/memunit/mem_out.cache {-radix hexadecimal}} /cpu_tb/cpu/core/memunit/mem_out
add wave -noupdate /cpu_tb/cpu/core/memunit/ena
add wave -noupdate /cpu_tb/cpu/core/memunit/ena_init
add wave -noupdate /cpu_tb/cpu/core/memunit/ena_int
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/op
add wave -noupdate -divider icache
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache_clear
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache_update
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/address
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/tag_array_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/tag_array_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/tag_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/valid_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/valid_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/hit
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/nxt_next
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/nxt_reg
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/offset
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/clear
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/memunit/icache/update
add wave -noupdate -divider datacache
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/cpu_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/cpu_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/cmp_stack/ram_wren_tag
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/cmp_dm/ram_wren_tag
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/dm_cpu_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/dm_mem_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/fa_cpu_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/fa_mem_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/inval
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/mem_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/mem_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/stack_cpu_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/core/datacache/stack_mem_out
add wave -noupdate -divider mem_if
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/sc_mem_if/sc_mem_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/sc_mem_if/sc_mem_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/sc_mem_if/state
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/sc_mem_if/wait_state
add wave -noupdate -divider ram
add wave -noupdate -radix hexadecimal /cpu_tb/ram_inout
add wave -noupdate -radix hexadecimal /cpu_tb/ram_out
add wave -noupdate -divider iomux
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/cpu_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/cpu_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/dram_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/dram_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/flash_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/flash_out
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/iomux/io_in.rd_data -radix hexadecimal} {/cpu_tb/cpu/iomux/io_in.rdy_cnt -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/iomux/io_in.rd_data {-radix hexadecimal} /cpu_tb/cpu/iomux/io_in.rdy_cnt {-radix hexadecimal}} /cpu_tb/cpu/iomux/io_in
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/iomux/io_out.address -radix hexadecimal} {/cpu_tb/cpu/iomux/io_out.wr_data -radix hexadecimal} {/cpu_tb/cpu/iomux/io_out.rd -radix hexadecimal} {/cpu_tb/cpu/iomux/io_out.wr -radix hexadecimal} {/cpu_tb/cpu/iomux/io_out.byte_ena -radix hexadecimal} {/cpu_tb/cpu/iomux/io_out.cache -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/iomux/io_out.address {-radix hexadecimal} /cpu_tb/cpu/iomux/io_out.wr_data {-radix hexadecimal} /cpu_tb/cpu/iomux/io_out.rd {-radix hexadecimal} /cpu_tb/cpu/iomux/io_out.wr {-radix hexadecimal} /cpu_tb/cpu/iomux/io_out.byte_ena {-radix hexadecimal} /cpu_tb/cpu/iomux/io_out.cache {-radix hexadecimal}} /cpu_tb/cpu/iomux/io_out
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/sram_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/iomux/sram_out
add wave -noupdate -divider I/O
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/sc_io/bootrom_in
add wave -noupdate -radix hexadecimal /cpu_tb/cpu/sc_io/bootrom_out
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/sc_io/uart_in.rd_data -radix hexadecimal} {/cpu_tb/cpu/sc_io/uart_in.rdy_cnt -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/sc_io/uart_in.rd_data {-radix hexadecimal} /cpu_tb/cpu/sc_io/uart_in.rdy_cnt {-radix hexadecimal}} /cpu_tb/cpu/sc_io/uart_in
add wave -noupdate -radix hexadecimal -childformat {{/cpu_tb/cpu/sc_io/uart_out.address -radix hexadecimal} {/cpu_tb/cpu/sc_io/uart_out.wr_data -radix hexadecimal} {/cpu_tb/cpu/sc_io/uart_out.rd -radix hexadecimal} {/cpu_tb/cpu/sc_io/uart_out.wr -radix hexadecimal} {/cpu_tb/cpu/sc_io/uart_out.byte_ena -radix hexadecimal} {/cpu_tb/cpu/sc_io/uart_out.cache -radix hexadecimal}} -expand -subitemconfig {/cpu_tb/cpu/sc_io/uart_out.address {-radix hexadecimal} /cpu_tb/cpu/sc_io/uart_out.wr_data {-radix hexadecimal} /cpu_tb/cpu/sc_io/uart_out.rd {-radix hexadecimal} /cpu_tb/cpu/sc_io/uart_out.wr {-radix hexadecimal} /cpu_tb/cpu/sc_io/uart_out.byte_ena {-radix hexadecimal} /cpu_tb/cpu/sc_io/uart_out.cache {-radix hexadecimal}} /cpu_tb/cpu/sc_io/uart_out
add wave -noupdate -divider Timer
add wave -noupdate -radix decimal /cpu_tb/cpu/sc_io/sc_timer/cycles
add wave -noupdate -radix decimal /cpu_tb/cpu/sc_io/sc_timer/secs
add wave -noupdate -radix decimal /cpu_tb/cpu/sc_io/sc_timer/usecs
add wave -noupdate /cpu_tb/cpu/core/decode/ena_cnt
add wave -noupdate /cpu_tb/cpu/core/decode/br_cnt
add wave -noupdate /cpu_tb/cpu/core/decode/br_uncond_cnt
add wave -noupdate /cpu_tb/cpu/core/decode/brind_cnt
add wave -noupdate /cpu_tb/cpu/core/decode/flush_cnt
add wave -noupdate /cpu_tb/cpu/core/inflate/nop_cnt
add wave -noupdate -expand /cpu_tb/cpu/core/inflate/bundle_cnt
add wave -noupdate -expand /cpu_tb/cpu/core/decode/op_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {214155000 ps} 0}
configure wave -namecolwidth 382
configure wave -valuecolwidth 325
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {228564 ns}
