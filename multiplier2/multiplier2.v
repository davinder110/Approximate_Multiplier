module multiplier2(input [7:0] A, input [7:0] B,output wire [15:0] y);
wire  [63:0] pp;
wire [11:0]s1,c1;
wire [11:0]s2,c2;
wire [12:0]c3;

genvar i;
genvar j;
for(i = 0; i<8; i=i+1)begin
   for(j = 0; j<8;j = j+1)begin
      assign pp[j+i*8] = A[j]&B[i];
end
end

//stage1
HA h1(.a(pp[4]),.b(pp[11]),.Sum(s1[0]),.Carry(c1[0]));
HA h2(.a(pp[34]),.b(pp[41]),.Sum(s1[3]),.Carry(c1[3]));
HA h3(.a(pp[51]),.b(pp[58]),.Sum(s1[9]),.Carry(c1[9]));
HA h4(.a(pp[39]),.b(pp[46]),.Sum(s1[11]),.Carry(c1[11]));


FA f1(.A(pp[43]),.B(pp[50]),.C(pp[57]),.Sum(s1[7]),.Carry(c1[7]));

comp g1(.A(pp[5]), .B(pp[12]), .C(pp[19]), .D(pp[26]), .Sum(s1[1]), .Carry(c1[1]) );
comp g2(.A(pp[6]), .B(pp[13]), .C(pp[20]), .D(pp[27]), .Sum(s1[2]), .Carry(c1[2]) );
comp g3(.A(pp[7]), .B(pp[14]), .C(pp[21]), .D(pp[28]), .Sum(s1[4]), .Carry(c1[4]) );
comp g4(.A(pp[35]), .B(pp[42]), .C(pp[49]), .D(pp[56]), .Sum(s1[5]), .Carry(c1[5]) );
comp g5(.A(pp[15]), .B(pp[22]), .C(pp[29]), .D(pp[36]), .Sum(s1[6]), .Carry(c1[6]) );
comp g6(.A(pp[23]), .B(pp[30]), .C(pp[37]), .D(pp[44]), .Sum(s1[8]), .Carry(c1[8]) );
comp g7(.A(pp[31]), .B(pp[38]), .C(pp[45]), .D(pp[52]), .Sum(s1[10]), .Carry(c1[10]) );

//stage 2
HA h5(.a(pp[2]),.b(pp[9]),.Sum(s2[0]),.Carry(c2[0]));
HA h6(.a(pp[55]),.b(pp[62]),.Sum(s2[11]),.Carry(c2[11]));

comp g8(.A(pp[3]), .B(pp[10]), .C(pp[17]), .D(pp[24]), .Sum(s2[1]), .Carry(c2[1]) );
comp g9(.A(s1[0]), .B(pp[18]), .C(pp[25]), .D(pp[32]), .Sum(s2[2]), .Carry(c2[2]) );
comp g10(.A(s1[1]), .B(c1[0]), .C(pp[33]), .D(pp[40]), .Sum(s2[3]), .Carry(c2[3]) );
comp g11(.A(s1[2]), .B(c1[1]), .C(s1[3]), .D(pp[48]), .Sum(s2[4]), .Carry(c2[4]) );
comp g12(.A(s1[4]), .B(c1[2]), .C(s1[5]), .D(c1[3]), .Sum(s2[5]), .Carry(c2[5]) );
comp g13(.A(s1[6]), .B(c1[4]), .C(s1[7]), .D(c1[5]), .Sum(s2[6]), .Carry(c2[6]) );
comp g14(.A(s1[8]), .B(c1[6]), .C(s1[9]), .D(c1[7]), .Sum(s2[7]), .Carry(c2[7]) );
comp g15(.A(s1[10]), .B(c1[8]), .C(pp[59]), .D(c1[9]), .Sum(s2[8]), .Carry(c2[8]) );
comp g16(.A(s1[11]), .B(c1[10]), .C(pp[23]), .D(pp[60]), .Sum(s2[9]), .Carry(c2[9]) );
comp g17(.A(pp[47]), .B(c1[11]), .C(pp[54]), .D(pp[61]), .Sum(s2[10]), .Carry(c2[10]) );



//stage 3
HA h7(.a(pp[1]),.b(pp[8]),.Sum(y[1]),.Carry(c3[0]));

FA f2(.A(s2[0]),.B(pp[16]),.C(c3[0]),.Sum(y[2]),.Carry(c3[1]));
FA f3(.A(s2[1]),.B(c2[0]),.C(c3[1]),.Sum(y[3]),.Carry(c3[2]));
FA f4(.A(s2[2]),.B(c2[1]),.C(c3[2]),.Sum(y[4]),.Carry(c3[3]));
FA f5(.A(s2[3]),.B(c2[2]),.C(c3[3]),.Sum(y[5]),.Carry(c3[4]));
FA f6(.A(s2[4]),.B(c2[3]),.C(c3[4]),.Sum(y[6]),.Carry(c3[5]));
FA f7(.A(s2[5]),.B(c2[4]),.C(c3[5]),.Sum(y[7]),.Carry(c3[6]));
FA f8(.A(s2[6]),.B(c2[5]),.C(c3[6]),.Sum(y[8]),.Carry(c3[7]));
FA f9(.A(s2[7]),.B(c2[6]),.C(c3[7]),.Sum(y[9]),.Carry(c3[8]));
FA f10(.A(s2[8]),.B(c2[7]),.C(c3[8]),.Sum(y[10]),.Carry(c3[9]));
FA f11(.A(s2[9]),.B(c2[8]),.C(c3[9]),.Sum(y[11]),.Carry(c3[10]));
FA f12(.A(s2[10]),.B(c2[9]),.C(c3[10]),.Sum(y[12]),.Carry(c3[11]));
FA f13(.A(s2[11]),.B(c2[10]),.C(c3[11]),.Sum(y[13]),.Carry(c3[12]));
FA f14(.A(pp[63]),.B(c2[11]),.C(c3[12]),.Sum(y[14]),.Carry(y[15]));

assign y[0] =  pp[0];


endmodule


module comp(input A,B,C,D, output Sum,Carry);

assign Sum= (~(A^B))|(~(C^D));
assign Carry = (A | B) & (C | D);

endmodule

module HA(a, b, Sum,Carry);

input a, b; 
output Sum, Carry; 

assign Sum = a ^ b; 
assign Carry = a & b; 

endmodule
module FA(input A,B,C,output Sum,Carry);
wire Sel;
assign Sel=A^B;
assign Sum=Sel^C;
assign Carry = Sel ? C :A ;
endmodule