`timescale 1ns/10ps
module CNT(clk,reset,gray_valid,gray_data,CNT1,CNT2,CNT3,CNT4,CNT5,CNT6,CNT_end);
input clk;
input reset;
input gray_valid;
input [7:0]gray_data;
output CNT_end;
output [7:0]CNT1,CNT2,CNT3,CNT4,CNT5,CNT6;
reg CNT_end;
reg [7:0]CNT1,CNT2,CNT3,CNT4,CNT5,CNT6;
always@(posedge clk or posedge reset)begin
 if(reset)begin
	CNT1<=8'd0;
	CNT2<=8'd0;
	CNT3<=8'd0;
	CNT4<=8'd0;
	CNT5<=8'd0;
	CNT6<=8'd0;
	CNT_end<=1'd0;
 end
 else if(gray_valid==1'd1) begin
    case(gray_data)
	  8'd1:CNT1<=CNT1+8'd1;
	  8'd2:CNT2<=CNT2+8'd1;
	  8'd3:CNT3<=CNT3+8'd1;
	  8'd4:CNT4<=CNT4+8'd1;
	  8'd5:CNT5<=CNT5+8'd1;
	  8'd6:CNT6<=CNT6+8'd1;
	endcase
 end
 else if(CNT1+CNT2+CNT3+CNT4+CNT5+CNT6==8'd100) begin
    CNT_end<=1'd1;
 end
end
endmodule