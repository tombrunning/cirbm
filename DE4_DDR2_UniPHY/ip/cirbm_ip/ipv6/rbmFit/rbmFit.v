module rmbFit(nhstate,W_Wc,bias,clk,reset,data_classes);
`include "param.v"

input wire clk;
input wire reset;
input wire [BATCH_SIZE-1:0]data_classes;
// Fucking basically get data from AMM bus and split them into input form of different modules' interfaces. You have to know how data are transfered in a burst and hpw tp write the AMM interface signals in custom component. For god sake.