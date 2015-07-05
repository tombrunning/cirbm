library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma_read_data_mux is
    port(
        byte_access     : in     vl_logic;
        clk             : in     vl_logic;
        clk_en          : in     vl_logic;
        dma_ctl_address : in     vl_logic_vector(2 downto 0);
        dma_ctl_chipselect: in     vl_logic;
        dma_ctl_write_n : in     vl_logic;
        dma_ctl_writedata: in     vl_logic_vector(30 downto 0);
        quadword        : in     vl_logic;
        read_readdata   : in     vl_logic_vector(127 downto 0);
        read_readdatavalid: in     vl_logic;
        readaddress     : in     vl_logic_vector(29 downto 0);
        readaddress_inc : in     vl_logic_vector(4 downto 0);
        reset_n         : in     vl_logic;
        word            : in     vl_logic;
        fifo_wr_data    : out    vl_logic_vector(127 downto 0)
    );
end DE4_QSYS_dma_read_data_mux;
