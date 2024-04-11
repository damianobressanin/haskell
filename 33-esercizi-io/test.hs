import System.IO
import Data.Char

-- IO programs that reverse text from keyboard to display
main = do
       line <- getLine
       if null line
       then return ()
       else do
            putStrLn (reverseWords line)
            main

reverseWords :: String -> String
reverseWords = unwords.(map reverse).(words)

{-
*Main> main
Ciao mondo!
oaiC !odnom
Questo è un testo di prova
otseuQ è nu otset id avorp

*Main> 
-}

-- IO programs that reverse text from file to file
everythingInReverse = do
       input <- readFile "input.txt"
       let output = processing1 input
       writeFile "output1.txt" output

processing1 :: String -> String
processing1 xs = reverse xs

{-
Ciao Mondo!
Questo è un file input di prova.

.avorp id tupni elif nu è otseuQ
!odnoM oaiC
-}
-- questa inverte solo l'ordine delle righe del file
--processing = unlines.reverse.lines

-- IO program that reverse every single word from file to file
everyWordInReverse = do
                     input <- readFile "input.txt"
                     let output = processing2 input
                     writeFile "output2.txt" output

processing2 :: String -> String
processing2 = unwords.(map reverse).words

{-
Ciao Mondo!
Questo è un file input di prova.

oaiC !odnoM otseuQ è nu elif tupni id .avorp
-}