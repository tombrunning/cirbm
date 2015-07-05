library verilog;
use verilog.vl_types.all;
entity sequencer_scc_acv_phase_decode is
    generic(
        AVL_DATA_WIDTH  : integer := 32;
        DLL_DELAY_CHAIN_LENGTH: integer := 8
    );
    port(
        avl_writedata   : in     vl_logic_vector;
        dqse_phase      : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AVL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DLL_DELAY_CHAIN_LENGTH : constant is 1;
end sequencer_scc_acv_phase_decode;
