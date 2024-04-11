-- Rifai la funzione di libreria zip
myZip [] ys = []
myZip xs [] = []
myZip (x:xs) (y:ys) = [(x,y)] ++ (myZip xs ys)

