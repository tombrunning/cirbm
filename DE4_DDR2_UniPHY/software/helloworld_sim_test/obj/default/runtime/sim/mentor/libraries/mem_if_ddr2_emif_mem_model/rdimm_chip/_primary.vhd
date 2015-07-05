library verilog;
use verilog.vl_types.all;
entity rdimm_chip is
    generic(
        MEM_IF_BA_WIDTH : integer := 2;
        MEM_IF_ADDR_WIDTH: integer := 12;
        MEM_IF_CS_WIDTH : integer := 1;
        MEM_DEPTH_IDX   : integer := -1;
        MEM_WIDTH_IDX   : integer := -1
    );
    port(
        a               : in     vl_logic_vector;
        ba              : in     vl_logic_vector;
        ck              : in     vl_logic;
        cs_n            : in     vl_logic_vector;
        ras_n           : in     vl_logic;
        cas_n           : in     vl_logic;
        we_n            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MEM_IF_BA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_IF_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_IF_CS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_DEPTH_IDX : constant is 1;
    attribute mti_svvh_generic_type of MEM_WIDTH_IDX : constant is 1;
end rdimm_chip;
