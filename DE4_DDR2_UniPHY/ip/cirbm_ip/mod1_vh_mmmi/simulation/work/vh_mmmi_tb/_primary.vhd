library verilog;
use verilog.vl_types.all;
entity vh_mmmi_tb is
    generic(
        VIS_SIZE        : integer := 768;
        DATA_WIDTH      : integer := 16;
        BITS_PIX        : integer := 1;
        buffer_sz       : integer := 256
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VIS_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BITS_PIX : constant is 1;
    attribute mti_svvh_generic_type of buffer_sz : constant is 1;
end vh_mmmi_tb;
