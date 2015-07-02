`include "param.v"

//module memory(clk,reset,read,write,row_based,col_based,col_in,row_in,col_out,row_out)
module memory(clk,reset,read,write,row_based,done);

parameter VIS_SIZE = 768;
parameter HID_SIZE = 100;
parameter DATA_WIDTH = 16;

parameter BLOCK_WIDTH = VIS_SIZE;
parameter BLOCK_LENGTH = HID_SIZE;
parameter NUM = 1;

input wire clk;
input wire reset;
input wire read;
input wire write;
input wire row_based;
output reg done;
//input wire col_based;

//input  wire [DATA_WIDTH*NUM*BLOCK_WIDTH-1:0]col_in;
//input  wire [DATA_WIDTH*NUM*BLOCK_LENGTH-1:0]row_in;

//output reg [DATA_WIDTH*NUM*BLOCK_WIDTH-1:0] col_out;
//output reg [DATA_WIDTH*NUM*BLOCK_LENGTH-1:0] row_out;
reg [DATA_WIDTH-1:0]mem[0:0][6:0];//[BLOCK_WIDTH-1:0][BLOCK_LENGTH-1:0];

// initialise memory by reading from files
integer data_file;
integer scan_file;

initial begin
    data_file = 0;
    scan_file = 0;
    data_file = $fopen("image.dat","r");
    $display("initial data_file: %d\n",data_file);
    if (data_file == 0) begin
        $display("file is invalid to  ");
        $finish;
    end  
end

always @(posedge clk) begin
    if(reset == 1) begin
        data_file <= 0;
        scan_file <= 0;
        done <= 0;
    end
end

//initialise memory
always@(posedge clk) begin
    if(reset == 1) begin
        mem[0][0] <= 'b0;
        mem[0][1] <= 'b0;
        mem[0][2] <= 'b0;
        mem[0][3] <= 'b0;
        mem[0][4] <= 'b0;
        mem[0][5] <= 'b0;
        mem[0][6] <= 'b0;
    end else begin
        $display("data_file: %d\n",data_file);
        if(data_file) begin
            scan_file = $fscanf(data_file,"%d\n",mem[0][0]);
            scan_file = $fscanf(data_file,"%d\n",mem[0][1]);
            scan_file = $fscanf(data_file,"%d\n",mem[0][2]);
            scan_file = $fscanf(data_file,"%d\n",mem[0][3]);
            scan_file = $fscanf(data_file,"%d\n",mem[0][4]);
            scan_file = $fscanf(data_file,"%d\n",mem[0][5]);
            scan_file = $fscanf(data_file,"%d\n",mem[0][6]);
        end else begin
            $fclose(data_file);
            $display("Memory initialisation completed.");
            $display("Captured data 0,1 is: %d\n finish!", mem[0][1]);
            $display("Captured data 0,2 is: %d\n finish!", mem[0][2]);
            $display("Captured data 0,3 is: %d\n finish!", mem[0][3]);
            $display("Captured data 0,4 is: %d\n finish!", mem[0][4]);
            $display("Captured data 0,5 is: %d\n finish!", mem[0][5]);
            $display("Captured data 0,6 is: %d\n finish!", mem[0][6]);
            done <= 1;
            $finish;
        end
    end
end


/* generate
for(p=0;p<BLOCK_WIDTH;p=p+1) begin
  for(q=0;q<BLOCK_LENGTH;q=q+1) begin   
    always@(posedge clk) begin
        if(reset == 1) begin
            mem[p][q] <= 'b0;
        end else begin
            if(!$feof(data_file)) begin
                scan_file = $fscanf(data_file,"%d\n",mem[p][q]);
                //$display("Captured data0 is: %d\n finish!", mem[p][q]);
            end else begin
                $fclose(data_file);
                $display("Memory initialisation completed.");
                done <= 1;
                $finish;
            end
        end
    end
  end
end
endgenerate */




// if write, assign col_in or row_in to corresponding values, based on the access method.


// if read, assign col_out or row_out the corresponding values, based on the access method.

//read NUM rows of data
/* genvar i;
genvar j;
genvar k;

generate 
for(j=0;j<HID_SIZE/NUM;j=j+1) begin
  for (i=j*NUM;i<(j+1)*NUM;i=i+1) begin
    for(k=0;k<BLOCK_WIDTH;k=k+1) begin
        always @(posedge clk) begin
            if (reset == 1) begin
                row_out[((i-j*NUM)*BLOCK_WIDTH+k)*DATA_WIDTH:((i-j*NUM)*BLOCK_WIDTH+k)*DATA_WIDTH-DATA_WIDTH+1]  <= 0;
            end else begin
                if(read == 1 && row_based == 1 && write == 0) begin
                    row_out[((i-j*NUM)*BLOCK_WIDTH+k+1)*DATA_WIDTH:((i-j*NUM)*BLOCK_WIDTH+k+1)*DATA_WIDTH-DATA_WIDTH+1] <= mem[i][k];
                end
            end
        end
    end
  end
end
endgenerate */



endmodule