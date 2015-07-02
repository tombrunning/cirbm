 module rnd_cmp_n(clk,reset,cmp_result,sig_values,rnd_vec);
`include "param.v"

input wire clk;
input wire reset;
input wire [COMPONENT_WIDTH-1:0]sig_values;
input wire [COMPONENT_WIDTH-1:0]rnd_vec;
//input wire [DATA_WIDTH-1:0]sig_values[COMPONENT_NUMBER-1:0];
//input wire [DATA_WIDTH-1:0]rnd_vec[COMPONENT_NUMBER-1:0];

output wire [COMPONENT_NUMBER-1:0]cmp_result;
//always@(posedge clk)begin
//	if(reset ==1)begin
//			cmp_result <= 'b0;
//	end 
//end

genvar i;
generate
	for(i=0;i<COMPONENT_WIDTH;i=i+DATA_WIDTH) begin: sampling
		assign cmp_result[i/DATA_WIDTH] = (sig_values[i+DATA_WIDTH-1:i] >= rnd_vec[i+DATA_WIDTH-1:i]);
	end
endgenerate

endmodule