module multiplier1(input [7:0] A, input [7:0] B,output wire [15:0] y);
wire  [63:0] pp;
wire [5:0]s1,c1;
wire [13:0]s2,c2;
wire [9:0]s3,c3;
wire [11:0]s4,c4;
wire [13:0]c5;
genvar i;
genvar j;

for(i = 0; i<8; i=i+1)begin

   for(j = 0; j<8;j = j+1)begin
      assign pp[j+i*8] = A[j]&B[i];
end
end

//stage 1
HA h1(.a(pp[6]),.b(pp[13]),.Sum(s1[0]),.Cout(c1[0]));
HA h2(.a(pp[28]),.b(pp[35]),.Sum(s1[2]),.Cout(c1[2]));
HA h3(.a(pp[36]),.b(pp[43]),.Sum(s1[4]),.Cout(c1[4]));

FA f1(.A(pp[7]),.B(pp[14]),.Cin(pp[21]),.Sum(s1[1]),.Cout(c1[1]));
FA f2(.A(pp[15]),.B(pp[22]),.Cin(pp[29]),.Sum(s1[3]),.Cout(c1[3]));
FA f3(.A(pp[23]),.B(pp[30]),.Cin(pp[37]),.Sum(s1[5]),.Cout(c1[5]));

//stage 2
HA h4(.a(pp[4]),.b(pp[11]),.Sum(s2[0]),.Cout(c2[0]));
HA h5(.a(pp[26]),.b(pp[33]),.Sum(s2[2]),.Cout(c2[2]));

FA f4(.A(pp[5]),.B(pp[12]),.Cin(pp[19]),.Sum(s2[1]),.Cout(c2[1]));
FA f5(.A(s1[0]),.B(pp[20]),.Cin(pp[27]),.Sum(s2[3]),.Cout(c2[3]));
FA f6(.A(pp[34]),.B(pp[41]),.Cin(pp[48]),.Sum(s2[4]),.Cout(c2[4]));
FA f7(.A(s1[1]),.B(s1[2]),.Cin(c1[0]),.Sum(s2[5]),.Cout(c2[5]));
FA f8(.A(pp[42]),.B(pp[49]),.Cin(pp[56]),.Sum(s2[6]),.Cout(c2[6]));
FA f9(.A(s1[3]),.B(s1[4]),.Cin(c1[1]),.Sum(s2[7]),.Cout(c2[7]));
FA f10(.A(c1[2]),.B(pp[50]),.Cin(pp[57]),.Sum(s2[8]),.Cout(c2[8]));
FA f11(.A(s1[5]),.B(c1[3]),.Cin(c1[4]),.Sum(s2[9]),.Cout(c2[9]));
FA f12(.A(pp[44]),.B(pp[51]),.Cin(pp[58]),.Sum(s2[10]),.Cout(c2[10]));
FA f13(.A(c1[5]),.B(pp[31]),.Cin(pp[38]),.Sum(s2[11]),.Cout(c2[11]));
FA f14(.A(pp[45]),.B(pp[52]),.Cin(pp[59]),.Sum(s2[12]),.Cout(c2[12]));
FA f15(.A(pp[39]),.B(pp[46]),.Cin(pp[53]),.Sum(s2[13]),.Cout(c2[13]));

//stage 3
HA h6(.a(pp[3]),.b(pp[10]),.Sum(s3[0]),.Cout(c3[0]));

FA f16(.A(s2[0]),.B(pp[18]),.Cin(pp[25]),.Sum(s3[1]),.Cout(c3[1]));
FA f17(.A(c2[0]),.B(s2[1]),.Cin(s2[2]),.Sum(s3[2]),.Cout(c3[2]));
FA f18(.A(c2[1]),.B(c2[2]),.Cin(s2[3]),.Sum(s3[3]),.Cout(c3[3]));
FA f19(.A(c2[3]),.B(c2[4]),.Cin(s2[5]),.Sum(s3[4]),.Cout(c3[4]));
FA f20(.A(c2[5]),.B(c2[6]),.Cin(s2[7]),.Sum(s3[5]),.Cout(c3[5]));
FA f21(.A(c2[7]),.B(c2[8]),.Cin(s2[9]),.Sum(s3[6]),.Cout(c3[6]));
FA f22(.A(c2[9]),.B(c2[10]),.Cin(s2[11]),.Sum(s3[7]),.Cout(c3[7]));
FA f23(.A(c2[11]),.B(c2[12]),.Cin(s2[13]),.Sum(s3[8]),.Cout(c3[8]));
FA f24(.A(c2[13]),.B(pp[47]),.Cin(pp[54]),.Sum(s3[9]),.Cout(c3[9]));

//stage 4
HA h7(.a(pp[2]),.b(pp[9]),.Sum(s4[0]),.Cout(c4[0]));

FA f25(.A(s3[0]),.B(pp[17]),.Cin(pp[24]),.Sum(s4[1]),.Cout(c4[1]));
FA f26(.A(c3[0]),.B(s3[1]),.Cin(pp[32]),.Sum(s4[2]),.Cout(c4[2]));
FA f27(.A(c3[1]),.B(s3[2]),.Cin(pp[40]),.Sum(s4[3]),.Cout(c4[3]));
FA f28(.A(c3[2]),.B(s3[3]),.Cin(s2[4]),.Sum(s4[4]),.Cout(c4[4]));
FA f29(.A(c3[3]),.B(s3[4]),.Cin(s2[6]),.Sum(s4[5]),.Cout(c4[5]));
FA f30(.A(c3[4]),.B(s3[5]),.Cin(s2[8]),.Sum(s4[6]),.Cout(c4[6]));
FA f31(.A(c3[5]),.B(s3[6]),.Cin(s2[10]),.Sum(s4[7]),.Cout(c4[7]));
FA f32(.A(c3[6]),.B(s3[7]),.Cin(s2[12]),.Sum(s4[8]),.Cout(c4[8]));
FA f33(.A(c3[7]),.B(s3[8]),.Cin(pp[60]),.Sum(s4[9]),.Cout(c4[9]));
FA f34(.A(c3[8]),.B(s3[9]),.Cin(pp[60]),.Sum(s4[10]),.Cout(c4[10]));
FA f35(.A(c3[9]),.B(pp[55]),.Cin(pp[62]),.Sum(s4[11]),.Cout(c4[11]));

// stage5
HA h8(.a(pp[1]),.b(pp[8]),.Sum(y[1]),.Cout(c5[0]));

FA f36(.A(s4[0]),.B(pp[16]),.Cin(c5[0]),.Sum(y[2]),.Cout(c5[1]));
FA f37(.A(c4[0]),.B(s4[1]),.Cin(c5[1]),.Sum(y[3]),.Cout(c5[2]));
FA f38(.A(c4[1]),.B(s4[2]),.Cin(c5[2]),.Sum(y[4]),.Cout(c5[3]));
FA f39(.A(c4[2]),.B(s4[3]),.Cin(c5[3]),.Sum(y[5]),.Cout(c5[4]));
FA f40(.A(c4[3]),.B(s4[4]),.Cin(c5[4]),.Sum(y[6]),.Cout(c5[5]));
FA f41(.A(c4[4]),.B(s4[5]),.Cin(c5[5]),.Sum(y[7]),.Cout(c5[6]));
FA f42(.A(c4[5]),.B(s4[6]),.Cin(c5[6]),.Sum(y[8]),.Cout(c5[7]));
FA f43(.A(c4[6]),.B(s4[7]),.Cin(c5[7]),.Sum(y[9]),.Cout(c5[8]));
FA f44(.A(c4[7]),.B(s4[8]),.Cin(c5[8]),.Sum(y[10]),.Cout(c5[9]));
FA f45(.A(c4[8]),.B(s4[9]),.Cin(c5[9]),.Sum(y[11]),.Cout(c5[10]));
FA f46(.A(c4[9]),.B(s4[10]),.Cin(c5[10]),.Sum(y[12]),.Cout(c5[11]));
FA f47(.A(c4[10]),.B(s4[11]),.Cin(c5[11]),.Sum(y[13]),.Cout(c5[12]));
FA f48(.A(c4[11]),.B(pp[63]),.Cin(c5[12]),.Sum(y[14]),.Cout(c5[13]));
assign y[0] =  pp[0];
assign y[15] = c5[13];
endmodule

module HA(input a, b, output Sum, Cout);

assign Sum = a ^ b; 
assign Cout = a & b; 

endmodule
module FA(input A,B,Cin,output Sum,Cout);
    
assign Sum = A^B^Cin;
assign Cout = (A&B)|(A&Cin)|(B&Cin);
    
endmodule
