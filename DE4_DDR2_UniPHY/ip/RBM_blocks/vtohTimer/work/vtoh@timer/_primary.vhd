library verilog;
use verilog.vl_types.all;
entity vtohTimer is
    generic(
        latency         : integer := 784;
        latency_LOG2    : integer := 10
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        in_available    : in     vl_logic;
        out_available   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of latency : constant is 1;
    attribute mti_svvh_generic_type of latency_LOG2 : constant is 1;
end vtohTimer;
