library verilog;
use verilog.vl_types.all;
entity tb_sign_judger is
    generic(
        inWIDTH         : integer := 16
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inWIDTH : constant is 1;
end tb_sign_judger;
