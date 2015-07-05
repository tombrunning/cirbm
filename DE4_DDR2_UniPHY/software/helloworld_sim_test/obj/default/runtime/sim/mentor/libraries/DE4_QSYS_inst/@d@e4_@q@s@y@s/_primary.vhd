library verilog;
use verilog.vl_types.all;
entity DE4_QSYS is
    port(
        clk_clk         : in     vl_logic;
        reset_reset_n   : in     vl_logic;
        memory_mem_a    : out    vl_logic_vector(13 downto 0);
        memory_mem_ba   : out    vl_logic_vector(2 downto 0);
        memory_mem_ck   : out    vl_logic_vector(1 downto 0);
        memory_mem_ck_n : out    vl_logic_vector(1 downto 0);
        memory_mem_cke  : out    vl_logic_vector(0 downto 0);
        memory_mem_cs_n : out    vl_logic_vector(0 downto 0);
        memory_mem_dm   : out    vl_logic_vector(7 downto 0);
        memory_mem_ras_n: out    vl_logic_vector(0 downto 0);
        memory_mem_cas_n: out    vl_logic_vector(0 downto 0);
        memory_mem_we_n : out    vl_logic_vector(0 downto 0);
        memory_mem_dq   : inout  vl_logic_vector(63 downto 0);
        memory_mem_dqs  : inout  vl_logic_vector(7 downto 0);
        memory_mem_dqs_n: inout  vl_logic_vector(7 downto 0);
        memory_mem_odt  : out    vl_logic_vector(0 downto 0);
        oct_rdn         : in     vl_logic;
        oct_rup         : in     vl_logic;
        mem_if_ddr2_emif_status_local_init_done: out    vl_logic;
        mem_if_ddr2_emif_status_local_cal_success: out    vl_logic;
        mem_if_ddr2_emif_status_local_cal_fail: out    vl_logic;
        led_export      : out    vl_logic_vector(7 downto 0);
        button_export   : in     vl_logic_vector(3 downto 0);
        ddr2_i2c_scl_export: out    vl_logic;
        ddr2_i2c_sda_export: inout  vl_logic
    );
end DE4_QSYS;
