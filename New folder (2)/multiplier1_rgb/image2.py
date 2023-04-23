from PIL import Image

img = Image.open("image2.png")
img = img.convert("RGB")
img = img.resize((300, 300))
img.save("file2.png")
image = list(img.getdata())
print(len(image))
pixels = []

for j in range(len(image)):
    for i in range(len(image[j])):
        pixels.append(image[j][i])
pixel = []
for j in range(len(pixels)):
    pixel.append(hex(pixels[j])[2:])
print(len(pixel))
with open("RGB2_pixel_hex.txt", "w") as f:
    for i in range(len(pixel)):
        f.write(str(pixel[i]) + "\n")
