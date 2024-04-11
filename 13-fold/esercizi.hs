{-
Fold

Capita spesso di vedere funzioni con questo pattern:

f lista vuota = v
f head_e_tail = head operazione chiamata_ricorsiva tail

f [] = v
f (x:xs) = x ⊕ f xs

Per esempio:

Somma:
v = 0
⊕ = +

Prodotto:
v = 1
⊕ = *

And:
v = True
⊕ = &&

-}
{-
foldr = fold right = avvolgo da destra
foldl = fold left = avvolgo da sinistra
-}
-- Rifacciamo la foldr come funzione di ordine superiore!
foldr' f v [] = v
foldr' f v (x:xs) = f x (foldr' f v xs) 


somma xs = foldr' (+) 0 xs
-- mi accorgo che xs compare sia a sinistra che a destra. Quindi posso usare il currying ed evitare di scrivere xs
somma' = foldr' (+) 0

andList xs = foldr' (&&) True xs

{-
Il prof evidenzia la bellezza e la potenza delle funzioni di ordine superiore:
In programmazione imperativa saremmo stati costretti ad utilizzare un ciclo per scorrere la lista.
Qui, in programmazione funzionale, si usano le fold.
Nel linguaggio funzionale è possibile definire le fold, mentre in un linguaggio imperativo come il C risulta impossibile la creazione di nuovi cicli: esiste il for, while e il do-while e non è possibile, tramite codice C, inventarne un altro al volo.
-}
-- fold è già presente in libreria
-- altri esempi di funzioni scrivibili facilmente tramite la foldr ed il currying:
p :: (Foldable t, Num b) => t b -> b
p xs = foldr (*) 1 xs
-- al compilatore non piace il currying nelle foldr
-- or = foldr (||) False
--and = (foldr (&&) True)
{-
La foldr si può immaginare come rimpiazzare (:) con ⊕ e [] con v nella rappresentazione interna delle liste in Haskell.
es:
product [1,2,3]
foldr (*) 1 [1,2,3]
foldr (*) 1 (1:(2:(3:[])))
1*(2*(3*1))

es:
sum [1,2,3]
foldr (+) 0 [1,2,3]
foldr (+) 0 (1:(2:(3:[])))
1+(2+(3+0))
-}
myLength xs = foldr (\ _ n -> n+1) 0 xs

myReverse xs = foldr (\ x y -> y ++ [x]) [] xs

myAppend xs ys = foldr (:) ys xs
{-
Fold Left = foldl

La differenza è che il valore è accumulato "a sinistra".

foldr ⊕ a [x1,...,xn] = x1 ⊕ (x2 ⊕ ( ... (xn ⊕ a)))

foldl ⊕ a [x1,...,xn] = (((a ⊕ x1) ⊕ x2) ... ⊕ xn)
-}
{-
Proviamo a scrivere noi la foldl:
Vogliamo combinare subito v con il primo valore della lista, quindi si scrive
f v x
ora il risultato di questa operazione dovrà essere combinato con la chiamata ricorsiva (tutto il resto)
quindi (f v x) è come il v da mettere nella chiamata ricorsiva
v funziona come accumulatore
quindi per la lista vuota devo restituire proprio l'accomulatore v

-}
foldl' f v [] = v
foldl' f v (x:xs) = foldl' f (f v x) xs
-----------------------------------------------------------

-- Esercizi fine video:
-- Trova il max di una lista di numeri positivi, naturali ed interi usando le fold.
myMax xs = foldr (\ x y -> if x>= y then x else y) 0 xs
-- per la versione curried devo mettere il tipo per esplicito, altrimenti non compila.
myMaxCurried :: (Foldable t, Ord a, Num a) => t a -> a
myMaxCurried = (foldr (\ x y -> if x>= y then x else y) 0)

-- Conta il numero di vocali di una stringa usando le fold. Funzione utile: elem x xs controlla se x è presente ella lista xs
listaVocali = ['a','e','i','o','u', 'A', 'E', 'I', 'O', 'U']

vocali xs = foldr (\ x n -> n + controlla x) 0 xs
controlla x
        | elem x listaVocali = 1
        | otherwise = 0

vocali' xs = foldr (\ x n -> n + if (elem x listaVocali) then 1 else 0) 0 xs
