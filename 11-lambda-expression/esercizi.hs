-- SOLUZIONE DEL PROFESSORE:
{-

trova xs v =
        map snd (filter (uguali v) (zip xs [1..l]))
        where l = length xs

uguali v (u,_) = v==u
-}
{-
Con uguali nel where, in modo da confinarla localmente per evitare interferenze future con i nomi

trova xs v =
        map snd (filter (uguali v) (zip xs [1..l]))
        where l = length xs
              uguali v1 (u,_) = v1==u
-}


trova xs v =
        map snd (filter uguali (zip xs [1..l]))
        where l = length xs
              uguali (u,_) = v==u
              -- uguali può guardare anche le variabili (come v) passate alla funzione trova

{-
Si può togliere la funzione uguali? Alla fine la userei solo per una cosa e mai più.
Si può fare! Esistono le lambda expressions, cioé le funzioni senza nome.
Il simbolo per le lambda expressions è l'asta grande della lettera greca Lambda, cioé il carattere '\'
-}

trova' xs v =
        map snd (filter (\ (u,_) -> v==u) (zip xs [1..l]))
        where l = length xs
              --uguali (u,_) = v==u

-- Funzione trova scritta in una sola riga di codice, nulla di nuovo
trova'' xs v = map snd (filter (\ (u,_) -> v==u) (zip xs [1..length xs]))


odds n = map f [0..n-1]
         where f x = x*2 +1

lambdaOdds n = map (\ x -> x*2+1) [0..n-1]



incrementa xs = map (\ x -> x+1) xs


