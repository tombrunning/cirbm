`timescale 10ns / 10ns

module rbm_demo_tb;
    parameter DATA_WIDTH = 256;
    
    reg [127:0] inputs;
    wire [127:0] outputs;
    
    reg clk;
    reg reset;
    //reg enable;
    reg write;
    wire tb_readdatavalid;
    
    always @(posedge clk) begin
        if (write == 1) begin
            inputs <= inputs + 1'b1;
        end
    end
    
    always begin
      #5 clk = ~clk;
    end

    initial begin        	
      clk = 1;
      reset = 1;
      //enable = 1;
      write = 1;
      
      inputs = 128'b00000000000000000000000000000100_00000000000000000000000000000011_00000000000000000000000000000010_00000000000000000000000000000001;
      
      #20 reset= 0;
      #60 write =0;
      #30 write =1;
      #100 reset = 1;
      #20 $finish;
      
    end

    rbm_demo inst (
        .clk(clk), 
        .reset(reset), 
        //.enable(enable),
        .avs_s0_read(0), 
        .avs_s0_write(write), 
        .avs_s0_readdata(outputs), 
        .avs_s0_writedata(inputs),
        .avs_s0_readdatavalid(tb_readdatavalid)
    );
endmodule