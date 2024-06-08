module Quantization where

import Clash.Prelude

type FixedPoint = SFixed 16 16
type New = Fixed Signed 33 32


quantization :: Vec 3 (Vec 8 (Vec 8 FixedPoint)) -> Vec 3 (Vec 8 (Vec 8 FixedPoint)) -> Vec 3 (Vec 8 (Vec 8 (Integer)))
quantization dctMatrices quantizationMatrices = quantizedMatrices
  where
    quantizedMatrices = zipWith quantizationStep dctMatrices quantizationMatrices

    quantizationStep :: Vec 8 (Vec 8 FixedPoint) -> Vec 8 (Vec 8 FixedPoint) -> Vec 8 (Vec 8 (Integer))
    quantizationStep dctCoeffs quantizationTable = result
      where
        result = zipWith f dctCoeffs quantizationTable

        f :: (Vec 8 FixedPoint) -> (Vec 8 FixedPoint) -> (Vec 8 (Integer))
        f dctRow quantizationTableRow =  res
          where 
            res = zipWith g dctRow quantizationTableRow

            g :: FixedPoint -> FixedPoint -> Integer
            g dctCoeff quantizationValue = fixedToInteger (divide dctCoeff quantizationValue)

-- Function to convert Fixed-point values to Integers
fixedToInteger :: New -> Integer
fixedToInteger x = fromIntegral (truncate x)


quantizationMat :: Vec 3 (Vec 8 (Vec 8 FixedPoint))
quantizationMat = ( ( ( 16  :> 11  :> 10  :> 16  :> 24  :> 40  :> 51  :> 61  :> Nil):> 
                    (12  :> 12  :> 14  :> 19  :> 26  :> 58  :> 60  :> 55  :> Nil) :> 
                    (14  :> 13  :> 16  :> 24  :> 40  :> 57  :> 69  :> 56  :> Nil) :> 
                    (14  :> 17  :> 22  :> 29  :> 51  :> 87  :> 80  :> 62  :> Nil) :> 
                    (18  :> 22  :> 37  :> 56  :> 68  :> 109 :> 103 :> 77  :> Nil) :> 
                    (24  :> 35  :> 55  :> 64  :> 81  :> 104 :> 113 :> 92  :> Nil) :> 
                    (49  :> 64  :> 78  :> 87  :> 103 :> 121 :> 120 :> 101 :> Nil) :> 
                    (72  :> 92  :> 95  :> 98  :> 112 :> 100 :> 103 :> 99  :> Nil) :> 
                    Nil):>
                  ( ( 17  :> 18  :> 24  :> 47  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (18  :> 21  :> 26  :> 66  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (24  :> 26  :> 56  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (47  :> 66  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    Nil):>
                   (( 17  :> 18  :> 24  :> 47  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (18  :> 21  :> 26  :> 66  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (24  :> 26  :> 56  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (47  :> 66  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    (99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> 99  :> Nil) :> 
                    Nil):> Nil)
