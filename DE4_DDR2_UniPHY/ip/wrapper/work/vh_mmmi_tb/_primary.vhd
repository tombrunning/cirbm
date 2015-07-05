library verilog;
use verilog.vl_types.all;
entity vh_mmmi_tb is
    generic(
        DATAWIDTH       : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
end vh_mmmi_tb;
