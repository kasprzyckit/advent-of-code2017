import System.IO
import Data.List

main = do
    fmap (
        (\(Just x) -> x).
        (\s -> find (\n -> foldl1 (&&) $ 
            map (\(x:y:xs) -> (x+n) `mod` ((y-1)*2) /= 0) s) [0..]).
        map (map (\x -> x+0)).
        map (map read).
        map (\(x:xs) -> (init x):xs).
        map words.
        lines) $ readFile "13.txt"
    >>= print