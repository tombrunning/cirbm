library verilog;
use verilog.vl_types.all;
entity altera_mem_if_dll_stratixiv is
    generic(
        DLL_DELAY_CTRL_WIDTH: integer := 0;
        DELAY_BUFFER_MODE: string  := "";
        DELAY_CHAIN_LENGTH: integer := 0;
        DLL_INPUT_FREQUENCY_PS_STR: string  := "";
        DLL_OFFSET_CTRL_WIDTH: integer := 0
    );
    port(
        clk             : in     vl_logic;
        dll_pll_locked  : in     vl_logic;
        dll_delayctrl   : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DLL_DELAY_CTRL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DELAY_BUFFER_MODE : constant is 1;
    attribute mti_svvh_generic_type of DELAY_CHAIN_LENGTH : constant is 1;
    attribute mti_svvh_generic_type of DLL_INPUT_FREQUENCY_PS_STR : constant is 1;
    attribute mti_svvh_generic_type of DLL_OFFSET_CTRL_WIDTH : constant is 1;
end altera_mem_if_dll_stratixiv;
