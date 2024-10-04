
# Design
set ::env(DESIGN_NAME) "picorv32a_ankit"

set ::env(VERILOG_FILES) "./designs/picorv32a_ankit/src/picorv32a.v"
set ::env(SDC_FILE) "./designs/picorv32a_ankit/src/picorv32a.sdc"

set ::env(CLOCK_PERIOD) "15.000"
set ::env(CLOCK_PORT) "clk"

set ::env(SYNTH_STRATEGY) "DELAY 2"
set ::env(SYNTH_SIZING) 1
set ::env(SYNTH_MAX_FANOUT) 4
set ::env(CLOCK_NET) $::env(CLOCK_PORT)

set ::env(FP_CORE_UTIL) 30
set ::env(FP_IO_VMETAL) 4
set ::env(FP_IO_HMETAL) 3

set ::env(LIB_SYNTH) "$::env(OPENLANE_ROOT)/designs/picorv32a_ankit/src/sky130_fd_sc_hd__typical.lib"
set ::env(LIB_FASTEST) "$::env(OPENLANE_ROOT)/designs/picorv32a_ankit/src/sky130_fd_sc_hd__fast.lib"
set ::env(LIB_SLOWEST) "$::env(OPENLANE_ROOT)/designs/picorv32a_ankit/src/sky130_fd_sc_hd__slow.lib"
set ::env(LIB_TYPICAL) "$::env(OPENLANE_ROOT)/designs/picorv32a_ankit/src/sky130_fd_sc_hd__typical.lib"
set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/*.lef]
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+10) / 100.0 ]

set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}
