
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

# ACDS 13.0sp1 232 win32 2015.07.01.13:36:37

# ----------------------------------------
# vcs - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="DE4_QSYS_tb"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/13.0sp1/quartus/"
SKIP_FILE_COPY=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"
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
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_sequencer_mem.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_AC_ROM.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_inst_ROM.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_bht_ram.dat ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_bht_ram.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_bht_ram.mif ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_dc_tag_ram.dat ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_dc_tag_ram.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_dc_tag_ram.mif ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_ic_tag_ram.dat ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_ic_tag_ram.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_ic_tag_ram.mif ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_ociram_default_contents.dat ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_ociram_default_contents.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_ociram_default_contents.mif ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_rf_ram_a.dat ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_rf_ram_a.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_rf_ram_a.mif ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_rf_ram_b.dat ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_rf_ram_b.hex ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_rf_ram_b.mif ./
  cp -f D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_onchip_memory.hex ./
  cp -f D:/Projects/fpl16/DE4_DDR2_UniPHY/software/helloworld_sim_test/mem_init/hdl_sim/DE4_QSYS_onchip_memory.dat ./
  cp -f D:/Projects/fpl16/DE4_DDR2_UniPHY/software/helloworld_sim_test/mem_init/DE4_QSYS_onchip_memory.hex ./
fi

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $USER_DEFINED_ELAB_OPTIONS \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v \
  $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_atoms.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_mm_st_converter.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_addr_cmd.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_addr_cmd_wrap.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ddr2_odt_gen.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ddr3_odt_gen.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_lpddr2_addr_cmd.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_odt_gen.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_rdwr_data_tmg.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_arbiter.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_burst_gen.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_cmd_gen.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_csr.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_buffer.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_buffer_manager.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_burst_tracking.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_dataid_manager.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_fifo.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_list.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_rdata_path.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_wdata_path.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_decoder.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_decoder_32_syn.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_decoder_64_syn.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_encoder.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_encoder_32_syn.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_encoder_64_syn.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_ecc_encoder_decoder_wrapper.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_axi_st_converter.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_input_if.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_rank_timer.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_sideband.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_tbp.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_timing_param.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_controller.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_ddrx_controller_st_top.v \
  \"+incdir+D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/\" D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_if_nextgen_ddr2_controller_core.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_mem_if_dll_stratixiv.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_mem_if_oct_stratixiv.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_c0.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_sc_fifo.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst_test_bench.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_mem_if_sequencer_mem_no_ifdef_params.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_mem_if_sequencer_rst.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_arbitrator.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_master_agent.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_master_translator.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_slave_agent.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_slave_translator.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_addr_router.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_addr_router_001.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_cmd_xbar_demux.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_cmd_xbar_demux_001.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_cmd_xbar_mux_003.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_id_router.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_id_router_003.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_irq_mapper.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_rsp_xbar_demux_003.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_s0_rsp_xbar_mux.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_ac_ROM_no_ifdef_params.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_ac_ROM_reg.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_bitcheck.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_core.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_datamux.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_data_broadcast.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_data_decoder.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_ddr2.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_di_buffer.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_di_buffer_wrap.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_dm_decoder.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_generic.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_inst_ROM_no_ifdef_params.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_inst_ROM_reg.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_jumplogic.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_lfsr12.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_lfsr36.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_lfsr72.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_pattern_fifo.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_ram.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_ram_csr.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_read_datapath.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/rw_manager_write_decoder.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_data_mgr.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_phy_mgr.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_reg_file.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_acv_phase_decode.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_acv_wrapper.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_mgr.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_reg_file.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_siii_phase_decode.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_siii_wrapper.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_sv_phase_decode.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/sequencer_scc_sv_wrapper.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/afi_mux_ddrx.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_clock_pair_generator.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_read_valid_selector.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_addr_cmd_datapath.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_reset.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_acv_ldc.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_memphy.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_reset_sync.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_new_io_pads.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_fr_cycle_shifter.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_fr_cycle_extender.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_read_datapath.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_write_datapath.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_simple_ddio_out.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_phy_csr.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_iss_probe.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_addr_cmd_pads.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_flop_mem.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_p0_altdqdqs.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altdq_dqs2_ddio_3reg_stratixiv.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altdq_dqs2_abstract.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altdq_dqs2_cal_delays.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif_pll0.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_irq_clock_crosser.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_irq_mapper.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_st_handshake_clock_crosser.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_st_clock_crosser.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_st_pipeline_base.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_width_adapter.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_address_alignment.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_mux_004.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_demux_006.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_cmd_xbar_demux_004.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_mux_001.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_mux.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_demux_005.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_demux_002.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_rsp_xbar_demux.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_cmd_xbar_mux_005.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_cmd_xbar_mux.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_cmd_xbar_demux_002.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_cmd_xbar_demux_001.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_cmd_xbar_demux.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_reset_controller.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_reset_synchronizer.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_burst_adapter.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_merlin_traffic_limiter.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_id_router_006.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_addr_router_004.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_id_router_005.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_id_router_002.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_id_router.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_addr_router_002.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_addr_router_001.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_addr_router.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_dma.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_ddr2_i2c_sda.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_ddr2_i2c_scl.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_mm_clock_crossing_bridge.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_dc_fifo.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_dcfifo_synchronizer_bundle.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_button.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_led.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_timer.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_sysid.vo \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_jtag_uart.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys.vo \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_jtag_debug_module_sysclk.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_jtag_debug_module_tck.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_jtag_debug_module_wrapper.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_mult_cell.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_oci_test_bench.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_nios2_qsys_test_bench.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_mem_if_ddr2_emif.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS_onchip_memory.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_if_ddr2_mem_model_top_mem_if_dm_pins_en_mem_if_dqsn_en.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/alt_mem_if_common_ddr_mem_model_mem_if_dm_pins_en_mem_if_dqsn_en.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/verbosity_pkg.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_conduit_bfm_0006.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_conduit_bfm_0005.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_conduit_bfm_0004.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_conduit_bfm_0003.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_conduit_bfm_0002.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_conduit_bfm.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_reset_source.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/altera_avalon_clock_source.sv \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/submodules/DE4_QSYS.v \
  D:/Projects/fpl16/cirbm/DE4_DDR2_UniPHY/DE4_QSYS/testbench/DE4_QSYS_tb/simulation/DE4_QSYS_tb.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $USER_DEFINED_SIM_OPTIONS
fi
