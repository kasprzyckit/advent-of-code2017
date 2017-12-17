main = do
    fmap (
        head.
        (\x -> foldl (\l n -> let ind =  x `mod` (length l) in (drop ind l) ++ (take ind l) ++ [n]
            ) [0] [1..2017]).
        read) $ getLine
    >>= print