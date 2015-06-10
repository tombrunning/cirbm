module rbm_demo(clk, reset, avs_s0_read, avs_s0_write, avs_s0_readdata, avs_s0_writedata);

    parameter DATA_WIDTH = 256;
    
    input wire clk;
    input wire reset;
    input wire avs_s0_read;
	input wire avs_s0_write;
    
    input  wire [DATA_WIDTH-1:0] avs_s0_writedata;
	output reg [DATA_WIDTH-1:0] avs_s0_readdata;
    
    reg [DATA_WIDTH-1:0] buffer;
    reg [1:0] result;
    
    assign tester = 'b0;
    
    always @(posedge clk) begin
        if(reset == 1) begin
            buffer <= 'b0;
        end else begin
            buffer <= avs_s0_writedata;
        end
    end
    
    always @(posedge clk) begin
        if(reset == 1) begin
            result <= 2'b01;
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
    end

endmodule