library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_mem_if_ddr2_emif_p0_phy_csr is
    generic(
        CSR_ADDR_WIDTH  : integer := 8;
        CSR_DATA_WIDTH  : integer := 32;
        CSR_BE_WIDTH    : integer := 4;
        MEM_READ_DQS_WIDTH: integer := 64;
        MR1_RTT         : integer := 0
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        csr_addr        : in     vl_logic_vector;
        csr_be          : in     vl_logic_vector;
        csr_write_req   : in     vl_logic;
        csr_wdata       : in     vl_logic_vector;
        csr_read_req    : in     vl_logic;
        csr_rdata       : out    vl_logic_vector;
        csr_rdata_valid : out    vl_logic;
        csr_waitrequest : out    vl_logic;
        pll_locked      : in     vl_logic;
        afi_cal_success : in     vl_logic;
        afi_cal_fail    : in     vl_logic;
        seq_fom_in      : in     vl_logic_vector(7 downto 0);
        seq_fom_out     : in     vl_logic_vector(7 downto 0);
        cal_init_failing_stage: in     vl_logic_vector(7 downto 0);
        cal_init_failing_substage: in     vl_logic_vector(7 downto 0);
        cal_init_failing_group: in     vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CSR_ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CSR_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CSR_BE_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEM_READ_DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MR1_RTT : constant is 1;
end DE4_QSYS_mem_if_ddr2_emif_p0_phy_csr;
