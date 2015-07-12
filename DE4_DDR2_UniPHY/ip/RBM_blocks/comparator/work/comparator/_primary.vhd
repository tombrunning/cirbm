library verilog;
use verilog.vl_types.all;
entity comparator is
    generic(
        DATAWIDTH       : integer := 16
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        sig_value       : in     vl_logic_vector;
        randn           : in     vl_logic_vector;
        cmp_result      : out    vl_logic;
        out_available   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
end comparator;
