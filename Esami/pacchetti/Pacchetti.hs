import System.IO

main = do
         inputDipendenze <- readFile "dipendenze.txt"
         let dipendenze = map (words) (lines inputDipendenze)
         {-
         print inputDipendenze
         "1 2\n2 3\n1 4\n5 6\n7 8\n"
         -}
         {-
         print (lines inputDipendenze)
         ["1 2","2 3","1 4","5 6","7 8"]
         -}
         {-
         print dipendenze
         [["1","2"],["2","3"],["1","4"],["5","6"],["7","8"]]
         -}
         inputRichiesti <- readFile "richiesti.txt"
         let richiesti = words inputRichiesti
         --print richiesti
         inputInstallati <- readFile "installati.txt"
         let installati = words inputInstallati
         --print installati
         let importanti = searchImp richiesti dipendenze
         let inutili = differenzaListe importanti installati
         --print ("Pacchetti inutili:")
         --print inutili
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

{-
*Main> main
Le dipendenze sono: [["1","2"],["2","3"],["1","4"],["5","6"],["7","8"]]
"I pacchetti richiesti sono: 1 6"
"I pacchetti installati sono: 1 2 3 4 5 6 7 8"
"I pacchetti importanti sono: 1 6 2 4 3"
"I pacchetti inutili sono: 5 7 8"
-}