module RgbToYCbCr where
import Clash.Prelude

type FixedPoint = SFixed 16 16
type Tuple = (FixedPoint, FixedPoint, FixedPoint)
type Matrix = Vec 8 (Vec 8 Tuple)

type Clk = Clock System
type Rst = Reset System
type Sig = Signal System

-- >>> COMBINATIONAL LOGIC
rgbToYCbCrValues :: Tuple -> Tuple
rgbToYCbCrValues (r, g, b) =
   (  0 + (0.299) * r + (0.587) * g + (0.114) * b
  ,  128 - (0.168736) * r - (0.331264) * g + (0.5) * b
  ,  128 + (0.5) * r - (0.418688) * g - (0.081312) * b
  )

rgbToYCbCrMatrix :: Matrix -> Matrix
rgbToYCbCrMatrix = map (map rgbToYCbCrValues)

-- >>> STATE MACHINE
type State = Tuple
type Input = Tuple
type Output = Tuple

-- State transition function
nextState :: State -> Input -> (State, Output)
nextState currentState input = (rgbToYCbCrValues input, rgbToYCbCrValues input)

-- This mealy machine iterates sequentially a matrix of tuples, applies the rgbToYCbCrValues function to each tuple
mealyMachine :: HiddenClockResetEnable dom => Signal dom (Input) -> Signal dom (Output)
mealyMachine = mealy nextState emptyTuple

topEntity :: Clk -> Rst -> Sig(Input) -> Sig Output
topEntity clk rst i = withClockResetEnable clk rst enableGen mealyMachine i


-- Intial state
emptyTuple :: Tuple
emptyTuple = (0, 0, 0)