`timescale 1ns / 1ns

module rbm_demo (
    clk, 
    reset, 

    avs_s0_address,
    avs_s0_read,
    avs_s0_write,
    avs_s0_readdata,
    avs_s0_readdatavalid,
    avs_s0_writedata,

    coe_control_fixed_location,
    coe_control_read_base,
    coe_control_read_length,
    coe_control_go,
    coe_control_done,
    coe_control_early_done,//reserved

    coe_user_buffer_data,
    coe_user_data_available,
    coe_user_read_buffer
                );
	parameter DATAWIDTH = 32;
    parameter ADDRESS_WIDTH =32;
    
    input clk;
    input reset;
    
    //Avalon slave signals, used to write addresses
    input avs_s0_read;
    input avs_s0_write;
    input [1:0] avs_s0_address;// 00 -> write base address; 01 -> write transfer length
    input [ADDRESS_WIDTH-1:0] avs_s0_writedata;
    output wire avs_s0_readdatavalid;
    output wire [ADDRESS_WIDTH-1:0] avs_s0_readdata;
    
    //Control signals, to match the memory reader interfaces
    output wire coe_control_fixed_location;
    output wire [ADDRESS_WIDTH-1:0] coe_control_read_base;
    output wire [ADDRESS_WIDTH-1:0] coe_control_read_length;
    output wire coe_control_go;
    input coe_control_done;
    input coe_control_early_done;
    
    //FIFO signals, to match the memory reader interfaces
    input  [DATAWIDTH-1:0] coe_user_buffer_data;
    input coe_user_data_available;
    output wire coe_user_read_buffer;
    
    //Internal signals    
    wire load_base_address;
    wire load_read_length;
    //wire load_readdata;
    //wire load_buffer_data;
    //reg data_ready;
    
    reg [ADDRESS_WIDTH-1:0] base_address; 
    reg [ADDRESS_WIDTH-1:0] read_length;
    reg [DATAWIDTH-1:0] data_reg;
    
    
    //Avalon slave signal configuration
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            base_address <= 'b0;
            read_length <= 'b0;
        end else begin
            if (load_base_address == 1) begin
                base_address <= avs_s0_writedata;
            end 
            if (load_read_length == 1) begin
                read_length <= avs_s0_writedata;
            end
        end
    end

    //////Pipelined demo function for testing purpose//////  
    always @(posedge clk) begin
        if(reset == 1) begin
            data_reg <= 0;
        end 
        else if (coe_user_data_available) begin
            data_reg <= coe_user_buffer_data;
        end
    end
    
    /*always @(posedge clk) begin
        if(reset == 1) begin
            data_ready <= 0;
        end 
        else begin        
            if(coe_control_done & (accumu == read_length/4)) begin               
                data_ready <= 1'b1;
            end
        end
    end*/
    
    assign load_base_address = (avs_s0_address == 2'b00) & (avs_s0_write == 1);
    assign load_read_length = (avs_s0_address == 2'b01) & (avs_s0_write == 1); 
    assign coe_control_go = (avs_s0_address == 2'b10) & (avs_s0_write == 1);
    assign avs_s0_readdatavalid = avs_s0_read; //& ( data_ready == 1); // use done signal in a right way in the future.
    assign coe_user_read_buffer = coe_user_data_available;   
    assign avs_s0_readdata = data_reg;
    
    //Interconnect with memory reader
    assign coe_control_read_base = base_address;
    assign coe_control_read_length = read_length;
    assign coe_control_fixed_location = 1'b0; // reserved assignment 
    
endmodule