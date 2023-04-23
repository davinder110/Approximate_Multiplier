`timescale 1ps/1fs
`include "multiplier1.v"
module multiplier_tb;
    reg [7:0]A;
reg [7:0]B;
wire [15:0]y;

 multiplier1 d1(.A(A),.B(B),.y(y));

initial
begin
	$dumpfile("multiplier_tb.vcd");
	$dumpvars(0,multiplier_tb);
$monitor(" A=%h,B=%h,AxB=%h",A,B,y);
	#100 A = 8'h80; B = 8'hba;
	#100 A= 8'h80; B=8'hbb;
	#100 A =8'h34; B = 8'h78;
	
#1000 $finish;
end
endmodule
