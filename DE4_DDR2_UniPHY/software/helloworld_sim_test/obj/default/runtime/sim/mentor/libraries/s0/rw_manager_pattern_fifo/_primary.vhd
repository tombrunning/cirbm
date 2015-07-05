library verilog;
use verilog.vl_types.all;
entity rw_manager_pattern_fifo is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(8 downto 0);
        rdaddress       : in     vl_logic_vector(4 downto 0);
        wraddress       : in     vl_logic_vector(4 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(8 downto 0)
    );
end rw_manager_pattern_fifo;
