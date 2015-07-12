module sign_judger(clock,reset,in_available,in,abs_out,sign_bit,out_available);
	parameter DATA_WIDTH = 16;
	parameter sign = 15;
	input clock;
	input reset;
	input [DATA_WIDTH-1:0] in;
    input in_available;

	output reg out_available;
	output reg [DATA_WIDTH-1:0] abs_out;
	output reg sign_bit;
    
	always @(posedge clock)begin
        if (reset == 1) begin 
            abs_out <= 0;
            sign_bit <= 0;
            out_available <= 0;
        end else if (in_available == 1 & in[sign] == 0) begin
            abs_out <= in;
            sign_bit <= in[sign];
            out_available <= in_available;
        end else if (in_available == 1 & in[sign] ==1)begin
            abs_out <= in+16'b1000_0000_0000_0000;
            sign_bit <= in[sign];
            out_available <= in_available;
        end else begin
            abs_out <= 0;
            sign_bit <= 0;
            out_available <= 0;
	end
        end
endmodule