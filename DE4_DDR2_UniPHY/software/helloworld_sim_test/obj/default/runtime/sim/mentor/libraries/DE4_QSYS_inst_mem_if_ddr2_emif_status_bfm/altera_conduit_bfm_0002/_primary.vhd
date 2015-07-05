library verilog;
use verilog.vl_types.all;
entity altera_conduit_bfm_0002 is
    port(
        sig_local_init_done: in     vl_logic;
        sig_local_cal_success: in     vl_logic;
        sig_local_cal_fail: in     vl_logic
    );
end altera_conduit_bfm_0002;
