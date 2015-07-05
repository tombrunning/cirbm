library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma is
    port(
        clk             : in     vl_logic;
        dma_ctl_address : in     vl_logic_vector(2 downto 0);
        dma_ctl_chipselect: in     vl_logic;
        dma_ctl_write_n : in     vl_logic;
        dma_ctl_writedata: in     vl_logic_vector(30 downto 0);
        read_readdata   : in     vl_logic_vector(127 downto 0);
        read_readdatavalid: in     vl_logic;
        read_waitrequest: in     vl_logic;
        system_reset_n  : in     vl_logic;
        write_waitrequest: in     vl_logic;
        dma_ctl_irq     : out    vl_logic;
        dma_ctl_readdata: out    vl_logic_vector(30 downto 0);
        read_address    : out    vl_logic_vector(29 downto 0);
        read_burstcount : out    vl_logic_vector(1 downto 0);
        read_chipselect : out    vl_logic;
        read_read_n     : out    vl_logic;
        write_address   : out    vl_logic_vector(29 downto 0);
        write_burstcount: out    vl_logic_vector(1 downto 0);
        write_byteenable: out    vl_logic_vector(15 downto 0);
        write_chipselect: out    vl_logic;
        write_write_n   : out    vl_logic;
        write_writedata : out    vl_logic_vector(127 downto 0)
    );
end DE4_QSYS_dma;
