library verilog;
use verilog.vl_types.all;
entity rbm_demo is
    generic(
        DATAWIDTH       : integer := 32;
        ADDRESS_WIDTH   : integer := 32
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        avs_s0_address  : in     vl_logic_vector(1 downto 0);
        avs_s0_read     : in     vl_logic;
        avs_s0_write    : in     vl_logic;
        avs_s0_readdata : out    vl_logic_vector;
        avs_s0_readdatavalid: out    vl_logic;
        avs_s0_writedata: in     vl_logic_vector;
        coe_control_fixed_location: out    vl_logic;
        coe_control_read_base: out    vl_logic_vector;
        coe_control_read_length: out    vl_logic_vector;
        coe_control_go  : out    vl_logic;
        coe_control_done: in     vl_logic;
        coe_control_early_done: in     vl_logic;
        coe_user_buffer_data: in     vl_logic_vector;
        coe_user_data_available: in     vl_logic;
        coe_user_read_buffer: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
end rbm_demo;
