library verilog;
use verilog.vl_types.all;
entity tb_net_mm_mul is
    generic(
        DATA_DEPTH      : integer := 784;
        DATA_WIDTH      : integer := 16;
        BATCH_SIZE      : integer := 16;
        BATCH_WIDTH     : vl_notype;
        COMPONENT_NUMBER: vl_notype;
        COMPONENT_WIDTH : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BATCH_SIZE : constant is 1;
    attribute mti_svvh_generic_type of BATCH_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of COMPONENT_NUMBER : constant is 3;
    attribute mti_svvh_generic_type of COMPONENT_WIDTH : constant is 3;
end tb_net_mm_mul;
