library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_clock_pair_generator is
    port(
        datain          : in     vl_logic_vector(0 downto 0);
        dataout         : out    vl_logic_vector(0 downto 0);
        dataout_b       : out    vl_logic_vector(0 downto 0)
    );
end DE4_QSYS_mem_if_ddr2_emif_p0_clock_pair_generator;
