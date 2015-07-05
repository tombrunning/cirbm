library verilog;
use verilog.vl_types.all;
entity sequencer_scc_acv_wrapper is
    generic(
        DATAWIDTH       : integer := 24;
        IO_SDATA_BITS   : integer := 11;
        DQS_SDATA_BITS  : integer := 46;
        AVL_DATA_WIDTH  : integer := 32;
        DLL_DELAY_CHAIN_LENGTH: integer := 6
    );
    port(
        reset_n_scc_clk : in     vl_logic;
        scc_clk         : in     vl_logic;
        scc_dataout     : in     vl_logic_vector;
        scc_io_cfg      : out    vl_logic_vector;
        scc_dqs_cfg     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of IO_SDATA_BITS : constant is 1;
    attribute mti_svvh_generic_type of DQS_SDATA_BITS : constant is 1;
    attribute mti_svvh_generic_type of AVL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DLL_DELAY_CHAIN_LENGTH : constant is 1;
end sequencer_scc_acv_wrapper;
