module ChrominanceSubsampling where
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

import Clash.Prelude

type State =  Vec 3 (Vec 8 (Vec 8 FixedPoint))
type Input = Vec 8 (Vec 8 (FixedPoint, FixedPoint, FixedPoint))
type Output = Vec 3 (Vec 8 (Vec 8 FixedPoint)) 


type FixedPoint = SFixed 16 16
type Matrices = (Vec 8 (Vec 8 FixedPoint), Vec 8 (Vec 8 FixedPoint), Vec 8 (Vec 8 FixedPoint))
-- type Clk = Clock System
-- type Rst = Reset System
-- type Sig = Signal System




pairVectors :: Vec (4 * 2) FixedPoint -> Vec 4 (Vec 2 FixedPoint)
pairVectors v = unconcatI v

avrg :: Vec 2 FixedPoint -> Vec 2 FixedPoint -> FixedPoint
avrg tuple1 tuple2 = (sum (toList tuple1) + sum (toList tuple2)) / 4
        
avrgValues :: Vec 4 (Vec 2 FixedPoint) -> Vec 4 (Vec 2 FixedPoint) -> Vec 4 FixedPoint
avrgValues v1 v2 = zipWith avrg v1 v2

duplicatedVectors :: Vec 4 FixedPoint -> Vec (4 * 2) FixedPoint
duplicatedVectors v = concatMap (\x -> x :> x :> Nil) v

modifyRows :: Vec 2 (Vec (4 * 2) FixedPoint) -> Vec 2 (Vec (4 * 2) FixedPoint)
modifyRows vec = a:>a:>Nil
  where 
    vec1 = vec !! 0
    vec2 = vec !! 1
    a = duplicatedVectors (avrgValues (pairVectors vec1) (pairVectors vec2))

pairRows :: Vec (4 * 2) (Vec 8 FixedPoint) -> Vec 4 (Vec 2 (Vec 8 FixedPoint))
pairRows matrixx = unconcatI matrixx

unite ::  Vec (4 * 2) (Vec (4 * 2) FixedPoint) -> Vec 8 (Vec 8 FixedPoint)
unite matriix = concat (map modifyRows (pairRows matriix))



toComponents :: Input -> (Vec 8 (Vec 8 FixedPoint), Vec 8 (Vec 8 FixedPoint), Vec 8 (Vec 8 FixedPoint))
toComponents ycbcrMatrix =
  let (rMatrix, gMatrix, bMatrix) = unzip3 (map (unzip3 . map (\(r, g, b) -> (r, g, b))) ycbcrMatrix)
  in (rMatrix, gMatrix, bMatrix)

f :: (Vec 8 (Vec 8 FixedPoint), Vec 8 (Vec 8 FixedPoint), Vec 8 (Vec 8 FixedPoint)) -> Vec 3 (Vec 8 (Vec 8 FixedPoint))
f (matR, matG, matB) = matR :> matG :> matB :> Nil

mainn :: State -> Output
mainn ycbcrMatrixx = (ycbcrMatrixx !! 0) :> (unite (ycbcrMatrixx !! 1)) :> (unite (ycbcrMatrixx !! 2) :> Nil)

-- nextState :: State -> Input -> (State, Output)
-- nextState currentState input = (mainn currentState, mainn currentState)

-- mealyMachine :: HiddenClockResetEnable dom => Signal dom (Input) -> Signal dom (Output)
-- mealyMachine i = mealy nextState emptyMatrix i

topEntity :: Input -> Output
topEntity i = mainn (f (toComponents i))

