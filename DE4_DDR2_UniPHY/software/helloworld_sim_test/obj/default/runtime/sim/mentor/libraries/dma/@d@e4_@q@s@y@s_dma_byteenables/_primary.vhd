library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_dma_byteenables is
    port(
        byte_access     : in     vl_logic;
        quadword        : in     vl_logic;
        word            : in     vl_logic;
        write_address   : in     vl_logic_vector(29 downto 0);
        write_byteenable: out    vl_logic_vector(15 downto 0)
    );
end DE4_QSYS_dma_byteenables;
