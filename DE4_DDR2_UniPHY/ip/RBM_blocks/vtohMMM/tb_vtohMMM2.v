`timescale 10ns / 10ns

module tb_vtohMMM2();

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
  #10 W_Wc = 16'b0001001000000000; data = 16'b1111010111111111;
  
  #100 enable = 0;reset = 1;
  #40 enable = 1;reset = 0;
  
      W_Wc = 1;data = 1;
  #10 W_Wc = 1;data = 2;
  #10 W_Wc = 1;data = 3;
  #10 W_Wc = 1;data = 4;
  #10 W_Wc = 1;data = 5;
  #10 W_Wc = 1;data = 6;
  #10 W_Wc = 1;data = 7;
  #10 W_Wc = 1;data = 8;
  
  
  #50 enable = 0;
  #40 enable = 1;
  #100 reset = 1;
  
  #50 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock;
end

vtohMMM2 inst_tb(
                .clk(clock),
                .reset(reset),
                .enable(enable),
                .in1(data),
                .in2(W_Wc),
                .out(partial_sum),
                .out_available(dataout_available)
);

endmodule

 
