library verilog;
use verilog.vl_types.all;
entity DE4_QSYS_nios2_qsys_mult_cell is
    port(
        A_en            : in     vl_logic;
        E_ctrl_mul_shift_src1_signed: in     vl_logic;
        E_ctrl_mul_shift_src2_signed: in     vl_logic;
        E_src1_mul_cell : in     vl_logic_vector(31 downto 0);
        E_src2_mul_cell : in     vl_logic_vector(31 downto 0);
        M_en            : in     vl_logic;
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        A_mul_cell_result: out    vl_logic_vector(63 downto 0)
    );
end DE4_QSYS_nios2_qsys_mult_cell;
