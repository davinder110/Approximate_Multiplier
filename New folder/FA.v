`timescale 1ns / 1ps

module FA(input A,B,C,output Carry, Sum);
wire Sel;
assign Sel=A^B;
assign Sum=Sel^C;
assign Carry = Sel ? C :A ;
endmodule
