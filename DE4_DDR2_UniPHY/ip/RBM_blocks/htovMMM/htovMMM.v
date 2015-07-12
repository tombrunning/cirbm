module htovMMM (clk, reset, enable, data, w, dataout, dataout_available);

    parameter DATAWIDTH = 16;
    parameter BATCHSIZE = 16;
    
    parameter L1SIZE = 16;
    parameter L2SIZE = 8;
    parameter L3SIZE = 4;    
    parameter L4SIZE = 2;
    parameter L5SIZE = 1;

    input clk;
    input reset;
    input enable;// enable is used as indata_available

    input [BATCHSIZE-1:0] data;
    input [DATAWIDTH*BATCHSIZE-1:0] w;

    output wire [DATAWIDTH-1:0] dataout;
    output wire dataout_available;

    //Internal wires and regs
    wire [DATAWIDTH-1:0]w_split[BATCHSIZE-1:0];

    reg [DATAWIDTH-1:0]layer1[BATCHSIZE-1:0];
    reg [DATAWIDTH-1:0]layer2[L2SIZE-1:0];
    reg [DATAWIDTH-1:0]layer3[L3SIZE-1:0];
    reg [DATAWIDTH-1:0]layer4[L4SIZE-1:0];
    reg [DATAWIDTH-1:0]layer5;//L5SIZE-1 = 0
    
    reg dataout_available_ppl1;
    reg dataout_available_ppl2;
    reg dataout_available_ppl3;
    reg dataout_available_ppl4;
    reg dataout_available_ppl5;
    
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            dataout_available_ppl1 <= 0;
        end else begin
            if(enable == 1) begin
                dataout_available_ppl1 <= enable;
            end else begin
                dataout_available_ppl1 <= 0;
            end
        end
    end
    
    //split up data chunk
    genvar i;
    generate
    for (i=0;i<BATCHSIZE;i=i+1) begin
        assign w_split[i]=w[(i+1)*DATAWIDTH-1:i*DATAWIDTH];
    end
    endgenerate
    
    //layer 1    
    genvar l1_iter;
    for (l1_iter=0;l1_iter<L1SIZE;l1_iter=l1_iter+1) begin
        always @(posedge clk or posedge reset) begin   
            if(reset == 1) begin
                layer1[l1_iter] <= 0;
            end else begin
                if(enable == 1)begin        
                    if(data[l1_iter] == 1)begin
                        layer1[l1_iter] <= w_split[l1_iter];
                    end  else begin
                        layer1[l1_iter]  <= 0;
                    end             
                end
            end
        end
    end

    //layer 2
    genvar l2_iter;
    for (l2_iter=0;l2_iter<L2SIZE;l2_iter=l2_iter+1)begin
        always @(posedge clk or posedge reset) begin
            if(reset == 1) begin
                layer2[l2_iter] <= 0;
                dataout_available_ppl2 <= 0;
            end else begin
                if(dataout_available_ppl1 == 1)begin               
                    layer2[l2_iter] <= layer1[2*l2_iter+1] + layer1[2*l2_iter]; 
                    dataout_available_ppl2 <= dataout_available_ppl1;
                end else begin
                    dataout_available_ppl2 <= 0;
                end
            end
        end
    end
  
    //layer 3
    genvar l3_iter;
    for (l3_iter=0;l3_iter<L3SIZE;l3_iter=l3_iter+1)begin
        always @(posedge clk or posedge reset) begin
            if(reset == 1) begin
                layer3[l3_iter] <= 0;
                dataout_available_ppl3 <= 0;
            end else begin
                if(dataout_available_ppl2 == 1)begin       
                    layer3[l3_iter] <= layer2[2*l3_iter+1] + layer2[2*l3_iter];
                    dataout_available_ppl3 <= dataout_available_ppl2;
                end else begin
                    dataout_available_ppl3 <= 0;
                end
            end
        end
    end

    //layer 4
    genvar l4_iter;
    for (l4_iter=0;l4_iter<L4SIZE;l4_iter=l4_iter+1)begin
        always @(posedge clk or posedge reset) begin
            if(reset == 1) begin
                layer4[l4_iter] <= 0;
                dataout_available_ppl4 <= 0;
            end else begin
                if(dataout_available_ppl3 == 1)begin    
                    layer4[l4_iter] <= layer3[2*l4_iter+1] + layer3[2*l4_iter];  
                    dataout_available_ppl4 <= dataout_available_ppl3;
                end else begin
                    dataout_available_ppl4 <= 0;
                end
            end
        end
    end

    //layer5
    always @(posedge clk or posedge reset) begin
        if(reset == 1) begin
            layer5 <= 0;
            dataout_available_ppl5 <= 0;
        end else begin
            if(dataout_available_ppl4 == 1)begin                
                layer5 <= layer4[1] + layer4[0];  
                dataout_available_ppl5 <= dataout_available_ppl4;
            end else begin
                dataout_available_ppl5 <= 0;
            end
        end
    end

    assign dataout = layer5;   
    assign dataout_available = dataout_available_ppl5;

endmodule 
