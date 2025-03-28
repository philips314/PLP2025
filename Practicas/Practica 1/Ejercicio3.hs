-- I. Redefinir sum, elem, (++), filter y map usando foldr.
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b.
-- foldr :: (head -> recCola -> recConCabeza) -> respuestaCasoBase -> lista -> res

sumFoldr :: Num a => [a] -> a
sumFoldr = foldr (\x rec -> x + rec) 0

filterFoldr :: (a -> Bool) -> [a] -> [a]
filterFoldr p = foldr (\x rec -> if p x then x : rec else rec) []

mapFoldr :: (a -> b) -> [a] -> [b]
mapFoldr f = foldr (\x rec -> f x : rec) []

-- II. mejorSegún, que devuelve el máximo elemento de la lista según una función de comparación, utilizando foldr1.

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun _ [x] = x
mejorSegun p (x:xs) = if p x rec then x else rec
    where rec = mejorSegun p xs

mejorSegunFoldr :: (a -> a -> Bool) -> [a] -> a
mejorSegunFoldr p (x:xs) = foldr (\y rec -> if p y rec then y else rec) x xs

-- Me sirve mejor Foldr1 en este caso, ya que usa el último elemento de la lista como base y luego aplica
-- la función de reducción al resto de la lista.
-- foldr1 :: (a -> a -> a) -> [a] -> a
mejorSegunFoldr1 :: (a -> a -> Bool) -> [a] -> a
mejorSegunFoldr1 p = foldr1 (\x rec -> if p x rec then x else rec)


-- III. sumasParciales, que dada una lista de números devuelve otra de la misma longitud, que tiene en
--      cada posición la suma parcial de los elementos de la lista original
--      desde la cabeza hasta la posición actual

-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldl :: (recCola -> head -> recConCabeza) -> casoBase -> lista -> res
-- Es como foldr pero resuelve de izquierda a derecha, comenzando desde el primer elemento.

sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldl (\rec x -> rec ++ (if null rec then [x] else [x + last rec])) []

-- IV. sumaAlt, que realiza la suma alternada de los elementos de una lista.
--     El primer elemento, menos el segundo, más el tercero, ...
--     Utilizando foldr

sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (\x rec -> x - rec) 0

-- V. Hacer lo mismo que en el punto anterior, pero en sentido inverso. Pensar que esquema de recursión usar.

sumaAlt2 :: Num a => [a] -> a
sumaAlt2 = foldr (flip (-)) 0