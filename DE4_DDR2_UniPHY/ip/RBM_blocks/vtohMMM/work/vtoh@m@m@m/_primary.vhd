library verilog;
use verilog.vl_types.all;
entity vtohMMM is
    generic(
        DATAWIDTH       : integer := 16;
        BATCHSIZE       : integer := 16
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
end vtohMMM;
