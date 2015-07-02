parameter DATA_DEPTH = 1024;
parameter BATCH_SIZE = 16;
parameter BATCH_WIDTH = DATA_WIDTH*BATCH_SIZE;//256
parameter COMPONENT_NUMBER = BATCH_SIZE * BATCH_SIZE;//16^2 = 256, number of outputs of the multiplier
parameter COMPONENT_WIDTH = DATA_WIDTH * COMPONENT_NUMBER;//16^2 x 16 = 4096

parameter DATA_WIDTH = 16;
parameter VIS_SIZE = 784
parameter HID_SIZE = 128;
parameter CLASSES = 10;
parameter BITS_PIX = 1;// # of bits to express one pixel
