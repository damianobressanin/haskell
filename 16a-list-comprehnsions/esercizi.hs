
fattori :: Int -> [Int]
fattori n = [x | x <- [1..n], n `mod` x == 0]

-- NB: PRIMA definiso i valori di x e POI ci metto delle condizioni (Booleane) su quei valori


primo :: Int -> Bool
primo n = fattori n == [1,n]

listaPrimiN :: Int -> [Int]
listaPrimiN n = [x | x <- [2..n], primo x]

{-
-- Order Matters!
om = [(x,y) | odd x, x <- [1..10], y <- [1..x], even (x*y)]


esercizi.hs:15:19: error: Variable not in scope: x :: Integer
   |
15 | om = [(x,y) | odd x, x <- [1..10], y <- [1..x], even (x*y)]
   |                   ^
Failed, no modules loaded.
-}

-- guardia subito dopo il generatore di x ==> max efficienza
om = [(x,y) | x <- [1..10], odd x, y <- [1..x], even (x*y)]

-- guardia di x dopo il generatore dipendente di y ==> non efficiente
om' = [(x,y) | x <- [1..10], y <- [1..x], odd x, even (x*y)]

-- guardia di x dopo il generatore dipendente di y e dopo le guardie di y ==> ottimizzazone peggiore possibile
om'' = [(x,y) | x <- [1..10], y <- [1..x], even (x*y), odd x]


-- Local Variables: let

lv = [x*y | x <- [1,2,3], y <- [1,2,3]]
lv' = [p | x <- [1,2,3], y <- [1,2,3], let p = x*y]

{-
*Main> lv
[1,2,3,2,4,6,3,6,9]

*Main> lv'
[1,2,3,2,4,6,3,6,9]
-}

-- Esercizi lezione: Pitagorica.

{-
Prelude> [x*y | x <- [1..5], y <- [1..5]]
[1,2,3,4,5,2,4,6,8,10,3,6,9,12,15,4,8,12,16,20,5,10,15,20,25]

Non va bene, voglio una lista di liste mentre qui è una lista unica
-}








-- funzione che moltiplica una lista per uno scalare:
mul scal xs = [p | x <- xs, let p = x*scal]

-- funzione che restituisce la tavola pitagorica fino ad n
pitagorica n = [xs | x <- [1..n], let y = [1..n], let xs = mul x y]


{-
pitagorica 3 = [xs | x <- [1,2,3], let y = [1,2,3], let xs = mul x y]

il concetto chiave è che x scorre i valori da 1 a 3 mentre y è già una lista che contiene 1,2,3.
Ecco perché posso fare il prodotto scalare*lista usando la funzione mul

mul prende uno scalare ed una lista.
x scorre ed assume tutti i valori della lista xs e, per ogni valore, viene salvato il prodotto tra lui e il parametro scal

-}

pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]


