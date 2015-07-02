`timescale 10ns / 10ns


module tb_top_fsm_n();
`include "param.v"


reg clock;
reg reset;
  data[0] <= 0;
  data[1] <= 0;
  data[2] <= 0;
  data[3] <= 0;
  data[4] <= 0;
  data[5] <= 1;
  data[6] <= 0;
  data[7] <= 0;
  data[8] <= 0;
  data[9] <= 1;
  data[10] <= 0;
  data[11] <= 0;
  data[12] <= 1;
  data[13] <= 0;
  data[14] <= 1;
  data[15] <= 0;
//outputs under observation
wire [BATCH_WIDTH-1:0]weight;
reg [BATCH_SIZE-1:0]data;
wire [COMPONENT_NUMBER-1:0]nhstate;
//wire [COMPONENT_WIDTH-1:0]bias;
//wire [DATA_WIDTH-1:0]weight[BATCH_SIZE-1:0];
//reg [BATCH_SIZE-1:0]data;
//wire [COMPONENT_NUMBER-1:0]nhstate;
//wire [DATA_WIDTH-1:0]bias[COMPONENT_NUMBER-1:0];

 //Initialize all variables
 initial begin        
  //$display ("time\t clk reset enable result");	
  //$monitor ("%g\t %b   %b     %b      %b", 
	  //$time, clock, reset, enable, result);	
  clock = 1;       // initial value of clock
  reset = 0;       // initial value of reset

  
  
   reset = 1;    
  #50 reset = 0;   
  #500 reset= 0;
  #20 reset = 1;
end 
// Clock  generator
always begin
  #5 clock = ~clock; // Toggle clock every 50 ns
end
/* always@(posedge clock) begin
  data[0] <= 0;
  data[1] <= 0;
  data[2] <= 0;
  data[3] <= 0;
  data[4] <= 0;
  data[5] <= 1;
  data[6] <= 0;
  data[7] <= 0;
  data[8] <= 0;
  data[9] <= 1;
  data[10] <= 0;
  data[11] <= 0;
  data[12] <= 1;
  data[13] <= 0;
  data[14] <= 1;
  data[15] <= 0;

end */
//Connect my_mul to test bench

VtoH inst_my_new_system(
.nhstate(nhstate),
.W_Wc(weight),
//.bias(bias),
.clk(clock),
.reset(reset),
.data_classes(data)
); 

endmodule


 