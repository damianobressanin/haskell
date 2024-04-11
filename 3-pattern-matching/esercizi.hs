-- Esercizio 1
lunghezza [] = 0
lunghezza (x:xs) = 1 + lunghezza xs


-- Esercizio 2
concatena xs [] = xs
concatena [] ys = ys
concatena (x:xs) ys = x:concatena xs ys
