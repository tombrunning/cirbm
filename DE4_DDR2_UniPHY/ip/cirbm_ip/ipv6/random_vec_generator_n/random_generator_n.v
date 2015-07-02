//////////////////////////////////////////////////
//Module: random_generator
//Input:  control signals
//Output: a 16-bit random binary sequence 
//        based on Linear Feedback Shift Register
//Note:   If seed16 is set 4'b0000, the sign bit 
//        keeps 0, otherwise it changes 
//        pseudo-randomly.   (Based on xor logic)
//Problems:1. reset signal should be long enough (4 cycles) to initialise the value of lscr.
//		   2. One seed is only for one bit while same seeds get the same multi-bit outputs. So
//inst_random_generator1 - 16 generate the same random numbers
//////////////////////////////////////////////////
`timescale 10ns / 10ns
module random_generator_n(clock,reset,rnd);
parameter DATA_WIDTH = 15;
parameter load = 1'b1;
	input wire clock;
	input wire reset;
	//input wire load;
	output wire [DATA_WIDTH:0]rnd;
	//reg [3:0] seed1,seed2,seed3,seed4,seed5,seed6,seed7,seed8,seed9,seed10,seed11,seed12,seed13,seed14,seed15,seed16;
	
	
	// initialization
	// apply reset pulse
	parameter   seed1  = 4'b0001;
	parameter	seed2  = 4'b0010;
	parameter	seed3  = 4'b0011;
	parameter	seed4  = 4'b0100;
	parameter	seed5  = 4'b0101;
	parameter	seed6  = 4'b0110;
	parameter	seed7  = 4'b0111; 
	parameter	seed8  = 4'b1000;
	parameter	seed9  = 4'b1001;
	parameter	seed10 = 4'b1010;
	parameter	seed11 = 4'b1011;
	parameter	seed12 = 4'b1100;
	parameter	seed13 = 4'b1101;
	parameter	seed14 = 4'b1110;
	parameter	seed15 = 4'b1111;
	parameter	seed16 = 4'b0000;//seed for the sign bit. set as 0 if sign is kept 0, which stands for positive number	end
	/* always@(posedge clock)
	begin
	if(reset ==1) begin
		load <= 0;
	end
	 else if(enable ==1) begin
		load =0;
	end 
	end */
	lfsr L1(rnd[0], clock, reset,seed1, load);
	lfsr L2(rnd[1], clock, reset,seed2, load);
	lfsr L3(rnd[2], clock, reset,seed3, load);
	lfsr L4(rnd[3], clock, reset,seed4, load);
	lfsr L5(rnd[4], clock, reset,seed5, load);
	lfsr L6(rnd[5], clock, reset,seed6, load);
	lfsr L7(rnd[6], clock, reset,seed7, load);
	lfsr L8(rnd[7], clock, reset,seed8, load);
	lfsr L9(rnd[8], clock, reset,seed9, load);
	lfsr L10(rnd[9], clock, reset,seed10, load);
	lfsr L11(rnd[10], clock, reset,seed11, load);
	lfsr L12(rnd[11], clock, reset,seed16, load);
	lfsr L13(rnd[12], clock, reset,seed16, load);
	lfsr L14(rnd[13], clock, reset,seed16, load);
	lfsr L15(rnd[14], clock, reset,seed16, load);
	lfsr L16(rnd[15], clock, reset,seed16, load);
	
endmodule