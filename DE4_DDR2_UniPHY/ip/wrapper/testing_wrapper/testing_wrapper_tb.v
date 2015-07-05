`timescale 10ns / 10ns

module testing_wrapper_tb();

	parameter DATAWIDTH = 32;

reg clk;
reg reset;

reg [1:0]avs_s0_address;
reg avs_s0_read;
reg avs_s0_write;
reg [DATAWIDTH-1:0]avs_s0_writedata;
wire [DATAWIDTH-1:0] avs_s0_readdata;
//wire avs_s0_readdatavalid;


initial begin        	
    clk = 1;
    reset = 1;
    
    avs_s0_address = 0;
    avs_s0_read = 0;
    avs_s0_write = 0;    
    avs_s0_writedata = 0;
    
#50
    avs_s0_read = 1;
#50    
    reset = 0;
    avs_s0_write = 1;
    avs_s0_writedata = 2;
    avs_s0_address = 0;
#100 
    avs_s0_writedata = 3;
    avs_s0_address = 1;
#40
    avs_s0_writedata = 3;
    avs_s0_address = 2;
#40
    avs_s0_read = 1;
#100





    $finish;
  
end  
  
always begin
  #5 clk = ~clk; // Toggle clk every 50 ns
end


testing_wrapper inst(
    clk, 
    reset, 

    avs_s0_address,
    avs_s0_read,
    avs_s0_write,
    avs_s0_readdata,
    //avs_s0_readdatavalid,
    avs_s0_writedata
    );
endmodule