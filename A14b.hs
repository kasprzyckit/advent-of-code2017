import KnotHash (knot)
import Data.Char (ord)
import Data.Bits ((.&.))
import Data.IntDisjointSet(empty, insert, union, disjointSetSize)
ln = 128

main = do
    fmap (
        disjointSetSize.
        (\d s -> foldl (\d1 y->foldl (\d2 x-> if s !! y !! x then
            union (x + y*129) ((x-1)+y*129) (union (x + y*129) (x + (y-1)*129) $ insert (x + y*129) d2) 
            else d2) d1 [0..128]) d [0..(ln-1)]) Data.IntDisjointSet.empty.
        map (map $ (==) 1).
        map ((++) [0]).
        map (foldl1 (++)).
        map (map $ \x -> map (signum . (.&.) x) [8,4,2,1]).
        map (map $ \x -> if ord x < 90 then (ord x)-48 else (ord x)-87).
        map knot.
        (\s -> map (\x -> (++) s $ (++) "-" $ show x) [0..(ln-1)])) $ getLine
    >>= print