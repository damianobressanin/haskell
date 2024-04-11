-- Altre funzioni di ordine superiore:

-- all = fold + map
-- all si usa per vedere se un predicato è rispettato per tutti gli elementi di una lista

-- any  si usa per vedere se un predicato è rispettato per almeno uno degli elementi di una lista

-- takeWhile prende tutti gli elementi della lista finché il predicato è vero

-- dropWhile butta via tutti gli elementi della lista finché il predicato è vero


f xs = zip xs (tail xs)
{-
*Main> f [1,2,3,4,5]
[(1,2),(2,3),(3,4),(4,5)]
-}

--ordinata xs = zipWith (<) xs (tail xs)
{-
*Main> ordinata [1,2,3,4,5]
[True,True,True,True]

*Main> ordinata [1,2,1,4,5,4]
[True,False,True,True,False]
-}
-- la modifico per avere il valore finale e non la lista

ordinata xs = and (zipWith (<) xs (tail xs))


{-
VEDI ESERCIZI QUADERNO: FAI ALMENO I PRIMI DUE, I FACOLTATIVI LASCIALI STARE
-}
{-
Esercizio compito 29/06/2016

Si scriva una funzione di ordine superiore
maxf :: Ord a => (t -> a) -> [t] -> t
che prende come parametri una funzione f e una lista xs e fornisce l'elemento x della lista xs che massimizza la funzione f
(ossia il valore x per cui f(x) è massimo).
-}


{-
Prendo spunto dal codice che ho già scritto per altri esercizi:

-- Trova il max di una lista di numeri positivi, naturali ed interi usando le fold.
myMax xs = foldr (\ x y -> if x>= y then x else y) 0 xs

----------------------------------------------------------------------

Modifico myMax ed invece che confrontare i singoli valori x e y confronto la funzione f applicata a quei parametri.
Poi mantengo solo il parametro che, inserito nella funzione, mi da il valore massimo.


maxf f xs = foldr (\ x y -> if (f x >= f y)
                            then x
                            else y) 0 xs
-}

maxf f xs = foldr (\ x y -> if (f x >= f y) then x else y) 0 xs

{-
maxf (^2) [1,3,5,-9]
-9

analizziamo la foldr:
sia ⊕ la funzione che è nella lambda expression, cioé (\ x y -> if (f x >= f y) then x else y)

1 ⊕ (3 ⊕ (5 ⊕ (-9 ⊕ 0)))        (-9)^2 è maggiore di (0)^2 ? sì, quindi restituisco -9
1 ⊕ (3 ⊕ (5 ⊕ (-9)))            (5)^2 è maggiore di (-9)^2 ? no, quindi restituisco -9
1 ⊕ (3 ⊕ (-9))                  (3)^2 è maggiore di (-9)^2 ? no, quindi restituisco -9
1 ⊕ (-9)                        (1)^2 è maggiore di (-9)^2 ? no, quindi restituisco -9
-9

-}

{-
maxf (^3) [1,3,5,-9]
5

analizziamo la foldr:
sia ⊕ la funzione che è nella lambda expression, cioé (\ x y -> if (f x >= f y) then x else y)

1 ⊕ (3 ⊕ (5 ⊕ (-9 ⊕ 0)))        (-9)^3 è maggiore di (0)^3 ? no, quindi restituisco 0
1 ⊕ (3 ⊕ (5 ⊕ 0))               (5)^3 è maggiore di (0)^3 ? sì, quindi restituisco 5
1 ⊕ (3 ⊕ 5)                     (3)^3 è maggiore di (5)^3 ? no, quindi restituisco 5
1 ⊕ (5)                         (1)^3 è maggiore di (5)^3 ? no, quindi restituisco 5
5

-}

{-
Altri esempi:
-- massimizza il resto della divisione tra gli elementi della lista e 3
maxf ((\x -> (x `mod` 3))) [1,3,5,-9]
5

-- minimizza il resto della divisione tra gli elementi della lista e 3
maxf ((\x -> (x `mod` 3)*(-1))) [1,3,5,-9]
3

-}
{-
Tentativo fallito di fare maxf che però prende tutti i massimi:
tuttiMaxf' f xs = foldr (\ x y -> if (f x >= f y)
                                          then if (f x == f y)
                                               then (x:y:massimi)
                                               else x:massimi
                                          else y:massimi) 0 xs
                                          where massimi = []
-}














maiuscole = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','X','Y','W','Z']
minuscole = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','x','y','w','z']
numeri = ['0','1','2','3','4','5','6','7','8','9']
{-
maiuscole' = "ABCDEFGHIJKLMNOPQRSTUVXYWZ"
minuscole' = "abcdefghijklmnopqrstuvxywz"
numeri' = "0123456789"
-}

-- mi ispiro alla funzione che contava le vocali:
-- contaVocali xs = foldr (\ x n -> n + if (elem x listaVocali) then 1 else 0) 0 xs

contaMaiuscole xs = foldr (\ x n -> n + if (elem x maiuscole) then 1 else 0) 0 xs
contaMinuscole xs = foldr (\ x n -> n + if (elem x minuscole) then 1 else 0) 0 xs
contaNumeri xs = foldr (\ x n -> n + if (elem x numeri) then 1 else 0) 0 xs


strong :: String -> Bool
strong xs
        | length xs < 15 = False
        | contaMaiuscole xs < 1 = False
        | contaMinuscole xs < 1 = False
        | contaNumeri xs < 1 = False
        | otherwise = True

