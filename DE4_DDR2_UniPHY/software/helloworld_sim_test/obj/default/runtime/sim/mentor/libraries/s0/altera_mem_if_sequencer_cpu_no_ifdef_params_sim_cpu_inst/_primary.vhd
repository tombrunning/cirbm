library verilog;
use verilog.vl_types.all;
entity altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst is
    generic(
        DEVICE_FAMILY   : string  := "Stratix V"
    );
    port(
        clk             : in     vl_logic;
        d_irq           : in     vl_logic_vector(31 downto 0);
        d_readdata      : in     vl_logic_vector(31 downto 0);
        d_waitrequest   : in     vl_logic;
        i_readdata      : in     vl_logic_vector(31 downto 0);
        i_waitrequest   : in     vl_logic;
        reset_n         : in     vl_logic;
        d_address       : out    vl_logic_vector(19 downto 0);
        d_byteenable    : out    vl_logic_vector(3 downto 0);
        d_read          : out    vl_logic;
        d_write         : out    vl_logic;
        d_writedata     : out    vl_logic_vector(31 downto 0);
        i_address       : out    vl_logic_vector(16 downto 0);
        i_read          : out    vl_logic;
        no_ci_readra    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEVICE_FAMILY : constant is 1;
end altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst;
