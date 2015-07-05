library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_write_datapath is
    generic(
        MEM_ADDRESS_WIDTH: string  := "";
        MEM_DM_WIDTH    : string  := "";
        MEM_CONTROL_WIDTH: string  := "";
        MEM_DQ_WIDTH    : string  := "";
        MEM_READ_DQS_WIDTH: string  := "";
        MEM_WRITE_DQS_WIDTH: string  := "";
        AFI_ADDRESS_WIDTH: string  := "";
        AFI_DATA_MASK_WIDTH: string  := "";
        AFI_CONTROL_WIDTH: string  := "";
        AFI_DATA_WIDTH  : string  := "";
        AFI_DQS_WIDTH   : string  := "";
        NUM_WRITE_PATH_FLOP_STAGES: string  := "";
        NUM_WRITE_FR_CYCLE_SHIFTS: string  := ""
    );
    port(
        pll_afi_clk     : in     vl_logic;
        reset_n         : in     vl_logic;
        force_oct_off   : in     vl_logic_vector;
        afi_dqs_en      : in     vl_logic_vector;
        phy_ddio_oct_ena: out    vl_logic_vector;
        afi_wdata       : in     vl_logic_vector;
        afi_wdata_valid : in     vl_logic_vector;
        afi_dm          : in     vl_logic_vector;
        phy_ddio_dq     : out    vl_logic_vector;
        phy_ddio_dqs_en : out    vl_logic_vector;
        phy_ddio_wrdata_en: out    vl_logic_vector;
        phy_ddio_wrdata_mask: out    vl_logic_vector;
        seq_num_write_fr_cycle_shifts: in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MEM_ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_DM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_CONTROL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_DQ_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_READ_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_WRITE_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_DATA_MASK_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_CONTROL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUM_WRITE_PATH_FLOP_STAGES : constant is 1;
    attribute mti_svvh_generic_type of NUM_WRITE_FR_CYCLE_SHIFTS : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_write_datapath;
