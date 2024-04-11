
incrementa xs = map (\ x -> (+) 1 x) xs

incrementa' xs = map (+ 1) xs

modulo2 xs = map (`mod` 2) xs

reciproco xs = map (1/) xs

raddoppia xs = map (2*) xs

dimezza xs = map (/2) xs

{-Dal punto di vista logico:

dimezza xs = map (/2) xs

supponiamo che xs sia la lista [1,2,3,4,5]

map (/2) [1,2,3,4,5].
Ricordiamo che map va ad applicare la funzione (/2) ad ogni singolo elemento della lista [1,2,3,4,5].
Ricordiamo anche che la funzione che effettua la divisione necessita di 2 parametri, mentre io sto fornendo solo il parametro che c'è a destra.
Haskell, in automatico, riconosce che manca il primo parametro e usa l'elemento della lista che la map gli da in quel momento.

Di conseguenza verrà generata una lista nel seguente modo:
Le operazioni svolte elemento per elemento sono: [1/2, 2/2, 3/2, 4/2, 5/2]
Il risultato della map è: [0.5, 1.0, 1.5, 2.0, 2.5]


Se invece eseguiamo il comando:
map (2/) [1,2,3,4,5]
il "buco" è a destra dell'operatore, e haskell ci mette, grazie alla map, i singoli elementi della lista [1,2,3,4,5] uno alla volta.

Di conseguenza verrà generata una lista nel seguente modo:
Le operazioni svolte elemento per elemento sono: [2/1, 2/2, 2/3, 2/4, 2/5]
Il risultato della map è: [2.0, 1.0, 0.6666666666666666, 0.5, 0.4]


Le Section quindi si dimostrano uno strumento potente per rendere il codice ancora più compatto.


-}
