library verilog;
use verilog.vl_types.all;
entity rw_manager_inst_ROM_no_ifdef_params is
    generic(
        ROM_INIT_FILE_NAME: string  := "inst_ROM.hex"
    );
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(19 downto 0);
        rdaddress       : in     vl_logic_vector(6 downto 0);
        wraddress       : in     vl_logic_vector(6 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(19 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROM_INIT_FILE_NAME : constant is 1;
end rw_manager_inst_ROM_no_ifdef_params;
