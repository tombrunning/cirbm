library verilog;
use verilog.vl_types.all;
entity altdq_dqs2_cal_delays is
    generic(
        CLOCK_FREQ      : string  := "";
        PIN_WIDTH       : integer := 1;
        EXTRA_OUTPUT_WIDTH: integer := 1;
        DEGREES_PER_PHASE_TAP: string  := "";
        DELAY_WIDTH     : integer := 32
    );
    port(
        config_data_in  : in     vl_logic;
        config_update   : in     vl_logic;
        config_dqs_ena  : in     vl_logic;
        config_io_ena   : in     vl_logic_vector;
        config_extra_io_ena: in     vl_logic_vector;
        config_dqs_io_ena: in     vl_logic;
        config_clock_in : in     vl_logic;
        opa_clock_delay : out    vl_logic_vector;
        dqs_in_busout_delay: out    vl_logic_vector;
        dqs_in_enable_on_delay: out    vl_logic_vector;
        dqs_in_enable_off_delay: out    vl_logic_vector;
        dqs_out_ptap_delay: out    vl_logic_vector;
        dqs_out_dtap_delay: out    vl_logic_vector;
        dq_out_ptap_delay: out    vl_logic_vector;
        dq_out_dtap_delay: out    vl_logic_vector;
        dq_in_dtap_delay: out    vl_logic_vector;
        extra_out_dtap_delay: out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_FREQ : constant is 1;
    attribute mti_svvh_generic_type of PIN_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of EXTRA_OUTPUT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEGREES_PER_PHASE_TAP : constant is 1;
    attribute mti_svvh_generic_type of DELAY_WIDTH : constant is 1;
end altdq_dqs2_cal_delays;
