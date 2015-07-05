library verilog;
use verilog.vl_types.all;
entity rw_manager_di_buffer is
    generic(
        DATA_WIDTH      : integer := 32;
        ADDR_WIDTH      : integer := 4;
        NUM_WORDS       : integer := 16
    );
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector;
        rdaddress       : in     vl_logic_vector;
        wraddress       : in     vl_logic_vector;
        wren            : in     vl_logic;
        q               : out    vl_logic_vector;
        clear           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUM_WORDS : constant is 1;
end rw_manager_di_buffer;
