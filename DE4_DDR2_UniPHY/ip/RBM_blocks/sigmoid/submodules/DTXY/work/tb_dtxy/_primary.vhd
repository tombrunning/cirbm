library verilog;
use verilog.vl_types.all;
entity tb_dtxy is
    generic(
        abs_inWIDTH     : integer := 16
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of abs_inWIDTH : constant is 1;
end tb_dtxy;
