module rbm_demo(clk, reset, avs_s0_read, avs_s0_write, avs_s0_readdata, avs_s0_writedata);

    parameter DATA_WIDTH = 128;
    parameter NUM_WIDTH = DATA_WIDTH/4;
    
    input wire clk;
    input wire reset;
    input wire avs_s0_read;
	input wire avs_s0_write;
    
    input  wire [DATA_WIDTH-1:0] avs_s0_writedata;
	output reg [DATA_WIDTH-1:0] avs_s0_readdata;
    
    reg [DATA_WIDTH-1:0] buffer;
    reg [NUM_WIDTH-1:0]num1;
    reg [NUM_WIDTH-1:0]num2;
    reg [NUM_WIDTH-1:0]num3;
    reg [NUM_WIDTH-1:0]num4;
    //reg [DATA_WIDTH-1:0] result;
    
    
    always @(posedge clk) begin
        if(reset == 1) begin
            buffer <= 'b0;
        end else begin
            buffer <= avs_s0_writedata;
        end
    end
    
    /*always @(posedge clk) begin
        if(reset == 1) begin
            result <= 'b0;
        end else begin
            result [0] <= & buffer;
            result [1] <= & buffer;
        end
    end
    
    always @(posedge clk) begin
        if(reset == 1) begin
            avs_s0_readdata <= 'b0;
        end else begin
            if (result == 2'b00) begin
                avs_s0_readdata <= 0;
            end else begin
                avs_s0_readdata <= 'b01;
            end
        end
    end*/
    
    always @(posedge clk) begin
        if(reset == 1) begin
            num1 = 'b0;
            num2 = 'b0;
            num3 = 'b0;
            num4 = 'b0;
        end else begin
            num1 <= buffer [NUM_WIDTH*1-1:NUM_WIDTH*0];
            num2 <= buffer [NUM_WIDTH*2-1:NUM_WIDTH*1];
            num3 <= buffer [NUM_WIDTH*3-1:NUM_WIDTH*2];
            num4 <= buffer [NUM_WIDTH*4-1:NUM_WIDTH*3];
        end
    end 
    
    always @(posedge clk) begin
        if(reset == 1) begin
            avs_s0_readdata <= 'b0;
        end else begin
            avs_s0_readdata <= num3*num4;
        end
    end
endmodule