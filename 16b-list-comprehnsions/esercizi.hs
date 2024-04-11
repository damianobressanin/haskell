-- String Comprehnsions

count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x==x']
--count x xs = [x' | x' <- xs, x==x']


-- Esercizi per casa:
contaMinuscoli xs = length [x | x <- xs, elem x "qwertyuiopasdfghjklzxcvbnm"]


qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) =
        qsort smaller ++ [x] ++ qsort larger
        where
                smaller = [a | a <- xs, a <= x]
                larger = [b| b <- xs, b > x]





pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], (x*x + y*y == z*z)]





fattori n = [x | x <- [1..n], n `mod` x == 0, x /= n]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], x == (sum.fattori) x]



