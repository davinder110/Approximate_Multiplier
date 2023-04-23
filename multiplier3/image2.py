from PIL import Image

img = Image.open("image2.jpg")
img = img.convert("L")
img = img.resize((300, 300))
img.save('file2.png')
image = list(img.getdata())

pixels=[]
for j in range(len(image)):
    pixels.append(hex(image[j])[2:])

with open("image2_pixel_hex.txt", "w") as f:
    for i in range(len(pixels)):
        f.write(str(pixels[i]) + "\n")