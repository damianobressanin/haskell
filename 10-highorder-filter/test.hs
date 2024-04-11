{-
selezionaDisp' [] = []
selezionaDisp' (x:xs)
        | odd x = x:selezionaDisp' xs
        | otherwise = selezionaDisp' xs

selezionaPos' [] = []
selezionaPos' (x:xs)
        | x>0 = x:selezionaPos' xs
        | otherwise = selezionaPos' xs
-}

{-
C'è sempre un pattern che si ripete, per questo si può fare in modo simile alla map e si "fattorizzano" le parti comuni.
La funzione di ordine superiore che fa il test di una condizione booleana ad ogni elemento di una lista si chiama filter:
        Se la condizione è rispettata allora inserisce l'elemento nella lista;
        Se la condizione non è rispettata allora NON inserisce l'elemento nella lista;
-}

filter' f [] = []
filter' f (x:xs)
        | f x = x:filter' f xs
        | otherwise = filter' f xs

{-
f è una funzione che deve restituire un dato di tipo Bool.
Ora basta definire la funzione che prenderà il posto di f. Nell'esercizio vogliamo fare selezionaPos:
        - Definisco la funzione f che deve essere applicata ad ogni singolo elemento della lista e che restituisce un Bool;
        - Scrivo una funzione che usa la filter' che ho creato su una lista;
-}

positivo x = x>0

{-
Nota Bene: nella definizione di filter' c'è già incluso il caso lista vuota.
Quindi non devo metterlo anche qua per il pattern matching.
-}
selezionaPos xs = filter' positivo xs

-- Rifacciamo la selezionaDispari
-- Qua addirittura f è già presente nella libreria base di Haskell ed è proprio odd

selezionaDisp xs = filter' odd xs

-- Rifacciamo la selezionaDispari ma usando il currying:
selezionaDispCurrying = filter' odd







