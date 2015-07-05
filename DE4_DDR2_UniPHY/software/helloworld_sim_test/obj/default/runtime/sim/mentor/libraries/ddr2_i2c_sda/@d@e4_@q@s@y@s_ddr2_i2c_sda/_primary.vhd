library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_ddr2_i2c_sda is
    port(
        address         : in     vl_logic_vector(1 downto 0);
        chipselect      : in     vl_logic;
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        write_n         : in     vl_logic;
        writedata       : in     vl_logic_vector(31 downto 0);
        bidir_port      : inout  vl_logic;
        readdata        : out    vl_logic_vector(31 downto 0)
    );
end DE4_QSYS_ddr2_i2c_sda;
