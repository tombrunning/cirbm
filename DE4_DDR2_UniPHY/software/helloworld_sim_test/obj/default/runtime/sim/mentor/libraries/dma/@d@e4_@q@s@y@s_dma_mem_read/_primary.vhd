library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma_mem_read is
    port(
        clk             : in     vl_logic;
        clk_en          : in     vl_logic;
        go              : in     vl_logic;
        p1_done_read    : in     vl_logic;
        p1_fifo_full    : in     vl_logic;
        read_waitrequest: in     vl_logic;
        reset_n         : in     vl_logic;
        inc_read        : out    vl_logic;
        mem_read_n      : out    vl_logic
    );
end DE4_QSYS_dma_mem_read;
