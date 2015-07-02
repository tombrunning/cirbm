`include "param.v"

`timescale 10ns / 10ns

module memory_tb();

parameter VIS_SIZE = 768;
parameter HID_SIZE = 100;
parameter DATA_WIDTH = 16;
parameter BITS_PIX = 1;
parameter BLOCK_WIDTH = VIS_SIZE;
parameter BLOCK_LENGTH = HID_SIZE;
parameter NUM = 1;
parameter buffer_sz = 256;
reg clk;
reg reset;
reg read;
reg write;
reg row_based;
//wire [DATA_WIDTH*NUM*BLOCK_LENGTH-1:0] row_out;
wire done;

initial begin
    clk = 1;
    reset = 1;
    read = 1;
    write = 0;
    row_based = 1;
    #100 reset = 0;
end

always begin
    #5 clk = ~clk;
end

memory inst_mem(clk,reset,read,write,row_based,done);

endmodule