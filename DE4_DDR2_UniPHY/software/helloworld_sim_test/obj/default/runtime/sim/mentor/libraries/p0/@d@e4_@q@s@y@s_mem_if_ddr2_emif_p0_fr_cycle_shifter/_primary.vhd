library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_fr_cycle_shifter is
    generic(
        DATA_WIDTH      : string  := "";
        REG_POST_RESET_HIGH: string  := "false"
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        shift_by        : in     vl_logic_vector(1 downto 0);
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of REG_POST_RESET_HIGH : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_fr_cycle_shifter;
