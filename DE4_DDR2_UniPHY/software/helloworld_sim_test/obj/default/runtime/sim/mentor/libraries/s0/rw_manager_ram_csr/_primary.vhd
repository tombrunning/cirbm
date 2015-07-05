library verilog;
use verilog.vl_types.all;
entity rw_manager_ram_csr is
    generic(
        DATA_WIDTH      : integer := 32;
        ADDR_WIDTH      : integer := 2;
        NUM_WORDS       : integer := 4
    );
    port(
        csr_clk         : in     vl_logic;
        csr_ena         : in     vl_logic;
        csr_din         : in     vl_logic;
        ram_clk         : in     vl_logic;
        wren            : in     vl_logic;
        data            : in     vl_logic_vector;
        wraddress       : in     vl_logic_vector;
        rdaddress       : in     vl_logic_vector;
        q               : out    vl_logic_vector;
        csr_dout        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUM_WORDS : constant is 1;
end rw_manager_ram_csr;
