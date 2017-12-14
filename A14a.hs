import KnotHash
import Data.Char
import Data.Bits

main = do
    fmap (
        foldl1 (+).
        map (foldl1 (+)).
        map (map $ \x ->  foldl1 (+) $ map (signum . (.&.) x) [8,4,2,1]).
        map (map $ \x -> if ord x < 90 then (ord x)-48 else (ord x)-87).
        map knot.
        (\s -> map (\x -> (++) s $ (++) "-" $ show x) [0..127])) $ getLine
    >>= print