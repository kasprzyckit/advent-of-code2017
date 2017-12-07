import System.IO
import Data.List

parse :: String -> String
parse s = case last s of
    ',' -> init s
    ')' -> init $ tail s
    c -> s

getW :: String -> [[String]] -> Int
getW key (x:xs) = if (head x) == key
    then read $ x !! 1
    else getW key xs

getCh :: String -> [[String]] -> [String]
getCh key (x:xs) = if (head x) == key
    then if length x > 2 then drop 3 x else []
    else getCh key xs

diff :: [Int] -> Int
diff l = if length l < 3 then -1 else 
    if l !! 0 /= l !! 1 then if l !! 0 == l !! 2 then 1 else 0 else diff' (tail l) 2
    where diff' [x] n = -1
          diff' (x:xs) n = if x /= (head xs) then n else diff' xs (n+1)

weights :: [String] -> [(Int, Int)] -> [[String]] -> [Int]
weights [] l nodes = []
weights (x:xs) (y:ys) nodes = [(getW x nodes) + (fst y)] ++ (weights xs ys nodes)

findWeight :: String -> [[String]] -> (Int, Int)
findWeight root nodes = if ch == [] then (0, -1) else
    if foldl (\acc x -> acc || (snd x) /= -1) False chil then
      foldl (\acc x -> if (snd x) /= -1 then x else acc) (0,0) chil else
      if dif == -1 then (sumCh, -1) else  
        if dif == 0 then (0, (getW (head ch) nodes) + (weig !! 1) - (weig !! 0)) else
          (0, (getW (ch !! dif) nodes) + (weig !! 0) - (weig !! dif))
    where
      ch = getCh root nodes
      chil = fmap (\c -> findWeight c nodes) ch
      weig = weights ch chil nodes
      dif = diff weig
      sumCh = sum weig


unbalanced :: String -> String -> (Int, Int)
unbalanced root = findWeight root.
         map (map parse).
         fmap words.
         lines

main = do  
    contents <- readFile "07.txt"
    root <- getLine
    print $ snd $ unbalanced root contents