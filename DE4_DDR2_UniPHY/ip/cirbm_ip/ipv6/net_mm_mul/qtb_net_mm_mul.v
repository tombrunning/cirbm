`timescale 10ns / 10ns


module qtb_net_mm_mul(out, clock,reset,data,weight);
`include "param.v"

input wire clock;
input wire reset;
input wire [BATCH_SIZE-1:0]data;
input wire [BATCH_WIDTH-1:0]weight;
output wire out;

wire [COMPONENT_WIDTH-1:0]partial_sum;

mask_input inst_input_net_mm_ml();

net_mm_mul inst_mm(
.clk(clock),
.reset(reset),
.matrix_element(partial_sum),
.w(weight),
.x(data)
); 

mask_output inst_output_net_mm_mul(out,clock,reset,partial_sum);
endmodule

module mask_output(out,clock,reset,partial_sum);
`include "param.v"
input wire clock;
input wire reset;
input wire [COMPONENT_WIDTH-1:0] partial_sum;
output reg out;

always @(posedge clock) begin
	if(reset == 1) begin
		out <= 0;
	end else begin
		out <= ^ partial_sum;
	end
end

endmodule

 