import System.IO
import Data.Bits
import Numeric
import Data.Char
ln = 256

rep :: Int -> [t] -> [t]
rep 1 l = l
rep n l = l ++ (rep (n-1) l)

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

xr :: [Int] -> [Int]
xr ls = xr' ls []
    where xr' [] l = l :: [Int]
          xr' s l = xr' (drop 16 s) (l ++ [foldl1 (\x y -> x `xor` y) (take 16 s)])

toHex :: Int -> String
toHex = map toLower . reverse . recurse 1
  where recurse b n
          | n < 16    = if b == 1 then [intToDigit n , '0'] else [ intToDigit n ]
          | otherwise = let (q,r) = n `divMod` 16
                        in (intToDigit r) : recurse 0 q

knot :: String -> String
knot = foldl1 (++).
    fmap toHex.
    xr.
    kn [0..ln-1] 0 0.
    rep 64.
    (\l r -> r ++ l) [17, 31, 73, 47, 23].
    fmap ord

main = do
    contents <- readFile "10.txt"
    print  $ knot contents