lunghezza [] = 0
lunghezza (x:xs) = 1 + lunghezza xs


concatena xs [] = xs
concatena [] ys = ys
concatena (x:xs) ys = x:concatena xs ys
