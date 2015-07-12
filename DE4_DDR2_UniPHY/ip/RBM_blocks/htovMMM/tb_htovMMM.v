`timescale 10ns / 10ns

module tb_htovMMM();

parameter DATAWIDTH = 16;
parameter BATCHSIZE = 16;
parameter COMPONENT_WIDTH = BATCHSIZE*DATAWIDTH;

reg clock;
reg reset;
reg enable;
 
//outputs under observation
reg [BATCHSIZE-1:0]data;
wire [DATAWIDTH-1:0]dataout;
reg [COMPONENT_WIDTH-1:0]W_Wc;
wire dataout_available;

initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  data = 16'b1111111111111111;//16'b0000110110000000;
  W_Wc = 'b1;
  enable = 1;
  
  #50 
  reset = 0;   
  #50 
  enable = 0;
  #50 enable = 1;
  #100 reset = 1;
  
  #50 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

always@(posedge clock) begin
	  W_Wc <= W_Wc + 1'b1;
end

htovMMM inst(clock, reset, enable, data, W_Wc, dataout, dataout_available);


endmodule

 

