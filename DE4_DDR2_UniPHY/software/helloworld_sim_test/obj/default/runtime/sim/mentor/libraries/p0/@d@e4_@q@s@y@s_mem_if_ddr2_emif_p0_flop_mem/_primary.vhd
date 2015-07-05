library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_flop_mem is
    generic(
        WRITE_MEM_DEPTH : string  := "";
        WRITE_ADDR_WIDTH: string  := "";
        WRITE_DATA_WIDTH: string  := "";
        READ_MEM_DEPTH  : string  := "";
        READ_ADDR_WIDTH : string  := "";
        READ_DATA_WIDTH : string  := ""
    );
    port(
        wr_reset_n      : in     vl_logic;
        wr_clk          : in     vl_logic;
        wr_en           : in     vl_logic;
        wr_addr         : in     vl_logic_vector;
        wr_data         : in     vl_logic_vector;
        rd_reset_n      : in     vl_logic;
        rd_clk          : in     vl_logic;
        rd_en           : in     vl_logic;
        rd_addr         : in     vl_logic_vector;
        rd_data         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WRITE_MEM_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of WRITE_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of WRITE_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of READ_MEM_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of READ_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of READ_DATA_WIDTH : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_flop_mem;
