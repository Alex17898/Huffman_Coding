`timescale 1ns/10ps
module split(clk,reset,sort_end,state,Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6,M1,M2,M3,M4,M5,M6,HC1,HC2,HC3,HC4,HC5,HC6);
input clk,reset,sort_end;
input [3:0]state;
input [14:0]Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6;
output [7:0]M1,M2,M3,M4,M5,M6;
output [7:0]HC1,HC2,HC3,HC4,HC5,HC6;
reg [7:0]HC1,HC2,HC3,HC4,HC5,HC6;
reg [7:0]M1,M2,M3,M4,M5,M6;
reg [2:0]count_M1,count_M2,count_M3,count_M4,count_M5,count_M6;
wire A1_Symbol1,A2_Symbol1,A3_Symbol1,A4_Symbol1,A5_Symbol1,A6_Symbol1;
wire A1_Symbol2,A2_Symbol2,A3_Symbol2,A4_Symbol2,A5_Symbol2,A6_Symbol2;
wire A1_Symbol3,A2_Symbol3,A3_Symbol3,A4_Symbol3,A5_Symbol3,A6_Symbol3;
wire A1_Symbol4,A2_Symbol4,A3_Symbol4,A4_Symbol4,A5_Symbol4,A6_Symbol4;
wire A1_Symbol5,A2_Symbol5,A3_Symbol5,A4_Symbol5,A5_Symbol5,A6_Symbol5;
wire A1_Symbol6,A2_Symbol6,A3_Symbol6,A4_Symbol6,A5_Symbol6,A6_Symbol6;
//HC
always@(posedge clk or posedge reset)begin
 if(reset)begin
   HC1<=8'd0;
   HC2<=8'd0;
   HC3<=8'd0;
   HC4<=8'd0;
   HC5<=8'd0;
   HC6<=8'd0;
 end
 else if((state==4'd2)&&sort_end)begin
   if(A1_Symbol5)begin
    HC1<={1'b0,HC1[7:1]};
   end
   else if(A1_Symbol6)begin
    HC1<={1'b1,HC1[7:1]};
   end
   else begin
    HC1<=HC1;
   end
   if(A2_Symbol5)begin
    HC2<={1'b0,HC2[7:1]};
   end
   else if(A2_Symbol6)begin
    HC2<={1'b1,HC2[7:1]};
   end
   else begin
    HC2<=HC2;
   end
   if(A3_Symbol5)begin
    HC3<={1'b0,HC3[7:1]};
   end
   else if(A3_Symbol6)begin
    HC3<={1'b1,HC3[7:1]};
   end
   else begin
    HC3<=HC3;
   end
   if(A4_Symbol5)begin
    HC4<={1'b0,HC4[7:1]};
   end
   else if(A4_Symbol6)begin
    HC4<={1'b1,HC4[7:1]};
   end
   else begin
    HC4<=HC4;
   end
   if(A5_Symbol5)begin
    HC5<={1'b0,HC5[7:1]};
   end
   else if(A5_Symbol6)begin
    HC5<={1'b1,HC5[7:1]};
   end
   else begin
    HC5<=HC5;
   end
   if(A6_Symbol5)begin
    HC6<={1'b0,HC6[7:1]};
   end
   else if(A6_Symbol6)begin
    HC6<={1'b1,HC6[7:1]};
   end
   else begin
    HC6<=HC6;
   end
   end
 else if((state==4'd4)&&sort_end)begin
   if(A1_Symbol4)begin
    HC1<={1'b0,HC1[7:1]};
   end
   else if(A1_Symbol5)begin
    HC1<={1'b1,HC1[7:1]};
   end
   else begin
    HC1<=HC1;
   end
   if(A2_Symbol4)begin
    HC2<={1'b0,HC2[7:1]};
   end
   else if(A2_Symbol5)begin
    HC2<={1'b1,HC2[7:1]};
   end
   else begin
    HC2<=HC2;
   end
   if(A3_Symbol4)begin
    HC3<={1'b0,HC3[7:1]};
   end
   else if(A3_Symbol5)begin
    HC3<={1'b1,HC3[7:1]};
   end
   else begin
    HC3<=HC3;
   end
   if(A4_Symbol4)begin
    HC4<={1'b0,HC4[7:1]};
   end
   else if(A4_Symbol5)begin
    HC4<={1'b1,HC4[7:1]};
   end
   else begin
    HC4<=HC4;
   end
   if(A5_Symbol4)begin
    HC5<={1'b0,HC5[7:1]};
   end
   else if(A5_Symbol5)begin
    HC5<={1'b1,HC5[7:1]};
   end
   else begin
    HC5<=HC5;
   end
   if(A6_Symbol4)begin
    HC6<={1'b0,HC6[7:1]};
   end
   else if(A6_Symbol5)begin
    HC6<={1'b1,HC6[7:1]};
   end
   else begin
    HC6<=HC6;
   end
 end
 else if((state==4'd6)&&sort_end)begin
   if(A1_Symbol3)begin
    HC1<={1'b0,HC1[7:1]};
   end
   else if(A1_Symbol4)begin
    HC1<={1'b1,HC1[7:1]};
   end
   else begin
    HC1<=HC1;
   end
   if(A2_Symbol3)begin
    HC2<={1'b0,HC2[7:1]};
   end
   else if(A2_Symbol4)begin
    HC2<={1'b1,HC2[7:1]};
   end
   else begin
    HC2<=HC2;
   end
   if(A3_Symbol3)begin
    HC3<={1'b0,HC3[7:1]};
   end
   else if(A3_Symbol4)begin
    HC3<={1'b1,HC3[7:1]};
   end
   else begin
    HC3<=HC3;
   end
   if(A4_Symbol3)begin
    HC4<={1'b0,HC4[7:1]};
   end
   else if(A4_Symbol4)begin
    HC4<={1'b1,HC4[7:1]};
   end
   else begin
    HC4<=HC4;
   end
   if(A5_Symbol3)begin
    HC5<={1'b0,HC5[7:1]};
   end
   else if(A5_Symbol4)begin
    HC5<={1'b1,HC5[7:1]};
   end
   else begin
    HC5<=HC5;
   end
   if(A6_Symbol3)begin
    HC6<={1'b0,HC6[7:1]};
   end
   else if(A6_Symbol4)begin
    HC6<={1'b1,HC6[7:1]};
   end
   else begin
    HC6<=HC6;
   end
 end
 else if((state==4'd8)&&sort_end)begin
   if(A1_Symbol2)begin
    HC1<={1'b0,HC1[7:1]};
   end
   else if(A1_Symbol3)begin
    HC1<={1'b1,HC1[7:1]};
   end
   else begin
    HC1<=HC1;
   end
   if(A2_Symbol2)begin
    HC2<={1'b0,HC2[7:1]};
   end
   else if(A2_Symbol3)begin
    HC2<={1'b1,HC2[7:1]};
   end
   else begin
    HC2<=HC2;
   end
   if(A3_Symbol2)begin
    HC3<={1'b0,HC3[7:1]};
   end
   else if(A3_Symbol3)begin
    HC3<={1'b1,HC3[7:1]};
   end
   else begin
    HC3<=HC3;
   end
   if(A4_Symbol2)begin
    HC4<={1'b0,HC4[7:1]};
   end
   else if(A4_Symbol3)begin
    HC4<={1'b1,HC4[7:1]};
   end
   else begin
    HC4<=HC4;
   end
   if(A5_Symbol2)begin
    HC5<={1'b0,HC5[7:1]};
   end
   else if(A5_Symbol3)begin
    HC5<={1'b1,HC5[7:1]};
   end
   else begin
    HC5<=HC5;
   end
   if(A6_Symbol2)begin
    HC6<={1'b0,HC6[7:1]};
   end
   else if(A6_Symbol3)begin
    HC6<={1'b1,HC6[7:1]};
   end
   else begin
    HC6<=HC6;
   end
 end
 else if((state==4'd10)&&sort_end)begin
   if(A1_Symbol1)begin
    HC1<={1'b0,HC1[7:1]};
   end
   else if(A1_Symbol2)begin
    HC1<={1'b1,HC1[7:1]};
   end
   else begin
    HC1<=HC1;
   end
   if(A2_Symbol1)begin
    HC2<={1'b0,HC2[7:1]};
   end
   else if(A2_Symbol2)begin
    HC2<={1'b1,HC2[7:1]};
   end
   else begin
    HC2<=HC2;
   end
   if(A3_Symbol1)begin
    HC3<={1'b0,HC3[7:1]};
   end
   else if(A3_Symbol2)begin
    HC3<={1'b1,HC3[7:1]};
   end
   else begin
    HC3<=HC3;
   end
   if(A4_Symbol1)begin
    HC4<={1'b0,HC4[7:1]};
   end
   else if(A4_Symbol2)begin
    HC4<={1'b1,HC4[7:1]};
   end
   else begin
    HC4<=HC4;
   end
   if(A5_Symbol1)begin
    HC5<={1'b0,HC5[7:1]};
   end
   else if(A5_Symbol2)begin
    HC5<={1'b1,HC5[7:1]};
   end
   else begin
    HC5<=HC5;
   end
   if(A6_Symbol1)begin
    HC6<={1'b0,HC6[7:1]};
   end
   else if(A6_Symbol2)begin
    HC6<={1'b1,HC6[7:1]};
   end
   else begin
    HC6<=HC6;
   end
 end
 else if((state==4'd11)&&sort_end)begin
   case(count_M1)
    3'd1:HC1<={7'd0,HC1[7]};
	3'd2:HC1<={6'd0,HC1[7:6]};
	3'd3:HC1<={5'd0,HC1[7:5]};
	3'd4:HC1<={4'd0,HC1[7:4]};
	3'd5:HC1<={3'd0,HC1[7:3]};
	3'd6:HC1<={2'd0,HC1[7:2]};
	default:HC1<=HC1;
   endcase
   case(count_M2)
    3'd1:HC2<={7'd0,HC2[7]};
	3'd2:HC2<={6'd0,HC2[7:6]};
	3'd3:HC2<={5'd0,HC2[7:5]};
	3'd4:HC2<={4'd0,HC2[7:4]};
	3'd5:HC2<={3'd0,HC2[7:3]};
	3'd6:HC2<={2'd0,HC2[7:2]};
	default:HC2<=HC2;
   endcase
   case(count_M3)
    3'd1:HC3<={7'd0,HC3[7]};
	3'd2:HC3<={6'd0,HC3[7:6]};
	3'd3:HC3<={5'd0,HC3[7:5]};
	3'd4:HC3<={4'd0,HC3[7:4]};
	3'd5:HC3<={3'd0,HC3[7:3]};
	3'd6:HC3<={2'd0,HC3[7:2]};
	default:HC3<=HC3;
   endcase
   case(count_M4)
    3'd1:HC4<={7'd0,HC4[7]};
	3'd2:HC4<={6'd0,HC4[7:6]};
	3'd3:HC4<={5'd0,HC4[7:5]};
	3'd4:HC4<={4'd0,HC4[7:4]};
	3'd5:HC4<={3'd0,HC4[7:3]};
	3'd6:HC4<={2'd0,HC4[7:2]};
	default:HC4<=HC4;
   endcase
   case(count_M5)
    3'd1:HC5<={7'd0,HC5[7]};
	3'd2:HC5<={6'd0,HC5[7:6]};
	3'd3:HC5<={5'd0,HC5[7:5]};
	3'd4:HC5<={4'd0,HC5[7:4]};
	3'd5:HC5<={3'd0,HC5[7:3]};
	3'd6:HC5<={2'd0,HC5[7:2]};
	default:HC5<=HC5;
   endcase
   case(count_M6)
    3'd1:HC6<={7'd0,HC6[7]};
	3'd2:HC6<={6'd0,HC6[7:6]};
	3'd3:HC6<={5'd0,HC6[7:5]};
	3'd4:HC6<={4'd0,HC6[7:4]};
	3'd5:HC6<={3'd0,HC6[7:3]};
	3'd6:HC6<={2'd0,HC6[7:2]};
	default:HC6<=HC6;
   endcase
 end
end

//M
always@(posedge clk or posedge reset)begin
 if(reset)begin
  M1<=8'd0;
  M2<=8'd0;
  M3<=8'd0;
  M4<=8'd0;
  M5<=8'd0;
  M6<=8'd0;
  count_M1<=3'd0;
  count_M2<=3'd0;
  count_M3<=3'd0;
  count_M4<=3'd0;
  count_M5<=3'd0; 
  count_M6<=3'd0;
 end
 else if((state==4'd2)&&sort_end)begin
   if(A1_Symbol5||A1_Symbol6)begin
    count_M1<=count_M1+3'd1;
   end
   if(A2_Symbol5||A2_Symbol6)begin
    count_M2<=count_M2+3'd1;
   end
   if(A3_Symbol5||A3_Symbol6)begin
    count_M3<=count_M3+3'd1;
   end
   if(A4_Symbol5||A4_Symbol6)begin
    count_M4<=count_M4+3'd1;
   end
   if(A5_Symbol5||A5_Symbol6)begin
    count_M5<=count_M5+3'd1;
   end
   if(A6_Symbol5||A6_Symbol6)begin
    count_M6<=count_M6+3'd1;
   end
 end
 else if((state==4'd4)&&sort_end)begin
   if(A1_Symbol4||A1_Symbol5)begin
    count_M1<=count_M1+3'd1;
   end
   if(A2_Symbol4||A2_Symbol5)begin
    count_M2<=count_M2+3'd1;
   end
   if(A3_Symbol4||A3_Symbol5)begin
    count_M3<=count_M3+3'd1;
   end
   if(A4_Symbol4||A4_Symbol5)begin
    count_M4<=count_M4+3'd1;
   end
   if(A5_Symbol4||A5_Symbol5)begin
    count_M5<=count_M5+3'd1;
   end
   if(A6_Symbol4||A6_Symbol5) begin
    count_M6<=count_M6+3'd1;
   end
 end
 else if((state==4'd6)&&sort_end)begin
   if(A1_Symbol3||A1_Symbol4)begin
    count_M1<=count_M1+3'd1;
   end
   if(A2_Symbol3||A2_Symbol4)begin
    count_M2<=count_M2+3'd1;
   end
   if(A3_Symbol3||A3_Symbol4)begin
    count_M3<=count_M3+3'd1;
   end
   if(A4_Symbol3||A4_Symbol4)begin
    count_M4<=count_M4+3'd1;
   end
   if(A5_Symbol3||A5_Symbol4)begin
    count_M5<=count_M5+3'd1;
   end
   if(A6_Symbol3||A6_Symbol4) begin
    count_M6<=count_M6+3'd1;
   end
 end
 else if((state==4'd8)&&sort_end)begin
   if(A1_Symbol2||A1_Symbol3)begin
    count_M1<=count_M1+3'd1;
   end
   if(A2_Symbol2||A2_Symbol3)begin
    count_M2<=count_M2+3'd1;
   end
   if(A3_Symbol2||A3_Symbol3)begin
    count_M3<=count_M3+3'd1;
   end
   if(A4_Symbol2||A4_Symbol3)begin
    count_M4<=count_M4+3'd1;
   end
   if(A5_Symbol2||A5_Symbol3)begin
    count_M5<=count_M5+3'd1;
   end
   if(A6_Symbol2||A6_Symbol3) begin
    count_M6<=count_M6+3'd1;
   end
 end
 else if((state==4'd10)&&sort_end)begin
   if(A1_Symbol1||A1_Symbol2)begin
    count_M1<=count_M1+3'd1;
   end
   if(A2_Symbol1||A2_Symbol2)begin
    count_M2<=count_M2+3'd1;
   end
   if(A3_Symbol1||A3_Symbol2)begin
    count_M3<=count_M3+3'd1;
   end
   if(A4_Symbol1||A4_Symbol2)begin
    count_M4<=count_M4+3'd1;
   end
   if(A5_Symbol1||A5_Symbol2)begin
    count_M5<=count_M5+3'd1;
   end
   if(A6_Symbol1||A6_Symbol2) begin
    count_M6<=count_M6+3'd1;
   end
 end
 else if(state==4'd11)begin
   case(count_M1)
   3'd1:M1<=8'b00000001;
   3'd2:M1<=8'b00000011;
   3'd3:M1<=8'b00000111;
   3'd4:M1<=8'b00001111;
   3'd5:M1<=8'b00011111;
   default:M1<=8'b00000000;
   endcase
   case(count_M2)
   3'd1:M2<=8'b00000001;
   3'd2:M2<=8'b00000011;
   3'd3:M2<=8'b00000111;
   3'd4:M2<=8'b00001111;
   3'd5:M2<=8'b00011111;
   default:M2<=8'b00000000;
   endcase
   case(count_M3)
   3'd1:M3<=8'b00000001;
   3'd2:M3<=8'b00000011;
   3'd3:M3<=8'b00000111;
   3'd4:M3<=8'b00001111;
   3'd5:M3<=8'b00011111;
   default:M3<=8'b00000000;
   endcase
   case(count_M4)
   3'd1:M4<=8'b00000001;
   3'd2:M4<=8'b00000011;
   3'd3:M4<=8'b00000111;
   3'd4:M4<=8'b00001111;
   3'd5:M4<=8'b00011111;
   default:M4<=8'b00000000;
   endcase
   case(count_M5)
   3'd1:M5<=8'b00000001;
   3'd2:M5<=8'b00000011;
   3'd3:M5<=8'b00000111;
   3'd4:M5<=8'b00001111;
   3'd5:M5<=8'b00011111;
   default:M5<=8'b00000000;
   endcase
   case(count_M6)
   3'd1:M6<=8'b00000001;
   3'd2:M6<=8'b00000011;
   3'd3:M6<=8'b00000111;
   3'd4:M6<=8'b00001111;
   3'd5:M6<=8'b00011111;
   default:M6<=8'b00000000;
  endcase
 end
end

assign A1_Symbol1=(Symbol_1[14:12]==3'd1)||(Symbol_1[11:9]==3'd1)||(Symbol_1[8:6]==3'd1)||(Symbol_1[5:3]==3'd1)||(Symbol_1[2:0]==3'd1);
assign A2_Symbol1=(Symbol_1[14:12]==3'd2)||(Symbol_1[11:9]==3'd2)||(Symbol_1[8:6]==3'd2)||(Symbol_1[5:3]==3'd2)||(Symbol_1[2:0]==3'd2);
assign A3_Symbol1=(Symbol_1[14:12]==3'd3)||(Symbol_1[11:9]==3'd3)||(Symbol_1[8:6]==3'd3)||(Symbol_1[5:3]==3'd3)||(Symbol_1[2:0]==3'd3);
assign A4_Symbol1=(Symbol_1[14:12]==3'd4)||(Symbol_1[11:9]==3'd4)||(Symbol_1[8:6]==3'd4)||(Symbol_1[5:3]==3'd4)||(Symbol_1[2:0]==3'd4);
assign A5_Symbol1=(Symbol_1[14:12]==3'd5)||(Symbol_1[11:9]==3'd5)||(Symbol_1[8:6]==3'd5)||(Symbol_1[5:3]==3'd5)||(Symbol_1[2:0]==3'd5);
assign A6_Symbol1=(Symbol_1[14:12]==3'd6)||(Symbol_1[11:9]==3'd6)||(Symbol_1[8:6]==3'd6)||(Symbol_1[5:3]==3'd6)||(Symbol_1[2:0]==3'd6);

assign A1_Symbol2=(Symbol_2[14:12]==3'd1)||(Symbol_2[11:9]==3'd1)||(Symbol_2[8:6]==3'd1)||(Symbol_2[5:3]==3'd1)||(Symbol_2[2:0]==3'd1);
assign A2_Symbol2=(Symbol_2[14:12]==3'd2)||(Symbol_2[11:9]==3'd2)||(Symbol_2[8:6]==3'd2)||(Symbol_2[5:3]==3'd2)||(Symbol_2[2:0]==3'd2);
assign A3_Symbol2=(Symbol_2[14:12]==3'd3)||(Symbol_2[11:9]==3'd3)||(Symbol_2[8:6]==3'd3)||(Symbol_2[5:3]==3'd3)||(Symbol_2[2:0]==3'd3);
assign A4_Symbol2=(Symbol_2[14:12]==3'd4)||(Symbol_2[11:9]==3'd4)||(Symbol_2[8:6]==3'd4)||(Symbol_2[5:3]==3'd4)||(Symbol_2[2:0]==3'd4);
assign A5_Symbol2=(Symbol_2[14:12]==3'd5)||(Symbol_2[11:9]==3'd5)||(Symbol_2[8:6]==3'd5)||(Symbol_2[5:3]==3'd5)||(Symbol_2[2:0]==3'd5);
assign A6_Symbol2=(Symbol_2[14:12]==3'd6)||(Symbol_2[11:9]==3'd6)||(Symbol_2[8:6]==3'd6)||(Symbol_2[5:3]==3'd6)||(Symbol_2[2:0]==3'd6);

assign A1_Symbol3=(Symbol_3[14:12]==3'd1)||(Symbol_3[11:9]==3'd1)||(Symbol_3[8:6]==3'd1)||(Symbol_3[5:3]==3'd1)||(Symbol_3[2:0]==3'd1);
assign A2_Symbol3=(Symbol_3[14:12]==3'd2)||(Symbol_3[11:9]==3'd2)||(Symbol_3[8:6]==3'd2)||(Symbol_3[5:3]==3'd2)||(Symbol_3[2:0]==3'd2);
assign A3_Symbol3=(Symbol_3[14:12]==3'd3)||(Symbol_3[11:9]==3'd3)||(Symbol_3[8:6]==3'd3)||(Symbol_3[5:3]==3'd3)||(Symbol_3[2:0]==3'd3);
assign A4_Symbol3=(Symbol_3[14:12]==3'd4)||(Symbol_3[11:9]==3'd4)||(Symbol_3[8:6]==3'd4)||(Symbol_3[5:3]==3'd4)||(Symbol_3[2:0]==3'd4);
assign A5_Symbol3=(Symbol_3[14:12]==3'd5)||(Symbol_3[11:9]==3'd5)||(Symbol_3[8:6]==3'd5)||(Symbol_3[5:3]==3'd5)||(Symbol_3[2:0]==3'd5);
assign A6_Symbol3=(Symbol_3[14:12]==3'd6)||(Symbol_3[11:9]==3'd6)||(Symbol_3[8:6]==3'd6)||(Symbol_3[5:3]==3'd6)||(Symbol_3[2:0]==3'd6);

assign A1_Symbol4=(Symbol_4[14:12]==3'd1)||(Symbol_4[11:9]==3'd1)||(Symbol_4[8:6]==3'd1)||(Symbol_4[5:3]==3'd1)||(Symbol_4[2:0]==3'd1);
assign A2_Symbol4=(Symbol_4[14:12]==3'd2)||(Symbol_4[11:9]==3'd2)||(Symbol_4[8:6]==3'd2)||(Symbol_4[5:3]==3'd2)||(Symbol_4[2:0]==3'd2);
assign A3_Symbol4=(Symbol_4[14:12]==3'd3)||(Symbol_4[11:9]==3'd3)||(Symbol_4[8:6]==3'd3)||(Symbol_4[5:3]==3'd3)||(Symbol_4[2:0]==3'd3);
assign A4_Symbol4=(Symbol_4[14:12]==3'd4)||(Symbol_4[11:9]==3'd4)||(Symbol_4[8:6]==3'd4)||(Symbol_4[5:3]==3'd4)||(Symbol_4[2:0]==3'd4);
assign A5_Symbol4=(Symbol_4[14:12]==3'd5)||(Symbol_4[11:9]==3'd5)||(Symbol_4[8:6]==3'd5)||(Symbol_4[5:3]==3'd5)||(Symbol_4[2:0]==3'd5);
assign A6_Symbol4=(Symbol_4[14:12]==3'd6)||(Symbol_4[11:9]==3'd6)||(Symbol_4[8:6]==3'd6)||(Symbol_4[5:3]==3'd6)||(Symbol_4[2:0]==3'd6);

assign A1_Symbol5=(Symbol_5[14:12]==3'd1)||(Symbol_5[11:9]==3'd1)||(Symbol_5[8:6]==3'd1)||(Symbol_5[5:3]==3'd1)||(Symbol_5[2:0]==3'd1);
assign A2_Symbol5=(Symbol_5[14:12]==3'd2)||(Symbol_5[11:9]==3'd2)||(Symbol_5[8:6]==3'd2)||(Symbol_5[5:3]==3'd2)||(Symbol_5[2:0]==3'd2);
assign A3_Symbol5=(Symbol_5[14:12]==3'd3)||(Symbol_5[11:9]==3'd3)||(Symbol_5[8:6]==3'd3)||(Symbol_5[5:3]==3'd3)||(Symbol_5[2:0]==3'd3);
assign A4_Symbol5=(Symbol_5[14:12]==3'd4)||(Symbol_5[11:9]==3'd4)||(Symbol_5[8:6]==3'd4)||(Symbol_5[5:3]==3'd4)||(Symbol_5[2:0]==3'd4);
assign A5_Symbol5=(Symbol_5[14:12]==3'd5)||(Symbol_5[11:9]==3'd5)||(Symbol_5[8:6]==3'd5)||(Symbol_5[5:3]==3'd5)||(Symbol_5[2:0]==3'd5);
assign A6_Symbol5=(Symbol_5[14:12]==3'd6)||(Symbol_5[11:9]==3'd6)||(Symbol_5[8:6]==3'd6)||(Symbol_5[5:3]==3'd6)||(Symbol_5[2:0]==3'd6);

assign A1_Symbol6=(Symbol_6[14:12]==3'd1)||(Symbol_6[11:9]==3'd1)||(Symbol_6[8:6]==3'd1)||(Symbol_6[5:3]==3'd1)||(Symbol_6[2:0]==3'd1);
assign A2_Symbol6=(Symbol_6[14:12]==3'd2)||(Symbol_6[11:9]==3'd2)||(Symbol_6[8:6]==3'd2)||(Symbol_6[5:3]==3'd2)||(Symbol_6[2:0]==3'd2);
assign A3_Symbol6=(Symbol_6[14:12]==3'd3)||(Symbol_6[11:9]==3'd3)||(Symbol_6[8:6]==3'd3)||(Symbol_6[5:3]==3'd3)||(Symbol_6[2:0]==3'd3);
assign A4_Symbol6=(Symbol_6[14:12]==3'd4)||(Symbol_6[11:9]==3'd4)||(Symbol_6[8:6]==3'd4)||(Symbol_6[5:3]==3'd4)||(Symbol_6[2:0]==3'd4);
assign A5_Symbol6=(Symbol_6[14:12]==3'd5)||(Symbol_6[11:9]==3'd5)||(Symbol_6[8:6]==3'd5)||(Symbol_6[5:3]==3'd5)||(Symbol_6[2:0]==3'd5);
assign A6_Symbol6=(Symbol_6[14:12]==3'd6)||(Symbol_6[11:9]==3'd6)||(Symbol_6[8:6]==3'd6)||(Symbol_6[5:3]==3'd6)||(Symbol_6[2:0]==3'd6);
endmodule