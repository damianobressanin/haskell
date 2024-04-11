-- Rifai la funzione last in due modi diversi
mylast' [] = []
mylast' xs = xs !! (length xs -1)


-- So che è giusta ma non piace al compilatore
mylast'' [] = []
mylast'' xs = head (reverse xs)
mylast''' xs = head (take 1 (reverse xs))

-- Es3
myinit [] = []
myinit xs = take (length xs -1) xs

myinit' [] = []
myinit' xs = reverse (tail (reverse xs))
