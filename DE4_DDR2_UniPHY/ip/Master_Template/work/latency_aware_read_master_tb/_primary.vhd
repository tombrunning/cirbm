library verilog;
use verilog.vl_types.all;
entity latency_aware_read_master_tb is
    generic(
        DATAWIDTH       : integer := 32;
        ADDRESSWIDTH    : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESSWIDTH : constant is 1;
end latency_aware_read_master_tb;
