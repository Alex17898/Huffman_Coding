`timescale 1ns/10ps
`include    "./sort.v"

module huffman0 ( clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, 
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
//===================================================================



parameter state_reset=4'd0;
parameter state_count=4'd1;
parameter state_sort1=4'd2;
parameter state_sort2=4'd3;
parameter state_sort3=4'd4;
parameter state_sort4=4'd5;
parameter state_split1=4'd6;
parameter state_split2=4'd7;
parameter state_split3=4'd8;
parameter state_split4=4'd9;
parameter state_split5=4'd10;
parameter state_complete=4'd11;

//distribution type
parameter typeA = 2'd0;//4 1 1
parameter typeB = 2'd1;//3 2 1
parameter typeC = 2'd2;//2 2 2

//
reg         CNT_valid;
reg  [7:0]  CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
reg         code_valid;
reg  [3:0]  state,next_state;
reg         next_CNT_valid,next_code_valid,start,next_start;
wire [7:0]  next_CNT1 , next_CNT2 , next_CNT3 , next_CNT4 , next_CNT5 , next_CNT6;
reg  [5:0]  plus;
reg  [7:0]  In1,In2,In3,In4,In5,In6;
wire [5:0]  c1 , c1_1 , c1_2;
wire [7:0]  group1,group2;
wire        wr1;
wire [5:0]  c2 , c2_1 , c2_2 , erase1;
wire        overlap;
wire [5:0]  two_group;
wire        single_arbiter;
wire [5:0]  single1;
wire        wr2;  
wire        wr3;
wire [5:0]  c3 , c3_1 , c3_2 , erase2;
wire [7:0]  group3;
wire [5:0]  option1 , option2;
reg  [5:0]  option3;
reg  [1:0]  distribution_type;
wire [2:0]  count_c1 , count_c2 , count_c3;
wire        standard_type2;
wire [5:0]  c4_1 , c4_2;
wire [5:0]  c4;
wire [7:0]  group4;
wire        sort_complete;
wire [7:0]  Out1,Out2;
wire [7:0]  CNT1_1 , CNT2_1 , CNT3_1 , CNT4_1 , CNT5_1 , CNT6_1;
wire [7:0]  CNT1_2 , CNT2_2 , CNT3_2 , CNT4_2 , CNT5_2 , CNT6_2;
wire [7:0]  CNT1_3 , CNT2_3 , CNT3_3 , CNT4_3 , CNT5_3 , CNT6_3;
wire [7:0]  CNT1_4 , CNT2_4 , CNT3_4 , CNT4_4 , CNT5_4 , CNT6_4;
reg  [5:0]  left , right;
wire [7:0]  next_HC1 , next_HC2 , next_HC3 , next_HC4 , next_HC5 , next_HC6;
wire [7:0]  next_M1 , next_M2 , next_M3 , next_M4 , next_M5 , next_M6;
reg  [5:0]  push , push_value;  
wire [7:0]  CNT1_encoder, CNT2_encoder, CNT3_encoder, CNT4_encoder, CNT5_encoder, CNT6_encoder;  
wire [7:0]  group1_encoder,group2_encoder,group3_encoder;
wire [5:0]  enable_encoder_CNT;
reg  [2:0]  encoder_group;
wire        larger;

//FSM
always@(posedge clk,posedge reset)
if(reset)
	begin
	state<=state_reset;
	CNT_valid<=1'b0;
	code_valid<=1'b0;
	start <= 1'b0;
	end
else
	begin
	state<=next_state;
	CNT_valid<=next_CNT_valid;
	code_valid<=next_code_valid;
	start <= next_start;
	end
	
always@(*)  //state stansition
begin
case(state)
state_reset:
	begin
	next_state = (gray_valid==1)?state_count:state_reset;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
state_count:
	begin
	next_state = (gray_valid==0)?state_sort1:state_count;
	next_CNT_valid = (gray_valid==0)?1'b1:1'b0;
	next_code_valid= 1'b0;
	next_start= (gray_valid==0)?1'b1:1'b0;
	end
state_sort1:
	begin
	next_state = (sort_complete==1)?state_sort2:state_sort1;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start= (sort_complete==1)?1'b1:1'b0;
	end
state_sort2:
	begin
	next_state = (sort_complete==1)?state_sort3:state_sort2;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start= (sort_complete==1)?1'b1:1'b0;
	end
state_sort3:
	begin
	next_state = (sort_complete==1)?state_sort4:state_sort3;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start= (sort_complete==1)?1'b1:1'b0;
	end
state_sort4:
	begin
	next_state = (sort_complete==1)?state_split1:state_sort4;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
state_split1:
	begin
	next_state = state_split2;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
state_split2:
	begin
	next_state = state_split3;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
state_split3:
	begin
	next_state = state_split4;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
state_split4:
	begin
	next_state =state_split5;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
state_split5:
	begin
	next_state = state_complete;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b1;
	next_start=1'b0;
	end
state_complete:
	begin
	next_state = state_complete;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
default:
	begin
	next_state = state_reset;
	next_CNT_valid = 1'b0;
	next_code_valid= 1'b0;
	next_start=1'b0;
	end
endcase
end	
	
//count the input	
always @(posedge clk , posedge reset)
if(reset==1)
	begin
	CNT1<=8'b0;
	CNT2<=8'b0;
	CNT3<=8'b0;
	CNT4<=8'b0;
	CNT5<=8'b0;
	CNT6<=8'b0;
	end
else
	begin
	CNT1<=next_CNT1;
	CNT2<=next_CNT2;
	CNT3<=next_CNT3;
	CNT4<=next_CNT4;
	CNT5<=next_CNT5;
	CNT6<=next_CNT6;
	end
	
assign next_CNT1 = CNT1 + plus[0];
assign next_CNT2 = CNT2 + plus[1];
assign next_CNT3 = CNT3 + plus[2];
assign next_CNT4 = CNT4 + plus[3];
assign next_CNT5 = CNT5 + plus[4];
assign next_CNT6 = CNT6 + plus[5];
//encoder 
always@(*)
begin
if(gray_valid ==1)
	begin
	plus[0] = (gray_data[2:0] == 3'd1);
	plus[1] = (gray_data[2:0] == 3'd2);
	plus[2] = (gray_data[2:0] == 3'd3);
	plus[3] = (gray_data[2:0] == 3'd4);
	plus[4] = (gray_data[2:0] == 3'd5);
	plus[5] = (gray_data[2:0] == 3'd6);
	end
else
	begin
	plus = 6'd0;
	end	
end	
	
	
	
	
	
	
	
	
	
	
//the input of sorting
always@(*) 
begin
case(state)
state_sort1:
	begin
	In1 = CNT1;
	In2 = CNT2;
	In3 = CNT3;
	In4 = CNT4;
	In5 = CNT5;
	In6 = CNT6;
	encoder_group = 3'd0;
	end
state_sort2:
	begin
	In1 = (c1_1[0])?group1:(c1_2[0])?8'd101:CNT1;
	In2 = (c1_1[1])?group1:(c1_2[1])?8'd101:CNT2;
	In3 = (c1_1[2])?group1:(c1_2[2])?8'd101:CNT3;
	In4 = (c1_1[3])?group1:(c1_2[3])?8'd101:CNT4;
	In5 = (c1_1[4])?group1:(c1_2[4])?8'd101:CNT5;
	In6 = (c1_1[4])?group1:(c1_2[5])?8'd101:CNT6;
	encoder_group = 3'b001;
	end
state_sort3:
	begin
	
	In1 = (single1[0])?group2:(two_group[0])?group1:(erase1[0])?8'd101:CNT1;
	In2 = (single1[1])?group2:(two_group[1])?group1:(erase1[1])?8'd101:CNT2;
	In3 = (single1[2])?group2:(two_group[2])?group1:(erase1[2])?8'd101:CNT3;
	In4 = (single1[3])?group2:(two_group[3])?group1:(erase1[3])?8'd101:CNT4;
	In5 = (single1[4])?group2:(two_group[4])?group1:(erase1[4])?8'd101:CNT5;
	In6 = (single1[5])?group2:(two_group[5])?group1:(erase1[5])?8'd101:CNT6;
	encoder_group = {1'b0,|(single1),|two_group};
	end
	
state_sort4:
	begin
	case(distribution_type)
		typeA://4 1 1 
			begin
			In1 = (c1_1[0])?group3:(c3[0])?8'd101:CNT1;
			In2 = (c1_1[1])?group3:(c3[1])?8'd101:CNT2;
			In3 = (c1_1[2])?group3:(c3[2])?8'd101:CNT3;
			In4 = (c1_1[3])?group3:(c3[3])?8'd101:CNT4;
			In5 = (c1_1[4])?group3:(c3[4])?8'd101:CNT5;
			In6 = (c1_1[5])?group3:(c3[5])?8'd101:CNT6;
			encoder_group = 3'b100;
			end
		typeB: // 3 2 1 
			begin
			In1 = option1;
			In2 = option2;
			In3 = option3;
			In4 = 8'd101;
			In5 = 8'd101;
			In6 = 8'd101;
			encoder_group = {3'b1,~larger,larger};
			end
		typeC: //2 2 2
			begin
			In1 = group1;
			In2 = group2;
			In3 = group3;
			In4 = 8'd101;
			In5 = 8'd101;
			In6 = 8'd101;
			encoder_group = 3'b111;
			end
		default:
			begin
			In1 = 8'b0;
			In2 = 8'b0;
			In3 = 8'b0;
			In4 = 8'b0;
			In5 = 8'b0;
			In6 = 8'b0;
			encoder_group = 3'b000;
			end
	endcase
	end
default:
begin
	In1 = 8'b0;
	In2 = 8'b0;
	In3 = 8'b0;
	In4 = 8'b0;
	In5 = 8'b0;
	In6 = 8'b0;
	encoder_group = 3'b000;
	end
endcase
end

	
	



//the flip flop that save the each compine in each sort	
DFF_6 C1_1 (left,clk,reset,wr1,c1_1);
DFF_6 C1_2 (right,clk,reset,wr1,c1_2);
assign c1 = c1_1|c1_2;
assign group1 = CNT1_1 + CNT2_1 + CNT3_1+ CNT4_1 + CNT5_1+CNT6_1;
assign wr1 = (state ==state_sort1);

DFF_6 C2_1 (left,clk,reset,wr2,c2_1);
DFF_6 C2_2 (right,clk,reset,wr2,c2_2);
assign c2 = c2_1 | c2_2;
assign  erase1= c2 | c1;
assign overlap = ~|(c1&c2);
assign two_group = { c1_1[5]&overlap , c1_1[4]&overlap , c1_1[3]&overlap , c1_1[2]&overlap , c1_1[1]&overlap , c1_1[0]&overlap};
assign group2 = CNT1_2 +CNT2_2 + CNT3_2 + CNT4_2 + CNT5_2 +CNT6_2;
assign single1_arbiter = (c2_1[0]&c2_1[1])|(c2_1[0]&c2_1[2])|(c2_1[0]&c2_1[3])|(c2_1[0]&c2_1[4])|(c2_1[0]&c2_1[5])|(c2_1[1]&c2_1[2])|
						(c2_1[1]&c2_1[3])|(c2_1[1]&c2_1[4])|(c2_1[1]&c2_1[5])|(c2_1[2]&c2_1[3])|(c2_1[2]&c2_1[4])|(c2_1[2]&c2_1[5])|
						(c2_1[3]&c2_1[4])|(c2_1[3]&c2_1[5])|(c2_1[4]&c2_1[5]);
assign single1 =(single1_arbiter==1)?c2_2:c2_1;
assign wr2 = (state ==state_sort2);

DFF_6 C3_1 (left,clk,reset,wr3,c3_1);
DFF_6 C3_2 (right,clk,reset,wr3,c3_2);

assign wr3 = (state ==state_sort3);
	
//typeA: 4 1 1
assign c3 = c3_1 | c3_2;
assign group3 = CNT1_3 + CNT2_3 + CNT3_3 + CNT4_3 + CNT5_3 + CNT6_3;

//typeB: 3 2 1
assign option1 = group3;
assign option2 = (larger==1)?group1:group2;
assign larger = group1 > group2;
assign erase2 = ~(erase1| c3);
always@(*)
begin
	 if(erase2[0]==0) 
			option3 = CNT1;
else if(erase2[1]==0) 
			option3 = CNT2;
else if(erase2[2]==0) 
			option3 = CNT3;
else if(erase2[3]==0) 
			option3 = CNT4;
else if(erase2[4]==0) 
			option3 = CNT5;
else if(erase2[5]==0) 
			option3 = CNT6;
else  
			option3 = 8'b0;
			
//decide the type
if(count_c3 ==3'd4)
	distribution_type =2'd0;
else if(standard_type2)
	distribution_type =2'd1;
else
	distribution_type =2'd3;
	
end

assign count_c3 = c3[0] +c3[1]+c3[2] +c3[3]+c3[4] +c3[5];
assign count_c2 = c2[0] +c2[1]+c2[2] +c2[3]+c2[4] +c2[5];
assign count_c1 = c1[0] +c1[1]+c1[2] +c1[3]+c1[4] +c1[5];
assign standard_type2 = (count_c2 ==3'd3) |(count_c3 ==3'd3);


DFF_6 C4_1 (left,clk,reset,wr4,c4_1);
DFF_6 C4_2 (right,clk,reset,wr4,c4_2);

assign wr4 = (state ==state_sort4);
assign c4 = c4_1 | c4_2;
assign group4 = CNT1_4 + CNT2_4 + CNT3_4 + CNT4_4 + CNT5_4 + CNT6_4;
	
sort  sorting (In1,In2,In3,In4,In5,In6,reset,Out1,Out2,sort_complete,clk,start);
	
	
assign CNT1_1 = (c1[0]==1)?CNT1:8'b0;
assign CNT2_1 = (c1[1]==1)?CNT2:8'b0;
assign CNT3_1 = (c1[2]==1)?CNT3:8'b0;
assign CNT4_1 = (c1[3]==1)?CNT4:8'b0;
assign CNT5_1 = (c1[4]==1)?CNT5:8'b0;
assign CNT6_1 = (c1[5]==1)?CNT6:8'b0;	
	
assign CNT1_2 = (c2[0]==1)?CNT1:8'b0;
assign CNT2_2 = (c2[1]==1)?CNT2:8'b0;
assign CNT3_2 = (c2[2]==1)?CNT3:8'b0;
assign CNT4_2 = (c2[3]==1)?CNT4:8'b0;
assign CNT5_2 = (c2[4]==1)?CNT5:8'b0;
assign CNT6_2 = (c2[5]==1)?CNT6:8'b0;

assign CNT1_3 = (c3[0]==1)?CNT1:8'b0;
assign CNT2_3 = (c3[1]==1)?CNT2:8'b0;
assign CNT3_3 = (c3[2]==1)?CNT3:8'b0;
assign CNT4_3 = (c3[3]==1)?CNT4:8'b0;
assign CNT5_3 = (c3[4]==1)?CNT5:8'b0;
assign CNT6_3 = (c3[5]==1)?CNT6:8'b0;


assign CNT1_4 = (c4[0]==1)?CNT1:8'b0;
assign CNT2_4 = (c4[1]==1)?CNT2:8'b0;
assign CNT3_4 = (c4[2]==1)?CNT3:8'b0;
assign CNT4_4 = (c4[3]==1)?CNT4:8'b0;
assign CNT5_4 = (c4[4]==1)?CNT5:8'b0;
assign CNT6_4 = (c4[5]==1)?CNT6:8'b0;		
	
assign CNT1_encoder = (enable_encoder_CNT[0])?CNT1:8'd168;
assign CNT2_encoder = (enable_encoder_CNT[1])?CNT2:8'd168;
assign CNT3_encoder = (enable_encoder_CNT[2])?CNT3:8'd168;
assign CNT4_encoder = (enable_encoder_CNT[3])?CNT4:8'd168;
assign CNT5_encoder = (enable_encoder_CNT[4])?CNT5:8'd168;
assign CNT6_encoder = (enable_encoder_CNT[5])?CNT6:8'd168;
assign group1_encoder = (encoder_group[0])? group1:8'd168;
assign group2_encoder = (encoder_group[1])? group2:8'd168;
assign group3_encoder = (encoder_group[2])? group3:8'd168;
assign enable_encoder_CNT = ~(c1|c2|c3|c4) ;
//decoder  Out1 is the smellest	
always@(*)
begin
if(sort_complete==0)
left =8'd0;
else
begin
if(Out1 == group1_encoder)
	left=c1;
	else if(Out1 == group2_encoder)
	left=c2;
	else if(Out1 == group3_encoder)
	left=c3;
	else 
		begin
		if(Out1==CNT6_encoder)
		left=6'b100_000;
		else if(Out1==CNT5_encoder)
		left=6'b010_000;
		else if(Out1==CNT4_encoder)
		left=6'b001_000;
		else if(Out1==CNT3_encoder)
		left=6'b000_100;
		else if(Out1==CNT2_encoder)
		left=6'b000_010;
		else if(Out1==CNT1_encoder)
		left=6'b000_001;
		else 
		left=7'd127;
		end
end

if (sort_complete==0)
right = 8'd0;
else
begin
 if(Out2==CNT6_encoder)
	right=6'b100_000;
	else if(Out2==CNT5_encoder)
	right=6'b010_000;
	else if(Out2==CNT4_encoder)
	right=6'b001_000;
	else if(Out2==CNT3_encoder)
	right=6'b000_100;
	else if(Out2==CNT2_encoder)
	right=6'b000_010;
	else if(Out2==CNT1_encoder)
	right=6'b000_001;	
	else
		begin
		if(Out2==group1_encoder)
		right=c1;
		else if(Out2==group2_encoder)
		right=c2;
		else if(Out2==group3_encoder)
		right=c3;
		else 
		right=8'd127;
		end
end
end	

//the split circuit	
DFF_8 hc1(next_HC1,clk,reset,push[0],HC1);
DFF_8 hc2(next_HC2,clk,reset,push[1],HC2);
DFF_8 hc3(next_HC3,clk,reset,push[2],HC3);
DFF_8 hc4(next_HC4,clk,reset,push[3],HC4);
DFF_8 hc5(next_HC5,clk,reset,push[4],HC5);
DFF_8 hc6(next_HC6,clk,reset,push[5],HC6);	

assign next_HC1 = {HC1[6:0],push_value[0]};
assign next_HC2 = {HC2[6:0],push_value[1]};
assign next_HC3 = {HC3[6:0],push_value[2]};
assign next_HC4 = {HC4[6:0],push_value[3]};
assign next_HC5 = {HC5[6:0],push_value[4]};
assign next_HC6 = {HC6[6:0],push_value[5]};	


DFF_8 m1(next_M1,clk,reset,push[0],M1);
DFF_8 m2(next_M2,clk,reset,push[1],M2);
DFF_8 m3(next_M3,clk,reset,push[2],M3);
DFF_8 m4(next_M4,clk,reset,push[3],M4);
DFF_8 m5(next_M5,clk,reset,push[4],M5);
DFF_8 m6(next_M6,clk,reset,push[5],M6);

assign next_M1 = {M1[6:0],1'b1};
assign next_M2 = {M2[6:0],1'b1};
assign next_M3 = {M3[6:0],1'b1};
assign next_M4 = {M4[6:0],1'b1};
assign next_M5 = {M5[6:0],1'b1};
assign next_M6 = {M6[6:0],1'b1};

always@(*)
case(state)
state_split1:
	begin
	push = 6'b111_111;
	push_value = (group4<50)?c4:~c4;
	end
state_split2:
	begin
	push = c4;
	push_value = c4_1;
	end
state_split3:
	begin
	push = c3;
	push_value = c3_1;
	end
state_split4:
	begin
	push = c2;
	push_value = c2_1;
	end
state_split5:
	begin
	push = c1;
	push_value = c1_1;
	end
default:
	begin
	push = 6'b0;
	push_value = 6'b0;
	end
endcase	
endmodule
//=========================================================================================================================
module DFF_6 (Din,clk,reset,wr,Dout);//save the point that combine
input [5:0] Din;
input clk,wr,reset;
output [5:0] Dout;
reg [5:0] Dout;


always @( posedge clk,posedge reset)
if (reset)
Dout<=6'b0;
else
Dout<=(wr)?Din:Dout;


endmodule


//=========================================================================================================================
module DFF_8 (Din,clk,reset,wr,Dout);//save the HC1 M1
input [7:0] Din;
input clk,wr,reset;
output [7:0] Dout;
reg [7:0] Dout;


always @( posedge clk,posedge reset)
if (reset)
Dout<=8'b0;
else
Dout<=(wr)?Din:Dout;


endmodule	



