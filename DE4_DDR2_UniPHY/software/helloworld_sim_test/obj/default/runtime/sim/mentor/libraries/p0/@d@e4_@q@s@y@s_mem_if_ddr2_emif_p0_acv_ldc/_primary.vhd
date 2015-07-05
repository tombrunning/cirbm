library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_acv_ldc is
    generic(
        DLL_DELAY_CTRL_WIDTH: string  := "";
        ADC_PHASE_SETTING: integer := 0;
        ADC_INVERT_PHASE: string  := "false";
        IS_HHP_HPS      : string  := "false"
    );
    port(
        pll_hr_clk      : in     vl_logic;
        pll_dq_clk      : in     vl_logic;
        pll_dqs_clk     : in     vl_logic;
        dll_phy_delayctrl: in     vl_logic_vector;
        afi_clk         : out    vl_logic;
        avl_clk         : out    vl_logic;
        adc_clk         : out    vl_logic;
        adc_clk_cps     : out    vl_logic;
        hr_clk          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DLL_DELAY_CTRL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADC_PHASE_SETTING : constant is 1;
    attribute mti_svvh_generic_type of ADC_INVERT_PHASE : constant is 1;
    attribute mti_svvh_generic_type of IS_HHP_HPS : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_acv_ldc;
