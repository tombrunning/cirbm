/*
module: hv_mmmi
input:  128 elements from Wc (16-bit fix point) 
        128 elements from classes (1 bit)
      
output: 1 16-bit fix point outputs per cycle
Intro:  this module calculates the multiplication between nhstates and W_T,
        which is the first item in go down phase. It does a 128-64-32-16-8-4-2-1,
        where layers are marked as a-b-c-d-e-f-g-h
*/

`include "param.v"

module hv_mmmi(clk,reset,nhstat_rows,wt_cols,res);

parameter HID_SIZE = 128;
parameter DATA_WIDTH = 16;

//parameters involved in the adder tree
parameter LAYER_A_SIZE = 128;
parameter LAYER_B_SIZE = 64;
parameter LAYER_C_SIZE = 32;
parameter LAYER_D_SIZE = 16;
parameter LAYER_E_SIZE = 8;
parameter LAYER_F_SIZE = 4;
parameter LAYER_G_SIZE = 2;
parameter LAYER_H_SIZE = 1;

//IO ports
input wire clk;
input wire reset;
input wire [HID_SIZE*DATA_WIDTH-1:0] wt_cols;
input wire [HID_SIZE-1:0] nhstat_rows;
output wire [DATA_WIDTH-1:0] res;

//internal signals
reg [DATA_WIDTH-1:0] _wt_cols [HID_SIZE-1:0];
reg [DATA_WIDTH-1:0] _nhstat_rows;

//signals involved in the adder tree
reg [DATA_WIDTH-1:0] al [LAYER_A_SIZE-1:0];
reg [DATA_WIDTH-1:0] bl [LAYER_B_SIZE-1:0];
reg [DATA_WIDTH-1:0] cl [LAYER_C_SIZE-1:0];
reg [DATA_WIDTH-1:0] dl [LAYER_D_SIZE-1:0];
reg [DATA_WIDTH-1:0] el [LAYER_E_SIZE-1:0];
reg [DATA_WIDTH-1:0] fl [LAYER_F_SIZE-1:0];
reg [DATA_WIDTH-1:0] gl [LAYER_G_SIZE-1:0];
reg [DATA_WIDTH-1:0] hl [LAYER_H_SIZE-1:0];

genvar i;
generate
for(i=0;i<HID_SIZE;i=i+1) begin
    always @(posedge clk) begin
        if(reset == 1) begin
            _wt_cols[i] <= 0;
            _nhstat_rows[i] <= 0;
        end else begin
            _wt_cols[i] <= wt_cols[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH];
            _nhstat_rows[i] <= nhstat_rows[i];
        end
    end
end
endgenerate

//logics involved in the adder tree
//layer a, AND logic to inputs
genvar iter0;
generate
for(iter0=0;iter0<LAYER_A_SIZE;iter0=iter0+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            al[iter0] <= 0;
        end else begin
            if(_nhstat_rows[iter0] == 1) begin
                al[iter0] <= _wt_cols[iter0];
            end else begin
                al[iter0] <= 0;
            end
        end
    end     
end
endgenerate

//layer b
genvar iter1;
generate
for(iter1=0;iter1<LAYER_B_SIZE;iter1=iter1+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            bl[iter1] <= 0;
        end else begin
            bl[iter1] <= al[2*iter1] + al[2*iter1+1];
        end
    end
end
endgenerate

//layer c
genvar iter2;
generate
for(iter2=0;iter2<LAYER_C_SIZE;iter2=iter2+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            cl[iter2] <= 0;
        end else begin
            cl[iter2] <= bl[2*iter2] + bl[2*iter2+1];
        end
    end
end
endgenerate

//layer d
genvar iter3;
generate
for(iter3=0;iter3<LAYER_D_SIZE;iter3=iter3+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            dl[iter3] <= 0;
        end else begin
            dl[iter3] <= cl[2*iter3] + cl[2*iter3+1];
        end
    end
end
endgenerate

//layer e
genvar iter4;
generate
for(iter4=0;iter4<LAYER_E_SIZE;iter4=iter4+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            el[iter4] <= 0;
        end else begin
            el[iter4] <= dl[2*iter4] + dl[2*iter4+1];
        end
    end
end
endgenerate

//layer f
genvar iter5;
generate
for(iter5=0;iter5<LAYER_F_SIZE;iter5=iter5+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            fl[iter5] <= 0;
        end else begin
            fl[iter5] <= el[2*iter5] + el[2*iter5+1];
        end
    end
end
endgenerate

//layer g
genvar iter6;
generate
for(iter6=0;iter6<LAYER_G_SIZE;iter6=iter6+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            gl[iter6] <= 0;
        end else begin
            gl[iter6] <= fl[2*iter6] + fl[2*iter6+1];
        end
    end
end
endgenerate

//layer h
genvar iter7;
generate
for(iter7=0;iter7<LAYER_H_SIZE;iter7=iter7+1)begin
    always@(posedge clk)begin
        if(reset == 1) begin
            hl[iter7] <= 0;
        end else begin
            hl[iter7] <= gl[2*iter7] + gl[2*iter7+1];
        end
    end
end
endgenerate

assign res = hl[0];
endmodule
