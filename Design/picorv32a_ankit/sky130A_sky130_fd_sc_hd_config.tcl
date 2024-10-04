# SCL Configs
set ::env(GLB_RT_ADJUSTMENT) 0.1
#set ::env(SYNTH_STRATERGY) 2

#Routing
set ::env(ROUTING_STRATEGY) 0

#Regression
#set ::env(SYNTH_MAX_FANOUT) 6
#set ::env(CLOCK_PERIOD) "12.000"
#set ::env(FP_CORE_UTIL) 50
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+10) / 100.0 ]

