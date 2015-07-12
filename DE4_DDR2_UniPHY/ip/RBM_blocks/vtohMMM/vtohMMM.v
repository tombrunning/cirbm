/*Version 1.0*/
/*Properties: inputs: 16 x 1bit binary pixels and 16 x 16bits weights*/
module vtohMMM (clk, reset, enable, data, w, dataout, dataout_available);

    parameter DATAWIDTH = 16;
    parameter BATCHSIZE = 16;

    input clk;
    input reset;
    input enable;

    input [BATCHSIZE-1:0] data;
    input [DATAWIDTH*BATCHSIZE-1:0] w;

    output wire [DATAWIDTH*BATCHSIZE-1:0] dataout;
    output wire dataout_available;

    //split data chunk
    genvar i;

    generate
        for(i=0;i<BATCHSIZE;i=i+1) begin
            unit_mul_accu unit1(
            .clk(clk),
            .reset(reset),
            .enable(enable),
            .in1(data[i]),
            .in2(w[(i+1)*DATAWIDTH-1:i*DATAWIDTH]),
            .out(dataout[(i+1)*DATAWIDTH-1:i*DATAWIDTH]),
            .out_available(dataout_available)
            );
        end
    endgenerate
endmodule

//Unit calculation module
module unit_mul_accu(clk,reset,enable,in1,in2,out,out_available);

    parameter DATAWIDTH = 16;

    input clk;
    input reset;
    input enable;

    input in1;
    input [DATAWIDTH-1:0] in2;
    
    output reg [DATAWIDTH-1:0] out; 
    output reg out_available;

    reg [DATAWIDTH-1:0] product;

    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            product <= 0;
        end
        else if (enable == 1) begin
            if (in1 == 0) begin
                product <= 0;
            end else begin
                product <= in2;
            end
        end 
    end

    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            out <= 0;
            out_available<= 0;
        end
        else begin
            if(enable == 1)begin
                out <= out + product ;
                out_available <= enable;
            end else begin
                out_available <= 0;
            end
        end
    end
endmodule
