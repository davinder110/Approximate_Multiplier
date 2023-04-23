`timescale 1ps/1fs
`include "multiplier3.v"
module image_multi3;
reg [7:0]a,b;
reg [7:0] image1 [0:89999];
reg [7:0] image2 [0:89999];
reg [7:0] output_image [0:89999];
wire [15:0] result1;
wire [15:0] result2;
reg [7:0]r1,r2;
integer i;
reg [7:0] pixel;

multiplier3 d1(.A(pixel), .B(a), .y(result1));
multiplier3 d2(.A(pixel), .B(b), .y(result2));

initial 
begin
pixel=8'h80;
$readmemh("image1_pixel_hex.txt", image1,0,89999);
$readmemh("image2_pixel_hex.txt", image2,0,89999);
$dumpfile ("image_multi3.vcd");
$dumpvars (0,image_multi3);
for (i = 0; i < 90000; i = i + 1)
begin
pixel=8'h80; a=image1[i];
#0.001 r1 =result1[15:8];
$monitor ($time," pixel=%h, a=%h, result1 =%b", pixel,a,result1);
pixel=8'h80; b=image2[i];
#0.001 r2=result2[15:8];
$monitor ($time," pixel=%h, b=%h, result2 =%b", pixel,b,result2);
#0.001 output_image[i] = r1+r2;
$display("output = %h",output_image[i]);
end
$writememh("memory_hex_multiplier3.txt", output_image);
end
endmodule