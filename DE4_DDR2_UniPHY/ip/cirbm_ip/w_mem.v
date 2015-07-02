module top

reg [DATA_WIDTH-1:0] w  [VIS_SIZE*HID_SIZE-1:0];
reg [DATA_WIDTH-1:0] wc [HID_SIZE*CLASSES-1:0];

reg [DATA_WIDTH-1:0] b  [?:0];
reg [DATA_WIDTH-1:0] c  [?:0];
reg [DATA_WIDTH-1:0] cc [?:0];

reg [DATA_WIDTH-1:0] w_row_buffer [HID_SIZE-1:0];
reg [DATA_WIDTH-1:0] w_col_buffer [VIS_SIZE-1:0];

reg [DATA_WIDTH-1:0] wc_row_buffer [HID_SIZE-1:0];
reg [DATA_WIDTH-1:0] wc_col_buffer [CLASSES-1:0];

always@(posedge clk)begin
	if(reset == 1) begin
		//everything <= 0;
	end else begin
		//do something here;
	end
end

//scheduling data and produce inputs for the first module;
//go up
mem_splitter_pre(clk,reset,w,wc,b,w_cols,data_seg,b_seg);
vh_mmm_i(clk,reset,w_cols,data_seg,i_res);
vh_mmm_ii(clk,reset,wc_cols,classes_seg,ii_res);
vh_sum(clk,reset,i_res,ii_res,b_seg,nh_seg);
sigmoid(clk,reset,nh_seg,nh_seg_p);
rnd_gen(clk,reset,rnd_vec);
rnd_cmp(clk,reset,nh_seg_p,rnd_vec,nhstate_seg);

//go down
//go up again
//parameter update

endmodule