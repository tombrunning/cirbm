library verilog;
use verilog.vl_types.all;
entity latency_aware_read_master is
    generic(
        DATAWIDTH       : integer := 32;
        BYTEENABLEWIDTH : integer := 4;
        ADDRESSWIDTH    : integer := 32;
        FIFODEPTH       : integer := 32;
        FIFODEPTH_LOG2  : integer := 5;
        FIFOUSEMEMORY   : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        coe_control_fixed_location: in     vl_logic;
        coe_control_read_base: in     vl_logic_vector;
        coe_control_read_length: in     vl_logic_vector;
        coe_control_go  : in     vl_logic;
        coe_control_done: out    vl_logic;
        coe_control_early_done: out    vl_logic;
        coe_user_read_buffer: in     vl_logic;
        coe_user_buffer_data: out    vl_logic_vector;
        coe_user_data_available: out    vl_logic;
        master_address  : out    vl_logic_vector;
        master_read     : out    vl_logic;
        master_byteenable: out    vl_logic_vector;
        master_readdata : in     vl_logic_vector;
        master_readdatavalid: in     vl_logic;
        master_waitrequest: in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of BYTEENABLEWIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESSWIDTH : constant is 1;
    attribute mti_svvh_generic_type of FIFODEPTH : constant is 1;
    attribute mti_svvh_generic_type of FIFODEPTH_LOG2 : constant is 1;
    attribute mti_svvh_generic_type of FIFOUSEMEMORY : constant is 1;
end latency_aware_read_master;
