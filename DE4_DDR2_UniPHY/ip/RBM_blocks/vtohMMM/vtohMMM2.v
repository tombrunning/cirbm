/*Version 2.0*/
/*Properties: inputs: 1 x 1bit scalar pixel and 1 x 16bits weight*/

module vtohMMM2 (clk,reset,enable,clear_acc,in1,in2,out,out_available);

    parameter DATAWIDTH = 16;
    parameter FRACLENGTH = 11;
    parameter sign = 15;

    input clk;
    input reset;
    input enable;
    input clear_acc;

    input [DATAWIDTH-1:0] in1;
    input [DATAWIDTH-1:0] in2;
    
    output reg [DATAWIDTH-1:0] out; 
    output reg out_available;

    reg [2*DATAWIDTH-1:0] product;
    reg out_available_ppl;

    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            product <= 0;
            out_available_ppl <= 0;
        end
        else if (enable == 1) begin
            product <= (in1 * in2);//>>FRACLENGTH;
            out_available_ppl <= enable;
        end else begin
            out_available_ppl <= enable;
        end
    end

    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            out <= 0;         
            out_available <= 0;
        end
        else begin
            if(enable == 1)begin
                if(clear_acc == 1) begin
                    out <= product [sign:0];
                end else begin
                    out <= out + product [sign:0];
                end
                out_available <= out_available_ppl;
            end else begin
                out_available <= out_available_ppl;
            end
        end
    end
endmodule
