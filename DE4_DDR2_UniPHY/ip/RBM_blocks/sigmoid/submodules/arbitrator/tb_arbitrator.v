`timescale 10ns / 10ns

module tb_arbitrator();

parameter DATA_WIDTH = 16;

reg clock;
reg reset;
reg enable;
reg sign_bit_in;
reg input_available;

reg [DATA_WIDTH-1:0] abs_in;


wire [DATA_WIDTH-1:0] out;
wire output_available;

//outputs under observation


initial begin        	
  clock = 1;       // abs_initial value of clock
  reset = 1;    
  enable = 1;
  abs_in = 16'b0000000000000000; 

  sign_bit_in = 0;
  input_available = 1;
  
  #50 
  reset = 0;
  abs_in = 16'b0000100000000000;
  #100 
      abs_in = 16'b0111100000000000;sign_bit_in = 0;
  #10 abs_in = 16'b0011000000000000;sign_bit_in = 1;
  #10 abs_in = 16'b0001000001110000;sign_bit_in = 0;
  #10 abs_in = 16'b0000000001110000;sign_bit_in = 1;
  #10 input_available = 0;
  #20 input_available = 1;
  #10 abs_in = 16'b0111100000000000;sign_bit_in = 1;
  #10 abs_in = 16'b0000000000000000;sign_bit_in = 0;
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

arbitrator INST(clock,reset,enable,abs_in,sign_bit_in,input_available,out,output_available);
endmodule

 

