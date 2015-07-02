//////////////////////////////////////////////////////////////////////////////
//Module  : 	VtoH														//
//Function: 	Combine all sub-modules together							//
//Author: 		Jiang Su													//
//Contact:		j.su13@imperial.ac.uk										//
//Affiliation: 	Electrical & Electronic Engineering, 						//
// 				Imperial College London										//
//Time: 		07/2014														//
//--------------------------------------------------------------------------//
//Inputs  : data_class: concatenation of below two groups of data.			//
//			data:       image data 											//
//                     (16 x 1-bit binary numbers, 784 times input totally) //
//			class:      known classes of corresponding data                 //
//				       (16 x 1-bit binary numbers, 10 times input totally)  //
//--------------------------------------------------------------------------//
//Outputs : W_Wc:       concatenation of below two groups of data.			//
//          W:          data weights										//
//                     (16 x 16-bit real numbers, 784 times output totally) //
//			Wc:         state weights										//
//                     (16 x 16-bit real numbers, 10 times output totally)  //
//			bias:       bias (256 x 16-bit real numbers)					//
//--------------------------------------------------------------------------//
//Note:		Matrix of a batch of data should be 784x16, but inputs of VtoH  //
//			are only inputs in every cycle (16x1b)). Matrices of data, 		//
//          class, W, Wc and bias should be split or assembled in a micro   //
//			module like a FSM.        										//
//////////////////////////////////////////////////////////////////////////////

module VtoH(nhstate,W_Wc,bias,clk,reset,data_classes);
`include "param.v"
//inputs
input wire clk;
input wire reset;
input wire [BATCH_SIZE-1:0]data_classes;//16*1b, From memory
//outputs
output reg [COMPONENT_NUMBER-1:0]nhstate;
output reg [BATCH_WIDTH-1:0]W_Wc;
output reg [COMPONENT_WIDTH-1:0]bias;

reg [COMPONENT_WIDTH-1:0]bias_r;
wire [COMPONENT_NUMBER-1:0]nhstate_w;

always@(posedge clk)begin
	if(reset == 1) begin
		bias_r <= 'b0;
		W_Wc   <= 'b0;
	end else begin
		nhstate <= nhstate_w;
	end
end

//assign bias = bias_r;

//expression of outputs in multiple dimension arrays
//reg [COMPONENT_NUMBER-1:0]nhstate_r;//256x1 = 32 k
//reg [DATA_WIDTH-1:0]W_Wc_r[BATCH_SIZE-1:0];//16x16 = 32 k
//reg [DATA_WIDTH-1:0]bias_r[COMPONENT_NUMBER-1:0];//256x16 = 512 k (O(n^2), n is batch size)
//split integrate arrays

/* assign nhstate = nhstate_r;
assign W_Wc = W_Wc_r;
assign bias = bias_r; */
//Internal parameters among sub-modules in one dimensional arrays as I/O wire signals
wire [COMPONENT_WIDTH-1:0]partial_sum;
wire [COMPONENT_WIDTH-1:0]mat_ele_bias_added;
wire [COMPONENT_WIDTH-1:0]sig_values;
wire [COMPONENT_WIDTH-1:0]rnd_vec;
//Internal parameters among sub-modules in  logical two dimensional arrays
//wire [DATA_WIDTH-1:0]partial_sum[COMPONENT_NUMBER-1:0];//256x16
//wire [DATA_WIDTH-1:0]mat_ele_bias_added[COMPONENT_NUMBER-1:0];
//wire [DATA_WIDTH-1:0]sig_values[COMPONENT_NUMBER-1:0];
//wire [DATA_WIDTH-1:0]rnd_vec[COMPONENT_NUMBER-1:0];
//Interconnections among sub-modules

//VtoH phase:
net_mm_mul inst_data_weight_mm(.clk(clk),.reset(reset),.matrix_element(partial_sum),.w(W_Wc),.x(data_classes)); 
hid_bias_n inst_hid_bias_n(clk,reset,mat_ele_bias_added,partial_sum,bias_r);
sigmoid_n  inst_sigmoid_n(clk,reset,sig_values,mat_ele_bias_added);
random_vec_generator_n inst_random_vec_generator_n(clk,reset,rnd_vec);
rnd_cmp_n  inst_rnd_cmp_n(clk,reset,nhstate_w,sig_values,rnd_vec);
//HtoV phase
/* net_mm_mul inst_nhstate_Wt_mm(.clk(clk),.reset(reset),.matrix_element(partial_sum),.w(W),.x(nhstate)); 
hid_bias_n inst_hid_bias_n(clk,reset,mat_ele_bias_added,partial_sum,bias); */


endmodule