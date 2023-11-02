`timescale 1ns/10ps
module Sort(clk,reset,count_en,CNT_valid,state,CNT1,CNT2,CNT3,CNT4,CNT5,CNT6,sort_end,Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6);
input clk;
input reset;
input count_en;
input CNT_valid;
input [3:0]state;
input [7:0]CNT1,CNT2,CNT3,CNT4,CNT5,CNT6;

output [14:0]Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6;
output sort_end;
reg [7:0]p_1,p_2,p_3,p_4,p_5,p_6;
reg [7:0]swap_p_1,swap_p_2,swap_p_3,swap_p_4,swap_p_5,swap_p_6;
reg [14:0]Symbol_1,Symbol_2,Symbol_3,Symbol_4,Symbol_5,Symbol_6;
reg [14:0]swap_Symbol_1,swap_Symbol_2,swap_Symbol_3,swap_Symbol_4,swap_Symbol_5,swap_Symbol_6;
reg [2:0]count;
wire [7:0]fp1,fp2,fp3,fp4,fp5,fp6;
wire [7:0]fpr2,fpr3,fpr4,fpr5;
wire [14:0]fs1,fs2,fs3,fs4,fs5,fs6;
wire [14:0]fsy2,fsy3,fsy4,fsy5;
always@(posedge clk or posedge reset)begin
 if(reset)begin
    count<=3'd0;
 end
 else if(sort_end)begin
    count<=3'd0;
 end
 else if((count_en==1'd1)&&(count!=3'd7)) begin
    count<=count+3'd1;
 end
 else begin
    count<=count;
 end
end
always@(posedge clk)begin
 if(CNT_valid)begin
    p_1<=CNT1;
	p_2<=CNT2;
    p_3<=CNT3;
	p_4<=CNT4;
    p_5<=CNT5;
	p_6<=CNT6;
	Symbol_1<=15'd1;
	Symbol_2<=15'd2;
	Symbol_3<=15'd3;
	Symbol_4<=15'd4;
	Symbol_5<=15'd5;
	Symbol_6<=15'd6;
 end
 else if(count_en==1'b0)begin
     p_1<=swap_p_1;
	 p_2<=swap_p_2;
	 p_3<=swap_p_3;
	 p_4<=swap_p_4;
	 p_5<=swap_p_5;
	 p_6<=swap_p_6;
	 Symbol_1<=swap_Symbol_1;
	 Symbol_2<=swap_Symbol_2;
	 Symbol_3<=swap_Symbol_3;
	 Symbol_4<=swap_Symbol_4;
	 Symbol_5<=swap_Symbol_5;
	 Symbol_6<=swap_Symbol_6;
 end
 else if(count==3'd2||count==3'd4||count==3'd6)begin
	 p_1<=fp1;
	 p_2<=fp2;
	 p_3<=fp3;
	 p_4<=fp4;
	 p_5<=fp5;
	 p_6<=fp6;
	 Symbol_1<=fs1;
	 Symbol_2<=fs2;
	 Symbol_3<=fs3;
	 Symbol_4<=fs4;
	 Symbol_5<=fs5;
	 Symbol_6<=fs6;
	end
 else if(count==3'd1||count==3'd3||count==3'd5)begin
     p_1<=p_1;
	 p_2<=fpr2;
	 p_3<=fpr3;
	 p_4<=fpr4;
	 p_5<=fpr5;
	 p_6<=p_6;
     Symbol_1<=Symbol_1;
	 Symbol_2<=fsy2;
	 Symbol_3<=fsy3;
	 Symbol_4<=fsy4;
	 Symbol_5<=fsy5;
	 Symbol_6<=Symbol_6;
 end
end
assign {fp1,fp2}=(p_2>p_1)?{swap_p_2,swap_p_1}:{swap_p_1,swap_p_2};
assign {fp3,fp4}=(p_4>p_3)?{swap_p_4,swap_p_3}:{swap_p_3,swap_p_4};
assign {fp5,fp6}=(p_6>p_5)?{swap_p_6,swap_p_5}:{swap_p_5,swap_p_6};
assign {fpr2,fpr3}=(p_3>p_2)?{swap_p_3,swap_p_2}:{swap_p_2,swap_p_3};
assign {fpr4,fpr5}=(p_5>p_4)?{swap_p_5,swap_p_4}:{swap_p_4,swap_p_5};

assign {fs1,fs2}=(p_2>p_1)?{swap_Symbol_2,swap_Symbol_1}:{swap_Symbol_1,swap_Symbol_2};
assign {fs3,fs4}=(p_4>p_3)?{swap_Symbol_4,swap_Symbol_3}:{swap_Symbol_3,swap_Symbol_4};
assign {fs5,fs6}=(p_6>p_5)?{swap_Symbol_6,swap_Symbol_5}:{swap_Symbol_5,swap_Symbol_6};
assign {fsy2,fsy3}=(p_3>p_2)?{swap_Symbol_3,swap_Symbol_2}:{swap_Symbol_2,swap_Symbol_3};
assign {fsy4,fsy5}=(p_5>p_4)?{swap_Symbol_5,swap_Symbol_4}:{swap_Symbol_4,swap_Symbol_5};
always@(state or count)begin
 if(count_en)begin
    swap_p_1=p_1;
	swap_p_2=p_2;
	swap_p_3=p_3;
	swap_p_4=p_4;
	swap_p_5=p_5;
	swap_p_6=p_6;
	swap_Symbol_1=Symbol_1;
	swap_Symbol_2=Symbol_2;
	swap_Symbol_3=Symbol_3;
	swap_Symbol_4=Symbol_4;
	swap_Symbol_5=Symbol_5;
	swap_Symbol_6=Symbol_6;
 end
 else if(state==4'd3)begin
    swap_p_1=p_1;
	swap_p_2=p_2;
	swap_p_3=p_3;
	swap_p_4=p_4;
	swap_p_5=p_5+p_6;
	swap_p_6=8'd0;
	swap_Symbol_1=Symbol_1;
	swap_Symbol_2=Symbol_2;
	swap_Symbol_3=Symbol_3;
	swap_Symbol_4=Symbol_4;
	swap_Symbol_5={9'd0,Symbol_5[2:0],Symbol_6[2:0]};
	swap_Symbol_6=15'd0;
 end
 else if(state==4'd5)begin
    swap_p_1=p_1;
	swap_p_2=p_2;
	swap_p_3=p_3;
	swap_p_4=p_4+p_5;
	swap_p_5=8'd0;
	swap_p_6=8'd0;
	if(Symbol_4[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3=Symbol_3;
	 swap_Symbol_4={6'd0,Symbol_4[5:0],Symbol_5[2:0]};
	 swap_Symbol_5=15'd0;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_5[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3=Symbol_3;
	 swap_Symbol_4={6'd0,Symbol_4[2:0],Symbol_5[5:0]};
	 swap_Symbol_5=15'd0;
	 swap_Symbol_6=Symbol_6;
	end
	else begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3=Symbol_3;
	 swap_Symbol_4={9'd0,Symbol_4[2:0],Symbol_5[2:0]};
	 swap_Symbol_5=15'd0;
	 swap_Symbol_6=Symbol_6;
	end
 end
 else if(state==4'd7)begin
    swap_p_1=p_1;
	swap_p_2=p_2;
	swap_p_3=p_3+p_4;
	swap_p_4=8'd0;
	swap_p_5=8'd0;
	swap_p_6=8'd0;
	if(Symbol_3[8:6]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3={3'd0,Symbol_3[8:0],Symbol_4[2:0]};
	 swap_Symbol_4=15'd0;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_4[8:6]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3={3'd0,Symbol_3[2:0],Symbol_4[8:0]};
	 swap_Symbol_4=15'd0;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if((Symbol_3[5:3]!=3'd0)&&(Symbol_4[5:3]!=3'd0))begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3={3'd0,Symbol_3[5:0],Symbol_4[5:0]};
	 swap_Symbol_4=15'd0;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_3[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3={6'd0,Symbol_3[5:0],Symbol_4[2:0]};
	 swap_Symbol_4=15'd0;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_4[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3={6'd0,Symbol_3[2:0],Symbol_4[5:0]};
	 swap_Symbol_4=15'd0;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2=Symbol_2;
	 swap_Symbol_3={9'd0,Symbol_3[2:0],Symbol_4[2:0]};
	 swap_Symbol_4=15'd0;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
 end
 else if(state==4'd9)begin
    swap_p_1=p_1;
	swap_p_2=p_2+p_3;
	swap_p_3=8'd0;
	swap_p_4=8'd0;
	swap_p_5=8'd0;
	swap_p_6=8'd0;
	if(Symbol_2[11:9]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={Symbol_2[11:0],Symbol_3[2:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_3[11:9]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={Symbol_2[2:0],Symbol_3[11:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if((Symbol_2[5:3]!=3'd0)&&(Symbol_3[8:6]!=3'd0))begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={Symbol_2[5:0],Symbol_3[8:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if((Symbol_2[8:6]!=3'd0)&&(Symbol_3[5:3]!=3'd0))begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={Symbol_2[8:0],Symbol_3[5:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if((Symbol_2[5:3]!=3'd0)&&(Symbol_3[5:3]!=3'd0))begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={3'd0,Symbol_2[5:0],Symbol_3[5:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_3[8:6]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={3'd0,Symbol_2[2:0],Symbol_3[8:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_2[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={3'd0,Symbol_2[8:0],Symbol_3[2:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_2[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={6'd0,Symbol_2[5:0],Symbol_3[2:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else if(Symbol_3[5:3]!=3'd0)begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={6'd0,Symbol_2[2:0],Symbol_3[5:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
	else begin
	 swap_Symbol_1=Symbol_1;
	 swap_Symbol_2={9'd0,Symbol_2[2:0],Symbol_3[2:0]};
	 swap_Symbol_3=15'd0;
	 swap_Symbol_4=Symbol_4;
	 swap_Symbol_5=Symbol_5;
	 swap_Symbol_6=Symbol_6;
	end
 end
end
assign sort_end=(p_1>=p_2)&&(p_2>=p_3)&&(p_3>=p_4)&&(p_4>=p_5)&&(p_5>=p_6);
endmodule