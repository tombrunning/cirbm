module DTXY(clock,reset,enable,abs_in,flag,flag_available,abs_sign_in,abs_sigmoid_available,abs_sigmoid_out,dtxy_sign_bit_out);
    parameter DATA_WIDTH = 16;
    input  clock;
    input  reset;
    input  enable;
    input flag_available;
    input abs_sign_in;
    input [3:0] flag ;
    input [DATA_WIDTH-1:0]abs_in;
    output wire [DATA_WIDTH-1:0]abs_sigmoid_out;
    output wire abs_sigmoid_available;
    output wire dtxy_sign_bit_out;
    
    reg [DATA_WIDTH-1:0]abs_sigmoid_out_r;
    reg [DATA_WIDTH-1:0]abs_in_reg;
    reg [DATA_WIDTH-1:0]tmp;
    reg resultavailable_ppl1;
    reg resultavailable_ppl2;
    reg sign_bit_ppl1;
    reg sign_bit_ppl2;
    reg [3:0]flag_ppl1;
        
    always @(posedge clock) begin
        if(reset == 1) begin
            
            abs_in_reg      <= 0;
            resultavailable_ppl1 <= 0;
            
            sign_bit_ppl1 <= 0;
            flag_ppl1 <= 0;
            tmp <= 0;
        end else if (enable == 1) begin
        
            abs_in_reg <= abs_in;        
            resultavailable_ppl1 <= flag_available; 
            sign_bit_ppl1 <= abs_sign_in;
            flag_ppl1 <= flag;

            
            if(flag_available == 1) begin
                if(flag == 4'b0001)begin
                    tmp <= 16'b0000_0000_0000_0001;
                    //abs_sigmoid_out_r <= tmp;
                end
                if(flag == 4'b0010) begin
                    tmp <= (abs_in_reg>>5);
                    //abs_sigmoid_out_r <= tmp + 16'b 0000011011000000;
                end
                if(flag == 4'b0100) begin
                    tmp <= (abs_in_reg>>3);
                    //abs_sigmoid_out_r <= tmp + 16'b 0000010100000000;
                end
                if(flag == 4'b1000) begin
                    tmp <= (abs_in_reg>>2);
                    //abs_sigmoid_out_r <= tmp + 16'b 0000010000000000;
                end                         
            end

            
        end else begin
            resultavailable_ppl1 <= 0;
            //sign_bit_ppl1 <= abs_sign_in;
            //sign_bit_ppl2 <= sign_bit_ppl1;
        end
        
    end
    
    always @(posedge clock or posedge reset) begin
        if(reset == 1)begin
        
            sign_bit_ppl2 <= 0;
            abs_sigmoid_out_r <= 0;
            resultavailable_ppl2 <= 0;
            
        end else begin
            if (resultavailable_ppl1 == 1) begin
            
                resultavailable_ppl2 <= resultavailable_ppl1;
                sign_bit_ppl2 <= sign_bit_ppl1;
                
                if(flag_ppl1 == 4'b0001)begin
                    //tmp <= 16'b0000_0000_0000_0001;
                    abs_sigmoid_out_r <= tmp;
                end
                if(flag_ppl1 == 4'b0010) begin
                    //tmp <= (abs_in_reg>>5);
                    abs_sigmoid_out_r <= tmp + 16'b 0000011011000000;
                end
                if(flag_ppl1 == 4'b0100) begin
                    //tmp <= (abs_in_reg>>3);
                    abs_sigmoid_out_r <= tmp + 16'b 0000010100000000;
                end
                if(flag_ppl1 == 4'b1000) begin
                    //tmp <= (abs_in_reg>>2);
                    abs_sigmoid_out_r <= tmp + 16'b 0000010000000000;
                end  
            end else begin
                resultavailable_ppl2 <= 0;
            end
        end
    end

    assign abs_sigmoid_out = abs_sigmoid_out_r;
    assign abs_sigmoid_available = resultavailable_ppl2;
    assign dtxy_sign_bit_out = sign_bit_ppl2;
    
endmodule
