library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_read_valid_selector is
    generic(
        MAX_LATENCY_COUNT_WIDTH: string  := ""
    );
    port(
        reset_n         : in     vl_logic;
        pll_afi_clk     : in     vl_logic;
        latency_shifter : in     vl_logic_vector;
        latency_counter : in     vl_logic_vector;
        read_enable     : out    vl_logic;
        read_valid      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MAX_LATENCY_COUNT_WIDTH : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_read_valid_selector;
