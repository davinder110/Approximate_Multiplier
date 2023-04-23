`timescale 1ns / 1ps

module comp(input A,B,C,D,output Carry, Sum);
assign Sum= (~(A^B))|(~(C^D));
assign Carry = (A | B) & (C | D);

endmodule
