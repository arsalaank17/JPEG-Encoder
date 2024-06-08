module RunLengthEncoding where

{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
-- {-# HLINT ignore "Eta reduce" #-}
-- {-# HLINT ignore "Use isNothing" #-}
-- {-# HLINT ignore "Use head" #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Clash.Prelude.Testbench
import qualified Data.List as L
import Clash.Prelude
import Data.Maybe
import Data.Maybe (catMaybes)
import Prelude hiding (repeat, head, (!!))
import Clash.Explicit.Testbench
import Language.Haskell.Exts (Literal(Int))
type Value = Maybe(Int,Int)
type VecLength = Vec 64 Value
type InputVec = Vec 8 (Vec 8 Int)

{-Since this program is quite complex a higher spec limit is required to compile it into vhdl. 
In the terminal go to the directory of this file and then type 
clash Run-Length-Encoding.hs --vhdl -fclash-spec-limit=65   -}

{- This program does the Run-Length-Encoding on an 8 by 8 pixel block. It takes as input an 8 by 8 pixel block and 
returns a vector of length 64. It traverses the matrix in a zig zag way and then counts the consecutive duplicate
values. So let's say this is the matrix we get after zigzag traversal 1:>1:>1:>2:>1:>Nil would become (1,3):>(2,1):>(1,1):>Nil 
However, since vectors have a defined length , we have set our output to be of size 64 since that is the maximum size it can be
in the worst case scenario with no duplicates. In case the size is smaller than 64, we fill the vector with "Nothing" and therefore
all the tuples that are in the vector is preceded with "Just". 
Example usage in clashi terminal = topEntity inputVector -}




{-This fucntion below is used to replace a value in the vector at index i with value a. Takes in a Vec n(Maybe(Int,Int)) as input
and outputs the same but with the element replaced -}
(~<~) :: (KnownNat n, Enum i) => Vec n (Maybe (Int, Int)) -> (i,  (Maybe (Int, Int))) -> Vec n (Maybe (Int, Int))
xs ~<~ (i,a) = replace i a xs
{-# NOINLINE (~<~) #-}


{-This function below is used to fetch the value inside the vector at an index i -}
(~>~) :: (KnownNat n ) => Vec n (Maybe (Int, Int)) -> Int -> Maybe (Int, Int)
xs ~>~ i = xs !! i

{-This function is used in the actual implementation of the myReplace used in the function below -}
{-# NOINLINE myReplace #-}
myReplace :: (KnownNat n) => Int -> a -> Vec n a -> Vec n a
myReplace i a xs = imap (\j x -> if j == fromIntegral i then a else x) xs

{-This function is is the same as (~<~) but used for a different data type.-}
(<~) :: VecLength-> (Int, Value) -> VecLength
xs <~ (i,a) = myReplace i a xs
{-# NOINLINE (<~) #-}

{-This function is is the same as (~>~) but used for a different data type.-}
(~>) :: Vec 64 Int -> Int -> Int
xs ~> i = xs !! fromIntegral i


type State = (Int, Vec 64 (Maybe (Int, Int)))

{-Counts the consecutive duplicates in a vector and replaces them with tuples
 consisting of the element and the number of consecutive occurrences.-} 
countCon :: Vec 64 Int -> Int -> Int -> State -> State
countCon vec sp curr res
                 | sp == 63  = if temp /= curr then (resPtr+1, currRes ~<~ (resPtr+1, Just (temp, 1))) else (resPtr, currRes ~<~ (resPtr, Just (curr, currCount+1))) --Base case reached the end of the vector
                 | otherwise =  if temp /= curr then countCon vec next temp (resPtr+1, currRes ~<~ (resPtr+1, Just (temp, 1))) 
                 else (if currValue == Nothing then countCon vec next temp (resPtr, currRes ~<~ (resPtr, Just (curr, 1))) 
                 else countCon vec next temp (resPtr, currRes ~<~ (resPtr, Just (curr, currCount+1)))) -- If the current element is different from the temporary element, add it to the result with count 1, otherwise increment the count of the current element.
            where temp = vec ~> sp -- Current element
                  resPtr = fst res -- Result pointer
                  next = sp + 1 -- Index of the next element
                  currRes = snd res -- Current result
                  currValue = currRes ~>~ resPtr -- Current value in the result at the result pointer
                  currCount = snd (fromJust currValue) -- Current count (extracted from the current value)


{-Does zigzag matrix traversal as required in the RLE encoding algorithm. This takes in an 8x8 image pixel
 and outputs the 64 vectors that it traverses in order. This is then passed onto the countCon function which 
 counts the concurrent duplicates in this Vec 64.  -}
{-# NOINLINE matrixTraversalZigZag #-}
matrixTraversalZigZag :: Vec 8 (Vec 8 Int) -> Vec 64 Int
matrixTraversalZigZag input = 
     row 0 !! 0  :> row 0 !! 1 :> row 1 !! 0 :> row 2 !! 0
  :> row 1 !! 1  :> row 0 !! 2 :> row 0 !! 3 :> row 1 !! 2  
  :> row 2 !! 1  :> row 3 !! 0 :> row 4 !! 0 :> row 3 !! 1  
  :> row 2 !! 2  :> row 1 !! 3 :> row 0 !! 4 :> row 0 !! 5  
  :> row 1 !! 4  :> row 2 !! 3 :> row 3 !! 2 :> row 4 !! 1  
  :> row 5 !! 0  :> row 6 !! 0 :> row 5 !! 1 :> row 4 !! 2  
  :> row 3 !! 3  :> row 2 !! 4 :> row 1 !! 5 :> row 0 !! 6  
  :> row 0 !! 7  :> row 1 !! 6 :> row 2 !! 5 :> row 3 !! 4  
  :> row 4 !! 3  :> row 5 !! 2 :> row 6 !! 1 :> row 7 !! 0  
  :> row 7 !! 1  :> row 6 !! 2 :> row 5 !! 3 :> row 4 !! 4  
  :> row 3 !! 5  :> row 2 !! 6 :> row 1 !! 7 :> row 2 !! 7  
  :> row 3 !! 6  :> row 4 !! 5 :> row 5 !! 4 :> row 6 !! 3  
  :> row 7 !! 2  :> row 7 !! 3 :> row 6 !! 4 :> row 5 !! 5  
  :> row 4 !! 6  :> row 3 !! 7 :> row 4 !! 7 :> row 5 !! 6  
  :> row 6 !! 5  :> row 7 !! 4 :> row 7 !! 5 :> row 6 !! 6  
  :> row 5 !! 7  :> row 6 !! 7 :> row 7 !! 6 :> row 7 !! 7
  :> Nil
  where
    row n = input !! n

matrixZigZag :: Vec 8 (Vec 8 Integer) -> Vec 64 Integer
matrixZigZag input = 
     row 0 !! 0  :> row 0 !! 1 :> row 1 !! 0 :> row 2 !! 0
  :> row 1 !! 1  :> row 0 !! 2 :> row 0 !! 3 :> row 1 !! 2  
  :> row 2 !! 1  :> row 3 !! 0 :> row 4 !! 0 :> row 3 !! 1  
  :> row 2 !! 2  :> row 1 !! 3 :> row 0 !! 4 :> row 0 !! 5  
  :> row 1 !! 4  :> row 2 !! 3 :> row 3 !! 2 :> row 4 !! 1  
  :> row 5 !! 0  :> row 6 !! 0 :> row 5 !! 1 :> row 4 !! 2  
  :> row 3 !! 3  :> row 2 !! 4 :> row 1 !! 5 :> row 0 !! 6  
  :> row 0 !! 7  :> row 1 !! 6 :> row 2 !! 5 :> row 3 !! 4  
  :> row 4 !! 3  :> row 5 !! 2 :> row 6 !! 1 :> row 7 !! 0  
  :> row 7 !! 1  :> row 6 !! 2 :> row 5 !! 3 :> row 4 !! 4  
  :> row 3 !! 5  :> row 2 !! 6 :> row 1 !! 7 :> row 2 !! 7  
  :> row 3 !! 6  :> row 4 !! 5 :> row 5 !! 4 :> row 6 !! 3  
  :> row 7 !! 2  :> row 7 !! 3 :> row 6 !! 4 :> row 5 !! 5  
  :> row 4 !! 6  :> row 3 !! 7 :> row 4 !! 7 :> row 5 !! 6  
  :> row 6 !! 5  :> row 7 !! 4 :> row 7 !! 5 :> row 6 !! 6  
  :> row 5 !! 7  :> row 6 !! 7 :> row 7 !! 6 :> row 7 !! 7
  :> Nil
  where
    row n = input !! n

{-This is the vector that we append to finally. This is a vector containing 64 Nothings. We want the duplicate count and then the 
 rest of the values to be nothing since vectors have to be of a defined length which is 64 in our case. -}
inputNothing :: Vec 64 (Maybe (Int, Int))
inputNothing = repeat Nothing

{-This is the topEntity of our implementation , it combines everything that the RLE requires to execute
takes in the 8 by 8 pixel block as input and outputs the Vector with consecutive duplicates removed!
-}
topEntity :: Vec 8 (Vec 8 Int) -> Vec 64 (Maybe (Int,Int))
topEntity input =  snd (countCon (matrixTraversalZigZag input)  0 1 (0,inputNothing))

testing5 = snd (countCon vec0output 0 1 (0,inputNothing))

vec0output :: Vec 64 Int
vec0output = Clash.Prelude.repeat 0     

--Feel free to change the input vector to whatever for testing.
inputVector :: Vec 8 (Vec 8 Int)
inputVector =
  ( 1 :>  1 :>   6 :>  7 :> 15 :> 16 :> 28 :> 29 :> Nil) :>
  ( 1 :>  5 :>  8 :> 14 :> 17 :> 27 :> 30 :> 43 :> Nil) :>
  ( 1 :>  9 :> 21 :> 18 :> 26 :> 31 :> 42 :> 44 :> Nil) :>
  (10 :> 12 :> 25 :> 25 :> 32 :> 41 :> 45 :> 54 :> Nil) :>
  (11 :> 20 :> 24 :> 33 :> 40 :> 46 :> 53 :> 55 :> Nil) :>
  (21 :> 23 :> 34 :> 39 :> 47 :> 52 :> 56 :> 61 :> Nil) :>
  (22 :> 35 :> 38 :> 48 :> 51 :> 57 :> 60 :> 62 :> Nil) :>
  (36 :> 37 :> 49 :> 50 :> 58 :> 59 :> 63 :> 64 :> Nil) :>
  Nil
vec1input :: Vec 8 (Vec 8 Int)
vec1input = ( 1 :>  2 :>   6 :>  7 :> 15 :> 16 :> 28 :> 29 :> Nil) :>
        ( 3 :>  5 :>  8 :> 14 :> 17 :> 27 :> 30 :> 43 :> Nil) :>
        ( 4 :>  9 :> 21 :> 18 :> 26 :> 31 :> 42 :> 44 :> Nil) :>
        (10 :> 12 :> 25 :> 25 :> 32 :> 41 :> 45 :> 54 :> Nil) :>
        (11 :> 20 :> 24 :> 33 :> 40 :> 46 :> 53 :> 55 :> Nil) :>
        (21 :> 23 :> 34 :> 39 :> 47 :> 52 :> 56 :> 61 :> Nil) :>
        (22 :> 35 :> 38 :> 48 :> 51 :> 57 :> 60 :> 62 :> Nil) :>
        (36 :> 37 :> 49 :> 50 :> 58 :> 59 :> 63 :> 64 :> Nil) :>
          Nil

--Here begins the testing for the matrix traversal zigzag. After compiling the file , type "test" in the terminal to run the tests
test :: IO()
test = do
  --Creating a matrix full of 0's. The traversal should still be all 0's
  let vec0input = ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
       ( 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> 0 :> Nil ) :>
        Nil
  let vec0output :: Vec 64 Int
      vec0output = Clash.Prelude.repeat 0     
  
  if matrixTraversalZigZag vec0input == vec0output then  putStrLn "test1 for matrixTraversalZigZag Passed" 
    else  putStrLn "test1 for matrixTraversalZigZag Failed"

  --Creating a matrix such that the zigzag traversal would lead to numbers 1 to 64 in a vector.  
  let vec1input :: Vec 8 (Vec 8 Int)
      vec1input = ( 1 :>  2 :>   6 :>  7 :> 15 :> 16 :> 28 :> 29 :> Nil) :>
            ( 3 :>  5 :>  8 :> 14 :> 17 :> 27 :> 30 :> 43 :> Nil) :>
            ( 4 :>  9 :> 13 :> 18 :> 26 :> 31 :> 42 :> 44 :> Nil) :>
            (10 :> 12 :> 19 :> 25 :> 32 :> 41 :> 45 :> 54 :> Nil) :>
            (11 :> 20 :> 24 :> 33 :> 40 :> 46 :> 53 :> 55 :> Nil) :>
            (21 :> 23 :> 34 :> 39 :> 47 :> 52 :> 56 :> 61 :> Nil) :>
            (22 :> 35 :> 38 :> 48 :> 51 :> 57 :> 60 :> 62 :> Nil) :>
            (36 :> 37 :> 49 :> 50 :> 58 :> 59 :> 63 :> 64 :> Nil) :>
          Nil


  let vec1output :: Vec 64 Int
      vec1output = 1 :> 2 :> 3 :> 4 :> 5 :> 6 :> 7 :> 8 :> 9 :> 10 :>
                    11 :> 12 :> 13 :> 14 :> 15 :> 16 :> 17 :> 18 :> 19 :> 20 :>
                    21 :> 22 :> 23 :> 24 :> 25 :> 26 :> 27 :> 28 :> 29 :> 30 :>
                    31 :> 32 :> 33 :> 34 :> 35 :> 36 :> 37 :> 38 :> 39 :> 40 :>
                    41 :> 42 :> 43 :> 44 :> 45 :> 46 :> 47 :> 48 :> 49 :> 50 :>
                    51 :> 52 :> 53 :> 54 :> 55 :> 56 :> 57 :> 58 :> 59 :> 60 :>
                    61 :> 62 :> 63 :> 64 :> Nil
  

  if matrixTraversalZigZag vec1input == vec1output then  putStrLn "test2 for matrixTraversalZigZag Passed" 
  else  putStrLn "test2 for matrixTraversalZigZag Failed"

  --testing count con. Creating a vector with 61 1's and 3 2's. 
  let inputCountCon :: Vec 64 Int
      inputCountCon = 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :>
        1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :>
        1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :>
        1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :> 1 :>
        1 :>  2 :> 2 :> 2 :> Nil

  --expected output for countCon
  let output0 :: Vec 64 (Maybe (Int, Int))
      output0 = Just (1,61) :> Just (2,3) :> Clash.Prelude.repeat Nothing

  if snd (countCon inputCountCon 0 1 (0,inputNothing)) == output0 then  putStrLn "test1 for countCon Passed" 
  else  putStrLn "test1 for countCon Failed"

