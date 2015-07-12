`timescale 10ns / 10ns

module tb_dtxy();

parameter DATA_WIDTH = 16;

reg clock;
reg reset;
reg flag_available;
reg enable;
reg [DATA_WIDTH-1:0] abs_in;
reg abs_sign_in;
reg [3:0] flag;

wire [DATA_WIDTH-1:0] abs_sigmoid_out;
wire dtxy_sign_bit_out;
wire abs_sigmoid_available;
//outputs under observation


initial begin        	
  clock = 1;       // abs_initial value of clock
  reset = 1;    
  enable = 1;
  abs_in = 16'b0000000000000000; 
  flag = 0;
  abs_sign_in = 0;
  flag_available = 1;
  
  #50 
  reset = 0;
  abs_in = 16'b0000100000000000;
  #100 
      abs_in = 16'b0111100000000000;abs_sign_in = 0;flag = 4'b0001;
  #10 abs_in = 16'b0011000000000000;abs_sign_in = 1;flag = 4'b0010;
  #10 abs_in = 16'b0001000001110000;abs_sign_in = 0;flag = 4'b0100;
  #10 abs_in = 16'b0000000001110000;abs_sign_in = 1;flag = 4'b1000;
  #10 flag_available = 0;
  #20 flag_available = 1;
  #10 abs_in = 16'b0111100000000000;abs_sign_in = 1;flag = 4'b0001;
  #10 abs_in = 16'b0000000000000000;abs_sign_in = 0;flag = 4'b0100;
  //#100 abs_in = 16'b0001100000000000;
  //#100 abs_in = 16'b1000100000000000;
  //#100 abs_in = 16'b1001000000000000;
  //#100 abs_in = 16'b1001100000000000;
  //#10 abs_in = 16'b0100000000000000;
  /*#20 abs_in = -4;
  #10 abs_in = -2;
  #10 abs_in = 0;enable = 0;
  #10 abs_in = 2;
  #30 enable = 1;
  #10 abs_in = 4;
  #10 abs_in = 6;
  #40 reset = 1;
  */
  #200 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

DTXY inst(clock,reset,enable,abs_in,flag,flag_available,abs_sign_in,abs_sigmoid_available,abs_sigmoid_out,dtxy_sign_bit_out);

endmodule

 

