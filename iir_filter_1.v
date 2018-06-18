`timescale 1ns/1ps 
module iir_filter_1(clk,reset,in,out);

parameter bit_no=32;
parameter ck=11;

input clk,reset;
input signed [bit_no-1:0] in;

output reg signed [bit_no-1:0] out;

reg signed [bit_no-1:0] x1,x2,x3,x4,x5,x6,x7;
reg signed [bit_no-1:0] g1,g2,g3,g4,d1,d2;

always @(posedge clk) begin
	g1<=32'd511;
	g2<=-32'd1764;
	g3<=-32'd1412;
	g4<=32'd889;
end

always @(posedge clk, negedge reset)
begin
	if(~reset)
	begin
		d1<=32'b0;
		d2<=32'b0;
	end
	else
	begin
		d1<=x3;
		d2<=d1;
	end
end
always @(*) 	x1<=(in*g1)>>>(ck-1);
always @(*) 	x2<=x1-x6;
always @(*)	x6<=(d1*g2)>>>(ck-1);
always @(*)	x3<=x2-x7;
always @(*)	x7<=(d2*g4)>>>(ck-1);
always @(*)	x4<=x3+x5;
always @(*)	x5<=(d1*g3)>>>(ck-1);
always @(*)	out<=x4+d2;

endmodule
