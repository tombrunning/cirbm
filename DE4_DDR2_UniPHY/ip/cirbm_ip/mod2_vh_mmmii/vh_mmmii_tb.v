
`include "param.v"

`timescale 10ns / 10ns

module vh_mmmii_tb();

parameter DATA_WIDTH = 16;
parameter CLASSES = 10;

reg clk;
reg reset;

reg [DATA_WIDTH*CLASSES-1:0] wc_cols;
reg [DATA_WIDTH-1:0] _wc_cols [CLASSES-1:0];
reg [CLASSES-1:0] class_rows;
wire [DATA_WIDTH-1:0] ii_res;

initial begin        	
  clk = 1;
  reset = 1;
  _wc_cols[0] = 1;
  _wc_cols[1] = 2;
  _wc_cols[2] = 3;
  _wc_cols[3] = 4;
  _wc_cols[4] = 5;
  _wc_cols[5] = 6;
  _wc_cols[6] = 7;
  _wc_cols[7] = 8;
  _wc_cols[8] = 9;
  _wc_cols[9] = 10;
  
  class_rows = 10'b1111111111;
  
  #100 reset = 0;   
  #10 _wc_cols[0] = 1;
  #10 _wc_cols[0] = 2;
  #10 _wc_cols[0] = 3;
  #10 _wc_cols[0] = 4;
  #10 _wc_cols[0] = 5;
  #10 _wc_cols[0] = 6;
  #10 _wc_cols[0] = 7;
  #10 _wc_cols[0] = 8; 
  #10 _wc_cols[0] = 9;
  #10 _wc_cols[0] = 10;
  #10 _wc_cols[0] = 11;
  #10 _wc_cols[0] = 12;
  #500 reset= 0;
  #20 reset = 1;
  #20 $finish;
end 

// clock  generator
always begin
  #5 clk = ~clk; // Toggle clk every 50 ns
end

genvar i;
generate
    for(i=0;i<CLASSES;i=i+1) begin
        always@(posedge clk) begin
            wc_cols [(i+1)*DATA_WIDTH-1:i*DATA_WIDTH] <= _wc_cols[i];
        end
    end
endgenerate

vh_mmmii inst(clk,reset,class_rows,wc_cols,ii_res);
endmodule