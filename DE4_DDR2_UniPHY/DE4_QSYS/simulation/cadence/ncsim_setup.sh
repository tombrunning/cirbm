
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2015.07.03.10:46:51

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="DE4_QSYS"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/13.0sp1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/a0/
mkdir -p ./libraries/ng0/
mkdir -p ./libraries/dll0/
mkdir -p ./libraries/oct0/
mkdir -p ./libraries/c0/
mkdir -p ./libraries/s0/
mkdir -p ./libraries/m0/
mkdir -p ./libraries/p0/
mkdir -p ./libraries/pll0/
mkdir -p ./libraries/irq_synchronizer/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/width_adapter/
mkdir -p ./libraries/rsp_xbar_mux_005/
mkdir -p ./libraries/rsp_xbar_demux_007/
mkdir -p ./libraries/cmd_xbar_demux_005/
mkdir -p ./libraries/rsp_xbar_mux_001/
mkdir -p ./libraries/rsp_xbar_mux/
mkdir -p ./libraries/rsp_xbar_demux_004/
mkdir -p ./libraries/rsp_xbar_demux/
mkdir -p ./libraries/cmd_xbar_mux_004/
mkdir -p ./libraries/cmd_xbar_mux/
mkdir -p ./libraries/cmd_xbar_demux_003/
mkdir -p ./libraries/cmd_xbar_demux_002/
mkdir -p ./libraries/cmd_xbar_demux_001/
mkdir -p ./libraries/cmd_xbar_demux/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/burst_adapter/
mkdir -p ./libraries/limiter/
mkdir -p ./libraries/id_router_007/
mkdir -p ./libraries/addr_router_005/
mkdir -p ./libraries/id_router_005/
mkdir -p ./libraries/id_router_004/
mkdir -p ./libraries/id_router_002/
mkdir -p ./libraries/id_router/
mkdir -p ./libraries/addr_router_003/
mkdir -p ./libraries/addr_router_002/
mkdir -p ./libraries/addr_router_001/
mkdir -p ./libraries/addr_router/
mkdir -p ./libraries/nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo/
mkdir -p ./libraries/nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent/
mkdir -p ./libraries/nios2_qsys_instruction_master_translator_avalon_universal_master_0_agent/
mkdir -p ./libraries/nios2_qsys_jtag_debug_module_translator/
mkdir -p ./libraries/nios2_qsys_instruction_master_translator/
mkdir -p ./libraries/ppl_mem_reader/
mkdir -p ./libraries/wrapper/
mkdir -p ./libraries/dma/
mkdir -p ./libraries/ddr2_i2c_sda/
mkdir -p ./libraries/ddr2_i2c_scl/
mkdir -p ./libraries/mm_clock_crossing_bridge_io/
mkdir -p ./libraries/button/
mkdir -p ./libraries/led/
mkdir -p ./libraries/timer/
mkdir -p ./libraries/sysid/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/nios2_qsys/
mkdir -p ./libraries/mem_if_ddr2_emif/
mkdir -p ./libraries/onchip_memory/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/stratixiv_hssi_ver/
mkdir -p ./libraries/stratixiv_pcie_hip_ver/
mkdir -p ./libraries/stratixiv_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_sequencer_mem.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_AC_ROM.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_inst_ROM.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_bht_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_bht_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_bht_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_dc_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_dc_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_dc_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_ic_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_ic_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_ic_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_rf_ram_b.mif ./
  cp -f $QSYS_SIMDIR/submodules/DE4_QSYS_onchip_memory.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"        -work altera_ver            
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                 -work lpm_ver               
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                    -work sgate_ver             
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                -work altera_mf_ver         
  ncvlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"            -work altera_lnsim_ver      
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_atoms.v"     -work stratixiv_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v" -work stratixiv_pcie_hip_ver
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_atoms.v"          -work stratixiv_ver         
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog                                        "$QSYS_SIMDIR/submodules/alt_mem_ddrx_mm_st_converter.v"                                        -work a0                                                                              -cdslib ./cds_libs/a0.cds.lib                                                                             
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_addr_cmd.v"                                               -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_addr_cmd_wrap.v"                                          -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ddr2_odt_gen.v"                                           -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ddr3_odt_gen.v"                                           -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_lpddr2_addr_cmd.v"                                        -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_odt_gen.v"                                                -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_rdwr_data_tmg.v"                                          -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_arbiter.v"                                                -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_burst_gen.v"                                              -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_cmd_gen.v"                                                -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_csr.v"                                                    -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_buffer.v"                                                 -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_buffer_manager.v"                                         -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_burst_tracking.v"                                         -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_dataid_manager.v"                                         -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_fifo.v"                                                   -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_list.v"                                                   -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_rdata_path.v"                                             -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_wdata_path.v"                                             -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_decoder.v"                                            -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_decoder_32_syn.v"                                     -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_decoder_64_syn.v"                                     -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder.v"                                            -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder_32_syn.v"                                     -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder_64_syn.v"                                     -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_ecc_encoder_decoder_wrapper.v"                            -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_axi_st_converter.v"                                       -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_input_if.v"                                               -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_rank_timer.v"                                             -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_sideband.v"                                               -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_tbp.v"                                                    -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_timing_param.v"                                           -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_controller.v"                                             -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog     -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_ddrx_controller_st_top.v"                                      -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog -sv -incdir "$QSYS_SIMDIR/submodules/" "$QSYS_SIMDIR/submodules/alt_mem_if_nextgen_ddr2_controller_core.sv"                            -work ng0                                                                             -cdslib ./cds_libs/ng0.cds.lib                                                                            
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_mem_if_dll_stratixiv.sv"                                        -work dll0                                                                            -cdslib ./cds_libs/dll0.cds.lib                                                                           
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_mem_if_oct_stratixiv.sv"                                        -work oct0                                                                            -cdslib ./cds_libs/oct0.cds.lib                                                                           
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_c0.v"                                        -work c0                                                                              -cdslib ./cds_libs/c0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0.v"                                        -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                               -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst.v"            -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst_test_bench.v" -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_mem_if_sequencer_mem_no_ifdef_params.sv"                        -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_mem_if_sequencer_rst.sv"                                        -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                   -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                         -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                    -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                          -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                     -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_addr_router.sv"                           -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_addr_router_001.sv"                       -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_cmd_xbar_demux.sv"                        -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_cmd_xbar_demux_001.sv"                    -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_cmd_xbar_mux_003.sv"                      -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_id_router.sv"                             -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_id_router_003.sv"                         -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_irq_mapper.sv"                            -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_rsp_xbar_demux_003.sv"                    -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_rsp_xbar_mux.sv"                          -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_ac_ROM_no_ifdef_params.v"                                   -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_ac_ROM_reg.v"                                               -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_bitcheck.v"                                                 -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/rw_manager_core.sv"                                                    -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_datamux.v"                                                  -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_data_broadcast.v"                                           -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_data_decoder.v"                                             -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_ddr2.v"                                                     -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_di_buffer.v"                                                -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_di_buffer_wrap.v"                                           -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_dm_decoder.v"                                               -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/rw_manager_generic.sv"                                                 -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_inst_ROM_no_ifdef_params.v"                                 -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_inst_ROM_reg.v"                                             -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_jumplogic.v"                                                -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_lfsr12.v"                                                   -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_lfsr36.v"                                                   -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_lfsr72.v"                                                   -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_pattern_fifo.v"                                             -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_ram.v"                                                      -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_ram_csr.v"                                                  -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_read_datapath.v"                                            -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/rw_manager_write_decoder.v"                                            -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_data_mgr.sv"                                                 -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_phy_mgr.sv"                                                  -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_reg_file.sv"                                                 -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/sequencer_scc_acv_phase_decode.v"                                      -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_scc_acv_wrapper.sv"                                          -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_scc_mgr.sv"                                                  -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/sequencer_scc_reg_file.v"                                              -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/sequencer_scc_siii_phase_decode.v"                                     -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_scc_siii_wrapper.sv"                                         -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/sequencer_scc_sv_phase_decode.v"                                       -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/sequencer_scc_sv_wrapper.sv"                                           -work s0                                                                              -cdslib ./cds_libs/s0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/afi_mux_ddrx.v"                                                        -work m0                                                                              -cdslib ./cds_libs/m0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_clock_pair_generator.v"                   -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_read_valid_selector.v"                    -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_addr_cmd_datapath.v"                      -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_reset.v"                                  -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_acv_ldc.v"                                -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_memphy.sv"                                -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_reset_sync.v"                             -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_new_io_pads.v"                            -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_fr_cycle_shifter.v"                       -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_fr_cycle_extender.v"                      -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_read_datapath.sv"                         -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_write_datapath.v"                         -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_simple_ddio_out.sv"                       -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_phy_csr.sv"                               -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_iss_probe.v"                              -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_addr_cmd_pads.v"                          -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_flop_mem.v"                               -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0.sv"                                       -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_altdqdqs.v"                               -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altdq_dqs2_ddio_3reg_stratixiv.sv"                                     -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altdq_dqs2_abstract.sv"                                                -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altdq_dqs2_cal_delays.sv"                                              -work p0                                                                              -cdslib ./cds_libs/p0.cds.lib                                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif_pll0.sv"                                     -work pll0                                                                            -cdslib ./cds_libs/pll0.cds.lib                                                                           
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_irq_clock_crosser.sv"                                           -work irq_synchronizer                                                                -cdslib ./cds_libs/irq_synchronizer.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_irq_mapper.sv"                                                -work irq_mapper                                                                      -cdslib ./cds_libs/irq_mapper.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                            -work crosser                                                                         -cdslib ./cds_libs/crosser.cds.lib                                                                        
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                      -work crosser                                                                         -cdslib ./cds_libs/crosser.cds.lib                                                                        
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                      -work crosser                                                                         -cdslib ./cds_libs/crosser.cds.lib                                                                        
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                        -work width_adapter                                                                   -cdslib ./cds_libs/width_adapter.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                    -work width_adapter                                                                   -cdslib ./cds_libs/width_adapter.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                   -work width_adapter                                                                   -cdslib ./cds_libs/width_adapter.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_xbar_mux_005                                                                -cdslib ./cds_libs/rsp_xbar_mux_005.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_rsp_xbar_mux_005.sv"                                          -work rsp_xbar_mux_005                                                                -cdslib ./cds_libs/rsp_xbar_mux_005.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_rsp_xbar_demux_007.sv"                                        -work rsp_xbar_demux_007                                                              -cdslib ./cds_libs/rsp_xbar_demux_007.cds.lib                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_demux_005.sv"                                        -work cmd_xbar_demux_005                                                              -cdslib ./cds_libs/cmd_xbar_demux_005.cds.lib                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_xbar_mux_001                                                                -cdslib ./cds_libs/rsp_xbar_mux_001.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_rsp_xbar_mux_001.sv"                                          -work rsp_xbar_mux_001                                                                -cdslib ./cds_libs/rsp_xbar_mux_001.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_xbar_mux                                                                    -cdslib ./cds_libs/rsp_xbar_mux.cds.lib                                                                   
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_rsp_xbar_mux.sv"                                              -work rsp_xbar_mux                                                                    -cdslib ./cds_libs/rsp_xbar_mux.cds.lib                                                                   
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_rsp_xbar_demux_004.sv"                                        -work rsp_xbar_demux_004                                                              -cdslib ./cds_libs/rsp_xbar_demux_004.cds.lib                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_rsp_xbar_demux.sv"                                            -work rsp_xbar_demux                                                                  -cdslib ./cds_libs/rsp_xbar_demux.cds.lib                                                                 
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_xbar_mux_004                                                                -cdslib ./cds_libs/cmd_xbar_mux_004.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_mux_004.sv"                                          -work cmd_xbar_mux_004                                                                -cdslib ./cds_libs/cmd_xbar_mux_004.cds.lib                                                               
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_xbar_mux                                                                    -cdslib ./cds_libs/cmd_xbar_mux.cds.lib                                                                   
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_mux.sv"                                              -work cmd_xbar_mux                                                                    -cdslib ./cds_libs/cmd_xbar_mux.cds.lib                                                                   
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_demux_003.sv"                                        -work cmd_xbar_demux_003                                                              -cdslib ./cds_libs/cmd_xbar_demux_003.cds.lib                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_demux_002.sv"                                        -work cmd_xbar_demux_002                                                              -cdslib ./cds_libs/cmd_xbar_demux_002.cds.lib                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_demux_001.sv"                                        -work cmd_xbar_demux_001                                                              -cdslib ./cds_libs/cmd_xbar_demux_001.cds.lib                                                             
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_cmd_xbar_demux.sv"                                            -work cmd_xbar_demux                                                                  -cdslib ./cds_libs/cmd_xbar_demux.cds.lib                                                                 
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                             -work rst_controller                                                                  -cdslib ./cds_libs/rst_controller.cds.lib                                                                 
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                           -work rst_controller                                                                  -cdslib ./cds_libs/rst_controller.cds.lib                                                                 
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                        -work burst_adapter                                                                   -cdslib ./cds_libs/burst_adapter.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                    -work burst_adapter                                                                   -cdslib ./cds_libs/burst_adapter.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                      -work limiter                                                                         -cdslib ./cds_libs/limiter.cds.lib                                                                        
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                      -work limiter                                                                         -cdslib ./cds_libs/limiter.cds.lib                                                                        
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_id_router_007.sv"                                             -work id_router_007                                                                   -cdslib ./cds_libs/id_router_007.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_addr_router_005.sv"                                           -work addr_router_005                                                                 -cdslib ./cds_libs/addr_router_005.cds.lib                                                                
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_id_router_005.sv"                                             -work id_router_005                                                                   -cdslib ./cds_libs/id_router_005.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_id_router_004.sv"                                             -work id_router_004                                                                   -cdslib ./cds_libs/id_router_004.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_id_router_002.sv"                                             -work id_router_002                                                                   -cdslib ./cds_libs/id_router_002.cds.lib                                                                  
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_id_router.sv"                                                 -work id_router                                                                       -cdslib ./cds_libs/id_router.cds.lib                                                                      
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_addr_router_003.sv"                                           -work addr_router_003                                                                 -cdslib ./cds_libs/addr_router_003.cds.lib                                                                
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_addr_router_002.sv"                                           -work addr_router_002                                                                 -cdslib ./cds_libs/addr_router_002.cds.lib                                                                
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_addr_router_001.sv"                                           -work addr_router_001                                                                 -cdslib ./cds_libs/addr_router_001.cds.lib                                                                
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/DE4_QSYS_addr_router.sv"                                               -work addr_router                                                                     -cdslib ./cds_libs/addr_router.cds.lib                                                                    
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                               -work nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -cdslib ./cds_libs/nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.cds.lib
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                          -work nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent          -cdslib ./cds_libs/nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent.cds.lib         
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                   -work nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent          -cdslib ./cds_libs/nios2_qsys_jtag_debug_module_translator_avalon_universal_slave_0_agent.cds.lib         
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                         -work nios2_qsys_instruction_master_translator_avalon_universal_master_0_agent        -cdslib ./cds_libs/nios2_qsys_instruction_master_translator_avalon_universal_master_0_agent.cds.lib       
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                     -work nios2_qsys_jtag_debug_module_translator                                         -cdslib ./cds_libs/nios2_qsys_jtag_debug_module_translator.cds.lib                                        
  ncvlog -sv                                    "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                    -work nios2_qsys_instruction_master_translator                                        -cdslib ./cds_libs/nios2_qsys_instruction_master_translator.cds.lib                                       
  ncvlog                                        "$QSYS_SIMDIR/submodules/latency_aware_read_master.v"                                           -work ppl_mem_reader                                                                  -cdslib ./cds_libs/ppl_mem_reader.cds.lib                                                                 
  ncvlog                                        "$QSYS_SIMDIR/submodules/rbm_demo.v"                                                            -work wrapper                                                                         -cdslib ./cds_libs/wrapper.cds.lib                                                                        
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_dma.v"                                                        -work dma                                                                             -cdslib ./cds_libs/dma.cds.lib                                                                            
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_ddr2_i2c_sda.v"                                               -work ddr2_i2c_sda                                                                    -cdslib ./cds_libs/ddr2_i2c_sda.cds.lib                                                                   
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_ddr2_i2c_scl.v"                                               -work ddr2_i2c_scl                                                                    -cdslib ./cds_libs/ddr2_i2c_scl.cds.lib                                                                   
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_avalon_mm_clock_crossing_bridge.v"                              -work mm_clock_crossing_bridge_io                                                     -cdslib ./cds_libs/mm_clock_crossing_bridge_io.cds.lib                                                    
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                                               -work mm_clock_crossing_bridge_io                                                     -cdslib ./cds_libs/mm_clock_crossing_bridge_io.cds.lib                                                    
  ncvlog                                        "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"                                   -work mm_clock_crossing_bridge_io                                                     -cdslib ./cds_libs/mm_clock_crossing_bridge_io.cds.lib                                                    
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_button.v"                                                     -work button                                                                          -cdslib ./cds_libs/button.cds.lib                                                                         
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_led.v"                                                        -work led                                                                             -cdslib ./cds_libs/led.cds.lib                                                                            
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_timer.v"                                                      -work timer                                                                           -cdslib ./cds_libs/timer.cds.lib                                                                          
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_sysid.vo"                                                     -work sysid                                                                           -cdslib ./cds_libs/sysid.cds.lib                                                                          
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_jtag_uart.v"                                                  -work jtag_uart                                                                       -cdslib ./cds_libs/jtag_uart.cds.lib                                                                      
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys.vo"                                                -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_jtag_debug_module_sysclk.v"                        -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_jtag_debug_module_tck.v"                           -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_jtag_debug_module_wrapper.v"                       -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_mult_cell.v"                                       -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_oci_test_bench.v"                                  -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_nios2_qsys_test_bench.v"                                      -work nios2_qsys                                                                      -cdslib ./cds_libs/nios2_qsys.cds.lib                                                                     
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_mem_if_ddr2_emif.v"                                           -work mem_if_ddr2_emif                                                                -cdslib ./cds_libs/mem_if_ddr2_emif.cds.lib                                                               
  ncvlog                                        "$QSYS_SIMDIR/submodules/DE4_QSYS_onchip_memory.v"                                              -work onchip_memory                                                                   -cdslib ./cds_libs/onchip_memory.cds.lib                                                                  
  ncvlog                                        "$QSYS_SIMDIR/DE4_QSYS.v"                                                                                                                                                                                                                                                                       
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
