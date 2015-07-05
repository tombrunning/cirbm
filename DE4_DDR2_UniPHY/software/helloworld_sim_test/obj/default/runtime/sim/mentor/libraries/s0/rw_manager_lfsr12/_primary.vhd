library verilog;
use verilog.vl_types.all;
entity rw_manager_lfsr12 is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        ena             : in     vl_logic;
        word            : out    vl_logic_vector(11 downto 0)
    );
end rw_manager_lfsr12;
