module rbm_demo(
                clk, 
                reset, 
                
                avm_s0_address,
                avm_s0_read,
                avm_s0_readdata, 
                avm_s0_readdatavalid, 
                avm_s0_burstcount, 
              //avm_s0_byteenable, 
                avm_s0_waitrequest,
                
                src_data,
                src_valid,
                src_ready
                );

    parameter DATA_WIDTH = 128;
    parameter ADDRESS_WIDTH = 32; 
    parameter NUM_WIDTH = DATA_WIDTH/4;
    parameter BURST_WIDTH = 2; 
    
    //IO signals
    input  wire clk;
    input  wire reset;
    
    output wire [ADDRESS_WIDTH-1:0] avm_s0_address;
    output wire avm_s0_read;
    input  [DATA_WIDTH-1:0] avm_s0_readdata;
    input  avm_s0_readdatavalid;
    output wire [BURST_WIDTH-1:0] avm_s0_burstcount;
    //output wire [BYTE_ENABLE_WIDTH-1:0] avm_s0_byteenable; 
    input  avm_s0_waitrequest;
    
    output wire [DATA_WIDTH-1:0] src_data;
    output wire src_valid;
    input  src_ready;
   
    //Internal Signals
   
    
endmodule