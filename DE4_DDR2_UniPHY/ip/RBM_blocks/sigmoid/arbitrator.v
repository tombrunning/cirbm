
module arbitrator(clock,reset,abs_in,sign_bit_in,input_available,out,output_available);

	parameter DATA_WIDTH = 16;
	parameter sign = 15;
    
	input clock;
	input reset;

	input input_available;
	input sign_bit_in;
	input [DATA_WIDTH-1:0]abs_in;
	output reg [DATA_WIDTH-1:0]out;
	output reg output_available;
    
	always@(posedge clock) begin 
    
        if(reset == 1) begin 
        
            out <= 0;
            output_available <= 0;
            
        end else if(input_available == 1) begin
            if(sign_bit_in==0) begin
                out <= abs_in;
                output_available <= input_available;
            end else if(sign_bit_in==1) begin
                out <= 16'b0000_1000_0000_0000 - abs_in;
                output_available <= input_available;
            end else begin
                output_available <= input_available;
            end
        end else begin
            output_available <= 0;
        end
    end

endmodule 