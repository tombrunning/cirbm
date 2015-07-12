/*compare two absolute values*/
/* input 2 x 16b comparators*/
/* output 1 x 1b result and 1 x 1b output availability*/

module comparator(clk,reset,enable, sig_value,randn,cmp_result,out_available);

    parameter DATAWIDTH = 16;

    input clk;
    input reset;
    input enable;
    input [DATAWIDTH-1:0]sig_value;
    input [DATAWIDTH-1:0]randn;
    output wire cmp_result;
    output wire out_available;

    reg result;
    reg result_available;

    always @(posedge clk or posedge reset) begin
        if(reset == 1)begin
            result <= 0;
            result_available <= 0;
        end else begin
            if(enable == 1)begin
                result <= (sig_value >= randn);
            end
            result_available <= enable;
        end
    end

    assign cmp_result = result;
    assign out_available = result_available;

endmodule