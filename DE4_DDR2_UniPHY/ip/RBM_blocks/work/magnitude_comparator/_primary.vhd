library verilog;
use verilog.vl_types.all;
entity magnitude_comparator is
    generic(
        DATA_WIDTH      : integer := 16;
        sign            : integer := 15;
        a               : integer := 14;
        b               : integer := 13;
        c               : integer := 12;
        d               : integer := 11;
        e               : integer := 10;
        f               : integer := 9;
        g               : integer := 8;
        h               : integer := 7;
        z1              : integer := 3;
        z2              : integer := 2;
        z3              : integer := 1;
        z4              : integer := 0
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        abs_in          : in     vl_logic_vector;
        sign_bit        : in     vl_logic;
        flag            : out    vl_logic_vector(3 downto 0);
        flag_available  : out    vl_logic;
        sign_bit_out    : out    vl_logic;
        abs_value_out   : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of sign : constant is 1;
    attribute mti_svvh_generic_type of a : constant is 1;
    attribute mti_svvh_generic_type of b : constant is 1;
    attribute mti_svvh_generic_type of c : constant is 1;
    attribute mti_svvh_generic_type of d : constant is 1;
    attribute mti_svvh_generic_type of e : constant is 1;
    attribute mti_svvh_generic_type of f : constant is 1;
    attribute mti_svvh_generic_type of g : constant is 1;
    attribute mti_svvh_generic_type of h : constant is 1;
    attribute mti_svvh_generic_type of z1 : constant is 1;
    attribute mti_svvh_generic_type of z2 : constant is 1;
    attribute mti_svvh_generic_type of z3 : constant is 1;
    attribute mti_svvh_generic_type of z4 : constant is 1;
end magnitude_comparator;
