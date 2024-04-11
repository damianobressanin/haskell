import System.IO
{-
COLLISIONI TRA QUADRATI:
Un programma Haskell deve controllare le collisioni fra quadrati nel piano.
Ogni quadrato è rappresentato da:
- identificatore: Int
- colore: Stringa (senza spazi)
- X, Y, lato: Int
Il programma deve leggere un file di testo e visualizzare il numero di coppie di quadrati che hanno intersezione non nulla.
Si utilizzino funzioni di ordine superiore. File di input scaricabile dalla scheda del corso: quadrati.txt
-}
main = do
         input <- readFile "quadrati.txt"
         let quadrati = lettura input
         let numeroCollisioni = trovaCollisioni quadrati 0
         putStrLn ("Ci sono "++show (contaQuadrati quadrati)++" quadrati e "++show numeroCollisioni++" collisioni")
               
         
data Quadrato = Quadrato {
                          identificatore :: Int,
                          colore :: String,
                          x :: Int,
                          y :: Int,
                          lato :: Int                                          
                         } deriving (Show)


rInt :: String -> Int
rInt = read

leggiQuadrato riga = Quadrato (rInt (riga !! 0)) (riga !! 1) (rInt (riga !! 2)) (rInt (riga !! 3)) (rInt (riga !! 4))

lettura s = map (leggiQuadrato.words) (lines s)


contaQuadrati :: [Quadrato] -> Int
contaQuadrati [] = 0;
contaQuadrati (x:xs) = 1+contaQuadrati(xs)

collidono :: Quadrato -> [Quadrato] -> Int -> Int
collidono quadrato [] contatore = contatore
collidono quadrato (q:qs) contatore = if ( (abs ((x quadrato)-(x q))) < (lato quadrato) && ((abs ((y quadrato) - (y q))) < (lato quadrato)) )
                                      then collidono quadrato qs (contatore+1)
                                      else collidono quadrato qs contatore

trovaCollisioni :: [Quadrato] -> Int -> Int
trovaCollisioni [] contatoreTutteCollisioni = contatoreTutteCollisioni
trovaCollisioni (x:xs) contatoreTutteCollisioni = trovaCollisioni xs (contatoreTutteCollisioni+(collidono x xs 0))