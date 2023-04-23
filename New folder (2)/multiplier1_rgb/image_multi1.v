`timescale 1ps/1fs
`include "multiplier1.v"
module image_multi1;
reg [7:0]a,b;
reg [7:0] image1 [0:269999];
reg [7:0] image2 [0:269999];
reg [7:0] output_image [0:269999];
wire [15:0] result1;
wire [15:0] result2;
reg [7:0]r1,r2;
integer i;
reg [7:0] pixel;

multiplier1 d1(.A(pixel), .B(a), .y(result1));
multiplier1 d2(.A(pixel), .B(b), .y(result2));

initial 
begin
pixel=8'h80;
$readmemh("RGB1_pixel_hex.txt", image1,0,269999);
$readmemh("RGB2_pixel_hex.txt", image2,0,269999);
$dumpfile ("image_multi1.vcd");
$dumpvars (0,image_multi1);
for (i = 0; i < 270000; i = i + 1)
begin
pixel=8'h80; a=image1[i];
r1 =result1[15:8];
// $monitor ($time," pixel=%h, a=%h, result1 =%b", pixel,a,result1);
pixel=8'h80; b=image2[i];
 r2=result2[15:8];
// $monitor ($time," pixel=%h, b=%h, result2 =%b", pixel,b,result2);
#0.001 output_image[i] = r1+r2;
$display("output = %h",output_image[i]);
end
$writememh("memory_hex_multiplier1_rgb.txt", output_image);
end
endmodule