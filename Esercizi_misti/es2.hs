count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']


conta = count 's' "Mississippi"


-- Funziona anche per le stringhe e per i caratteri
test = [(c,n)|c<-"abd",n<-[1,2,3]]
test' = [(c,n)|c<-['j'..'l'],n<-[1,2,3]]

{- fai esercizio contaMinuscoli.
Per le lettere usa la lista di tutti i caratteri minuscoli ['a'..'z'].
Se il carattere appartiene alla lista allora è minuscolo
-}


-- Quicksort:
qsort [] = []
qsort (x:xs) =
        qsort smaller ++ [x] ++ qsort larger
        where
                smaller = [a | a <- xs, a <= x]
                larger = [b | b <- xs, b > x]
