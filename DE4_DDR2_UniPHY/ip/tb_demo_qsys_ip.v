`timescale 10ns / 10ns

module rbm_demo_tb;
    parameter DATA_WIDTH = 256;
    
    wire [255:0] inputs;
    wire [255:0] outputs;
    
    reg clk;
    reg reset;
    
    assign inputs = 256'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111_1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111_11111111111111111111111111111111111111111111111111111111;
    
    always begin
      #5 clk = ~clk;
    end

    initial begin        	
      clk = 1;
      reset = 1;
      #20 reset= 0;
      #200 reset = 1;
      #20 $finish;
      
    end

    rbm_demo inst (
        .clk(clk), 
        .reset(reset), 
        .avs_s0_read(0), 
        .avs_s0_write(1), 
        .avs_s0_readdata(outputs), 
        .avs_s0_writedata(inputs)
    );
endmodule
