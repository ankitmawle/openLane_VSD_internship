set ::env(CLOCK_PORT) clk
set ::env(CLOCK_PERIOD) 15.000
set ::env(SYNTH_DRIVING_CELL) sky130_fd_sc_hd__inv_8
set ::env(SYNTH_DRIVING_CELL_PIN) Y
set ::env(SYNTH_CAP_LOAD) 17.65
set ::env(SYNTH_MAX_FANOUT) 4
set ::env(SYNTH_STRATEGY) "DELAY 1"
set ::env(SYNTH_SIZING) 1
create_clock [get_ports $::env(CLOCK_PORT)] -name $::env(CLOCK_PORT) -period $::env(CLOCK_PERIOD)
set IO_PCT 0.2
set input_delay_value [expr $::env(CLOCK_PERIOD) *$IO_PCT] 
set output_delay_value [expr $::env(CLOCK_PERIOD) *$IO_PCT]

puts "\[INFO\]: Setting output delay to : $output_delay_value"
puts "\[INFO\]: Setting input delay to : $input_delay_value"

#set_max_fanout [$::env(SYNTH_MAX_FANOUT)] [current_design]

set clk_indx [lsearch [all_inputs] [get_port $::env(CLOCK_PORT)]]
set all_inputs_wo_clk [lreplace [all_inputs] $clk_indx $clk_indx]
set all_inputs_wo_clk_rst $all_inputs_wo_clk


set_input_delay $input_delay_value -clock [get_clocks $::env(CLOCK_PORT)] $all_inputs_wo_clk_rst
 
set_output_delay $output_delay_value -clock [get_clocks $::env(CLOCK_PORT)] [all_outputs]

set_driving_cell -lib_cell $::env(SYNTH_DRIVING_CELL) -pin $env(SYNTH_DRIVING_CELL_PIN) [all_inputs]

set cap_load [expr $::env(SYNTH_CAP_LOAD) / 1000.0]
puts "\[INFO\]: Setting load to: $cap_load"
set_load $cap_load [all_outputs]
