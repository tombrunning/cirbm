// Problems to be solved: fix-point fractions arithmetic logic needed to be fix in multiplication (vtohMMM) and addition (addItem).


`include "test/addItem/addItem.v"
`include "vtohMMM/vtohMMM2.v"
`include "sigmoid/PLAN_top.v"
`include "comparator/comparator.v"
`include "vtohTimer/vtohTimer.v"

`include "sigmoid/sign_judger.v"
`include "sigmoid/magnitude_comparator.v"
`include "sigmoid/dtxy.v"
`include "sigmoid/arbitrator.v"

module VTOH_top(clk,reset,available,fifo_data,vtoh_out,vtoh_out_available);

parameter DATAWIDTH = 16;
parameter BATCHSIZE = 16;
parameter CHUNKSIZE =  DATAWIDTH*BATCHSIZE;

parameter VS = 784;//visible layer size
parameter HS = 512;//hidden layer size
parameter BS = 16;//batch size

input clk;
input reset;
input [BATCHSIZE-1:0] available;
input [CHUNKSIZE-1:0] fifo_data;

output wire [BATCHSIZE-1:0] vtoh_out;
output wire [BATCHSIZE-1:0] vtoh_out_available;

//Internal wires////////////////////////////////////////
// input pixel signals
wire [DATAWIDTH-1:0]single_pixel[BATCHSIZE-1:0];


// wires between "vtohMMM2" to "vtohTimer"
wire out_from_timer_available[BATCHSIZE-1:0];
wire clear_acc[BATCHSIZE-1:0];

// wires between "vtohTimer", "vtohMMM2" to "addItem"
wire [DATAWIDTH-1:0]out_from_vtohMMM2[BATCHSIZE-1:0];
wire out_from_vtohMMM2_available [BATCHSIZE-1:0];

//wires between "addItem" to "sigmoid"
wire [DATAWIDTH-1:0]out_from_addItem[BATCHSIZE-1:0];
wire out_from_addItem_available [BATCHSIZE-1:0];

//wires between "sigmoid" to "comparator"
wire [DATAWIDTH-1:0]out_from_sigmoid[BATCHSIZE-1:0];
wire out_from_sigmoid_available [BATCHSIZE-1:0];

//wires from "comparator"
wire out_from_cmp[BATCHSIZE-1:0];
wire out_from_cmp_available[BATCHSIZE-1:0];


//for testing purpose////////////////////////////////////////////////////////
wire [DATAWIDTH-1:0] weight[BATCHSIZE-1:0];
wire [DATAWIDTH-1:0]out_from_classXWc[BATCHSIZE-1:0];
wire [DATAWIDTH-1:0]out_from_random_number[BATCHSIZE-1:0];

    

genvar test_iter;
generate 
    for(test_iter=0;test_iter<BATCHSIZE;test_iter=test_iter+1)begin
    
        assign out_from_classXWc[test_iter] = 0;//16'b0000_0000_1100_1100; //~ 0.1
        assign weight[test_iter] = 16'b0000_0000_0000_0001;//weight[test_iter] = 16'b0000_0000_1100_1100; //~ 0.1
        assign out_from_random_number[test_iter] = 16'b0000_0100_0000_0000; //~ 0.5
    end
endgenerate

//Split up data chunk into batches////////////////////////////////////////////
genvar i;
generate 
    for(i=0;i<BATCHSIZE;i=i+1)begin :split_in
        assign single_pixel[i] = fifo_data [(i+1)*DATAWIDTH-1:i*DATAWIDTH];
    end
endgenerate

//Feed split data into components/////////////////////////////////////////////
genvar j;
generate
    for(j=0;j<BATCHSIZE;j=j+1)begin :htov
        vtohMMM2 inpixel_inst(.clk(clk),
                             .reset(reset), 
                             .enable(available), 
                             .clear_acc(clear_acc[j]),
                             .in1(single_pixel[j]), 
                             .in2(weight[j]), 
                             .out(out_from_vtohMMM2[j]), 
                             .out_available(out_from_vtohMMM2_available[j])
                             );
                             
        vtohTimer #(.latency(VS-1)) vtohTimer_inst(.clk(clk),
                                                 .reset(reset),
                                                 .in_available(out_from_vtohMMM2_available[j]),
                                                 .out_available(out_from_timer_available[j])
                                                );
                             
        addItem addItem_inst(.clk(clk),
                             .reset(reset),
                             .enable(out_from_timer_available[j]),
                             .in1(out_from_vtohMMM2[j]),
                             .in2(out_from_classXWc[j]),
                             .out(out_from_addItem[j]),
                             .out_available(out_from_addItem_available[j])
                             );
                             
        PLAN_top sigmoid_inst(.clock(clk),
                              .reset(reset),
                              .enable(out_from_addItem_available[j]),
                              .in(out_from_addItem[j]),
                              .sigmoid_value(out_from_sigmoid[j]),
                              .sigmoid_value_available(out_from_sigmoid_available[j])
                              );
                              
        comparator rnd_cmp_inst(.clk(clk),
                                .reset(reset),
                                .enable(out_from_sigmoid_available[j]), 
                                .sig_value(out_from_sigmoid[j]),
                                .randn(out_from_random_number[j]),
                                .cmp_result(out_from_cmp[j]),
                                .out_available(out_from_cmp_available[j])
                                );
                                
        assign clear_acc[j] = out_from_timer_available[j];
    end
endgenerate

//Merge results into output chunk//////////////////////////////////////////////
genvar k;
generate
for (k=0;k<BATCHSIZE;k=k+1) begin :merge_out
    assign vtoh_out[k] = out_from_cmp[k];
    assign vtoh_out_available[k] = out_from_cmp_available[k];
end
endgenerate

endmodule