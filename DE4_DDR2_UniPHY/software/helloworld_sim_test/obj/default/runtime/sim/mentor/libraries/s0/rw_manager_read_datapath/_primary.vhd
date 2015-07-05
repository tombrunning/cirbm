library verilog;
use verilog.vl_types.all;
entity rw_manager_read_datapath is
    generic(
        DATA_WIDTH      : string  := "";
        AFI_RATIO       : string  := ""
    );
    port(
        ck              : in     vl_logic;
        reset_n         : in     vl_logic;
        check_do        : in     vl_logic_vector(3 downto 0);
        check_dm        : in     vl_logic_vector(2 downto 0);
        check_do_lfsr   : in     vl_logic;
        check_dm_lfsr   : in     vl_logic;
        check_pattern_push: in     vl_logic;
        clear_error     : in     vl_logic;
        read_data       : in     vl_logic_vector;
        read_data_valid : in     vl_logic;
        error_word      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_RATIO : constant is 1;
end rw_manager_read_datapath;
