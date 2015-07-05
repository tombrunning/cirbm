library verilog;
use verilog.vl_types.all;
entity sequencer_data_mgr is
    generic(
        AVL_DATA_WIDTH  : integer := 32;
        AVL_ADDR_WIDTH  : integer := 13;
        MAX_LATENCY_COUNT_WIDTH: integer := 5;
        MEM_READ_DQS_WIDTH: integer := 1;
        AFI_DEBUG_INFO_WIDTH: integer := 32;
        AFI_MAX_WRITE_LATENCY_COUNT_WIDTH: integer := 5;
        AFI_MAX_READ_LATENCY_COUNT_WIDTH: integer := 5;
        CALIB_VFIFO_OFFSET: integer := 10;
        CALIB_LFIFO_OFFSET: integer := 3;
        CALIB_SKIP_STEPS_WIDTH: integer := 8;
        READ_VALID_FIFO_SIZE: integer := 16;
        MEM_T_WL        : integer := 1;
        MEM_T_RL        : integer := 2;
        CTL_REGDIMM_ENABLED: integer := 0;
        SEQUENCER_VERSION: integer := 0
    );
    port(
        avl_clk         : in     vl_logic;
        avl_reset_n     : in     vl_logic;
        avl_address     : in     vl_logic_vector;
        avl_write       : in     vl_logic;
        avl_writedata   : in     vl_logic_vector;
        avl_read        : in     vl_logic;
        avl_readdata    : out    vl_logic_vector;
        avl_waitrequest : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AVL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MAX_LATENCY_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_READ_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_DEBUG_INFO_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_MAX_WRITE_LATENCY_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_MAX_READ_LATENCY_COUNT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CALIB_VFIFO_OFFSET : constant is 1;
    attribute mti_svvh_generic_type of CALIB_LFIFO_OFFSET : constant is 1;
    attribute mti_svvh_generic_type of CALIB_SKIP_STEPS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of READ_VALID_FIFO_SIZE : constant is 1;
    attribute mti_svvh_generic_type of MEM_T_WL : constant is 1;
    attribute mti_svvh_generic_type of MEM_T_RL : constant is 1;
    attribute mti_svvh_generic_type of CTL_REGDIMM_ENABLED : constant is 1;
    attribute mti_svvh_generic_type of SEQUENCER_VERSION : constant is 1;
end sequencer_data_mgr;
