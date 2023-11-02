`timescale 1ns/10ps
`include 	"./CNT.v"
`include 	"./Sort.v"
`include 	"./split.v"
`include 	"./Control.v"
module huffman(clk, reset, gray_data,gray_valid, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6,M1, M2, M3, M4, M5, M6);

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output CNT_valid;
output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output code_valid;
output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output [7:0] M1, M2, M3, M4, M5, M6;
wire CNT_end,count_en,sort_end;
wire [14:0]Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6;
wire [3:0]state;
CNT U0(clk,reset,gray_valid,gray_data,CNT1,CNT2,CNT3,CNT4,CNT5,CNT6,CNT_end);
Sort U1(clk,reset,count_en,CNT_valid,state,CNT1,CNT2,CNT3,CNT4,CNT5,CNT6,sort_end,Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6);
split U2(clk,reset,sort_end,state,Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6,M1,M2,M3,M4,M5,M6,HC1,HC2,HC3,HC4,HC5,HC6);
Control U3(clk,reset,CNT_end,sort_end,CNT_valid,count_en,state,code_valid);
endmodule

