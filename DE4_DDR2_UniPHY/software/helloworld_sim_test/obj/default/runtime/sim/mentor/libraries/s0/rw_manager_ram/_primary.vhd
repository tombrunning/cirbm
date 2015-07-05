library verilog;
use verilog.vl_types.all;
entity rw_manager_ram is
    generic(
        DATA_WIDTH      : integer := 36;
        ADDR_WIDTH      : integer := 8
    );
    port(
        data            : in     vl_logic_vector;
        rdaddress       : in     vl_logic_vector;
        wraddress       : in     vl_logic_vector;
        wren            : in     vl_logic;
        clock           : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end rw_manager_ram;
