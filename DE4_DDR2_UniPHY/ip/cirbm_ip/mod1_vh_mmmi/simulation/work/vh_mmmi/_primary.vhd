library verilog;
use verilog.vl_types.all;
entity vh_mmmi is
    generic(
        VIS_SIZE        : integer := 768;
        DATA_WIDTH      : integer := 16;
        BITS_PIX        : integer := 1;
        buffer_sz       : integer := 256
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        w_cols          : in     vl_logic_vector;
        data_seg        : in     vl_logic_vector;
        i_res           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VIS_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BITS_PIX : constant is 1;
    attribute mti_svvh_generic_type of buffer_sz : constant is 1;
end vh_mmmi;
