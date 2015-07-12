library verilog;
use verilog.vl_types.all;
entity tb_VTOH_top is
    generic(
        DATAWIDTH       : integer := 16;
        BATCHSIZE       : integer := 16;
        CHUNKSIZE       : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of BATCHSIZE : constant is 1;
    attribute mti_svvh_generic_type of CHUNKSIZE : constant is 3;
end tb_VTOH_top;
