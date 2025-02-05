module InputMatrix where
import Clash.Prelude
type Matrix = Vec 8 (Vec 8 (SFixed 16 16, SFixed 16 16, SFixed 16 16))
inputMatrix :: Matrix
inputMatrix = (
  ((0, 188, 212) :> (0, 188, 212) :> (16, 188, 211) :> (17, 187, 211) :> (18, 187, 211) :> (15, 187, 211) :> (0, 188, 212) :> (1, 188, 212) :>  Nil) :> 
  ((2, 188, 212) :> (29, 189, 212) :> (213, 184, 206) :> (232, 186, 209) :> (229, 184, 206) :> (217, 186, 209) :> (30, 188, 212) :> (0, 189, 212) :>  Nil) :> 
  ((13, 188, 211) :> (213, 179, 204) :> (254, 181, 203) :> (237, 172, 190) :> (249, 181, 202) :> (241, 172, 190) :> (213, 181, 204) :> (32, 185, 209) :>  Nil) :> 
  ((32, 178, 205) :> (240, 145, 185) :> (231, 165, 187) :> (52, 43, 55) :> (207, 154, 174) :> (53, 44, 54) :> (230, 165, 187) :> (243, 138, 180) :>  Nil) :> 
  ((239, 132, 176) :> (250, 174, 200) :> (230, 167, 197) :> (95, 95, 173) :> (215, 165, 199) :> (94, 95, 172) :> (230, 164, 196) :> (243, 135, 177) :>  Nil) :> 
  ((241, 129, 174) :> (247, 121, 167) :> (246, 99, 151) :> (240, 171, 202) :> (249, 186, 208) :> (244, 173, 203) :> (222, 97, 150) :> (33, 175, 203) :>  Nil) :> 
  ((28, 170, 200) :> (188, 43, 116) :> (250, 103, 155) :> (249, 128, 171) :> (229, 181, 205) :> (246, 159, 188) :> (188, 44, 115) :> (9, 174, 203) :>  Nil) :> 
  ((9, 176, 204) :> (180, 32, 108) :> (226, 27, 97) :> (200, 47, 111) :> (43, 167, 197) :> (190, 39, 112) :> (199, 36, 104) :> (16, 176, 204) :>  Nil) :> 
    Nil)
