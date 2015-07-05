library verilog;
use verilog.vl_types.all;
entity sequencer_scc_mgr is
    generic(
        AVL_DATA_WIDTH  : integer := 32;
        AVL_ADDR_WIDTH  : integer := 13;
        MEM_IF_READ_DQS_WIDTH: integer := 1;
        MEM_IF_WRITE_DQS_WIDTH: integer := 1;
        MEM_IF_DQ_WIDTH : integer := 36;
        MEM_IF_DM_WIDTH : integer := 4;
        MEM_NUMBER_OF_RANKS: integer := 1;
        DLL_DELAY_CHAIN_LENGTH: integer := 8;
        FAMILY          : string  := "STRATIXIII";
        USE_DQS_TRACKING: integer := 0;
        USE_SHADOW_REGS : integer := 0;
        DUAL_WRITE_CLOCK: integer := 0
    );
    port(
        avl_clk         : in     vl_logic;
        avl_reset_n     : in     vl_logic;
        avl_address     : in     vl_logic_vector;
        avl_write       : in     vl_logic;
        avl_writedata   : in     vl_logic_vector;
        avl_read        : in     vl_logic;
        avl_readdata    : out    vl_logic_vector;
        avl_waitrequest : out    vl_logic;
        scc_reset_n     : in     vl_logic;
        scc_clk         : in     vl_logic;
        scc_data        : out    vl_logic;
        scc_dqs_ena     : out    vl_logic_vector;
        scc_dqs_io_ena  : out    vl_logic_vector;
        scc_dq_ena      : out    vl_logic_vector;
        scc_dm_ena      : out    vl_logic_vector;
        scc_upd         : out    vl_logic_vector;
        scc_sr_dqsenable_delayctrl: out    vl_logic_vector(7 downto 0);
        scc_sr_dqsdisablen_delayctrl: out    vl_logic_vector(7 downto 0);
        scc_sr_multirank_delayctrl: out    vl_logic_vector(7 downto 0);
        capture_strobe_tracking: in     vl_logic_vector;
        afi_init_req    : in     vl_logic;
        afi_cal_req     : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AVL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_IF_READ_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_IF_WRITE_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_IF_DQ_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_IF_DM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_NUMBER_OF_RANKS : constant is 1;
    attribute mti_svvh_generic_type of DLL_DELAY_CHAIN_LENGTH : constant is 1;
    attribute mti_svvh_generic_type of FAMILY : constant is 1;
    attribute mti_svvh_generic_type of USE_DQS_TRACKING : constant is 1;
    attribute mti_svvh_generic_type of USE_SHADOW_REGS : constant is 1;
    attribute mti_svvh_generic_type of DUAL_WRITE_CLOCK : constant is 1;
end sequencer_scc_mgr;
