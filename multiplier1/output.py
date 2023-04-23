from PIL import Image
import numpy as np

with open("memory_hex_multiplier1.txt", "r") as f:
    array= f.readlines()

print(len(array))
count=0
pixel=[]
for i in range(len(array)):
    if(count):
        pixel.append(int(array[i],16))
    else:
        count=17
    count -=1

print(pixel)
print(len(pixel))
width = 300
height = 300

im = Image.new('L', (width, height))
im.putdata(pixel)
im.save('output_multiplier1.png')
