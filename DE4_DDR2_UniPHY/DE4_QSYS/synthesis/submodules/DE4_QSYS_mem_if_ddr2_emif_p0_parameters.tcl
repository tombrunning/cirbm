#
# AUTO-GENERATED FILE: Do not edit ! ! ! 
#

set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_corename "DE4_QSYS_mem_if_ddr2_emif_p0"
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_io_standard "SSTL-18"
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_io_interface_type "HPAD"
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_io_standard_differential "1.8-V SSTL"
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_number_of_dqs_groups 8
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_dqs_group_size 8
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_number_of_ck_pins 2
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_number_of_dm_pins 8
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_dqs_delay_chain_length 2
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_uniphy_temp_ver_code 137699769
# PLL Parameters

#USER W A R N I N G !
#USER The PLL parameters are statically defined in this
#USER file at generation time!
#USER To ensure timing constraints and timing reports are correct, when you make 
#USER any changes to the PLL component using the MegaWizard Plug-In,
#USER apply those changes to the PLL parameters in this file

set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_num_pll_clock 7
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(0) 4
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(0) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(0) 0
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(1) 8
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(1) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(1) 0
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(2) 8
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(2) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(2) 90
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(3) 4
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(3) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(3) 270
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(4) 2
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(4) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(4) 0
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(5) 2
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(5) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(5) 0
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_mult(6) 1
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_div(6) 2
set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_pll_phase(6) 0

set ::GLOBAL_DE4_QSYS_mem_if_ddr2_emif_p0_leveling_capture_phase 90.0

##############################################################
## IP options
##############################################################

set IP(write_dcc) "static"
set IP(write_deskew_range) 15
set IP(read_deskew_range) 15
set IP(write_deskew_range_setup) 3
set IP(write_deskew_range_hold) 15
set IP(read_deskew_range_setup) 15
set IP(read_deskew_range_hold) 15
set IP(mem_if_memtype) "ddr2"
set IP(RDIMM) 0
set IP(mp_calibration) 1
set IP(quantization_T9) 0.050
set IP(quantization_T1) 0.050
set IP(quantization_DCC) 0.050
set IP(quantization_T7) 0.050
set IP(quantization_WL) 0.050
# Can be either dynamic or static
set IP(write_deskew_mode) "dynamic"
set IP(read_deskew_mode) "dynamic"
set IP(discrete_device) 1
set IP(num_ranks) 1

set IP(num_report_paths) 10
