{-
FUNZIONI COMPOSTE:

Prelude> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c

prende una funzione che fa da (b -> c), un'altra funzione che fa da (a -> b) e restituisce una funzione che va da (a -> c)

a -> b
b -> c
a -> c
 
-}


componi f g x = f (g x)

-- uso currying
odd' = not.even

-- Esercizio videolezione
dati = [("Luigi", [2,5,1,3]), ("Sara", [2,3,8,0]), ("Carla", [2,2,1]), ("Velia", [3,2,1])]
--seleziona :: (Ord a, Num a) => (String, [a]) -> String

--versione che funziona
--seleziona xs = filter (\ x -> (sum (snd x)) > 10) xs

-- ci metto la section per >10
--seleziona xs = filter (\ x -> (>10) (sum (snd x))) xs

{- il prof ci fa notare che ci sono ben 3 funzioni composte:
(>10)   sum     snd x

E dato che sono funzioni composte si possono scrivere con il (.)
-}

--seleziona xs = filter ((>10).sum.snd) xs

-- Nota bene: facendo così ho anche rimosso la lambda expression!

{- Ora quello che ci manca è prendere solo il primo campo perché al momento l'output è questo:

*Main> selezionaComp dati
[("Luigi",[2,5,1,3]),("Sara",[2,3,8,0])]

-}

seleziona xs = map (fst) (filter ((>10).sum.snd) xs)

{-
Ora l'output è il seguente:

*Main> seleziona dati
["Luigi","Sara"]

-}

-- il prof si sofferma sulla forza delle funzioni di ordine superiore: sono strumenti potenti che ci permettono di risolvere esercizi e problemi in una sola riga di codice molto compatto. Il prof dice che è proprio il linguaggio che è potente

{-
ESERCIZIO FINE LEZIONE
Data una lista di numeri creare una lista di tutti i negati dei valori assoluti usando la funzione map.
Alcune funzioni utili possono essere abs e negate
-}

{-
numeri = [1,-2,3,4,-7]

*Main> numeri 
[1,-2,3,4,-7]

*Main> map abs numeri 
[1,2,3,4,7]

map negate (map abs numeri)

*Main> map negate (map abs numeri)
[-1,-2,-3,-4,-7]
-}

-- funzione scritta come mi verrebbe naturale 
negatedAbs xs = map negate (map abs xs)

-- funzione scritta cercando di usare la composizione di funzioni
composedNegatedAbs xs = map (negate.abs) xs
