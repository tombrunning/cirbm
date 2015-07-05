# Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst:*
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_oci:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_oci
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_break 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_oci_break:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_oci_break
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_ocimem 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_ocimem:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_ocimem
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_oci_debug:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_nios2_oci_debug
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_wrapper 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_debug_module_wrapper:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_debug_module_wrapper
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_tck 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_debug_module_tck:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_debug_module_tck
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sysclk 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_debug_module_sysclk:the_DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_debug_module_sysclk
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_path 	 [format "%s|%s" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci]
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_break_path 	 [format "%s|%s" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_path $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_break]
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_ocimem_path 	 [format "%s|%s" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_path $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_ocimem]
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug_path 	 [format "%s|%s" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_path $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug]
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_tck_path 	 [format "%s|%s|%s" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_path $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_wrapper $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_tck]
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sysclk_path 	 [format "%s|%s|%s" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_path $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_wrapper $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sysclk]
set 	DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr 	 [format "%s|*sr" $DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_break_path|break_readreg*] -to [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr*]
set_false_path -from [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug_path|*resetlatch]     -to [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr[33]]
set_false_path -from [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug_path|monitor_ready]  -to [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr[0]]
set_false_path -from [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug_path|monitor_error]  -to [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr[34]]
set_false_path -from [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_ocimem_path|*MonDReg*] -to [get_keepers *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr*]
set_false_path -from *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sr*    -to *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$DE4_QSYS_mem_if_ddr2_emif_p0_qsys_sequencer_cpu_inst_oci_debug_path|monitor_go
