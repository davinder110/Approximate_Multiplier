`timescale 1ns / 1ps
`include
module FA_tb();
reg A,B,C;
wire Sum, Carry;

integer i;
FA f1(A,B,C,Carry,Sum);

initial 
begin
{A,B,C}=0;
for(i=1; i<8;i=i+1)
begin
#100 {A,B,C}=i;
end
#2000 $stop;
end
endmodule
