library verilog;
use verilog.vl_types.all;
entity DTXY is
    generic(
        DATA_WIDTH      : integer := 16
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        abs_in          : in     vl_logic_vector;
        flag            : in     vl_logic_vector(3 downto 0);
        flag_available  : in     vl_logic;
        abs_sign_in     : in     vl_logic;
        abs_sigmoid_available: out    vl_logic;
        abs_sigmoid_out : out    vl_logic_vector;
        dtxy_sign_bit_out: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end DTXY;
