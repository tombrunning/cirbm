library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_reset is
    generic(
        MEM_READ_DQS_WIDTH: string  := "";
        NUM_AFI_RESET   : integer := 1
    );
    port(
        seq_reset_mem_stable: in     vl_logic;
        pll_afi_clk     : in     vl_logic;
        pll_addr_cmd_clk: in     vl_logic;
        pll_dqs_ena_clk : in     vl_logic;
        seq_clk         : in     vl_logic;
        scc_clk         : in     vl_logic;
        pll_avl_clk     : in     vl_logic;
        reset_n_scc_clk : out    vl_logic;
        reset_n_avl_clk : out    vl_logic;
        read_capture_clk: in     vl_logic_vector;
        pll_locked      : in     vl_logic;
        global_reset_n  : in     vl_logic;
        soft_reset_n    : in     vl_logic;
        ctl_reset_n     : out    vl_logic;
        ctl_reset_export_n: out    vl_logic;
        reset_n_afi_clk : out    vl_logic_vector;
        reset_n_addr_cmd_clk: out    vl_logic;
        reset_n_resync_clk: out    vl_logic;
        reset_n_seq_clk : out    vl_logic;
        reset_n_read_capture_clk: out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MEM_READ_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUM_AFI_RESET : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_reset;
