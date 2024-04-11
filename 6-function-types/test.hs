fac :: Int -> Int
fac n = product [1..n]

fac' 0 = 1
fac' n = n*(fac' (n-1))


add :: (Int,Int) -> Int
add (x,y) = x+y

length' [] = 0
length' (_:xs) = 1 + length' xs

-- non devo mettere i parametri:  lungheza è una costante di tipo funzione che restituisce length' che poi viene eseguita
lunghezza = length'

add' x y = x+y



-- es lezione Gravity curried

gravity m1 r m2 = 6.67e-11 * m1 * m2 / (r^2)

earthGravity = gravity 5.96e24
{- così facendo io chiamo gravity passandole m1 = massa della Terra
gravity è una funzione con più parametri e dato che c'è il currying si ha

((gravity m1) r) m2
con earthGravity abbiamo "settato" m1 ma non r e m2

earthGravity ha bisogno solo di 2 parametri adesso:
earthGravity r m2

infatti se controllo i tipi ho:
:t earthGravity
earthGravity :: Double -> Double -> Double
-}

earthGravitySurface = earthGravity 6.37e6

