import System.IO
import Data.Tree
import Data.List
import Data.Graph

v [] = []
v (x:xs) = [(0, head x, tail x)] ++ (v xs)

bulidGraph :: [[Int]] -> Graph
bulidGraph s = a
    where (a, b, c) = graphFromEdges $ v s

pipes :: String -> Int
pipes = length.
    components.
    bulidGraph.
    fmap (fmap read).
    map (map (\x -> if last x == ',' then init x else x)).
    map (\(x:y:xs) -> x:xs).
    fmap words.
    lines

main = do
    contents <- readFile "12.txt"
    print $ pipes contents