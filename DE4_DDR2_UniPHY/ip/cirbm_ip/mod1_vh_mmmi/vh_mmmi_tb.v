`include "param.v"

`timescale 10ns / 10ns

module vh_mmmi_tb();

parameter VIS_SIZE = 768;
parameter DATA_WIDTH = 16;
parameter BITS_PIX = 1;
parameter buffer_sz = 256;
reg clk;
reg reset;
 
//outputs under observation
wire [VIS_SIZE*DATA_WIDTH-1:0] w_cols;
reg [VIS_SIZE*BITS_PIX-1:0] data_seg;
reg [DATA_WIDTH-1:0] _w_cols  [VIS_SIZE-1:0];
wire [DATA_WIDTH-1:0] i_res;

initial begin        	
  clk = 1;
  reset = 1;
  data_seg = 768'b0;
  #100 reset = 0;  
  #40 data_seg = 'b1;  
  #40 data_seg = 'b11;  
  #40 data_seg = 'b111;//data_seg + 'b1;  
  #40 data_seg = 'b1111;//data_seg + 'b1;  
  #40 data_seg = 'b11111;  
  #40 data_seg = 'b111111;  
  #40 data_seg = 'b1111111;  
  #40 data_seg = 'b111111111;  
  #40 data_seg = 'b1111111111;  
  #40 data_seg = 'b11111111111;  
  #40 data_seg = 'b111111111111;  
  #40 data_seg = 'b1111111111111;  
  #40 data_seg = 'b11111111111111;  
  #40 data_seg = 'b111111111111111;  
  #40 data_seg = 'b1111111111111111;  
  #40 data_seg = 'b11111111111111111;  
  #40 data_seg = 'b111111111111111111;  
  #40 data_seg = 'b1111111111111111111;  
  #40 data_seg = 'b11111111111111111111;  
  #40 data_seg = 'b111111111111111111111;  
  #40 data_seg = 'b1111111111111111111111;  
  #40 data_seg = 'b11111111111111111111111;  
  #40 data_seg = 'b111111111111111111111111;  
  #40 data_seg = 'b1111111111111111111111111;  
  #40 data_seg = 'b11111111111111111111111111;  
  #40 data_seg = 'b111111111111111111111111111;  
  #40 data_seg = 'b1111111111111111111111111111;  
  #40 data_seg = 'b11111111111111111111111111111;  
  #40 data_seg = 'b111111111111111111111111111111;  
  #40 data_seg = 'b1111111111111111111111111111111;  
  #40 data_seg = 'b11111111111111111111111111111111;  
  #40 data_seg = 'b111111111111111111111111111111111;  
 
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
    for(i=0;i<VIS_SIZE;i=i+1)begin
        always @(posedge clk) begin
            _w_cols[i] <= 16'b0000_0000_0000_0001;
        end
    end
endgenerate


genvar j;
generate
    for(j=0;j<VIS_SIZE;j=j+1)begin
		assign w_cols[(j+1)*DATA_WIDTH-1:j*DATA_WIDTH] = _w_cols[j];
    end
endgenerate

vh_mmmi #(.VIS_SIZE(VIS_SIZE),.DATA_WIDTH(DATA_WIDTH),.BITS_PIX(BITS_PIX)) inst(clk,reset,w_cols,data_seg,i_res);


endmodule