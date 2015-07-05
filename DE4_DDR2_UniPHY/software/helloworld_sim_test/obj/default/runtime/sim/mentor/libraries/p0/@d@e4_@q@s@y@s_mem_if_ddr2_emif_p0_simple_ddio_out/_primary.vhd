library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_simple_ddio_out is
    generic(
        DATA_WIDTH      : string  := "";
        OUTPUT_FULL_DATA_WIDTH: string  := "";
        USE_CORE_LOGIC  : string  := "";
        REG_POST_RESET_HIGH: string  := "false";
        HALF_RATE_MODE  : string  := "";
        REGISTER_OUTPUT : string  := "false";
        OUTPUT_REGISTER_STAGES: integer := 1;
        USE_EXTRA_OUTPUT_REG: string  := "false"
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        dr_clk          : in     vl_logic;
        dr_reset_n      : in     vl_logic;
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_FULL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of USE_CORE_LOGIC : constant is 1;
    attribute mti_svvh_generic_type of REG_POST_RESET_HIGH : constant is 1;
    attribute mti_svvh_generic_type of HALF_RATE_MODE : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_OUTPUT : constant is 1;
    attribute mti_svvh_generic_type of OUTPUT_REGISTER_STAGES : constant is 1;
    attribute mti_svvh_generic_type of USE_EXTRA_OUTPUT_REG : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_simple_ddio_out;
