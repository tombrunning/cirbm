module vtohTimer(clk,reset,in_available,out_available);

parameter latency = 784;//visible layer size
//parameter HS = 512;//hidden layer size
//parameter BS = 16;//batch size

//derived parameters
parameter latency_LOG2 = 10;
//parameter HS_LOG2 = 9;

input clk;
input reset;
input in_available;

output reg out_available;

reg [latency_LOG2-1:0] vs_timer;
//reg [HS_LOG2-1:0] hs_timer;

always @(posedge clk or posedge reset)begin
    if(reset == 1)begin
        vs_timer <= 0;
        out_available <= 0;
    end else begin
        if(in_available == 1 & vs_timer != latency)begin
            vs_timer <= vs_timer + 1;
            out_available <= 0;
        end else begin
            vs_timer <= 0;
            out_available <= 1;
        end
    end
end
endmodule