`timescale 1ps/1fs
module test;
integer i;
reg [7:0] memory [0:89999]; 

initial
begin
    $readmemh("image1_pixel_hex.txt", memory,0,89999);
    for (i=0; i<90000; i++) 
    begin
    #0.001   
    $display ($time," output=%h",memory[i]);
    end
end
endmodule