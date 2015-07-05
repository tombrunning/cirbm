library verilog;
use verilog.vl_types.all;
entity rw_manager_datamux is
    generic(
        DATA_WIDTH      : integer := 8;
        SELECT_WIDTH    : integer := 1;
        NUMBER_OF_CHANNELS: integer := 2
    );
    port(
        datain          : in     vl_logic_vector;
        sel             : in     vl_logic_vector;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SELECT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NUMBER_OF_CHANNELS : constant is 1;
end rw_manager_datamux;
