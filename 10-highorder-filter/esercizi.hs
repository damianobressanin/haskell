-- Esercizio lezione 10

listaDiCoppie xs = zip xs [1..length xs]

trova :: Eq t => [t] -> t -> [Int]
{-
Pattern matching ridondante: la lista vuota c'è già nella filter'
trova [] k = []
-}
trova xs k = filter' (confronto k) (listaDiCoppie xs)

filter' f [] = []
filter' f (x:xs)
        | f (fst x) = (snd x):filter' f xs
        | otherwise = filter' f xs

confronto x y = x==y


{-
Esempio di output:

*Main> listaDiCoppie "Testo di prova"
[('T',1),('e',2),('s',3),('t',4),('o',5),(' ',6),('d',7),('i',8),(' ',9),('p',10),('r',11),('o',12),('v',13),('a',14)]
-}

{-
costruisco una filter modificata apposta per l'esercizio.
Prendo spunto dalla filter originale:

myFilter f [] = []
myFilter f (x:xs)
        | f x = x:myFilter f xs
        | otherwise = myFilter f xs
-}




-- SOLUZIONE DEL PROFESSORE:
trova' xs v =
        map snd (filter (uguali v) (zip xs [1..l]))
        where l = length xs

uguali v (u,_) = v==u
