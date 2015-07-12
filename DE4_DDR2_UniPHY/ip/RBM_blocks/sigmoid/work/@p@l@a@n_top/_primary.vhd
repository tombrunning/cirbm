library verilog;
use verilog.vl_types.all;
entity PLAN_top is
    generic(
        DATA_WIDTH      : integer := 16
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        \in\            : in     vl_logic_vector;
        sigmoid_value   : out    vl_logic_vector;
        sigmoid_value_available: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end PLAN_top;
