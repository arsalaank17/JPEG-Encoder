import numpy as np
import matplotlib.pyplot as plt

# RGB values (example values)
r = 120
g = 50
b = 20

def rgb_to_ycbcr(rgb):
    r, g, b = rgb
    y = 0.299 * r + 0.587 * g + 0.114 * b
    cb = 128 - 0.168736 * r - 0.331264 * g + 0.5 * b
    cr = 128 + 0.5 * r - 0.418688 * g - 0.081312 * b
    return y, cb, cr

def ycbcr_to_rgb(ycbcr):
    y, cb, cr = ycbcr
    r = y + 1.402 * (cr - 128)
    g = y - 0.344136 * (cb - 128) - 0.714136 * (cr - 128)
    b = y + 1.772 * (cb - 128)
    rgb = np.clip([r, g, b], 0, 255)
    return rgb.astype(int)

# Convert RGB to YCbCr
rgb = np.array([r, g, b])
ycbcr = rgb_to_ycbcr(rgb)

# Print the RGB and YCbCr values
print("RGB: ({}, {}, {})".format(r, g, b))
print("YCbCr: ({:.2f}, {:.2f}, {:.2f})".format(ycbcr[0], ycbcr[1], ycbcr[2]))

# Create a color swatch image for RGB
rgb_swatch = np.zeros((1, 1, 3), dtype=np.uint8)
rgb_swatch[:, :] = rgb

# Create a color swatch image for YCbCr
ycbcr_rgb = ycbcr_to_rgb(ycbcr)
ycbcr_swatch = np.zeros((1, 1, 3), dtype=np.uint8)
ycbcr_swatch[:, :] = ycbcr_rgb

# Display the color swatches side by side
fig, axs = plt.subplots(1, 2, figsize=(8, 4))

axs[0].imshow(rgb_swatch)
axs[0].axis('off')
axs[0].set_title('RGB')

axs[1].imshow(ycbcr_swatch)
axs[1].axis('off')
axs[1].set_title('YCbCr')

plt.tight_layout()
plt.show()
