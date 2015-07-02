library verilog;
use verilog.vl_types.all;
entity vh_mmmii_tb is
    generic(
        DATA_WIDTH      : integer := 16;
        CLASSES         : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CLASSES : constant is 1;
end vh_mmmii_tb;
