{-
Se non metto Ord si arrabbia!

data Nat = Zero | Succ Nat
        deriving (Show)

*Main> Succ Zero < Zero
<interactive>:6:1: error:
    • No instance for (Ord Nat) arising from a use of ‘<’
    • In the expression: Succ Zero < Zero
      In an equation for ‘it’: it = Succ Zero < Zero
-}
data Nat = Zero | Succ Nat
        deriving (Show, Eq, Ord)

{-
Ottengo:
*Main> Succ Zero < Zero
False

il primo costruttore risulta sempre minore del secondo e così via.
Se mettessi prima Succ Nat prima di Zero avrei problemi.
-}
{-
*Main> Zero < (Succ Zero)
True
-}

-- lista infinita: sfruttiamo la Lazy Evaluation
inf = Succ inf
{-
Zero < inf
True
*Main> Succ (Succ Zero) < inf
True
-}

{-
ESERCIZIO PER CASA:
costruisci foldExpr id (+) (*)

-}
-- inizio test

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

{-
*Main> nat2int (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))
6

*Main> int2nat 3
Succ (Succ (Succ Zero))
-}
-- fine test
