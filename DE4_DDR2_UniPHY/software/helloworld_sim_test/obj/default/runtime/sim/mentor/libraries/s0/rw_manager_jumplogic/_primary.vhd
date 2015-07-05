library verilog;
use verilog.vl_types.all;
entity rw_manager_jumplogic is
    generic(
        DATA_WIDTH      : integer := 8
    );
    port(
        ck              : in     vl_logic;
        reset_n         : in     vl_logic;
        cntr_value      : in     vl_logic_vector;
        cntr_load       : in     vl_logic;
        reg_select      : in     vl_logic_vector(1 downto 0);
        reg_load_select : in     vl_logic_vector(1 downto 0);
        jump_value      : in     vl_logic_vector;
        jump_load       : in     vl_logic;
        jump_check      : in     vl_logic;
        jump_taken      : out    vl_logic;
        jump_address    : out    vl_logic_vector;
        cntr_3          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end rw_manager_jumplogic;
