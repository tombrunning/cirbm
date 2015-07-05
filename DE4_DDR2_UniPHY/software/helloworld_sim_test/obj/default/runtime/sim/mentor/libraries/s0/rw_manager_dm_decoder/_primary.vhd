library verilog;
use verilog.vl_types.all;
entity rw_manager_dm_decoder is
    generic(
        AFI_RATIO       : string  := ""
    );
    port(
        ck              : in     vl_logic;
        reset_n         : in     vl_logic;
        code            : in     vl_logic_vector(2 downto 0);
        pattern         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AFI_RATIO : constant is 1;
end rw_manager_dm_decoder;
