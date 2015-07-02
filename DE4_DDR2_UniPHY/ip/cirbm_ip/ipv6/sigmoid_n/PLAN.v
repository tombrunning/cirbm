/*
input(16-bit fix point):   sign a  b  c  d . e  f g h i j k l m n o
bits:   					15  14 13 12 11. 10 9 8 7 6 5 4 3 2 1 0

sign: 				0 f| positive number, 1 f| negative number;
integral part: 		a-d
fractional part: 	e-o
*/
module PLAN(clock,reset,enable,sigmoid_value,in);
parameter DATA_WIDTH = 15;
input  wire clock;
input  wire reset;
input  wire enable;

input  wire [DATA_WIDTH:0]in;
output wire [DATA_WIDTH:0]sigmoid_value;

wire [DATA_WIDTH:0] abs_value;
wire [DATA_WIDTH:0] abs_sigmoid_value;
wire [3:0] flag;
sign_judger inst_sign_judger(clock,reset,enable,abs_value,in);
magnitude_comparator inst_magnitude_comparator(clock,reset,enable,flag,abs_value);
DTXY inst_DTXY(clock,reset,enable,abs_sigmoid_value,abs_value,flag);
arbitrator inst_arbitrator(clock,reset,enable,sigmoid_value,abs_sigmoid_value,in);
endmodule

module sign_judger(clock,reset,enable,abs_out,in);
	parameter DATA_WIDTH = 15;
	parameter sign = 15;
	input  wire clock;
	input  wire reset;
	input  wire enable;
	input  wire [DATA_WIDTH:0]in;
	output reg [DATA_WIDTH:0] abs_out;
	always @(posedge clock)begin
	if (reset == 1) begin 
	abs_out = 0;
	end else if (enable == 1 && in[sign] == 0) begin
		abs_out = in;
	end else if (enable ==1 && in[sign] ==1)begin
		abs_out = in+16'b1000_0000_0000_0000;
	end
	end
endmodule

module magnitude_comparator(clock,reset,enable,flag,abs_in);
	parameter DATA_WIDTH = 15;
	parameter sign = 15;
	parameter a = 14;
	parameter b = 13;
	parameter c = 12;
	parameter d = 11;
	parameter e = 10;
	parameter f = 9;
	parameter g = 8;
	parameter h = 7;//i-o are ignored

	parameter z1 = 3;//Bits of flag
	parameter z2 = 2;
	parameter z3 = 1;
	parameter z4 = 0;
	
	input  wire clock;
	input  wire reset;
	input  wire enable;
	
	input wire [DATA_WIDTH:0]abs_in;
	output reg [3:0] flag;

	reg wire_z4_1;//temporary registers one bit each
	reg wire_z4_2;
	
	reg wire_z2_1;
	reg wire_z2_2;
	reg wire_z2_3;
	reg wire_z2_4;
	reg wire_z2_5;
	
	always @(posedge clock) begin
		if(reset == 1) begin
			flag <=0;

			wire_z4_1 <=0 ;//temporary registers one bit each
			wire_z4_2 <=0 ;
	
			wire_z2_1 <=0 ;
			wire_z2_2 <=0 ;
			wire_z2_3 <=0 ;
			wire_z2_4 <=0 ;
			wire_z2_5 <=0 ;
		end else if (enable == 1) begin
				wire_z2_3 <= abs_in[f] & abs_in[g];
				//n| z2_n|3
				wire_z2_4 = !(abs_in[e] | wire_z2_3);
				wire_z2_5 = wire_z2_1 & wire_z2_4;
				flag[z2]  = wire_z2_5 | wire_z2_2;
				
				wire_z4_1 <= abs_in[c] | abs_in[d];
				wire_z4_2 = wire_z4_1 & abs_in[b]; 
				flag[z4]  = wire_z4_2 | abs_in[a];
				 
				//n| z1_n|
				flag[z1]  <= !(abs_in[a] | abs_in[b] | abs_in[c] | abs_in[d]);		//Z1  one step per second????
				//n| z2_n|1
				wire_z2_1 <= !(abs_in[a] | abs_in[b] | ~abs_in[c] | abs_in[d]);	//Z2
				//n| z2_n|2
				wire_z2_2 <= !(abs_in[a] | abs_in[b] | abs_in[c] | ~abs_in[d]);
				//n| z3_n|
				flag[z3] = !(flag[z4] | flag[z2] | flag[z1]);	//Z3
			end
		
		end
endmodule

module DTXY(clock,reset,enable,abs_sigmoid_out,abs_in,flag);
	parameter DATA_WIDTH = 15;
	input  wire clock;
	input  wire reset;
	input  wire enable;
	input wire [3:0] flag ;
	input wire [DATA_WIDTH:0]abs_in;
	output reg [DATA_WIDTH:0]abs_sigmoid_out;
	reg  [DATA_WIDTH:0]abs_in_reg;
always @(posedge clock) begin
	if(reset ==1) begin
		abs_sigmoid_out <= 0;
		abs_in_reg      <= 0;
	end else if (enable == 1) begin
		abs_in_reg = abs_in;
		case(flag)
			4'b0001 : begin abs_sigmoid_out = 16'b1; end
			4'b0010 : begin abs_in_reg = (abs_in_reg>>5); abs_sigmoid_out = abs_in_reg + 16'b 0000011011000000; end
			4'b0100 : begin abs_in_reg = (abs_in_reg>>3); abs_sigmoid_out = abs_in_reg + 16'b 0000010100000000; end
			4'b1000 : begin abs_in_reg = (abs_in_reg>>2); abs_sigmoid_out = abs_in_reg + 16'b 0000010000000000; end
		endcase
	end
end
endmodule

module arbitrator(clock,reset,enable,out,abs_in,in);
	parameter DATA_WIDTH = 15;
	parameter sign = 15;
	input  wire clock;
	input  wire reset;
	input  wire enable;
	input  wire [DATA_WIDTH:0]in;
	input  wire [DATA_WIDTH:0]abs_in;
	output reg [DATA_WIDTH:0]out;
	always@(posedge clock) begin
	if(reset == 1) begin 
		out <= 0;
	end else if(enable == 1 && in[sign]==0) begin
			out = abs_in;
		end else if(enable == 1 && in[sign]==1) begin
			out = 16'b1 - abs_in;
		end
	end

endmodule 


//Abandoned codes f| the direct transf|mation process which is not necessary here
/*reg wire_dircttrans_pos1;// All comments are f| Direct Transf|mation.
	reg wire_dircttrans_pos2;
	reg wire_dircttrans_pos3;
	reg wire_dircttrans_pos4;
	reg wire_dircttrans_pos5;
	reg wire_dircttrans_pos6;
	reg wire_dircttrans_pos7;
	reg wire_dircttrans_pos8;
	reg wire_dircttrans_pos9;
	reg wire_dircttrans_pos10;
	reg wire_dircttrans_pos11;
	reg wire_dircttrans_pos12;
	reg wire_dircttrans_pos13;
	reg wire_dircttrans_pos14;
	reg wire_dircttrans_pos15;*/
	
	//assign abs_in = in;
	//assign abs_in[sign]=0;
/* 	
always @(posedge clock) begin
	if(reset == 1'b1) begin
		abs_in<=0;
		abs_out<=0;
		out  <= 0;
		flag <= 0;//4 bits flag
	
		wire_z4_1 <= 0;//temp|ary registers one bit each
		wire_z4_2 <= 0;
		
		wire_z2_1 <= 0;
		wire_z2_2 <= 0;
		wire_z2_3 <= 0;
		wire_z2_4 <= 0;
		wire_z2_5 <= 0;
		
		wire_dircttrans_pos1 <= 0;
		wire_dircttrans_pos2 <= 0;
		wire_dircttrans_pos3 <= 0;
		wire_dircttrans_pos4 <= 0;
		wire_dircttrans_pos5 <= 0;
		wire_dircttrans_pos6 <= 0;
		wire_dircttrans_pos7 <= 0;
		wire_dircttrans_pos8 <= 0;
		wire_dircttrans_pos9 <= 0;
		wire_dircttrans_pos10 <= 0;
		wire_dircttrans_pos11 <= 0;
		wire_dircttrans_pos12 <= 0;
		wire_dircttrans_pos13 <= 0;
		wire_dircttrans_pos14 <= 0;
		wire_dircttrans_pos15 <= 0;
		end
	
	
	
	out[sign] <= 0;										//bit sign (In this version of codes, we only discuss about positive numbers)
	out[a] <= flag[z4];									//bit A'
	out[b] <= ~flag[z4];								//bit B'
	out[c] <= flag[z2]|flag[z3];						//bit C'
	
	wire_dircttrans_pos1 <= flag[z2]&in[c];				//bit D'
	wire_dircttrans_pos2 <= flag[z1]&in[e];
	| bit_d_|(out[d],flag[z3],wire_dircttrans_pos1,wire_dircttrans_pos2);
	
	wire_dircttrans_pos3 <= in[c]^-in[d];				//bit E'
	wire_dircttrans_pos4 <= flag[z3]&wire_dircttrans_pos3;
	wire_dircttrans_pos5								//??????????
	wire_dircttrans_pos6 <= flag[z1]&in[f];
	| bit_e_|(out[e],wire_dircttrans_pos4,wire_dircttrans_pos5,wire_dircttrans_pos6);
	
	wire_dircttrans_pos7 <= in[g]&flag[z1];				//bit F'
	wire_dircttrans_pos8 <= in[f]&flag[z2];
	wire_dircttrans_pos9 <= in[d]&flag[z3];
	| bit_f_|(out[f],wire_dircttrans_pos7,wire_dircttrans_pos8,wire_dircttrans_pos9);

	wire_dircttrans_pos10<= in[h]&flag[z1];				//bit G'
	wire_dircttrans_pos11<= in[g]&flag[z2];
	wire_dircttrans_pos12<= in[e]&flag[z3];
	| bit_g_|(out[g],wire_dircttrans_pos10,wire_dircttrans_pos11,wire_dircttrans_pos12);
	
	wire_dircttrans_pos13<= 1&flag[z1];				//bit H' ????????
	wire_dircttrans_pos14<= in[h]&flag[z2];
	wire_dircttrans_pos15<= in[f]&flag[z3];
	| bit_h_|(out[h],wire_dircttrans_pos13,wire_dircttrans_pos14,wire_dircttrans_pos15);

end  */

