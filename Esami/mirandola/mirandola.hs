import System.IO

data Msg = Msg {cant :: Int, po :: Int} deriving (Show)

main = do
         messaggioStr <- readFile "messaggio.txt"
         let messaggio = map (letturaMessaggio.words) (lines messaggioStr)
         infernoStr <- readFile "commedia.txt"
         let inferno = words infernoStr
         print (decifraTutto messaggio inferno)
--         print (contaCanti inferno 0)


letturaMessaggio [c,p] = Msg (read c) (read p)


myDecodifica :: [String] -> Int -> Int -> Int -> String
myDecodifica [] canto posizione contatore = []    
myDecodifica (x:xs) canto posizione contatore = if (x=="CANTO")
                                                then
                                                        if (canto == (contatore))
                                                        then restituisciElemento xs posizione
                                                        else myDecodifica xs canto posizione (contatore+1) 
                                                else
                                                        myDecodifica xs canto posizione contatore
    

restituisciElemento [] _ = []
restituisciElemento (x:xs) n
        | n==0 = x
        | otherwise = restituisciElemento xs (n-1)


-- funzione contaConti fatta per test
contaCanti [] contatore = contatore
contaCanti (x:xs) contatore = if x == "CANTO"
                              then contaCanti xs (contatore+1)
                              else contaCanti xs contatore


decifraTutto :: [Msg] -> [String] -> String
decifraTutto [] _= []
decifraTutto (x:xs) inferno = (myDecodifica inferno (cant x) (po x) 1)++" "++(decifraTutto xs inferno)

{-
Risultato:
*Main> main
"colpo in via bolognese; dieci settembre ore venti porta l'armi! "
-}
