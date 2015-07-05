library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma_fifo_module_fifo_ram_module is
    port(
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(127 downto 0);
        rdaddress       : in     vl_logic_vector(2 downto 0);
        rdclken         : in     vl_logic;
        reset_n         : in     vl_logic;
        wraddress       : in     vl_logic_vector(2 downto 0);
        wrclock         : in     vl_logic;
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(127 downto 0)
    );
end DE4_QSYS_dma_fifo_module_fifo_ram_module;
