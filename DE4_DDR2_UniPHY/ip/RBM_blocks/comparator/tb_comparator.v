`timescale 10ns / 10ns

module tb_comparator();

parameter DATAWIDTH = 16;

reg clock;
reg reset;
reg enable;
 
//outputs under observation
reg [DATAWIDTH-1:0]sig_values;
reg [DATAWIDTH-1:0]randn;

wire cmp_result;
wire res_available;

initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  enable = 1;
  randn =0;
  sig_values = 0;
  
  #10 reset =0;
  #10 randn =1; sig_values = 6;

  #10 randn =4; sig_values = 3;
  #10 randn =3; sig_values = 4;
  #10 randn =5; sig_values = 2;
  #10 randn =2; sig_values = 5;
  #10 randn =6; sig_values = 1;
  

  
  #50 $finish;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

comparator inst( clock, reset, enable, sig_values, randn, cmp_result, res_available);


endmodule
