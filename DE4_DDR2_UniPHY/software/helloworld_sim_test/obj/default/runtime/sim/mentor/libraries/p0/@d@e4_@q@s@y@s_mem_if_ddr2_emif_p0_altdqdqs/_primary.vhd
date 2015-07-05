library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_altdqdqs is
    generic(
        ALTERA_ALTDQ_DQS2_FAST_SIM_MODEL: integer := 1
    );
    port(
        core_clock_in   : in     vl_logic;
        reset_n_core_clock_in: in     vl_logic;
        fr_clock_in     : in     vl_logic;
        hr_clock_in     : in     vl_logic;
        write_strobe_clock_in: in     vl_logic;
        strobe_ena_hr_clock_in: in     vl_logic;
        strobe_ena_clock_in: in     vl_logic;
        capture_strobe_ena: in     vl_logic_vector(1 downto 0);
        read_write_data_io: inout  vl_logic_vector(7 downto 0);
        write_oe_in     : in     vl_logic_vector(15 downto 0);
        strobe_io       : inout  vl_logic;
        output_strobe_ena: in     vl_logic_vector(1 downto 0);
        strobe_n_io     : inout  vl_logic;
        oct_ena_in      : in     vl_logic_vector(1 downto 0);
        read_data_out   : out    vl_logic_vector(31 downto 0);
        capture_strobe_out: out    vl_logic;
        write_data_in   : in     vl_logic_vector(31 downto 0);
        extra_write_data_in: in     vl_logic_vector(3 downto 0);
        extra_write_data_out: out    vl_logic_vector(0 downto 0);
        parallelterminationcontrol_in: in     vl_logic_vector(13 downto 0);
        seriesterminationcontrol_in: in     vl_logic_vector(13 downto 0);
        config_data_in  : in     vl_logic;
        config_update   : in     vl_logic;
        config_dqs_ena  : in     vl_logic;
        config_io_ena   : in     vl_logic_vector(7 downto 0);
        config_extra_io_ena: in     vl_logic_vector(0 downto 0);
        config_dqs_io_ena: in     vl_logic;
        config_clock_in : in     vl_logic;
        dll_delayctrl_in: in     vl_logic_vector(5 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ALTERA_ALTDQ_DQS2_FAST_SIM_MODEL : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_altdqdqs;
