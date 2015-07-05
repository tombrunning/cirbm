library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_s0_irq_mapper is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sender_irq      : out    vl_logic_vector(31 downto 0)
    );
end DE4_QSYS_mem_if_ddr2_emif_s0_irq_mapper;
