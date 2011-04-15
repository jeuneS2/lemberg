# Original Clock Setting Name: clk_pin
create_clock -period "20.000 ns" -name {clk_pin} {clk_pin}

# Create generated clocks based on PLLs
derive_pll_clocks -use_tan_name

set_min_delay 0 -from [get_clocks {pll:pll*_clk0}] -to [get_ports {sram_pin_out.clk}]
set_max_delay 3 -from [get_clocks {pll:pll*_clk0}] -to [get_ports {sram_pin_out.clk}]

set_min_delay 0 -from [get_ports {sram_pin_inout.*}] -to [get_registers *] 
set_max_delay 3 -from [get_ports {sram_pin_inout.*}] -to [get_registers *] 
set_min_delay 0 -from [get_registers *] -to [get_ports {sram_pin_inout.*}]
set_max_delay 3 -from [get_registers *] -to [get_ports {sram_pin_inout.*}]

set_min_delay 0 -from [get_registers *] -to [get_ports {sram_pin_out.*}]
set_max_delay 3 -from [get_registers *] -to [get_ports {sram_pin_out.*}]


