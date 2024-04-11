import System.IO
{-
HANGMAN
- un giocatore inserisce la parola segreta di nascosto;
- l'altro giocatore prova ad indovinare la parola inserendo una sequenza di tentativi;
- per ogni tentativo, il computer indica quali lettere della parola segreta ci sono nella parola tentativo;
- il gioco termina quando la parola tentativo è uguale alla parola segreta;
-}

-- top-down approach:
hangman :: IO ()
hangman = do
          putStrLn "Inserisci la parola: "
          word <- sgetLine
          putStrLn "Prova ad indovinarla: "
          play word

-- secretgetLine è una getLine alternativa che legge una stringa e sostituisce carattere per carattere con '-'
sgetLine :: IO String
sgetLine = do
           x <- getCh
           if x == '\n'
           then return []
           else
                do
                putChar '-'
                xs <- sgetLine
                return (x:xs)

-- getCh è una getChar alterntiva che non fa visualizzare il carattere inserito da tastiera.
-- va a modificare gli standard in per non far visualizzare all'utente quello che ha inserito.
getCh :: IO Char
getCh = do
          hSetEcho stdin False
          x <- getChar
          hSetEcho stdin True
          return x

-- funzione che ci fa giocare all'infinito finché non indoviniamo
-- delega i suggerimenti (nel caso la risposta sia errata) alla funzione match
play :: String -> IO ()
play word = do
              putStr "? "
              guess <- getLine
              if guess == word
              then putStrLn "Indovinato!"
              else
                  do
                    putStrLn (match word guess)
                    play word

-- da i suggerimenti: se una lettera della parola da indovinare compare anche nella parola tentativo allora la scrivi in output, altrimenti ci metti un '-'
match :: String -> String -> String
match xs ys = [if (elem x ys) then x else '-' | x <- xs]
{-
*Main> match "haskell" "pascal"
"-as--ll"
-}