{-
Lezione 29:
Esercizio sulla "do notation"

Leggere da tastiera un carattere e visualizzare a schermo il successivo.

-}

-- main per eseguire il codice standalone
{-
getChar è pura o fa dell'IO?
è impura e quindi fa IO.
come facciamo ad estrarre il dato da una monade?
teoricamente non si può fare ma in pratica abbiamo l'illusione dell'estrazione dei dati dalla monade grazie a
do { x<-e;es}

c estrai carattere dalla monade getChar
c1 succ è una funzione che fa IO oppure no? NO, ho una funzione pura. Quindi non devo estrarre un dato dalla monade ma devo introdurre una variabile locale che chiameremo c1.
stampo a video il carattere con la putChar
-}

main = do
        c <- getChar
        let c1 = succ c
        putChar c1

{-
Lo scope delle variabili dentro al do è: da dove sono state dichiarate fino alla fine del do. Fuori dal do quelle variabili non esistono più.
Se vai a rivedere la parte in cui c'è scritto come haskell fa l'IO trovi che fa uso di lambda expressions.
Quindi ora è più chiaro il perché dello scope delle variabili e il perché come ultima cosa in una do-notation ci deve essere un'espressione: PER LUI È UNA LAMBDA EXPRESSION

Infatti se provo a fare:
main = do
        c <- getChar
        let c1 = succ c
        putChar c1
        c2 <- getChar

il codice non compila perché l'ultima istruzione in un blocco 'do' deve essere un'espressione.


Anche questo codice non compila per lo stesso motivo di prima!
main = do
        c <- getChar
        let c1 = succ c

-}
