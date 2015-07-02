library verilog;
use verilog.vl_types.all;
entity element_mul_accu is
    generic(
        DATA_WIDTH      : integer := 16
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \out\           : out    vl_logic_vector;
        in1             : in     vl_logic;
        in2             : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end element_mul_accu;
