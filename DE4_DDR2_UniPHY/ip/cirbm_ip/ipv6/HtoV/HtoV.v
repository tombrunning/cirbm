module HtoV(negdatastates,negclassesstates,clk,reset,nhstate,W_Wc);
`include "param.v"

input wire [COMPONENT_NUMBER-1:0] nhstate;
input wire [BATCH_WIDTH-1:0]W_Wc;
output reg [COMPONENT_NUMBER-1:0]negdatastates;
output reg [COMPONENT_NUMBER-1:0]negclassesstates;

wire [COMPONENT_WIDTH-1:0]partial_sum_htov1;
wire [COMPONENT_WIDTH-1:0]partial_sum_htov2;
wire [COMPONENT_WIDTH-1:0]negdata;
wire [COMPONENT_WIDTH-1:0]negclasses;
wire [COMPONENT_WIDTH-1:0]rnd_vec1;
wire [COMPONENT_WIDTH-1:0]rnd_vec2;
split W_Wc to W and Wc;

net_mm_mul inst_nhstate_W_mm(.clk(clk),.reset(reset),.matrix_element(partial_sum_htov1),.w(W),.x(nhstate));
sigmoid_n  inst_sigmoid_negdata(clk,reset,negdata,partial_sum_htov1);
random_vec_generator_n inst_random_vec_generator_n(clk,reset,rnd_vec1);
rnd_cmp_n  inst_rnd_cmp_n(clk,reset,negdatastates,negdata,rnd_vec1);

net_mm_mul inst_nhstate_Wc_mm(.clk(clk),.reset(reset),.matrix_element(partial_sum_htov2),.w(Wc),.x(nhstate));
sigmoid_n  inst_sigmoid_negclasses(clk,reset,negclasses,partial_sum_htov2);
random_vec_generator_n inst_random_vec_generator_n(clk,reset,rnd_vec2);
rnd_cmp_n  inst_rnd_cmp_n(clk,reset,negclassesstates,negclasses,rnd_vec2);