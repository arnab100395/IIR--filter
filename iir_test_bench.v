//Self - Diagnostic Testbench
`timescale 1ns/10ps
module iir_test_bench;

wire signed [31:0] out;

reg signed [31:0] in,out_mat;
reg clk, reset;

reg signed [31:0] input_data  [0:441000];
reg signed [31:0] output_data [0:441000];
reg signed [31:0] var,var1;
parameter len = 441000;
integer k,err;

IIR_main ut1(.out(out),.in(in),.clk(clk),.reset(reset));

initial begin
clk  = 1'b0;
reset= 1'b0;
k=0;
 #20 clk = ~clk;
 #20 clk = ~clk;
 #20 clk = ~clk;
 reset = 1'b1;
forever #20 clk = ~clk;  
end

initial begin
err=0;

end

initial begin

$readmemb("Input_vectors.txt",input_data);
$readmemb("Output_vectors_matlab.txt",output_data);
end

always @(posedge clk) begin
#10;
in = input_data[k];
$display(" Filter Input   %b", in);
out_mat = output_data[k];
$display(" Filter Output  %b", out_mat);
$display(" Verilog filter %b", out);
var = out - out_mat;
var=var>0?var:-1*var;
$display(" Variance %d", var);
end
always @(negedge clk) 
if(reset) begin
k = k+1;
end
endmodule
