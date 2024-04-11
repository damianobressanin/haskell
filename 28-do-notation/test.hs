{-
lezione 28 do-notation
-}
getTwoChars :: IO (Char, Char)
getTwoChars = do { c1 <- getChar;
                   c2 <- getChar;
                   return (c1,c2) }


-- attento ai nomi: a ghci non piaceva (giustamente) il nome getLine perché è una funzione di libreria
-- con parentesi
getLine' :: IO String
getLine' = do { x <- getChar;
               if (x == ('\n'))
               then return []
               else do { xs <- getLine'; --chiamata ricorsiva
                         return (x:xs)
                       }
             }

-- scritto come sulle slide:
-- senza parentesi
getLine'' :: IO String
getLine'' = do x <- getChar
               if x == '\n'
               then return []
               else do xs <- getLine'' --chiamata ricorsiva
                       return (x:xs)
                       
-- QUESTA SINTASSI DA L'ILLUSIONE DI POTER ESTRARRE QUALCOSA DALLA MONADE MA ABBIAMO VISTO CHE NON È COSÌ




strlen :: IO ()
strlen = do putStr "Inserisci una stringa: "
            xs <- getLine
            putStr "La stringa ha "
            putStr (show (length xs))
            putStr " caratteri \n"



{-
Esercizio per casa:
Scivere un programma Haskell che legge una stringa da tastiera e la stampa invertita
-}

inverti :: IO ()
inverti = do putStr "Inserisci la stringa da invertire: "
             xs <- getLine
             putStr "Invertita: "
             putStr ((reverse xs)++"\n")
             
             
             

