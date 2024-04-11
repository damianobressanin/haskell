import Data.List
{-
ESEMPIO di lazy evaluation:

Prelude> foldr (&&) True [1<2, 3>2]
True

Prelude> foldr (&&) True [1<2, 3>20]
False

Prelude> foldr (&&) True [1<2, 3>20, 5/0==5]
False

-}

-- attento che è curried!
myAnd = foldr (&&) True

prefix xs ys = myAnd (zipWith (==) xs ys)

{-
Esempio di output:

*Main> prefix "Haskell" "Haskell"
True

*Main> prefix "Haskell" "LazyEvaluation"
False
-}

-- Ricordiamo che il codice della zipWith è il seguente:
zipWith' f [] _ = []
zipWith' f _ [] = []
zipWith' f (x:xs) (y:ys) = (f x y):zipWith' f xs ys

-- la funzione prefix è ottimizzata ed efficiente grazie alla Lazy Evaluation


and' [] = True
and' (z:zs) = z && (and zs)


ordina = sort [1,2,3,4,5,3,2,1]


--qsort :: Ord a => [a] -> [a]
qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort [y | y <- xs, y < x] ++ [x] ++ qsort [z | z <- xs, z >= x]

minimo = head . qsort

