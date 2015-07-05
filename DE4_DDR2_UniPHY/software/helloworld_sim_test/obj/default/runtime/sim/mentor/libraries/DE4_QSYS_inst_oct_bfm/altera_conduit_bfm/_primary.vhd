library verilog;
use verilog.vl_types.all;
entity altera_conduit_bfm is
    port(
        sig_rdn         : out    vl_logic;
        sig_rup         : out    vl_logic
    );
end altera_conduit_bfm;
