module rbm_demo(clk, 
                reset, 
                avs_s0_read, 
                avs_s0_write, 
                avs_s0_writedata, 
                avs_s0_readdata, 
                avs_s0_readdatavalid, 
                avs_s0_waitrequest
                );

    parameter DATA_WIDTH = 128;
    parameter NUM_WIDTH = DATA_WIDTH/4;
    
    input wire clk;
    input wire reset;
    input wire avs_s0_read;
	input wire avs_s0_write;
    
    input  wire [DATA_WIDTH-1:0] avs_s0_writedata;
	output reg [DATA_WIDTH-1:0] avs_s0_readdata;
	output reg avs_s0_readdatavalid;
    
    output reg avs_s0_waitrequest;
    wire enable;
    
    //0th bit of buffer is a flag of first layer pipeline
    reg [DATA_WIDTH:0] buffer;
    
    //customer internal registers
    reg [NUM_WIDTH-1:0]num1;
    reg [NUM_WIDTH-1:0]num2;
    reg [NUM_WIDTH-1:0]num3;
    reg [NUM_WIDTH-1:0]num4;
    reg [DATA_WIDTH-1:0] result;
    
    // two pipeline flag registers
    reg cp1;
    reg cp2;
    
    //reserved enable signal
    assign enable = ~reset;
    
    always @(posedge clk) begin
        if(reset == 1) begin
            avs_s0_readdatavalid <= 'b0;
            avs_s0_readdata <= 'b0;
            avs_s0_waitrequest <= 'b0;
        end else begin
            if(enable == 1) begin
                if(cp2 == 1'b1) begin
                    avs_s0_readdatavalid <= 1'b1;
                    avs_s0_readdata <= result;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if(reset == 1) begin
            buffer <= 'b0;
        end else begin
            if(enable == 1) begin
                if (avs_s0_write == 1) begin
                    buffer [DATA_WIDTH:1] <= avs_s0_writedata;
                    buffer [0] <= 1'b1;
                end else begin
                    buffer [0] <= 1'b0;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if(reset == 1) begin
            num1 <= 'b0;
            num2 <= 'b0;
            num3 <= 'b0;
            num4 <= 'b0;
            cp1  <= 1'b0;
        end else begin
            if(enable == 1) begin
                if (buffer [0] == 1'b1) begin
                    num1 <= buffer [NUM_WIDTH*1:NUM_WIDTH*0+1];
                    num2 <= buffer [NUM_WIDTH*2:NUM_WIDTH*1+1];
                    num3 <= buffer [NUM_WIDTH*3:NUM_WIDTH*2+1];
                    num4 <= buffer [NUM_WIDTH*4:NUM_WIDTH*3+1];
                    cp1 <= 1'b1;
                end else begin
                    cp1 <= 1'b0;
                end
            end
        end
    end 
    
    always @(posedge clk) begin
        if(reset == 1) begin
            result <= 'b0;
            cp2 <= 1'b0;
        end else begin
            if(enable == 1) begin
                if (cp1 == 1'b1) begin
                    result <= num3*num4;
                    cp2 <= 1'b1;
                end else begin
                    cp2 <= 1'b0;
                end
            end
        end
    end
    
endmodule