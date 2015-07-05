library verilog;
use verilog.vl_types.all;
entity rw_manager_write_decoder is
    generic(
        DATA_WIDTH      : string  := "";
        AFI_RATIO       : string  := ""
    );
    port(
        ck              : in     vl_logic;
        reset_n         : in     vl_logic;
        do_lfsr         : in     vl_logic;
        dm_lfsr         : in     vl_logic;
        do_lfsr_step    : in     vl_logic;
        dm_lfsr_step    : in     vl_logic;
        do_code         : in     vl_logic_vector(3 downto 0);
        dm_code         : in     vl_logic_vector(2 downto 0);
        do_data         : out    vl_logic_vector;
        dm_data         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_RATIO : constant is 1;
end rw_manager_write_decoder;
