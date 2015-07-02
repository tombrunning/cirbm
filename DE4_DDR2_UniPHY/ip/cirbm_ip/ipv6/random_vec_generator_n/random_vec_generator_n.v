 module random_vec_generator_n(clk,reset,rnd_vec);
 `include "param.v"

	input wire clk;
	input wire reset;

	output wire [COMPONENT_WIDTH-1:0]rnd_vec;
	//output wire [DATA_WIDTH-1:0]rnd_vec[COMPONENT_NUMBER-1:0];
	
	genvar i;
	generate 
		for(i=0;i<COMPONENT_WIDTH;i=i+DATA_WIDTH) begin:rnd_generating
			random_generator_n inst_rnd(clk,reset,rnd_vec[i+DATA_WIDTH-1:i]);
		end
	endgenerate 
endmodule