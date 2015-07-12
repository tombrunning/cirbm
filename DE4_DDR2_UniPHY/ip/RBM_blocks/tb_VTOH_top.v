`timescale 1ns / 1ns

module tb_VTOH_top();

parameter DATAWIDTH = 16;
parameter BATCHSIZE = 16;
parameter CHUNKSIZE =  DATAWIDTH*BATCHSIZE;

reg clock;
reg reset;

reg [CHUNKSIZE-1:0]coe_user_buffer_data;
reg [BATCHSIZE-1:0]coe_user_data_available;
 
wire [BATCHSIZE-1:0]vtoh_output;
wire [BATCHSIZE-1:0]dataout_available;


initial begin        	
  clock = 1;
  reset = 1;
  //coe_user_data_available = 16'b0000000000000000;
  coe_user_data_available = 16'b0000000000000000;
  //coe_user_buffer_data = 256'b0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000_0000100000000000;
  coe_user_buffer_data = 256'b0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001_0000000000000001;
  
  #10 reset = 0;  coe_user_data_available = 16'b1111111111111111;

  //#30 coe_user_data_available = 0;
  //#34 coe_user_data_available = 1;
  #10000 $finish;
end 


always begin
  #5 clock = ~clock;
end

VTOH_top top_inst(.clk(clock),
                  .reset(reset),
                  .available(coe_user_data_available),
                  .fifo_data(coe_user_buffer_data),
                  .vtoh_out(vtoh_output),
                  .vtoh_out_available(dataout_available)
                  );
                  

endmodule

 
