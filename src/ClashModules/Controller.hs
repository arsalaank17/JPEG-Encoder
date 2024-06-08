module Controller where
import Clash.Prelude

import RgbToYCbCr
import ChrominanceSubsampling
import DCT
import Quantization
import RunLengthEncoding
import InputMatrix

type FixedPoint = SFixed 16 16


-- RGB to YCbCr color conversion --> USING THE GENERATED MATRIX BY THE "img_to_matrix.py" SCRIPT stored in the InputMatrix.hs file<--  
converted ::  Vec 8 (Vec 8 (SFixed 16 16, SFixed 16 16, SFixed 16 16))
converted = RgbToYCbCr.rgbToYCbCrMatrix InputMatrix.inputMatrix

-- Chrominance Subsampling is preformed on the Chrominance Chanel
subsampled :: Vec 3 (Vec 8 (Vec 8 ChrominanceSubsampling.FixedPoint)) 
subsampled = ChrominanceSubsampling.topEntity converted

-- Discrete Cosine Transform 
dct_aplied :: Vec 3 (Vec 8 (Vec 8 DCT.FixedPoint)) 
dct_aplied = DCT.dctMain subsampled DCT.cosineLookupTable

-- Quantization
quantized :: Vec 3 (Vec 8 (Vec 8 (Integer)))
quantized = Quantization.quantization dct_aplied Quantization.quantizationMat

-- data preperation for Entropy Encoding with zig-zag traversal of the data
zigZagTraversal :: Vec 3 (Vec 64 Integer)
zigZagTraversal = map RunLengthEncoding.matrixZigZag quantized

-- encoding an image represented by the RGB values in the inputMatrix
encode :: Vec 3 (Vec 64 Integer)
encode = zigZagTraversal

