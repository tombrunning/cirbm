library verilog;
use verilog.vl_types.all;
entity rw_manager_data_decoder is
    generic(
        DATA_WIDTH      : string  := "";
        AFI_RATIO       : string  := ""
    );
    port(
        ck              : in     vl_logic;
        reset_n         : in     vl_logic;
        code            : in     vl_logic_vector(3 downto 0);
        pattern         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AFI_RATIO : constant is 1;
end rw_manager_data_decoder;
