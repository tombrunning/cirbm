library verilog;
use verilog.vl_types.all;
entity rw_manager_bitcheck is
    generic(
        DATA_WIDTH      : string  := "";
        AFI_RATIO       : string  := ""
    );
    port(
        ck              : in     vl_logic;
        reset_n         : in     vl_logic;
        clear           : in     vl_logic;
        enable          : in     vl_logic;
        read_data       : in     vl_logic_vector;
        reference_data  : in     vl_logic_vector;
        mask            : in     vl_logic_vector;
        error_word      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_RATIO : constant is 1;
end rw_manager_bitcheck;
