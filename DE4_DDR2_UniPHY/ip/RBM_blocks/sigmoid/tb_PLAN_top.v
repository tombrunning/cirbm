`timescale 10ns / 10ns

module tb_PLAN_top();

parameter DATAWIDTH = 16;

reg clock;
reg reset;
reg enable;
reg [DATAWIDTH-1:0] data;
wire [DATAWIDTH-1:0] sigValue;
wire data_available;
//outputs under observation


initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  data = 16'b0000100000000000;
  enable = 1;
  
  #20 
  reset = 0;
  #10 data = 16'b1100000000000000;
  #10 data = 16'b1000100000000000;
  #10 data = 16'b1000000100000000;
  #10 enable = 0;
  #10 enable = 1;
  #10 data = 16'b0100000000000000;
  #10 data = 16'b0010000000000000;
  #10 data = 16'b0001000000000000;
  #10 data = 16'b0000100000000000;
  #10 data = 16'b0000010000000000;
  #10 data = 16'b0000001000000000;
  #10 data = 16'b0000000100000000;
  #10 data = 16'b0000000010000000;
  #10 data = 16'b0000000001000000;
  //#100 data = 16'b0001100000000000;
  //#100 data = 16'b1000100000000000;
  //#100 data = 16'b1001000000000000;
  //#100 data = 16'b1001100000000000;
  //#10 data = 16'b0100000000000000;
  /*#20 data = -4;
  #10 data = -2;
  #10 data = 0;enable = 0;
  #10 data = 2;
  #30 enable = 1;
  #10 data = 4;
  #10 data = 6;
  #40 reset = 1;
  */
  #300 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

PLAN_top inst(clock,reset,enable,data,sigValue,data_available);

endmodule

 

