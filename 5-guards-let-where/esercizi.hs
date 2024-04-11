-- trova e correggi gli errori di sintassi:
{-
Versione sbagliata
N = a ´div´ length xs
        where
            a=10
          xs=[1,2,3,4,5]
-}
-- Versione corretta
n = a `div` length xs
        where
                a = 10
                xs = [1..5]


{- Esercizio safetail: tail è definita come:
tail (x:xs) = xs
Non è un pattern esaustivo e se gli passo [] si pianta.
Correggila in 3 modi diversi per farla funzionare anche in presenza della stringa vuota in input.
        a) conditional expression
        b) guarded equations
        c) pattern matching
        
        Hint#1: la funzione di libreria null può essere usata per testare se una lista è vuota
                null::[a] -> Bool
        
        Hint#2: posso confrontare una lista che creo io vuota con un'altra lista.
                Se sono uguali allora anche la seconda lista è vuota
                let x = [] in x==[] True
                let x = [1,2,3] in x==[] False
                
        Hint#3: posso usare la length per capire se la lista è vuota. Non usarla perché non è efficiente.
                length == 0
-}
safeTail xs = if xs==[]
              then []
              else tail xs


safeTail' xs
        | xs==[] = []
        | otherwise = tail xs


safeTail'' [] = []
safeTail'' (x:xs) = xs





{- Esercizio ||:
        definisci || in altri 3 modi usando il pattern matching
-}
myOr False False = False
myOr True _ = True
myOr _ True = True

{-
Funziona ma non è pattern matching, questo è con le guardie
myOr' x y
        | x==False && y==False = False
        | otherwise = True
-}


-- non mi vengono in mente gli altri modi con il pattern matching...


{- Esercizio &&:
        definisci && usando if-then-else
-}
myAnd x y = if ((x==True) && (y==True))
            then True
            else False


{-
-- Primo step: cifrare in avanti con k>0

myCipher [] k = []
myCipher xs 0 = xs
myCipher (x:xs) k = let avanti a b = if b==0
                                     then a
                                     else avanti (succ a) (b-1)
                                     in (avanti x k):(myCipher xs k)
-}
-- Esercizio finito: cifra in avanti se k>0 e cifra all'indietro se k<0
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

