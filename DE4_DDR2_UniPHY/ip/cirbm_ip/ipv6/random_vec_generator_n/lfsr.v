
////////////////////////////////////////////////////////////////////
//Module: random number generator LFSR
//Patrick Schaumont
//Spring 2008
//ECE 4514 Digital Design II
//Lecture 6: A Random Number Generator in Verilog
////////////////////////////////////////////////////////////////////
`timescale 10ns / 10ns
module lfsr(q, clk, rst, seed, load);
	output wire q;
	input [3:0] seed;
	input load;
	input rst;
	input clk;
	wire [3:0] state_out;
	wire [3:0] state_in;

	flipflop F[3:0] (state_out, clk, rst, state_in);
	
	mux_custom M1[3:0] (state_in, load, seed, {state_out[2],state_out[1],state_out[0],nextbit});
	
	xor G1(nextbit, state_out[2], state_out[3]);
	assign q = nextbit;
endmodule

module flipflop(q, clk, rst, d);
	input clk;
	input rst;
	input d;
	output q;
	reg q;
	
	always @(posedge clk or posedge rst)
	begin
	if (rst)
		 q <= 0;
	else
       	 q <= d;
	end
	
	/*propogation specification
	specify
		$setup(d, clk, 2);
		$hold(clk, d, 0);
	endspecify */
endmodule

module mux_custom(q,control,a,b);
	output q;
	reg q;
	input control,a,b;
	
	wire notcontrol;
	
	always@(control or notcontrol or a or b)
		q = (control & a)|(notcontrol&b);
		
	not(notcontrol,control);
endmodule