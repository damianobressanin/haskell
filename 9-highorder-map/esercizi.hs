{-
verificaPari :: [Int] -> [Bool]
verificaPari [] = []
verificaPari (x:xs) = (even x):(verificaPari xs)
-- verificaPari (x:xs) = [even x]++(verificaPari xs)

-- volendo al posto di even si può usare una funzione scritta con il modulo
ePari x = if x `mod` 2 == 0
          then True
          else False
          
incrList :: [Int] -> [Int]
incrList [] = []
incrList (x:xs) = (x+1):(incrList xs)
-}

-- rifacciamo la map
map' f [] = []
map' f (x:xs) = (f x):(map' f xs)

-- verifica pari con la map si risolve in una riga!
verificaPari xs = map even xs



-- non ci piace incrementa perché se dopo devo fare un programma che incrementa per altri valori mi ritrovo al problema di partenza
-- incrementa x = x+1
-- incrList xs = map incrementa xs

{-
Usiamo il currying:
somma x y = x+y
(somma x) y
(somma 1) y
cioé vado a fare y+1 perché nel codice della map (che è lo stesso della map') c'è l'applicazione della funzione alla head della lista
e gli arriva la funzione che ha già il primo parametro impostato e quindi gli basta solo il secondo (la head della lista)
-}
somma x y = x+y
incrList xs = map (somma 1) xs

incrList' n xs = map' (somma n) xs

-- esercizio map e matQuad

-- square :: Double -> Double
square x = x*x

-- squareList :: [Double] -> [Double]
squareList [] = []
squareList xs = map square xs

-- matQuad :: [[Double]] -> [[Double]]
matQuad [] = []
matQuad [[]] = [[]]
matQuad xss = map squareList xss

