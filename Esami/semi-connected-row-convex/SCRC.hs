import System.IO
import Data.List

incrementa matrice = map (map (+1)) matrice

visualizza matrice = map (map show) matrice


{-
-- eliminaZeri matrice
eliminaZeri [[]] = [[]]
eliminaZeri [] = []
eliminaZeri (xs:xss) = if all (==0) xs
                       then eliminaZeri xss
                       else xs:(eliminaZeri xss)
-}
eliminaZeri matrice = [xs | xs <- matrice, not (all (==0) xs)]

esempio :: [[Int]]
esempio = [[0,1,0,0], [0,0,0,0], [1,1,1,0], [0,0,0,1]]


esempio1 :: [[Int]]
esempio1 = [[0,1,0,0], [0,0,0,0], [1,1,1,0], [0,0,0,1]]

esempio2 :: [[Int]]
esempio2 = [[0,1,0,0], [0,0,0,0], [1,1,1,0], [1,0,0,1]]

esempio3 :: [[Int]]
esempio3 = [[0,1,1], [1,1,1], [0,1,0]]


contaUniMatrice matrice = map (foldr (+) 0) (matrice)

contaUni lista = foldr (+) 0 lista


contaUniConsecutivi contatore max [] = max
contaUniConsecutivi contatore max (x:xs)
        | x == 1 = let newCont = (contatore+1) in if (newCont)>max then contaUniConsecutivi (newCont) (newCont) xs else contaUniConsecutivi (newCont) (max) xs
        | otherwise = contaUniConsecutivi 0 max xs
        

contaUniConsecutiviMatrice matrice = map (contaUniConsecutivi 0 0) matrice


isRowConvex matrice = uni == consecutivi
                      where m = eliminaZeri matrice
                            uni = contaUniMatrice m
                            consecutivi = contaUniConsecutiviMatrice m
                            


-- righeVicine mi da la posizione delle coppie di righe in cui devo verificare se le righe sono tutte connected
-- creo una funzione che fa il check se due liste (righe) sono connected e la "sparo" su tutti gli elementi di righeVicine
righeVicine (xs:xss) = map (\ (x,y) -> ((x-1),(y-1))) (zip [1..righe] [2..righe])
                       where righe = length (xs:xss)













-- casi speciali: prima colonna, ultima colonna
check :: Int -> [Int] -> Bool
check posizione lista
        | posizione == 0 = ((lista!!posizione == 1) || (lista!!(posizione+1) == 1))
        | posizione == (length lista)-1 = ((lista!!(posizione-1) == 1) || (lista!!(posizione) == 1))
        | otherwise = ((lista!!(posizione-1) == 1) || (lista!!posizione == 1) || (lista!!(posizione+1) == 1))


coppieConnected :: [Int] -> [Int] -> Int -> Bool
coppieConnected [] _ _ = False
coppieConnected (x:xs) ys posizione = if x == 1
                                      then if ((check posizione ys) == False) then (coppieConnected xs ys (posizione+1)) else True
                                      else coppieConnected xs ys (posizione+1)



isConnected matrice = all (== True) righeConnesse
               where m = eliminaZeri matrice
                     coppie = righeVicine m
                     righeConnesse = map (\ (x,y) -> (coppieConnected (m!!x) (m!!y) 0)) coppie


scrc :: [[Int]] -> Bool
scrc matrice = (isConnected matrice) && (isRowConvex matrice)


trasposta ([]:_) = []
trasposta xss = map head xss:trasposta (map tail xss)

crc :: [[Int]] -> Bool
crc matrice = (scrc matrice) && (scrc (transpose matrice))



