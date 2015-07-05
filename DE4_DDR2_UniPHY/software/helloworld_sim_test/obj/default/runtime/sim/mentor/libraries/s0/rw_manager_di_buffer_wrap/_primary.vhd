library verilog;
use verilog.vl_types.all;
entity rw_manager_di_buffer_wrap is
    generic(
        DATA_WIDTH      : integer := 18;
        READ_DATA_SIZE  : integer := 9;
        WRITE_TO_READ_RATIO_2_EXPONENT: integer := 2;
        WRITE_TO_READ_RATIO: integer := 1;
        ADDR_WIDTH      : integer := 2;
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
    attribute mti_svvh_generic_type of READ_DATA_SIZE : constant is 1;
    attribute mti_svvh_generic_type of WRITE_TO_READ_RATIO_2_EXPONENT : constant is 1;
    attribute mti_svvh_generic_type of WRITE_TO_READ_RATIO : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUM_WORDS : constant is 1;
end rw_manager_di_buffer_wrap;
