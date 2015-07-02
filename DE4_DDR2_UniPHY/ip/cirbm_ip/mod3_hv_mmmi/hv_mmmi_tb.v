`include "param.v"

`timescale 10ns / 10ns

module hv_mmmi_tb();

parameter DATA_WIDTH = 16;
parameter HID_SIZE = 128;

reg clk;
reg reset;
reg [HID_SIZE*DATA_WIDTH-1:0] wt_cols;
reg [DATA_WIDTH-1:0] _wt_cols [HID_SIZE-1:0];
reg [HID_SIZE-1:0] nhstat_rows;
wire [DATA_WIDTH-1:0] res;

always begin
  #5 clk = ~clk; // Toggle clk every 50 ns
end

initial begin        	
  clk = 1;
  reset = 1;
  nhstat_rows = 128'b0;
  
  #40 reset = 0;
  #10 nhstat_rows = 'b1;
  #10 nhstat_rows = 'b11;
  #10 nhstat_rows = 'b111;
  #10 nhstat_rows = 'b1111;
  #10 nhstat_rows = 'b11111;
  #10 nhstat_rows = 'b111111;
  
  #200 reset= 0;
  #20 reset = 1;
  #20 $finish;
  
end

genvar i;
generate
for(i=0;i<HID_SIZE;i=i+1) begin
    always@(posedge clk) begin
        wt_cols [(i+1)*DATA_WIDTH-1:i*DATA_WIDTH] <= _wt_cols[i];
    end
end
endgenerate

genvar j;
generate
for(j=0;j<HID_SIZE;j=j+1)begin
    always@(posedge clk)begin
        _wt_cols[j] <= 16'b0000000000000001;
    end
end
endgenerate

hv_mmmi inst(clk,reset,nhstat_rows,wt_cols,res);

endmodule