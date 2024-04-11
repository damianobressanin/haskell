test = [x^2 | x <- [1..5]]

test' a b = [x^a | x <- [1..b]]
testQuadrati = test' 2
testLunga5 aa = test' aa 5

-- la lista contiene un 1 per ogni elemento della lista. Poi faccio la somma ed ottengo quindi il numero di elemti della lista, cioé la lunghezza
length' xs = sum [1 | _<- xs]


