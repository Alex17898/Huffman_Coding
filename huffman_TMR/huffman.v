`timescale 1ns/10ps
`include    "./huffmanO.v"
`include    "./voter.v"
`include    "./vote.v"

module  huffman (clk, reset, gray_valid, gray_data,  CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, 
code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6);
input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output CNT_valid;
output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output code_valid;
output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output [7:0] M1, M2, M3, M4, M5, M6;
wire    [7:0] CNT1a, CNT2a, CNT3a, CNT4a, CNT5a, CNT6a, 
HC1a, HC2a, HC3a, HC4a, HC5a, HC6a, M1a, M2a, M3a, M4a, M5a, M6a, CNT1b, CNT2b, CNT3b, CNT4b, CNT5b, CNT6b, 
HC1b, HC2b, HC3b, HC4b, HC5b, HC6b, M1b, M2b, M3b, M4b, M5b, M6b, CNT1c, CNT2c, CNT3c, CNT4c, CNT5c, CNT6c, 
HC1c, HC2c, HC3c, HC4c, HC5c, HC6c, M1c, M2c, M3c, M4c, M5c, M6c;
wire    CNT_valida, CNT_validb, CNT_validc, code_valida, code_validb, code_validc;

wire [7:0] gray_dataE; 

huffman0 a ( clk, reset, gray_valid, gray_data, CNT_valida, CNT1a, CNT2a, CNT3a, CNT4a, CNT5a, CNT6a, 
code_valida, HC1a, HC2a, HC3a, HC4a, HC5a, HC6a, M1a, M2a, M3a, M4a, M5a, M6a);

huffman0 b ( clk, reset, gray_valid, gray_data, CNT_validb, CNT1b, CNT2b, CNT3b, CNT4b, CNT5b, CNT6b, 
code_validb, HC1b, HC2b, HC3b, HC4b, HC5b, HC6b, M1b, M2b, M3b, M4b, M5b, M6b);

huffman0 c ( clk, reset, gray_valid, gray_dataE, CNT_validc, CNT1c, CNT2c, CNT3c, CNT4c, CNT5c, CNT6c, 
code_validc, HC1c, HC2c, HC3c, HC4c, HC5c, HC6c, M1c, M2c, M3c, M4c, M5c, M6c);


voter cnt1 (CNT1a,CNT1b,CNT1c,CNT1);
voter cnt2 (CNT2a,CNT2b,CNT2c,CNT2);
voter cnt3 (CNT3a,CNT3b,CNT3c,CNT3);
voter cnt4 (CNT4a,CNT4b,CNT4c,CNT4);
voter cnt5 (CNT5a,CNT5b,CNT5c,CNT5);
voter cnt6 (CNT6a,CNT6b,CNT6c,CNT6);

voter hc1 (HC1a,HC1b,HC1c,HC1);
voter hc2 (HC2a,HC2b,HC2c,HC2);
voter hc3 (HC3a,HC3b,HC3c,HC3);
voter hc4 (HC4a,HC4b,HC4c,HC4);
voter hc5 (HC5a,HC5b,HC5c,HC5);
voter hc6 (HC6a,HC6b,HC6c,HC6);

voter m1 (M1a,M1b,M1c,M1);
voter m2 (M2a,M2b,M2c,M2);
voter m3 (M3a,M3b,M3c,M3);
voter m4 (M4a,M4b,M4c,M4);
voter m5 (M5a,M5b,M5c,M5);
voter m6 (M6a,M6b,M6c,M6);

vote codeV (code_valida, code_validb, code_validc, code_valid);
vote cntV (CNT_valida, CNT_validb, CNT_validc, CNT_valid);

assign gray_dataE = 8'b0;

endmodule