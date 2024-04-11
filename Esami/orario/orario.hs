import System.IO

main = do
         input <- readFile "orario.txt"
         let listaLezioni = leggiTutteLezioni input
         --putStrLn (show listaLezioni)
         putStrLn ("Le lezioni del lunedì sono: \n" ++ show (lezioniIlGiornoX 1 listaLezioni))
         --let lezioniPerGiorno = (lezioniIlGiornoX 1 listaLezioni)++(lezioniIlGiornoX 2 listaLezioni)++(lezioniIlGiornoX 3 listaLezioni)++(lezioniIlGiornoX 4 listaLezioni)++(lezioniIlGiornoX 5 listaLezioni)
         --putStrLn ("\nLe lezioni del lunedì sono: \n" ++ show (filter ((1==).giorno) lezioniPerGiorno))
         {-
         ATTENIONE: la list comprehnsion è l'unico modo per avere una lista di liste. Con il metodo usato un paio di righe fa si ottiene una lista unica che contiene le lezioni in sequenza.
         -}
         let lezioniPerGiorno = [lezioniIlGiornoX g listaLezioni | g <- [1..5]]
         putStrLn ("\nLe lezioni del lunedì sono: \n" ++ show (lezioniPerGiorno!!0))
         let maxDurateGiorni = map maxOrePerGiorno lezioniPerGiorno
         let oreMassime = foldr max 0 maxDurateGiorni
         putStrLn("\n"++ show maxDurateGiorni)
         putStrLn ("\noreMassime="++show oreMassime)
         putStrLn ("\n\nSOLUZIONE = " ++ show (fst (maxf snd (zip [1..] maxDurateGiorni))) ++ "\n")
         


maxf :: Ord a => (t -> a) -> [t] -> t
maxf f (x:xs) = foldr (\ a b -> if f a > f b then a else b) (x) xs

data Lezione = Lezione {nome :: String, giorno :: Int, inizio :: Int, fine :: Int} deriving Show

leggiUnaLezione riga = Lezione (riga!!0) (read(riga!!1)) (read(riga!!2)) (read(riga!!3))

leggiTutteLezioni input = map (leggiUnaLezione.words) (lines input)

lezioniIlGiornoX g listaLezioni = filter ((g==).giorno) listaLezioni

maxOrePerGiorno lezioni = (fine (maxf fine lezioni)) - (inizio (maxf (negate.inizio) lezioni))

