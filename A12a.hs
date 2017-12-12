import System.IO
import Data.Tree
import Data.Graph

main = do
    fmap (length.
        flatten.
        head.
        (\l g -> dfs g l) [0].
        (\(a, b, c) -> a).
        graphFromEdges.
        map (\x -> (0, head x, tail x)).
        map (map $ \x -> if last x == ',' then init x else x).
        map (\(x:y:xs) -> x:xs).
        map words.
        lines) $ readFile "12.txt"
    >>= print