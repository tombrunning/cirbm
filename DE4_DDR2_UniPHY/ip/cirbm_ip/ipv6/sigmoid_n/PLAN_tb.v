`timescale 10ns / 10ns

module tb_PLAN();

parameter DATAWIDTH = 16;

reg clock;
reg reset;
reg enable;
reg [DATAWIDTH-10] data;
wire [DATAWIDTH-10] sigValue;
//outputs under observation


initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  data = -6;//16'b0000110110000000;
  enable = 1;
  
  #50 
  reset = 0;
  #20 data = -4;
  #10 data = -2;
  #10 data = 0;enable = 0;
  #10 data = 2;
  #30 enable = 1;
  #10 data = 4;
  #10 data = 6;
  #40 reset = 1;
  
  #40 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

PLAN inst(clock,reset,enable,sigValue,data);


endmodule

 

