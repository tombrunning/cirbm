library verilog;
use verilog.vl_types.all;
entity VTOH_top is
    generic(
        DATAWIDTH       : integer := 16;
        BATCHSIZE       : integer := 16;
        CHUNKSIZE       : vl_notype;
        VS              : integer := 784;
        HS              : integer := 512;
        BS              : integer := 16
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        available       : in     vl_logic_vector;
        fifo_data       : in     vl_logic_vector;
        vtoh_out        : out    vl_logic_vector;
        vtoh_out_available: out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of BATCHSIZE : constant is 1;
    attribute mti_svvh_generic_type of CHUNKSIZE : constant is 3;
    attribute mti_svvh_generic_type of VS : constant is 1;
    attribute mti_svvh_generic_type of HS : constant is 1;
    attribute mti_svvh_generic_type of BS : constant is 1;
end VTOH_top;
