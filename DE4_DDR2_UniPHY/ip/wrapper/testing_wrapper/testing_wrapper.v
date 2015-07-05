`timescale 1ns / 1ns

module testing_wrapper (
    clk, 
    reset, 

    avs_s0_address,
    avs_s0_read,
    avs_s0_write,
    avs_s0_readdata,
    //avs_s0_readdatavalid,
    avs_s0_writedata
    );
    
    parameter DATAWIDTH = 32;
    parameter ADDRESS_WIDTH = 32;
    
    input clk;
    input reset;
    
    //Avalon slave signals, used to write addresses
    input avs_s0_read;
    input avs_s0_write;
    input [1:0] avs_s0_address;// 00 -> write base address; 01 -> write transfer length
    input [DATAWIDTH-1:0] avs_s0_writedata;
    //output wire avs_s0_readdatavalid;
    output wire [ADDRESS_WIDTH-1:0] avs_s0_readdata;
    
    reg [DATAWIDTH-1:0]a;
    reg [DATAWIDTH-1:0]b;
    wire [DATAWIDTH-1:0]c;
    
    wire read;
    wire load_a;
    wire load_b;
    //wire load_c;
    //reg readdatavalid;
    reg [DATAWIDTH-1:0]readdata;
    
    always @(posedge clk or posedge reset)begin
        if(reset == 1)begin
            readdata <= 'b0;
        end else begin
            if(read)begin
                readdata <= c;
            end
        end
    end
    
    always @(posedge clk or posedge reset)begin
        if(reset == 1)begin
            a <= 'b0;
            b <= 'b0;
        end else begin
            if(load_a) begin
                a <= avs_s0_writedata;
            end
            if(load_b) begin
                b <= avs_s0_writedata;
            end
        end
    end 
    
    /*always @(posedge clk or posedge reset)begin
        if(reset == 1)begin
            c <= 0;
            //readdatavalid <= 0;
        end else begin
            if (load_c)begin
                c <= a + b;
                //readdatavalid <= 1;
            end
        end
    end */
    
    assign read = avs_s0_read;
    assign load_a = (avs_s0_write == 1) & (avs_s0_address == 2'b00);
    assign load_b = (avs_s0_write == 1) & (avs_s0_address == 2'b01);
    assign c = a + b;
    //assign load_c =  (avs_s0_address == 2'b10);
    assign avs_s0_readdata = readdata;
    //assign avs_s0_readdatavalid = readdatavalid;
    
    
    /*
    always @(posedge clk or posedge reset)begin
        if(reset == 1)begin
        end else begin
        end
    end    */
endmodule