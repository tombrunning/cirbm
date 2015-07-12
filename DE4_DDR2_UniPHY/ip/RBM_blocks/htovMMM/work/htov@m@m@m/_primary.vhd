library verilog;
use verilog.vl_types.all;
entity htovMMM is
    generic(
        DATAWIDTH       : integer := 16;
        BATCHSIZE       : integer := 16;
        L1SIZE          : integer := 16;
        L2SIZE          : integer := 8;
        L3SIZE          : integer := 4;
        L4SIZE          : integer := 2;
        L5SIZE          : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        data            : in     vl_logic_vector;
        w               : in     vl_logic_vector;
        dataout         : out    vl_logic_vector;
        dataout_available: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of BATCHSIZE : constant is 1;
    attribute mti_svvh_generic_type of L1SIZE : constant is 1;
    attribute mti_svvh_generic_type of L2SIZE : constant is 1;
    attribute mti_svvh_generic_type of L3SIZE : constant is 1;
    attribute mti_svvh_generic_type of L4SIZE : constant is 1;
    attribute mti_svvh_generic_type of L5SIZE : constant is 1;
end htovMMM;
