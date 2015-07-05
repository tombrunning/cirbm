library verilog;
use verilog.vl_types.all;
entity testing_wrapper is
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
        avs_s0_writedata: in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
end testing_wrapper;
