import System.IO
import Data.List
ln = 256

wordsWhen     :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'

kn :: [Int] -> Int -> Int -> [Int] -> [Int]
kn ls n sk [] = ls
kn ls n sk (x:xs) = kn 
        ((if n+x > ln then drop (ln-n) rev else []) ++
            (drop (if n+x >= ln then (n+x)`mod`ln else 0) $ take n ls) ++
            (if n+x > ln then take (ln-n) rev else rev) ++
            drop (n+x) ls)
        ((n + x + sk) `mod` ln) (sk+1) xs
        where
            rev = reverse $ drop n $ take (n + x) $ ls ++ ls

knot :: String -> Int
knot = (\ls -> ls!!0 * ls!!1).
    kn [0..ln-1] 0 0 .
    fmap read.
    wordsWhen (==',')

main = do
    contents <- readFile "10.txt"
    print $ knot contents