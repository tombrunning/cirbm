library verilog;
use verilog.vl_types.all;
entity vtohMMM2 is
    generic(
        DATAWIDTH       : integer := 16;
        FRACLENGTH      : integer := 11;
        sign            : integer := 15
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clear_acc       : in     vl_logic;
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        \out\           : out    vl_logic_vector;
        out_available   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of FRACLENGTH : constant is 1;
    attribute mti_svvh_generic_type of sign : constant is 1;
end vtohMMM2;
