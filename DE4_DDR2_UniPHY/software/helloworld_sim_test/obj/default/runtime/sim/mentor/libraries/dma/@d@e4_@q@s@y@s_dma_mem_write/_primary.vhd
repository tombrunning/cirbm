library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma_mem_write is
    port(
        d1_enabled_write_endofpacket: in     vl_logic;
        fifo_datavalid  : in     vl_logic;
        write_waitrequest: in     vl_logic;
        fifo_read       : out    vl_logic;
        inc_write       : out    vl_logic;
        mem_write_n     : out    vl_logic;
        write_select    : out    vl_logic
    );
end DE4_QSYS_dma_mem_write;
