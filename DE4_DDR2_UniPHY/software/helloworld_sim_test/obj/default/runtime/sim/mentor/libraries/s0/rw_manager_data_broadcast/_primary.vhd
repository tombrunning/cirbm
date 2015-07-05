library verilog;
use verilog.vl_types.all;
entity rw_manager_data_broadcast is
    generic(
        NUMBER_OF_DQS_GROUPS: string  := "";
        NUMBER_OF_DQ_PER_DQS: string  := "";
        AFI_RATIO       : string  := "";
        MEM_DM_WIDTH    : string  := ""
    );
    port(
        dq_data_in      : in     vl_logic_vector;
        dm_data_in      : in     vl_logic_vector;
        dq_data_out     : out    vl_logic_vector;
        dm_data_out     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUMBER_OF_DQS_GROUPS : constant is 1;
    attribute mti_svvh_generic_type of NUMBER_OF_DQ_PER_DQS : constant is 1;
    attribute mti_svvh_generic_type of AFI_RATIO : constant is 1;
    attribute mti_svvh_generic_type of MEM_DM_WIDTH : constant is 1;
end rw_manager_data_broadcast;
