-- I. Indicar si la recursión usada es o no estructural, y usar foldr en caso afirmativo.

elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs then [x] 
    else x : elementosEnPosicionesPares (tail xs)
-- No es estructural, es primitiva.

entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys -> if null ys then x : entrelazar xs [] 
    else x : head ys : entrelazar xs (tail ys)
-- Es estructural.

entrelazarFoldr :: [a] -> [a] -> [a]
entrelazarFoldr = foldr (\x rec -> \ys -> if null ys then x : rec [] else x : head ys : rec (tail ys)) id