from PIL import Image

with open("memory_hex_multiplier2.txt", "r") as f:
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
im.save('output_multiplier2.png')
