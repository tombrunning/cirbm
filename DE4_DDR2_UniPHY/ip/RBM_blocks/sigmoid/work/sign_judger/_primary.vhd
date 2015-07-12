library verilog;
use verilog.vl_types.all;
entity sign_judger is
    generic(
        DATA_WIDTH      : integer := 16;
        sign            : integer := 15
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        in_available    : in     vl_logic;
        \in\            : in     vl_logic_vector;
        abs_out         : out    vl_logic_vector;
        sign_bit        : out    vl_logic;
        out_available   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of sign : constant is 1;
end sign_judger;
