`timescale 10ns / 10ns

module tb_vtohMMM();

parameter DATAWIDTH = 16;
parameter BATCHSIZE = 16;
parameter COMPONENT_WIDTH = BATCHSIZE*DATAWIDTH;

reg clock;
reg reset;
reg enable;
 
//outputs under observation
reg [BATCHSIZE-1:0]data;
wire [COMPONENT_WIDTH-1:0]partial_sum;
reg [COMPONENT_WIDTH-1:0]W_Wc;
wire dataout_available;

initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  data = 16'b1111111111111111;//16'b0000110110000000;
  W_Wc = 1;
  enable = 1;
  
  #20 reset = 0;   
  #10 W_Wc = 1;
  #10 W_Wc = 2;
  #10 W_Wc = 3;
  #30 W_Wc = 4;
  #30 W_Wc = 5;
  

  
  
  #50 enable = 0;
  #40 enable = 1;
  #100 reset = 1;
  
  #50 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock;
end

vtohMMM inst_tb(
                .clk(clock),
                .reset(reset),
                .enable(enable),
                .data(data),
                .w(W_Wc),
                .dataout(partial_sum),
                .dataout_available(dataout_available)
);

endmodule

 
