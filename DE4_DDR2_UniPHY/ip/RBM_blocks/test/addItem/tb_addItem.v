`timescale 10ns / 10ns

module tb_addItem();

parameter DATAWIDTH = 16;

reg clock;
reg reset;
reg enable;
reg [DATAWIDTH-1:0]data;
reg [DATAWIDTH-1:0]W_Wc;

wire [DATAWIDTH-1:0]partial_sum;
wire dataout_available;

initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  data = 1;//16'b0000110110000000;
  W_Wc = 1;
  enable = 1;
  
  #20 reset = 0; 
#10 W_Wc = -1;data = 1;  
  #10 W_Wc = 8;data = 1;
  #10 W_Wc = 7;data = 2;
  #10 W_Wc = -6;data = 3;
  #10 W_Wc = -5;data = 4;
  #10 W_Wc = 4;data = 5;
  #10 W_Wc = 3;data = 6;
  #10 W_Wc = 2;data = 7;
  #10 W_Wc = 1;data = 8;
  
  #10 enable = 0;reset = 1;
  #40 enable = 1;reset = 0;
  
      W_Wc = 8;data = -1;
  #10 W_Wc = 7;data = -2;
  #10 W_Wc = 6;data = -3;
  #10 W_Wc = 5;data = -4;
  #10 W_Wc = 4;data = -5;
  #10 W_Wc = 3;data = -6;
  #10 W_Wc = 2;data = -7;
  #10 W_Wc = 1;data = -8;
  
  
  #50 enable = 0;
  #40 enable = 1;
  #100 reset = 1;
  
  #50 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock;
end

addItem inst_tb(
                .clk(clock),
                .reset(reset),
                .enable(enable),
                .in1(data),
                .in2(W_Wc),
                .out(partial_sum),
                .out_available(dataout_available)
);

endmodule

 
