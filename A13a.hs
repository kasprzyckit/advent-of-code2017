import System.IO

main = do
    fmap (
        foldl1 (+).
        map (\(x:y:xs) -> if x `mod` ((y-1)*2) == 0 then x*y else 0).
        map (map read).
        map (\(x:xs) -> (init x):xs).
        map words.
        lines) $ readFile "13.txt"
    >>= print