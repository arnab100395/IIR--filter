`timescale 1ns / 1ps
module IIR_main(out,in,clk,reset);
  wire signed [31:0] out1 [0:565];  
  wire signed [31:0] out2 [0:565];
  wire signed [31:0] out3 [0:565];
  input  clk,reset;
  input  signed [31:0] in  ;  
  output signed [31:0] out ;

endmodule
