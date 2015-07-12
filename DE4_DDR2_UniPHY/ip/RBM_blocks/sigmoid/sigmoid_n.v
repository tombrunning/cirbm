 module sigmoid(clk,reset,sig_values,mat_ele_bias_added);
`include "param.v"

input wire clk;
input wire reset;

input  wire [COMPONENT_WIDTH-1:0]mat_ele_bias_added;
output wire [COMPONENT_WIDTH-1:0]sig_values;
//input  wire [DATA_WIDTH-1:0]mat_ele_bias_added[COMPONENT_NUMBER-1:0];
//output wire [DATA_WIDTH-1:0]sig_values[COMPONENT_NUMBER-1:0];
genvar i;
generate 
	for(i=0;i<COMPONENT_WIDTH;i=i+DATA_WIDTH)begin: sigmoid
		PLAN inst_my_PLAN(clk,reset,reset,sig_values[i+DATA_WIDTH-1:i],mat_ele_bias_added[i+DATA_WIDTH-1:i]);
	end
endgenerate
 endmodule