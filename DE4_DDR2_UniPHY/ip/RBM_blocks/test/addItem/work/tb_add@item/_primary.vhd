library verilog;
use verilog.vl_types.all;
entity tb_addItem is
    generic(
        DATAWIDTH       : integer := 16
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
end tb_addItem;
