module hid_bias_n(clk,reset,mat_ele_bias_added,matrix_element,bias);
`include "param.v"
input wire clk;
input wire reset; 
input wire [COMPONENT_WIDTH-1:0]bias;
input wire [COMPONENT_WIDTH-1:0]matrix_element;
output reg [COMPONENT_WIDTH-1:0]mat_ele_bias_added;

//reg [COMPONENT_WIDTH-1:0]bias_r;
//assign bias = bias_r;

always@(posedge clk) begin
	if(reset ==1)begin
		mat_ele_bias_added <= 'b0;
		//bias_r <= 'b0;
	end else begin
		mat_ele_bias_added <= matrix_element + bias;
	end
end
endmodule

