library verilog;
use verilog.vl_types.all;
entity vh_mmmii is
    generic(
        VIS_SIZE        : integer := 768;
        DATA_WIDTH      : integer := 16;
        BATCH_SIZE      : integer := 16;
        CLASSES         : integer := 10
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        class_rows      : in     vl_logic_vector;
        wc_cols         : in     vl_logic_vector;
        ii_res          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VIS_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BATCH_SIZE : constant is 1;
    attribute mti_svvh_generic_type of CLASSES : constant is 1;
end vh_mmmii;
