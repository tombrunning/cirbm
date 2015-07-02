library verilog;
use verilog.vl_types.all;
entity hv_mmmi_tb is
    generic(
        DATA_WIDTH      : integer := 16;
        HID_SIZE        : integer := 128
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of HID_SIZE : constant is 1;
end hv_mmmi_tb;
