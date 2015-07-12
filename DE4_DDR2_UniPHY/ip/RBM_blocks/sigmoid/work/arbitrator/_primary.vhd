library verilog;
use verilog.vl_types.all;
entity arbitrator is
    generic(
        DATA_WIDTH      : integer := 16;
        sign            : integer := 15
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        abs_in          : in     vl_logic_vector;
        sign_bit_in     : in     vl_logic;
        input_available : in     vl_logic;
        \out\           : out    vl_logic_vector;
        output_available: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of sign : constant is 1;
end arbitrator;
