{-
*Main> foldr (+) 0 [1..10e10]
*** Exception: stack overflow
-}


foldl' f z [] = z
foldl' f z (x:xs) = let z' = f z x
                    in seq z' (foldl' f z' xs)




sum3 = foldl' (+) 0

-- con sum3 non posso più andare in stack overflow grazie alla seq
