-- Scrivo la mia funzione repeat N

-- attento che repeatN fa IO e non da un risultato indietro, quindi ci devo mettere l'equivalente del void, cioé ()
repeatN 0 a = return ()
repeatN n a = do
        a
        repeatN (n-1) a

{-
*Main> repeatN 10 (putChar 'y')
yyyyyyyyyy
-}

for [] _ = return ()
for (x:xs) f = do
    f x
    for xs f

{-
*Main> for [1..5] (\x -> putStr (show x))
12345
-}



{-
RISCRIVIAMO LA SEQUENCE
a = action
as = actions
r = risposta
rs = risposte

-}

sequence' [] = return []
sequence' (a:as) = do
        r <- a
        rs <- sequence' as
        r:rs
        -- r e rs sono valori puri, quindi devo fornirli nella monade di IO
        return (r:rs)

-- per implementare il for come visto a lezione devo aggiungere un return ()

for' :: [a] -> (a -> IO b) -> IO ()
for' xs fa = do
        sequence (map fa xs)
        return ()

{-
*Main> for' [1..5] (\x -> putStr (show x))
12345
-}        
        
{-
La funzione sequence è già predefinita in Haskell:

sequence [getLine, getLine]
Ciao
mondo!
["Ciao","mondo!"]

il risultato è un dato di tipo IO che contiene una lista di stringhe, viene visualizzato solo l'interno del dato di tipo IO
-}


{-
*Main> sequence (map print [1,2])
1
2
[(),()]

Perché c'è una lista di tuple vuote?
vedi slides di teoria
-}





vuoiUscire = do
             putStrLn "Vuoi uscire dal programma? y/n"
             ans <- getLine
             if ans /= "y" then do
                                putStrLn "non esci dal programma"
                                vuoiUscire
             else return ()


