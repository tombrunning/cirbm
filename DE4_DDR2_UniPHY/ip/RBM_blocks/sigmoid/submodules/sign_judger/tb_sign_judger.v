`timescale 10ns / 10ns

module tb_sign_judger();

parameter inWIDTH = 16;

reg clock;
reg reset;
reg in_available;
reg [inWIDTH-1:0] in;

wire [inWIDTH-1:0] abs_out;
wire sign_bit;
wire out_available;
//outputs under observation


initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  in = 16'b0000000000000000;
  in_available = 1;
  
  #50 
  reset = 0;
  in = 16'b0000100000000000;
  #100 
      in = 16'b0000100000000000;
  #10 in = 16'b1001000000000000;
  #10 in = 16'b0010000000000000;
      in_available = 0;
  #20 in_available = 1;
  #10 in = 16'b1100000000000000;
  #10 in = 16'b0000000000000000;
  //#100 in = 16'b0001100000000000;
  //#100 in = 16'b1000100000000000;
  //#100 in = 16'b1001000000000000;
  //#100 in = 16'b1001100000000000;
  //#10 in = 16'b0100000000000000;
  /*#20 in = -4;
  #10 in = -2;
  #10 in = 0;enable = 0;
  #10 in = 2;
  #30 enable = 1;
  #10 in = 4;
  #10 in = 6;
  #40 reset = 1;
  */
  #200 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

sign_judger inst(clock,reset,in_available,in,abs_out,sign_bit,out_available);

endmodule

 

