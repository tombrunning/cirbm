module magnitude_comparator(clock,reset,enable,abs_in,sign_bit,flag,flag_available,sign_bit_out,abs_value_out);
	parameter DATA_WIDTH = 16;
	parameter sign = 15;
	parameter a = 14;
	parameter b = 13;
	parameter c = 12;
	parameter d = 11;
	parameter e = 10;
	parameter f = 9;
	parameter g = 8;
	parameter h = 7;//i-o are ignored

	parameter z1 = 3;//Bits of flag
	parameter z2 = 2;
	parameter z3 = 1;
	parameter z4 = 0;

	input clock;
	input reset;
	input enable;

	input [DATA_WIDTH-1:0]abs_in;
	input sign_bit;
	output reg [3:0] flag;
	output reg flag_available;
	output reg sign_bit_out;
	output reg [DATA_WIDTH-1:0] abs_value_out;
    
    // register of input in the first layer, sign bit is 
    // temporarily used for valid bit in this module.
    reg [DATA_WIDTH-1:0]in_reg;
    reg [3:0] flag_reg_ppl1; 
    reg [3:0] flag_reg_ppl2;     
    reg [DATA_WIDTH-1:0] pipeline[4:0];
    
    // regs for intermediate results, the very final results are always flag_reg_ppl1[z];
	reg z4_1;
	reg z4_2;   
    reg z2b1_1;
    reg z2b2_1;
    reg z2b2_2;
    reg z2_1;
    reg z2_2;
    
    //registers to pass down sign bit.
    reg sign_bit_ppl1;
    reg sign_bit_ppl2;
    reg sign_bit_ppl3;
    reg sign_bit_ppl4;
    reg sign_bit_ppl5;
    reg sign_bit_ppl6;
    
    //registers to pass down the abs_value
    reg [DATA_WIDTH-1:0]abs_value_ppl1;
    reg [DATA_WIDTH-1:0]abs_value_ppl2;
    reg [DATA_WIDTH-1:0]abs_value_ppl3;
    reg [DATA_WIDTH-1:0]abs_value_ppl4;
    reg [DATA_WIDTH-1:0]abs_value_ppl5;
    reg [DATA_WIDTH-1:0]abs_value_ppl6;
    
    //register inputs with assigning sign bit 1
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            in_reg <= 0;
            sign_bit_ppl1 <= 0;
            abs_value_ppl1<= 0;
        end else begin
            if(enable == 1) begin
                in_reg[14:0] <= abs_in[14:0];
                in_reg[sign] <= 1;
                sign_bit_ppl1 <= sign_bit;
                abs_value_ppl1<= abs_in[14:0];
            end else begin
                in_reg <= abs_in[14:0];
                sign_bit_ppl1 <= sign_bit;
                abs_value_ppl1<= abs_in[14:0];
            end
        end
    end   
    
    //store values of inputs at every level of pipeline logic
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            pipeline[0] <= 0;
            pipeline[1] <= 0;
            pipeline[2] <= 0;
            pipeline[3] <= 0;
            pipeline[4] <= 0;
            
            sign_bit_ppl2 <= 0;
            sign_bit_ppl3 <= 0;
            sign_bit_ppl4 <= 0;
            sign_bit_ppl5 <= 0;
            sign_bit_ppl6 <= 0;
            
            abs_value_ppl2 <= 0;
            abs_value_ppl3 <= 0;
            abs_value_ppl4 <= 0;
            abs_value_ppl5 <= 0;
            abs_value_ppl6 <= 0;
            
        end else begin
            if(in_reg[sign] == 1) begin
                pipeline[0] <= in_reg; 
                sign_bit_ppl2 <= sign_bit_ppl1;
                abs_value_ppl2 <= abs_value_ppl1;
            end else begin
                pipeline[0] <= 0;
                sign_bit_ppl2 <= sign_bit_ppl1;
                abs_value_ppl2 <= abs_value_ppl1;
            end
            pipeline[1] <= pipeline [0];
            pipeline[2] <= pipeline [1];
            pipeline[3] <= pipeline [2];
            pipeline[4] <= pipeline [3];
            
            sign_bit_ppl3 <= sign_bit_ppl2;
            sign_bit_ppl4 <= sign_bit_ppl3;
            sign_bit_ppl5 <= sign_bit_ppl4;
            sign_bit_ppl6 <= sign_bit_ppl5;
            
            abs_value_ppl3 <= abs_value_ppl2;
            abs_value_ppl4 <= abs_value_ppl3;
            abs_value_ppl5 <= abs_value_ppl4;
            abs_value_ppl6 <= abs_value_ppl5;
            
        end
    end

    //logic of control registers
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            flag <= 0;
            flag_available <= 0;
            sign_bit_out <= 0;
            abs_value_out <= 0;
        end else begin
            if(pipeline[4][sign] == 1 ) begin
                flag <= flag_reg_ppl2;
                flag_available <= 1;
                sign_bit_out <= sign_bit_ppl6;
                abs_value_out <= abs_value_ppl6;
            end else begin
                flag <= 0;
                flag_available <= 0;
                sign_bit_out <= sign_bit_ppl6;
                abs_value_out <= abs_value_ppl6;
            end
        end
    end
    
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            flag_reg_ppl2 <= 0;
        end else begin
            if(pipeline[3][sign] == 1 ) begin
                flag_reg_ppl2[z1] <= flag_reg_ppl1[z1];
                flag_reg_ppl2[z2] <= flag_reg_ppl1[z2];
                flag_reg_ppl2[z4] <= flag_reg_ppl1[z4];
            end else begin


            end
        end
    end
    
/////flag[z1]//begin//////////////////////////////////// 
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            flag_reg_ppl1[z1] <= 0;
        end else begin
            if(pipeline[2][sign] == 1) begin
                flag_reg_ppl1[z1]  <=  !(pipeline[2][a] | pipeline[2][b] | pipeline[2][c] | pipeline[2][d]);
            end else begin
                flag_reg_ppl1[z1] <= 0;     
            end
        end
    end

    
/////flag[z4]//begin////////////////////////////////////  
    //z4_1
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z4_1<= 0;
        end else begin
            if(pipeline[0][sign] == 1) begin
                z4_1 <= pipeline[0][c]|pipeline[0][d];
            end
        end
    end
    
    //z4_2
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z4_2<= 0;
        end else begin
            if(pipeline[1][sign] == 1) begin
                z4_2 <= z4_1 & pipeline[1][b];
            end
        end
    end
    
    //flag_reg_ppl1[z4]
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            flag_reg_ppl1[z4]<= 0;
        end else begin
            if(pipeline[2][sign] == 1) begin
                flag_reg_ppl1[z4] <= z4_2|pipeline[2][a];
            end else begin
                flag_reg_ppl1[z4]<= 0;         
            end
        end
    end
  

/////flag[z2]//begin//////////////////////////////////// 
    //z2b1_1
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z2b1_1<= 0;
        end else begin
            if(pipeline[0][sign] == 1) begin
                z2b1_1 <= !(pipeline[0][a] | pipeline[0][b] | (~pipeline[0][c]) | pipeline[0][d]);
            end
        end
    end
    
    //z2b2_1
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z2b2_1<= 0;
        end else begin
            if(in_reg[sign] == 1) begin
                z2b2_1 <= in_reg[f] & in_reg[g];
            end
        end
    end
    
    //z2b2_2
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z2b2_2<= 0;
        end else begin
            if(pipeline[0][sign] == 1) begin
                z2b2_2 <= !(pipeline[0][e]|z2b2_1);
            end
        end
    end
   
    //z2_1
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z2_1<= 0;
        end else begin
            if(pipeline[1][sign] == 1) begin
                z2_1 <= z2b1_1 & z2b2_2;
            end
        end
    end   

    //z2_2   
    always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            z2_2<= 0;
        end else begin
            if(pipeline[1][sign] == 1) begin
                z2_2 <= !(pipeline[1][a] | pipeline[1][b] | pipeline[1][c] | (~pipeline[1][d]));
            end
        end
    end  
    
    //flag[z2]   
     always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            flag_reg_ppl1[z2]<= 0;
        end else begin
            if(pipeline[2][sign] == 1) begin
                flag_reg_ppl1[z2] <= z2_1|z2_2;
            end else begin
                flag_reg_ppl1[z2]<= 0;
            end
        end
    end    
    

/////flag[z3]//begin//////////////////////////////////// 
     always @(posedge clock or posedge reset) begin
        if(reset == 1) begin
            flag_reg_ppl1[z3]<= 0;
            flag_reg_ppl2[z3]<= 0;
        end else begin
            if(pipeline[3][sign] == 1) begin
                flag_reg_ppl2[z3] <= !(flag_reg_ppl1[z4] | flag_reg_ppl1[z2] | flag_reg_ppl1[z1]);
            end else begin
                flag_reg_ppl1[z3]<= 0;
            end
        end
    end    
    
  
endmodule