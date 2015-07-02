library verilog;
use verilog.vl_types.all;
entity hv_mmmi is
    generic(
        HID_SIZE        : integer := 128;
        DATA_WIDTH      : integer := 16;
        LAYER_A_SIZE    : integer := 128;
        LAYER_B_SIZE    : integer := 64;
        LAYER_C_SIZE    : integer := 32;
        LAYER_D_SIZE    : integer := 16;
        LAYER_E_SIZE    : integer := 8;
        LAYER_F_SIZE    : integer := 4;
        LAYER_G_SIZE    : integer := 2;
        LAYER_H_SIZE    : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        nhstat_rows     : in     vl_logic_vector;
        wt_cols         : in     vl_logic_vector;
        res             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of HID_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of LAYER_A_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_B_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_C_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_D_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_E_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_F_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_G_SIZE : constant is 1;
    attribute mti_svvh_generic_type of LAYER_H_SIZE : constant is 1;
end hv_mmmi;
