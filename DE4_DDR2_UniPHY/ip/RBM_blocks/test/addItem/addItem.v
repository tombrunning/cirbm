module addItem(clk,reset,enable,in1,in2,out,out_available);
parameter DATAWIDTH = 16;
 
input clk;
input reset;
input enable;

input [DATAWIDTH-1:0] in1;
input [DATAWIDTH-1:0] in2;

output reg [DATAWIDTH-1:0] out;
output reg out_available; 

always @(posedge clk or posedge reset)begin
    if(reset == 1)begin
        out <= 0;
        out_available <= 0;
    end else begin
        if(enable == 1)begin
            out <= in1 + in2;
        end
        out_available <= enable;
    end
end
 

endmodule