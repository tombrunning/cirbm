library verilog;
use verilog.vl_types.all;
entity sequencer_reg_file is
    generic(
        AVL_DATA_WIDTH  : integer := 32;
        AVL_ADDR_WIDTH  : integer := 4;
        AVL_NUM_SYMBOLS : integer := 4;
        AVL_SYMBOL_WIDTH: integer := 8;
        REGISTER_RDATA  : integer := 0;
        NUM_REGFILE_WORDS: integer := 16;
        DEBUG_REG_FILE_WORD: integer := 2
    );
    port(
        avl_clk         : in     vl_logic;
        avl_reset_n     : in     vl_logic;
        avl_address     : in     vl_logic_vector;
        avl_write       : in     vl_logic;
        avl_writedata   : in     vl_logic_vector;
        avl_read        : in     vl_logic;
        avl_readdata    : out    vl_logic_vector;
        avl_waitrequest : out    vl_logic;
        avl_be          : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AVL_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AVL_NUM_SYMBOLS : constant is 1;
    attribute mti_svvh_generic_type of AVL_SYMBOL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_RDATA : constant is 1;
    attribute mti_svvh_generic_type of NUM_REGFILE_WORDS : constant is 1;
    attribute mti_svvh_generic_type of DEBUG_REG_FILE_WORD : constant is 1;
end sequencer_reg_file;
