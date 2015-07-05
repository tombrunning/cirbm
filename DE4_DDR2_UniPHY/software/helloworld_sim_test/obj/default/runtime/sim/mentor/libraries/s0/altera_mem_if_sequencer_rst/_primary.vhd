library verilog;
use verilog.vl_types.all;
entity altera_mem_if_sequencer_rst is
    generic(
        DEPTH           : integer := 2;
        CLKEN_LAGS_RESET: integer := 0
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clken_out       : out    vl_logic;
        reset_out       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of CLKEN_LAGS_RESET : constant is 1;
end altera_mem_if_sequencer_rst;
