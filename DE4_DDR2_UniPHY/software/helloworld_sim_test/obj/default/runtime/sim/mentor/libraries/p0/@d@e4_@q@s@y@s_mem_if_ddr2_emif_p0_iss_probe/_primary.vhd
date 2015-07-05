library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_iss_probe is
    generic(
        WIDTH           : integer := 1;
        ID_NAME         : string  := "PROB"
    );
    port(
        probe_input     : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ID_NAME : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_iss_probe;
