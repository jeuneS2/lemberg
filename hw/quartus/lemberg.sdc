# Original Clock Setting Name: clk_pin
create_clock -period "50.000 ns" -name {clk_pin} {clk_pin}

# Create generated clocks based on PLLs
derive_pll_clocks -use_tan_name

set_max_delay 3 -from [get_registers *] -to [get_ports {ram_a[*]}]

set_max_delay 3 -from [get_registers *] -to [get_ports {ram_d[*]}]
set_max_delay 3 -from [get_ports {ram_d[*]}] -to [get_registers *] 

set_max_delay 3 -from [get_registers *] -to [get_ports {ram_clk}]
set_max_delay 3 -from [get_registers *] -to [get_ports {ram_nsc}]
set_max_delay 3 -from [get_registers *] -to [get_ports {ram_ncs}]
set_max_delay 3 -from [get_registers *] -to [get_ports {ram_cs}]
set_max_delay 3 -from [get_registers *] -to [get_ports {ram_noe}]
set_max_delay 3 -from [get_registers *] -to [get_ports {ram_nwe}]
set_max_delay 3 -from [get_registers *] -to [get_ports {ram_nbw[*]}]

