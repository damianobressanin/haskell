leggiInt :: IO Int
stampaInt :: Int -> IO ()


-- collego 2 funzioni: una pura ed una impura. Per farlo devo usare una funzione di ordine superiore.
--collega :: IO Int -> (Int -> Int) -> IO Int
-- la funzione collega estrae il dato da IO Int, lo passa alla funzione (la lambda che incrementa il valore) che da un valore in output che passa ad IO Int.
-- Così abbiamo rispettato la regola che tutte le funzioni di tipo IO restituiscono un dato di tipo IO (impuro) (ma abbiamo usato lo stesso una funzione di ordine superiore)
-- usiamo la notazione infissa (in maniera forzata) per renderla più leggibile.

-- riscriviamo il tipo di collega per renderla più generica
--collega :: IO a -> (a -> b) -> IO b

-- i conti non tornano perché ho troppi dati in ritorno. Infatti ho che il dato finale di ritorno è IO IO Int mentre io voglio IO Int
--((leggiInt) `collega` (\x -> x+1)) `collega` (stampaInt)

-- per motivi partiolari la funzione interna restituisce già un tipo di dati IO che uso come contenitore. Per riempirlo bisogna usare la funzione di libreria return che prende un dato e lo inserisce dentro al contenitore impuro di tipo IO
collega :: IO a -> (a -> IO b) -> IO b
((leggiInt) `collega` (\x -> return x+1)) `collega` (stampaInt)


{- in realtà la funzione collega esiste già in haskell:
si chiama bind e si indica con >>=

Il suo tipo è:
>>= :: IO a -> (a -> IO b) -> IO b

Il tipo di return è:
return :: a -> IO a


DEFINIZIONE IMPORTANTE:
Dal punto di vista teorico una Abstract Data Type che ha le due operazioni base "bind" e "return" viene chiamato MONADE.
Quindi quella che abbiamo visto noi è la monade dell'IO


L'operatore "bind" non viene usato solo per l'IO ma viene usato anche per altre cose, quindi nella sua definizione di tipo rimane un po' generico.
:t (>>=)
(>>=) :: Monad m => m a -> (a -> m b) -> m b

-}


{-
Nota bene:
Il codice non funziona così com'è, va completato scrivendo effetivamente le funzioni per le quali abbiamo definito i tipi nelle prime 2 righe.
-}
