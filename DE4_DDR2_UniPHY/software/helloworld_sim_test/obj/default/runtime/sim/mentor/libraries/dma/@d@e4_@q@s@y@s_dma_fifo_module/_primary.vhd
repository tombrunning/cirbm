library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma_fifo_module is
    port(
        clk             : in     vl_logic;
        clk_en          : in     vl_logic;
        fifo_read       : in     vl_logic;
        fifo_wr_data    : in     vl_logic_vector(127 downto 0);
        fifo_write      : in     vl_logic;
        flush_fifo      : in     vl_logic;
        inc_pending_data: in     vl_logic;
        reset_n         : in     vl_logic;
        fifo_datavalid  : out    vl_logic;
        fifo_empty      : out    vl_logic;
        fifo_rd_data    : out    vl_logic_vector(127 downto 0);
        p1_fifo_full    : out    vl_logic
    );
end DE4_QSYS_dma_fifo_module;
