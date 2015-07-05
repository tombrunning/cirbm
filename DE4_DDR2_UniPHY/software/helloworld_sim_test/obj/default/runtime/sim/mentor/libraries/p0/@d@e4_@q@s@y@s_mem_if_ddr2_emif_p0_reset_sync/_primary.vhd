library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_reset_sync is
    generic(
        RESET_SYNC_STAGES: integer := 4;
        NUM_RESET_OUTPUT: integer := 1
    );
    port(
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        reset_n_sync    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RESET_SYNC_STAGES : constant is 1;
    attribute mti_svvh_generic_type of NUM_RESET_OUTPUT : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_reset_sync;
