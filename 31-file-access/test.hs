import System.IO
import Data.Char
-- Leggi da un file di testo il contenuto e riscrivilo in maiuscolo su un altro file
main = do
       inh <- openFile "input.txt" ReadMode
       outh <- openFile "output1.txt" WriteMode
       inpStr <- hGetContents inh
       let result = processData inpStr
       hPutStr outh result
       hClose inh
       hClose outh
processData = map toUpper


main' = do
        inpStr <- readFile "input.txt"
        writeFile "output2.txt" (map toUpper inpStr)
        
-- Vedi slides
{-
ESEMPIO:
input.txt
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed accumsan nisi ultrices elit tempor luctus.
Nulla tincidunt accumsan lectus vitae ultrices.
Phasellus lobortis tempus quam quis tincidunt.
Mauris pretium sagittis nisl, sit amet condimentum lorem condimentum a.
Integer at arcu eget augue cursus sodales nec vel mauris.
Vivamus elementum dui et efficitur tincidunt.
Suspendisse ac sapien porta, euismod risus eget, sagittis urna.
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;
Quisque porta sit amet libero quis porttitor.
Nulla ut sapien odio.
Proin sem enim, tempor a pretium nec, cursus porta risus.
Integer vulputate, massa ac venenatis facilisis, arcu dui convallis odio, auctor posuere erat nisl nec ipsum.
Etiam eu mattis orci, sit amet pellentesque risus.
Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
Fusce blandit mauris ac dolor euismod viverra.

output.txt
LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT.
SED ACCUMSAN NISI ULTRICES ELIT TEMPOR LUCTUS.
NULLA TINCIDUNT ACCUMSAN LECTUS VITAE ULTRICES.
PHASELLUS LOBORTIS TEMPUS QUAM QUIS TINCIDUNT.
MAURIS PRETIUM SAGITTIS NISL, SIT AMET CONDIMENTUM LOREM CONDIMENTUM A.
INTEGER AT ARCU EGET AUGUE CURSUS SODALES NEC VEL MAURIS.
VIVAMUS ELEMENTUM DUI ET EFFICITUR TINCIDUNT.
SUSPENDISSE AC SAPIEN PORTA, EUISMOD RISUS EGET, SAGITTIS URNA.
VESTIBULUM ANTE IPSUM PRIMIS IN FAUCIBUS ORCI LUCTUS ET ULTRICES POSUERE CUBILIA CURAE;
QUISQUE PORTA SIT AMET LIBERO QUIS PORTTITOR.
NULLA UT SAPIEN ODIO.
PROIN SEM ENIM, TEMPOR A PRETIUM NEC, CURSUS PORTA RISUS.
INTEGER VULPUTATE, MASSA AC VENENATIS FACILISIS, ARCU DUI CONVALLIS ODIO, AUCTOR POSUERE ERAT NISL NEC IPSUM.
ETIAM EU MATTIS ORCI, SIT AMET PELLENTESQUE RISUS.
ORCI VARIUS NATOQUE PENATIBUS ET MAGNIS DIS PARTURIENT MONTES, NASCETUR RIDICULUS MUS.
FUSCE BLANDIT MAURIS AC DOLOR EUISMOD VIVERRA.
-}