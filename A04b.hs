import System.IO
import Data.List
  
areAnagrams :: [String] -> Int
areAnagrams [x] = 1
areAnagrams (x:xs) = if x == head(xs) then 0 else areAnagrams xs

checkLines :: String -> Int
checkLines = foldl1 (+).
         fmap areAnagrams.
         map sort.
         map (map sort).
         fmap words.
         lines

main = do  
    contents <- readFile "04.txt"  
    print (checkLines contents)