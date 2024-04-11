data Risposta = Si | No | Sconosciuto
        deriving (Show)

risposte :: [Risposta]
risposte = [Si,No,Sconosciuto]

flipAns :: Risposta -> Risposta
flipAns Si = No
flipAns No = Si
flipAns Sconosciuto = Sconosciuto

{-

*Main> flipAns No
Si
*Main> flipAns Si
No
*Main> flipAns Sconosciuto
Sconosciuto


-}
