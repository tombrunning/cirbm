library verilog;
use verilog.vl_types.all;
entity rbm_demo is
    generic(
        DATA_WIDTH      : integer := 256
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        avs_s0_read     : in     vl_logic;
        avs_s0_write    : in     vl_logic;
        avs_s0_readdata : out    vl_logic_vector;
        avs_s0_writedata: in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end rbm_demo;
