import System.IO
import Data.List
  
divisible :: [Int] -> Int
divisible [] = 0   --never executes, assuming correct input data
divisible (x:xs) = if tmp /= 0 then tmp else divisible xs
                    where tmp = quotient x xs
                          quotient n [] = 0
                          quotient n (y:ys) = if y `mod` n == 0 then quot y n else quotient n ys

evenly :: String -> Int
evenly = foldl1 (+).
         fmap divisible.
         fmap sort.
         fmap (fmap read).
         fmap words.
         lines

main = do  
    contents <- readFile "02.txt"  
    print (evenly contents)