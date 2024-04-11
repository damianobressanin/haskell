{-
NIM
- La tabella è costituita da 5 righe di stelle *;
- Due giocatori a turno rimuovono una o più stelle dalla fine di una singola riga;
- il vincitore è il giocatore che rimuove l'ultima stella o l'ultimo gruppo di stelle dalla tabella;

Suggerimento:
Rappresenta la tabella come una lista di 5 interi che rappresentano il numero di stelle * rimanenti in ogni riga.
Per esempio la tabella iniziale è [5,4,3,2,1]
-}

import System.IO
import Data.Char

main = do
         putStrLn "Nome giocatore 1:"
         player1 <- getLine
         putStrLn "Nome giocatore 2:"
         player2 <- getLine
         putStrLn ("Chi comincia per primo tra "++player1++" e "++player2++" ?")
         firstPlayer <- getLine
         putStrLn ("Inizia il giocatore "++firstPlayer)
         
         putStrLn "Stato scacchiera: [5,4,3,2,1]"
         mossa <- getLine
         let m = processa mossa
         if ((snd m) /= 0)
         then
             nim [5,4,3,2,1] m player1 player2 firstPlayer
         else
             do
               putStrLn ("Il giocatore "++firstPlayer++" ha violato le regole e ha perso: devi togliere almeno una stella!")
               putStrLn ("Vince il giocatore "++(next player1 player2 firstPlayer))

processa stringa = let xs = (words stringa)
                   in (leggiInt (head xs), leggiInt (last xs))


leggiInt :: String -> Int
leggiInt = read


next p1 p2 giocatoreCorrente
        | giocatoreCorrente == p1 = p2
        | otherwise = p1


nim xs (colonna, numero) p1 p2 giocatoreCorrente = do
                                                     let scacchiera = rimuovi xs (colonna,numero)
                                                     putStrLn ("Stato scacchiera: "++(show scacchiera))
                                                     if (any (<0) scacchiera)
                                                     then do
                                                            let nextPlayer = next p1 p2 giocatoreCorrente
                                                            putStrLn ("Il giocatore "++giocatoreCorrente++" ha violato le regole e ha perso: hai tolto troppe stelle!")
                                                            putStrLn ("Vince il giocatore "++nextPlayer)
                                                     else
                                                         if (scacchiera /= [0,0,0,0,0])
                                                         then do
                                                                let nextPlayer = next p1 p2 giocatoreCorrente
                                                                putStrLn ("Ora tocca a " ++ nextPlayer)                                                                
                                                                mossa <- getLine
                                                                let m = processa mossa
                                                                if ((snd m) /= 0)
                                                                then
                                                                    nim scacchiera m p1 p2 nextPlayer
                                                                else
                                                                    do
                                                                      let nextPlayer = next p1 p2 giocatoreCorrente
                                                                      putStrLn ("Il giocatore "++nextPlayer++" ha violato le regole e ha perso: devi togliere almeno una stella!")
                                                                      putStrLn ("Vince il giocatore "++giocatoreCorrente)
                                                         else
                                                             putStrLn ("Ha vinto il giocatore "++ giocatoreCorrente) 


rimuovi [] _ = []
rimuovi (x:xs) (colonna,numero)
        | x == ((x:xs) !! colonna) = (x-numero):xs
        | otherwise = x:(rimuovi xs (colonna-1,numero))


