`timescale 10ns / 10ns

module tb_magnitude_comparator();

parameter DATAWIDTH = 16;

reg clock;
reg reset;
reg enable;
reg sign_bit;

reg [DATAWIDTH-1:0]ppl0;
reg [DATAWIDTH-1:0]ppl1;
reg [DATAWIDTH-1:0]ppl2;
reg [DATAWIDTH-1:0]ppl3;
reg [DATAWIDTH-1:0]ppl4;
reg [DATAWIDTH-1:0] abs_in;

wire [3:0]flag;
wire sign_bit_out;
wire flag_available;
wire [DATAWIDTH-1:0] abs_value_out;

always begin
  #5 clock = ~clock; 
end

initial begin 

  ppl0 = 0;       	
  ppl1 = 0;       	
  ppl2 = 0;       	
  ppl3 = 0;       	
  ppl4 = 0;       	
  clock = 1;
  reset = 1;    
  abs_in = 16'b0000000000000000;sign_bit <= 0;
  enable = 1;
  
  #50  reset = 0; 
     
       abs_in = 16'b0111100000000000;sign_bit = 1;
  #10  abs_in = 16'b0010000000000000;sign_bit = 0;
  #10  abs_in = 16'b0000100000000000;sign_bit = 1;
  #10  abs_in = 16'b0000000000000000;sign_bit = 0;
  
  #10  enable = 0;
  #10  enable = 1;

       abs_in = 16'b0110000000000000;sign_bit = 1;
  #10  abs_in = 16'b0001100000000000;sign_bit = 0;
  #10  abs_in = 16'b0001000000000000;sign_bit = 1;
  #10  abs_in = 16'b0000011100000000;sign_bit = 0;

  #10  enable = 0;
  #100  enable = 1;
  
       abs_in = 16'b0111000000000000;sign_bit = 1;
  #10  abs_in = 16'b0001110000000000;sign_bit = 0;
  #10  abs_in = 16'b0000011100000000;sign_bit = 1;
  #10  abs_in = 16'b0000000000011100;sign_bit = 0;

  #100 enable = 0;
  #50  enable = 1;
  #100 $finish;
  
end

magnitude_comparator inst(clock,reset,enable,abs_in,sign_bit,flag,flag_available,sign_bit_out,abs_value_out);
endmodule