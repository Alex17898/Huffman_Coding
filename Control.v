`timescale 1ns/10ps

module Control(clk,reset,CNT_end,sort_end,CNT_valid,count_en,state,code_valid);
input clk,reset,CNT_end,sort_end;
output CNT_valid,count_en,code_valid;
output [3:0]state;
reg	[3:0]	state, next_state;



parameter s0=4'd0, s1=4'd1, s2=4'd2, s3=4'd3, s4=4'd4;
parameter s5=4'd5, s6=4'd6, s7=4'd7, s8=4'd8, s9=4'd9, s10=4'd10;
parameter s11=4'd11, s12=4'd12;

// Sequential
always@(posedge clk or posedge reset)begin
	if (reset)
	state<=s0;
	else
	state<=next_state;
end

// Combinational
always@(*) begin
	case(state)
	s0:next_state = (CNT_end)?s1:s0;
	s1:next_state = s2;  //CNT_valid
	s2:next_state = (sort_end)?s3:s2;  //sort
	s3:next_state = s4;  //c1
	s4:next_state = (sort_end)?s5:s4;  //c1 sort
	s5:next_state = s6;  //c2
	s6:next_state = (sort_end)?s7:s6;  //c2 sort
	s7:next_state = s8;  //c3
	s8:next_state = (sort_end)?s9:s8;  //c3 sort
	s9:next_state = s10;  //c4
	s10:next_state = (sort_end)?s11:s10;  //c4 sort
	s11:next_state = s12;  //split
	s12:next_state = s0;
	default:next_state = s0;
	endcase
end

assign CNT_valid=(state==s1)?1'd1:1'd0;
assign count_en=(state==s2||state==s4||state==s6||state==s8||state==s10)?1'd1:1'd0;
assign code_valid=(state==s12)?1'd1:1'd0;
endmodule