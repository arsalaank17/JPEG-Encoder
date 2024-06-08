# JPEG Encoding hardware design in Clash 

Hardware designs in Clash for the Color Space Conversion, Chrominance Subsampling, Discrete Cosine Transform (DCT), Quantization, and Run-Length Encoding (RLE) processes. Also includes a sample implementation of the Color Space Conversion component for the De1-SoC board in Quartus.


## Contents

"Python" folder contains all the scripts used for testing and verification of the hardware components. "ClashModules" folder contains the designs for each individual component as well as the main Controller module which demonstrates how the components work together to produce a final output of the JPEG encoding algorithm.

## Usage

Testing the functionality of the RgbToYCbCr module

```bash
simulate @System mealyMachine [(120,50,20)]
```

To encode your image, position it in the "Python" directory. Run the command:
```bash
python img_to_matrix.py
```
This command creates a file InputMatrix.hs which can be used as an input to the Controller module to encode your own image. The InputMatrix.hs file just needs to be repositioned into the ClashModules directory for the Controller module to be able to read it.


## License

[MIT](https://choosealicense.com/licenses/mit/)