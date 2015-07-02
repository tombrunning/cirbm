module cirbm(clk, reset, avs_s0_read, avs_s0_write, avs_s0_readdata, avs_s0_writedata);

    parameter DATA_WIDTH = 128;
    parameter NUM_WIDTH = DATA_WIDTH/4;
    
    input wire clk;
    input wire reset;
    input wire avs_s0_read;
	input wire avs_s0_write;
    
    input  wire [DATA_WIDTH-1:0] avs_s0_writedata;
	output reg [DATA_WIDTH-1:0] avs_s0_readdata;
endmodule