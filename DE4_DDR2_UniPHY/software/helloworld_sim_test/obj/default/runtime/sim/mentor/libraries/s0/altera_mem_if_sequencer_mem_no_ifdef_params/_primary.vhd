library verilog;
use verilog.vl_types.all;
entity altera_mem_if_sequencer_mem_no_ifdef_params is
    generic(
        AVL_ADDR_WIDTH  : integer := 0;
        AVL_DATA_WIDTH  : integer := 0;
        AVL_SYMBOL_WIDTH: integer := 0;
        AVL_NUM_SYMBOLS : integer := 0;
        MEM_SIZE        : integer := 0;
        INIT_FILE       : string  := "";
        RAM_BLOCK_TYPE  : string  := ""
    );
    port(
        clk1            : in     vl_logic;
        reset1          : in     vl_logic;
        clken1          : in     vl_logic;
        s1_address      : in     vl_logic_vector;
        s1_be           : in     vl_logic_vector;
        s1_chipselect   : in     vl_logic;
        s1_write        : in     vl_logic;
        s1_writedata    : in     vl_logic_vector;
        s1_readdata     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AVL_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_SYMBOL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_NUM_SYMBOLS : constant is 1;
    attribute mti_svvh_generic_type of MEM_SIZE : constant is 1;
    attribute mti_svvh_generic_type of INIT_FILE : constant is 1;
    attribute mti_svvh_generic_type of RAM_BLOCK_TYPE : constant is 1;
end altera_mem_if_sequencer_mem_no_ifdef_params;
