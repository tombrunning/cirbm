library verilog;
use verilog.vl_types.all;
entity rw_manager_inst_ROM_reg is
    generic(
        INST_ROM_DATA_WIDTH: string  := "";
        INST_ROM_ADDRESS_WIDTH: string  := ""
    );
    port(
        rdaddress       : in     vl_logic_vector;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector;
        wraddress       : in     vl_logic_vector;
        wren            : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INST_ROM_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of INST_ROM_ADDRESS_WIDTH : constant is 1;
end rw_manager_inst_ROM_reg;
