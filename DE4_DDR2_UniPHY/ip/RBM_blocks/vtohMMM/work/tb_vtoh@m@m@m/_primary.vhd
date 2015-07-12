library verilog;
use verilog.vl_types.all;
entity tb_vtohMMM is
    generic(
        DATAWIDTH       : integer := 16;
        BATCHSIZE       : integer := 16;
        COMPONENT_WIDTH : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of BATCHSIZE : constant is 1;
    attribute mti_svvh_generic_type of COMPONENT_WIDTH : constant is 3;
end tb_vtohMMM;
