--Rifaccio il cifrario di Cesare con la map:
{-
myCipherI

myCipher [] k = []
myCipher xs 0 = xs
myCipher (x:xs) k = if k>0
                    then let avanti a b = if b==0
                                          then a
                                          else avanti (succ a) (b-1)
                                          in (avanti x k):(myCipher xs k)
                    else let indietro c d = if d==0
                                            then c
                                            else indietro (pred c) (d+1)
                                            in (indietro x k):(myCipher xs k)
-}


{-
avanti k x
        | k == 0 = x
        | k > 0 = avanti (k-1) (succ x)
        | otherwise = x

indietro k x
        | k == 0 = x
        | k < 0 = indietro (k+1) (pred x)
        | otherwise = x
-}


cifraCarattere :: Int -> Char -> Char
cifraCarattere k x
        | k > 0 = cifraCarattere (k-1) (succ x)
        | k < 0 = cifraCarattere (k+1) (pred x)
        | k == 0 = x


myCipherII :: Int -> [Char] -> [Char]
myCipherII k [] = []
myCipherII 0 xs = xs
myCipherII k xs = map (cifraCarattere k) xs


-- Faccio la terza versione con: dichiarazione tipi, pattern matching, let, guards, ricorsione, map e currying

myCipherIII :: Int -> [Char] -> [Char]
myCipherIII k [] = []
myCipherIII 0 xs = xs
myCipherIII k xs = let cifraCarattereIII k x
                                | k > 0 = cifraCarattereIII (k-1) (succ x)
                                | k < 0 = cifraCarattereIII (k+1) (pred x)
                                | k == 0 = x
                   in map (cifraCarattereIII k) xs


