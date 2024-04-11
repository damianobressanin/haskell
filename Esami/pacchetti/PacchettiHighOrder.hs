import System.IO

main = do
         {-
         inputDipendenze <- readFile "dipendenze.txt"
         let dipendenze = map (words) (lines inputDipendenze)
         
         inputRichiesti <- readFile "richiesti.txt"
         let richiesti = words inputRichiesti
         
         inputInstallati <- readFile "installati.txt"
         let installati = words inputInstallati
         -}
         
         -- Uso le High Order Functions per gestire la lettura dei file di testo:
         -- molte parti comuni ==> fattorizzo con HOF         
         installati <- leggi words "installati.txt"
         
         richiesti <- leggi words "richiesti.txt"
         
         dipendenze <- leggi elabora "dipendenze.txt"
         
         let importanti = searchImp richiesti dipendenze
         let inutili = differenzaListe importanti installati
         putStrLn ("Le dipendenze sono: " ++ show dipendenze)
         print ("I pacchetti richiesti sono: "++ (unwords richiesti))
         print ("I pacchetti installati sono: " ++ (unwords installati))
         print ("I pacchetti importanti sono: " ++ (unwords importanti))
         print ("I pacchetti inutili sono: " ++ (unwords inutili))
         

searchImp rs dss
        | rs' == [] = rs -- rs' va a cercare ulteriori pacchetti oltre i richiesti rs. Se rs' è [] allora bastano i richiesti rs
        | otherwise = rs++(searchImp rs' dss) -- se rs' non è vuoto allora devo aggiungere delle dipendenze. Chiamo questa funzione ricorsivamente per cercare le dipendenze delle dipendenze
        where rs' = [ds!!1 | r <- rs, ds <- dss, r==(ds!!0)] -- rs' sono tutti i pacchetti richesti indirettamente


differenzaListe xs ys = [y | y <- ys, not (elem y xs)]


leggi modo nome = do
                    input <- readFile nome
                    return (modo input)
                    
                    
elabora stringa = map words (lines stringa)

{-
*Main> main
Le dipendenze sono: [["1","2"],["2","3"],["1","4"],["5","6"],["7","8"]]
"I pacchetti richiesti sono: 1 6"
"I pacchetti installati sono: 1 2 3 4 5 6 7 8"
"I pacchetti importanti sono: 1 6 2 4 3"
"I pacchetti inutili sono: 5 7 8"
-}