library verilog;
use verilog.vl_types.all;
entity altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst_register_bank_b_module is
    generic(
        lpm_file        : string  := "UNUSED";
        intended_device_family: string  := "Stratix V"
    );
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        rdaddress       : in     vl_logic_vector(4 downto 0);
        wraddress       : in     vl_logic_vector(4 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_file : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
end altera_mem_if_sequencer_cpu_no_ifdef_params_sim_cpu_inst_register_bank_b_module;
