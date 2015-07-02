library verilog;
use verilog.vl_types.all;
entity memory is
    generic(
        VIS_SIZE        : integer := 768;
        HID_SIZE        : integer := 100;
        DATA_WIDTH      : integer := 16;
        BLOCK_WIDTH     : vl_notype;
        BLOCK_LENGTH    : vl_notype;
        NUM             : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        read            : in     vl_logic;
        write           : in     vl_logic;
        row_based       : in     vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of VIS_SIZE : constant is 1;
    attribute mti_svvh_generic_type of HID_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BLOCK_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of BLOCK_LENGTH : constant is 3;
    attribute mti_svvh_generic_type of NUM : constant is 1;
end memory;
