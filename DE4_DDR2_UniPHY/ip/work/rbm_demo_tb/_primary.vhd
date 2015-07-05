library verilog;
use verilog.vl_types.all;
entity rbm_demo_tb is
    generic(
        DATA_WIDTH      : integer := 256
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end rbm_demo_tb;
