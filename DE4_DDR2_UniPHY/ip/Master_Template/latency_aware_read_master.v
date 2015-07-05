/*
  Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
  use of Altera Corporation's design tools, logic functions and other
  software and tools, and its AMPP partner logic functions, and any
  output files any of the foregoing (including device programming or
  simulation files), and any associated documentation or information are
  expressly subject to the terms and conditions of the Altera Program
  License Subscription Agreement or other applicable license agreement,
  including, without limitation, that your use is for the sole purpose
  of programming logic devices manufactured by Altera and sold by Altera
  or its authorized distributors.  Please refer to the applicable
  agreement for further details.
*/

/*

	Author:  JCJB
	Date:  11/04/2007
	
	This latency aware read master is passed a word aligned address, length in bytes,
	and a 'go' bit.  The master will continue to post reads until the length register
	reaches a value of zero.  When all the reads return the done bit will be asserted. 

	To use this master you must simply drive the control signals into this block,
	and also read the data from the exposed read FIFO.  To read from the exposed FIFO
	use the 'coe_user_read_buffer' signal to pop data from the FIFO 'coe_user_buffer_data'.
	The signal 'coe_user_data_available' is asserted whenever data is available from the
	exposed FIFO.
	
*/

// altera message_off 10230


module latency_aware_read_master (
	clk,
	reset,

	// control inputs and outputs
	coe_control_fixed_location,
	coe_control_read_base,
	coe_control_read_length,
	coe_control_go,
	coe_control_done,
	coe_control_early_done,
	
	// user logic inputs and outputs
	coe_user_read_buffer,
	coe_user_buffer_data,
	coe_user_data_available,
	
	// master inputs and outputs
	master_address,
	master_read,
	master_byteenable,
	master_readdata,
	master_readdatavalid,
	master_waitrequest
);

	parameter DATAWIDTH = 32;
	parameter BYTEENABLEWIDTH = 4;
	parameter ADDRESSWIDTH = 32;
	parameter FIFODEPTH = 32;
	parameter FIFODEPTH_LOG2 = 5;
	parameter FIFOUSEMEMORY = 1;  // set to 0 to use LEs instead
	
	input clk;
	input reset;


	// control inputs and outputs
	input coe_control_fixed_location;
	input [ADDRESSWIDTH-1:0] coe_control_read_base;
	input [ADDRESSWIDTH-1:0] coe_control_read_length;
	input coe_control_go;
	output reg coe_control_done;
	output wire coe_control_early_done;  // don't use this unless you know what you are doing!
	
	// user logic inputs and outputs
	input coe_user_read_buffer;
	output wire [DATAWIDTH-1:0] coe_user_buffer_data;
	output wire coe_user_data_available;
	
	// master inputs and outputs
	input master_waitrequest;
	input master_readdatavalid;
    input [DATAWIDTH-1:0] master_readdata;
	output wire [ADDRESSWIDTH-1:0] master_address;
	output wire master_read;
	output wire [BYTEENABLEWIDTH-1:0] master_byteenable;
	
	// internal control signals
	reg coe_control_fixed_location_d1;
	wire fifo_empty;
	reg [ADDRESSWIDTH-1:0] address;
	reg [ADDRESSWIDTH-1:0] length;
	reg [FIFODEPTH_LOG2-1:0] reads_pending;
	wire increment_address;
	wire too_many_pending_reads;
	reg too_many_pending_reads_d1;
	wire [FIFODEPTH_LOG2-1:0] fifo_used;
    
    //Jiang adds
    wire coe_control_done_w;
    reg fifo_started;


	// registering the coe_control_fixed_location bit
	always @ (posedge clk or posedge reset)
	begin
		if (reset == 1)
		begin
			coe_control_fixed_location_d1 <= 0;
		end
		else
		begin
			if (coe_control_go == 1)
			begin
				coe_control_fixed_location_d1 <= coe_control_fixed_location;
			end
		end
	end



	// master address logic 
	assign master_address = address;
	assign master_byteenable = -1;  // all ones, always performing word size accesses
	always @ (posedge clk or posedge reset)
	begin
		if (reset == 1)
		begin
			address <= 0;
		end
		else
		begin
			if(coe_control_go == 1)
			begin
				address <= coe_control_read_base;
			end
			else if((increment_address == 1) & (coe_control_fixed_location_d1 == 0))
			begin
				address <= address + BYTEENABLEWIDTH;  // always performing word size accesses
			end
		end
	end

	
	
	// master length logic
	always @ (posedge clk or posedge reset)
	begin
		if (reset == 1)
		begin
			length <= 0;
		end
		else
		begin
			if(coe_control_go == 1)
			begin
				length <= coe_control_read_length;
			end
			else if(increment_address == 1)
			begin
				length <= length - BYTEENABLEWIDTH;  // always performing word size accesses
			end
		end
	end	
	
    // Introduction of coe_control_done_w and fifo_started to fix the logic issue that the initial state of control_done should be 0, rather than 1.
	always @ (posedge clk or posedge reset)
	begin
		if (reset == 1)
		begin
            coe_control_done <= 0;
        end else if (fifo_started == 1) begin
            coe_control_done <= coe_control_done_w;
        end
    end
    
    always @ (posedge clk or posedge reset)
	begin
		if (reset == 1)
		begin
            fifo_started <= 0;
        end else if (length != 0) begin
            fifo_started <= 1;
        end
    end
    
	
	// control logic
	assign too_many_pending_reads = (fifo_used + reads_pending) >= (FIFODEPTH - 4);
	assign master_read = (length != 0) & (too_many_pending_reads_d1 == 0);
	assign increment_address = (length != 0) & (too_many_pending_reads_d1 == 0) & (master_waitrequest == 0);
	assign coe_control_done_w = (reads_pending == 0) & (length == 0);  // master done posting reads and all reads have returned
	assign coe_control_early_done = (length == 0);  // if you need all the pending reads to return then use 'coe_control_done' instead of this signal


	always @ (posedge clk)
	begin
		if (reset == 1)
		begin
			too_many_pending_reads_d1 <= 0;
		end
		else
		begin
			too_many_pending_reads_d1 <= too_many_pending_reads;
		end
	end

	

	always @ (posedge clk or posedge reset)
	begin
		if (reset == 1)
		begin
			reads_pending <= 0;
		end
		else
		begin
			if(increment_address == 1)
			begin
				if(master_readdatavalid == 0)
				begin
					reads_pending <= reads_pending + 1;
				end
				else
				begin
					reads_pending <= reads_pending;  // a read was posted, but another returned
				end			
			end
			else
			begin
				if(master_readdatavalid == 0)
				begin
					reads_pending <= reads_pending;  // read was not posted and no read returned
				end
				else
				begin
					reads_pending <= reads_pending - 1;  // read was not posted but a read returned
				end				
			end
		end
	end

	
	// read data feeding user logic	
	assign coe_user_data_available = !fifo_empty;
	scfifo the_master_to_user_fifo (
		.aclr (reset),
		.clock (clk),
		.data (master_readdata),
		.empty (fifo_empty),
		.q (coe_user_buffer_data),
		.rdreq (coe_user_read_buffer),
		.usedw (fifo_used),
		.wrreq (master_readdatavalid)
	);
	defparam the_master_to_user_fifo.lpm_width = DATAWIDTH;
	defparam the_master_to_user_fifo.lpm_numwords = FIFODEPTH;
	defparam the_master_to_user_fifo.lpm_showahead = "ON";
	defparam the_master_to_user_fifo.use_eab = (FIFOUSEMEMORY == 1)? "ON" : "OFF";
	defparam the_master_to_user_fifo.add_ram_output_register = "OFF";
	defparam the_master_to_user_fifo.underflow_checking = "OFF";
	defparam the_master_to_user_fifo.overflow_checking = "OFF";

endmodule
