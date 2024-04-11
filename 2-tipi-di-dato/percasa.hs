-- Esercizio 1
isPositive xs = if xs == []
                then True
                else
                        if (head xs > 0)
                        then isPositive (tail xs)
                        else False


-- Esercizio 2
elemento n xs = if (n /= 1)
                then elemento (n-1) (tail xs)
                else head xs


-- Esercizio 3
inverti :: [Int] -> [Int]
inverti [] = []
inverti (x:xs) = inverti xs ++ [x]
