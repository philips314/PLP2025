-- recr :: (head -> tail -> recTail -> recConHead) -> casoBase -> Lista -> RES

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z [] = z
recr f z (x:xs) = f x xs (recr f z xs) 

-- I. sacarUna, que dados un elemento y una lista devuelve el res de eliminar
-- de la lista la primera aparición del elemento.

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna elem = recr (\x xs rec -> if x == elem then xs else x : rec) [] 

-- II. Explicar por qué el esquema de recursión estructural (foldr) no es adecuado 
-- para implementar la función sacarUna del punto anterior.
-- No hay forma de hacer referencia a la cola de la lista con foldr, y es necesario para esta función.

-- III. insertarOrdenado, que inserta un elemento en una lista ordenada (reciente),
-- de manera que se preserva el ordenamiento.
-- Obs: Si no hay elemento mayor que "elem", llega al caso base en donde inserta elem al final de la lista.

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado elem = recr (\x xs rec -> if elem < x then elem:x:xs else x:rec) [elem]

