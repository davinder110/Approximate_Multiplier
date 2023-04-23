`timescale 1ns / 1ps
`include"comp.v"
module comp_tb;
reg A,B,C,D;
wire Sum, Carry;

integer i;
comp c1(A,B,C,D,Carry,Sum);

initial 
begin
    $dumpfile("comp_tb.vcd");
	$dumpvars(0,comp_tb);
{A,B,C,D}=0;
for(i=1; i<16;i=i+1)
begin
#100 {A,B,C,D}=i;
end
#2000 $finish;
end
endmodule
