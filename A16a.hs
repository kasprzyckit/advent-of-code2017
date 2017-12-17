import System.IO
import Data.List.Split
import Data.Char
import Data.List
ln = 16

main = do
    fmap (
       foldl (\s (o:r) -> case o of
            's' -> (drop sz s) ++ (take sz s) where sz = ln - (read r)
            'x' -> (take fs s) ++ [s !! sn] ++ (drop (fs+1) $ take sn s) ++ [s !! fs] ++ (drop (sn+1) s)
                where rd = splitOn "/" r
                      fs = min (read $ head rd) $ read $ last rd
                      sn = max (read $ head rd) $ read $ last rd
            'p' -> (take fs s) ++ [s !! sn] ++ (drop (fs+1) $ take sn s) ++ [s !! fs] ++ (drop (sn+1) s)
                where fs = min fr sd
                      sn = max fr sd
                      fr = (\(Just a)->a) $ findIndex (==(head r)) s
                      sd = (\(Just a)->a) $ findIndex (==(last r)) s
            _ -> s)
        (map (chr.(+96)) [1..ln]).
        splitOn ",") $ readFile "16.txt"
    >>= print