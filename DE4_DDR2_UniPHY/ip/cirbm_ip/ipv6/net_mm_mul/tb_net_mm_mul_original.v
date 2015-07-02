`timescale 10ns / 10ns


module tb_net_mm_mul();
`include "param.v"

reg clock;
reg reset;
 
//outputs under observation
reg [BATCH_SIZE-1:0]data;
wire [COMPONENT_WIDTH-1:0]partial_sum;
reg [BATCH_WIDTH-1:0]W_Wc;
initial begin        	
  clock = 1;       // initial value of clock
  reset = 1;    
  data = 12.36;//16'b0000110110000000;
  W_Wc = 'b1;
  #50 reset = 0;   
  #500 reset= 0;
  #20 reset = 1;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end

always@(posedge clock) begin
	  data[0] <= ~data[0];
	  data[1] <= ~data[1];
      data[2] <= ~data[2];
	  data[3] <= ~data[3];
	  data[4] <= ~data[4];
	  data[5] <= ~data[5];
	  data[6] <= ~data[6];
	  data[7] <= ~data[7];
	  data[8] <= ~data[8];
	  data[9] <= ~data[9];
	  data[10] <= ~data[10];
	  data[11] <= ~data[11];
	  data[12] <= ~data[12];
	  data[13] <= ~data[13];
	  data[14] <= ~data[14];
	  //data[15] <= ~data[15]; No change to sign
	  W_Wc <= W_Wc + 1'b1;
end


net_mm_mul inst_mm(
.clk(clock),
.reset(reset),
.matrix_element(partial_sum),
.w(W_Wc),
.x(data)
); 


endmodule

 