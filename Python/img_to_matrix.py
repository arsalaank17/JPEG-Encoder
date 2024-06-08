import os
from PIL import Image

def get_rgb_matrices():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    relative_path = os.path.join(current_dir,'img.png')
    image = Image.open(relative_path)
    image = image.convert("RGB")

    image = image.resize((8, 8), Image.LANCZOS)

    width, height = image.size

    red_matrix = []
    green_matrix = []
    blue_matrix = []

    for y in range(height):
        red_row = []
        green_row = []
        blue_row = []
        for x in range(width):
            pixel_rgb = image.getpixel((x, y))
            red_row.append(pixel_rgb[0])
            green_row.append(pixel_rgb[1])
            blue_row.append(pixel_rgb[2])
        red_matrix.append(red_row)
        green_matrix.append(green_row)
        blue_matrix.append(blue_row)

    return red_matrix, green_matrix, blue_matrix


def write_combined_matrix_to_file(matrix1, matrix2, matrix3, output_file):
    with open(output_file, "w") as file:
        file.write("module InputMatrix where\n")
        file.write("import Clash.Prelude\n")
        file.write("type Matrix = Vec 8 (Vec 8 (SFixed 16 16, SFixed 16 16, SFixed 16 16))\n")
        file.write("inputMatrix :: Matrix\n")
        file.write("inputMatrix = (\n")

        for i in range(len(matrix1)):
            file.write("  (")
            for j in range(len(matrix1[i])):
                pixel1 = matrix1[i][j]
                pixel2 = matrix2[i][j]
                pixel3 = matrix3[i][j]

                if isinstance(pixel1, tuple):
                    file.write("(" + str(pixel1[0]) + ", " + str(pixel1[1]) + ", " + str(pixel1[2]) + ") :> ")
                else:
                    file.write("(" + str(pixel1) +  ", " + str(pixel2) +  ", " + str(pixel3) + ") :> ")

            file.write(" Nil) :> \n")

        file.write("    Nil)\n")



def reconstruct_image(red_matrix, green_matrix, blue_matrix):
    width = len(red_matrix[0])
    height = len(red_matrix)

    # Create a blank image with RGB mode
    reconstructed_image = Image.new("RGB", (width, height))

    for y in range(height):
        for x in range(width):
            red = red_matrix[y][x]
            green = green_matrix[y][x]
            blue = blue_matrix[y][x]
            pixel_rgb = (red, green, blue)
            reconstructed_image.putpixel((x, y), pixel_rgb)

    return reconstructed_image


def main():
    red, green, blue = get_rgb_matrices()

    print("Red Matrix:")
    for row in red:
        print(row)

    print("\nGreen Matrix:")
    for row in green:
        print(row)

    print("\nBlue Matrix:")
    for row in blue:
        print(row)

    output_file = "InputMatrix.hs"
    write_combined_matrix_to_file(red, green, blue, output_file)

    reconstructed_image = reconstruct_image(red, green, blue)
    reconstructed_image.save("reconstructed_image.png")

if __name__ == "__main__":
    main()