library verilog;
use verilog.vl_types.all;
entity sequencer_scc_reg_file is
    generic(
        WIDTH           : string  := "";
        DEPTH           : string  := ""
    );
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector;
        rdaddress       : in     vl_logic_vector;
        wraddress       : in     vl_logic_vector;
        wren            : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end sequencer_scc_reg_file;
