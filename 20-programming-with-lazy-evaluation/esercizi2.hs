ifPzn x pos zero neg
        | x > 0 = pos
        | x == 0 = zero
        | otherwise = neg

-- d = delta dell'equazione di secondo grado
-- rd = radice di delta. (per evitare di calcolare la radice quadrata di delta

solve a b c =
        let d = b^2-4*a*c
            rd = sqrt d
        in  ifPzn d [(-b - rd)/(2*a), (-b + rd)/(2*a)] [-b/2/a] []
        
{-
Ho un if a 3 condizioni, in un linguaggio imperativo avrei dovuto usare i costrutti hard-coded del linguaggio.

Posso scrivere la funzione così solo perché haskell ha la lazy evaluation.
Infatti se il delta dell'equazione di secondo grado è negativo e ho una eager evaluation otterrei un runtime error per una divisione per zero.
Mentre con la lazy evaluation ho che le variabili della let vengono istanziate solo se devono essere usate (lazy). Nel caso di delta negativo passo solo la lista vuota e non si va a calcolare la radice quadrata di delta.

-}
