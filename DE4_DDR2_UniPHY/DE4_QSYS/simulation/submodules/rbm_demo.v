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
    coe_control_early_done,

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
    wire [DATAWIDTH-1:0] doubled_value_w;
    wire addr_ready;
    wire enable_base_address;
    wire enable_read_length;
    
    reg [ADDRESS_WIDTH-1:0] base_address; 
    reg [ADDRESS_WIDTH-1:0] read_length;
    reg [DATAWIDTH-1:0] data_reg;
    reg [DATAWIDTH-1:0] doubled_value_r;
    reg read_length_ready;
    reg base_address_ready;
    reg readdatavalid;
    reg read_buffer;
    reg go;
    
    
    
//Avalon slave signal configuration
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            base_address <= 'b0;
            read_length <= 'b0;
            base_address_ready <= 'b0;
            read_length_ready <= 'b0;
        end else begin
            if (enable_base_address == 1) begin
                base_address <= avs_s0_writedata;
                base_address_ready <= 1'b1;
            end 
            if (enable_read_length == 1) begin
                read_length <= avs_s0_writedata;
                read_length_ready <= 1'b1;
            end
        end
    end
    
    always @(posedge clk or posedge reset) begin
        if (reset == 1) begin
            go <= 1'b0;
        end else begin
            if(addr_ready == 1) begin
                go <= 1'b1;
            end else begin
                go <= 1'b0;
            end
        end
    end
    
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            readdatavalid <= 1'b0;
        end else begin
            if (coe_control_done == 1) begin
                readdatavalid <= 1'b1;
            end
        end
    end
    assign addr_ready = read_length_ready & base_address_ready;
    assign enable_base_address = (avs_s0_address == 0) & (avs_s0_write == 1);
    assign enable_read_length = (avs_s0_address == 1) & (avs_s0_write == 1); 
    
    
//////Pipelined demo function for testing purpose//////  
    always @(posedge clk) begin
        if(reset == 1) begin
            data_reg <= 0;
        end 
        else if (coe_user_data_available & coe_user_read_buffer) begin
            data_reg <= coe_user_buffer_data;
        end
    end
    
    always@(posedge clk) begin
        if(reset == 1) begin
            read_buffer <= 0;
        end else begin 
            if (coe_user_data_available == 1)begin
                read_buffer <= 1'b1;
            end else begin
                read_buffer <= 1'b0;
            end
        end
    end
    
    always @(posedge clk) begin
        if(reset == 1) begin
            doubled_value_r <= 0;
        end 
        else begin
            doubled_value_r <= doubled_value_w;
        end
    end
    
    assign avs_s0_readdata = doubled_value_r;
    assign doubled_value_w = data_reg + data_reg;
    assign coe_user_read_buffer = read_buffer;
    assign avs_s0_readdatavalid = readdatavalid;
    assign coe_control_go = go;
//Interconnect with memory reader
    assign coe_control_read_base = base_address;
    assign coe_control_read_length = read_length;
    assign coe_control_fixed_location = 1'b0; // reserved assignment 
    
endmodule