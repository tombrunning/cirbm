`ifndef _param_vh_
`define _param_vh_

`define DATA_DEPTH = 1024;
`define BATCH_SIZE = 16;
`define BATCH_WIDTH = DATA_WIDTH*BATCH_SIZE;//256
`define COMPONENT_NUMBER = BATCH_SIZE * BATCH_SIZE;//16^2 = 256, number of outputs of the multiplier
`define COMPONENT_WIDTH = DATA_WIDTH * COMPONENT_NUMBER;//16^2 x 16 = 4096

`define DATA_WIDTH = 16;
`define VIS_SIZE = 768;
`define HID_SIZE = 128;
`define CLASSES = 10;
`define BITS_PIX = 1;// # of bits to express one pixel

`endif //_param_vh_