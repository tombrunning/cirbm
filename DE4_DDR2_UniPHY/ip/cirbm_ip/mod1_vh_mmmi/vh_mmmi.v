/*
module: vh_mmmi
input:  768 weights (16-bit fix point) 
        768 image pixels (1 bit)
      
output: 1 16-bit fix point every four cycles
Intro:  this module calculates the multiplication between weights and input data.
        four status in FSM, output is activated only in status 00.
        768 production results are input into an addwe tree in a pipelined
        way by three cycles. an extra status of fsm is used to reset accumulator
        and activate output.
*/


`include "param.v"

module vh_mmmi(clk,reset,w_cols,data_seg,i_res);

parameter VIS_SIZE = 768;
parameter DATA_WIDTH = 16;
parameter BITS_PIX = 1;

parameter buffer_sz = 256;

input wire clk;
input wire reset;

input wire [VIS_SIZE*DATA_WIDTH-1:0] w_cols;
input wire [VIS_SIZE*BITS_PIX-1:0] data_seg;
output reg [DATA_WIDTH-1:0] i_res;                          

//internal regs
reg [DATA_WIDTH-1:0] _w_cols  [VIS_SIZE-1:0]; 
reg [DATA_WIDTH-1:0] _and_res [VIS_SIZE-1:0]; 
reg [DATA_WIDTH-1:0] _buffer  [buffer_sz-1:0];
reg [VIS_SIZE-1:0] _data_seg;//Bcs BITS_PIX=1

//intermediate regs within sub adder trees.
reg [DATA_WIDTH-1:0] al1 [127:0];
reg [DATA_WIDTH-1:0] al2 [63:0];
reg [DATA_WIDTH-1:0] al3 [31:0];
reg [DATA_WIDTH-1:0] al4 [15:0];
reg [DATA_WIDTH-1:0] al5 [7:0];
reg [DATA_WIDTH-1:0] al6 [3:0];
reg [DATA_WIDTH-1:0] al7 [1:0];
reg [DATA_WIDTH-1:0] sum;
reg [DATA_WIDTH-1:0] acc;

//assign inputs to internal reg bit by bit
genvar i;
generate
    for(i=0;i<VIS_SIZE;i=i+1)begin
        always @(posedge clk) begin
		    if(reset == 1) begin
		        _w_cols[i] <= 'b0;
            end else begin
			    _w_cols[i] <= w_cols[(i*16+15):(i*16)] ;
            end
        end
    end
endgenerate

always @(posedge clk) begin
    if(reset == 1) begin
        _data_seg <= 'b0;
    end else begin
        _data_seg <= data_seg;
    end
end

//AND logic producing the inputs to the three adder trees.
genvar j;
generate
    for(j=0;j<VIS_SIZE;j=j+1) begin
        always @(posedge clk) begin
            if(reset == 1)begin
                _and_res[j] <= 'b0;
            end else begin
                if( _data_seg[j] == 1) begin
                    _and_res[j] <=  _w_cols[j];
                end else begin
                    _and_res[j] <= 'b0;
                end
            end
        end
    end
endgenerate

//buffer controller
reg [1:0] status;

genvar k;
generate
    for(k=0;k<buffer_sz;k=k+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                _buffer [k] <= 'b0;
            end else begin
                case (status)//can be replaced by bit shifting operations which could potentially be faster.
                    2'b00: 
                    begin
                        _buffer [k] <= _and_res [k];
                    end
                    2'b01:
                    begin
                        _buffer [k] <= _and_res[k+buffer_sz]; 
                    end
                    2'b10:
                    begin
                        _buffer [k] <= _and_res[k+2*buffer_sz];   
                    end
                    default:
                    begin
                        _buffer [k] <= 'b0;
                    end
                endcase        
            end
        end
    end
endgenerate

//FSM
always @(posedge clk) begin
    if(reset == 1) begin
        acc     <= 'b0;
        i_res   <= 'b0;
        status  <= 2'b00;
    end else begin
        case (status)//can be replaced by bit shifting operations which could potentially be faster.
            2'b00: begin status <= 2'b01; i_res <= acc; acc <= 0; end
            2'b01: begin status <= 2'b10; acc <= sum + acc; end
            2'b10: begin status <= 2'b11; acc <= sum + acc; end
            2'b11: begin status <= 2'b00; acc <= sum + acc; end
            default: status <= 2'b00;
        endcase        
    end
end


//a large adder tree adding up 768(784-16) 16-bit fix-point numbers
// is implemented as a 256 adder tree with pipelined (X3) inputs.

//Adder Tree begin
//layer1
genvar iter1;
generate
    for(iter1=0;iter1<128;iter1=iter1+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al1[iter1] <= 'b0;
            end else begin
                al1[iter1] <= _buffer[iter1*2] + _buffer[iter1*2+1];
            end
        end
    end
endgenerate

//layer2
genvar iter2;
generate
    for(iter2=0;iter2<64;iter2=iter2+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al2[iter2] <= 'b0;
            end else begin
                al2[iter2] <= al1[iter2*2] + al1[iter2*2+1];
            end
        end
    end
endgenerate

//layer3
genvar iter3;
generate
    for(iter3=0;iter3<32;iter3=iter3+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al3[iter3] <= 'b0;
            end else begin
                al3[iter3] <= al2[iter3*2] + al2[iter3*2+1];
            end
        end
    end
endgenerate

//layer4
genvar iter4;
generate
    for(iter4=0;iter4<16;iter4=iter4+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al4[iter4] <= 'b0;
            end else begin
                al4[iter4] <= al3[iter4*2] + al3[iter4*2+1];
            end
        end
    end
endgenerate

//layer5
genvar iter5;
generate
    for(iter5=0;iter5<8;iter5=iter5+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al5[iter5] <= 'b0;
            end else begin
                al5[iter5] <= al4[iter5*2] + al4[iter5*2+1];
            end
        end
    end
endgenerate

//layer6
genvar iter6;
generate
    for(iter6=0;iter6<4;iter6=iter6+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al6[iter6] <= 'b0;
            end else begin
                al6[iter6] <= al5[iter6*2] + al5[iter6*2+1];
            end
        end
    end
endgenerate

//layer7
genvar iter7;
generate
    for(iter7=0;iter7<2;iter7=iter7+1) begin
        always @(posedge clk) begin
            if(reset == 1) begin
                al7[iter7] <= 'b0;
            end else begin
                al7[iter7] <= al6[iter7*2] + al6[iter7*2+1];
            end
        end
    end
endgenerate

//layer8
always @(posedge clk) begin
    if(reset == 1) begin
        sum <= 'b0;
    end else begin
        sum <= al7[1] + al7[0];
    end
end
//Adder Tree end

endmodule
