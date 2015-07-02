//test_mem.dat:
//1 11 111 1111 
//2 22 222 2222
//3 33 333 3333
//4 44 444 4444
//5 55 555 5555
//6 66 666 6666
//7 77 777 7777
//8 88 888 8888
module test_mem();
integer data_file;
integer scan_file;

reg clk;
reg [15:0] data[3:0];

always begin
  #5 clk = ~clk;
end
initial begin
    data[0] = 0;
    data[1] = 0;
    data[2] = 0;
    data[3] = 0;
    clk = 0;
    data_file = 0;
    scan_file = 0;
    data_file = $fopen("test_mem.dat","r");
    if (data_file == 0) begin
        $display("file is invalid to open");
        $finish;
    end
    #500 $finish;
end

always@(posedge clk)begin
    if(!$feof(data_file)) begin
        scan_file = $fscanf(data_file,"%d\n",data[0]);
        scan_file = $fscanf(data_file,"%d\n",data[1]);
        scan_file = $fscanf(data_file,"%d\n",data[2]);
        scan_file = $fscanf(data_file,"%d\n",data[3]);
        $display("Captured data0 is: %d\n finish!", data[0]);
        $display("Captured data1 is: %d\n finish!", data[1]);
        $display("Captured data2 is: %d\n finish!", data[2]);
        $display("Captured data3 is: %d\n finish!", data[3]);

    end else begin
        $fclose(data_file);
        $finish;

    end
end

endmodule