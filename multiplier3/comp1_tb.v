`timescale 1ns/1ps
`include"comp1.v"
module comp1_tb;
reg A,B,C,D,Cin;
wire Sum,Carry,Cout;
integer i;
comp1 d1(A,B,C,D,Cin,Sum,Carry,Cout);
initial 
begin
    $dumpfile("comp1_tb.vcd");
    $dumpvars(0,comp1_tb);
    
    {A,B,C,D,Cin}=0;
    for(i=0;i<32;i=i+1)
    begin
       #10 {A,B,C,D,Cin}=i; 
    end
    #1000 $finish;
end
endmodule