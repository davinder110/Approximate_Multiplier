module comp1(input a,b,c,d,cin,output sum,carry, cout);
assign {cout,carry,sum}=a+b+c+d+cin;
endmodule