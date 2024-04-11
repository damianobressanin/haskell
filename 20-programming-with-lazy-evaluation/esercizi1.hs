-- LISTE INFINITE
nPari n = take n [x|x<-[1..], mod x 2 == 0]


pairs xs = zip [1..l] xs where l = length xs

pairs' xs = zip [1..] xs
{-
codice più compatto.
codice più efficiente: non viene calcolata la length (per calcolarla bisogna scorrere tutta la lista).
Usando le liste infinite con la lazy evaluation si va a generare solo gli elementi che gli servono.
-}


replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x


replicate'' n x = let valore x = x:valore x in take n (valore x)

{-
*Main> replicate'' 7 "abc"
["abc","abc","abc","abc","abc","abc","abc"]
-}

fib = 1:1:[a+b | (a,b) <- zip fib (tail fib)]
{-
fib è una funzione  che non si ferma mai.
Facendo così ho proprio definito la funzione com'è nella realtà: una sequenza infinita di numeri.
Posso farlo solo se ragiono con la Lazy Evaluation, se usassi la Eager Evaluation non me ne farei nulla.
Per esempio: take 10 fib
-}
-- La funzione di libreria iterate genera liste infinite: es con metodo di Erone per la radice quadrata:

better a x = (1/2)*(x + a/x)

within eps (x:y:ys)
        | abs (x-y) <= eps = y
        | otherwise = within eps (y:ys)

squareRoot a = within 1e-9 (iterate (better a) 1)



