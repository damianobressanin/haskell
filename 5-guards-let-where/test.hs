-- indovinare un numero
guess x
        | x >10 = "alto"
        | x<10 = "basso"
        | otherwise = "giusto"
        | x == 10 = "ramo che non viene valutato perché c'è già l'otherwise sopra e haskell legge in ordine"
-- "otherwise is just a fance word for True"


-- calcolo pendenza di una retta dati due punti
slope (x1,y1) (x2,y2) = let dy = y2-y1
                            dx = x2-x1
                        in dy/dx


-- scope della where più ampio: uso nelle guardie
bmiTell weight height
        | bmi <= 18.5 = "sottopeso"
        | bmi <= 25.0 = "normale"
        | bmi <= 30.0 = "grasso"
        | otherwise = "troppo"
        where bmi = weight/height^2


-- let si può usare nelle espressioni: posso assegnarle numeri o funzioni
myLetNumero = 4*(let a=9 in a+1)+2 -- che fa 42
myLetFunzione = [let square x = x*x in (square 5, square 3)] -- che fa [(29,9)]

-- ci passo io i numeri da elevare al quadrato
myLetFunzione' a b = [let square x = x*x in (square a, square b)]


