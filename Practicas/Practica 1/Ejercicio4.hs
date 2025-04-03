-- I. Definir la función permutaciones, que dada una lista devuelve todas sus permutaciones. 
-- concatMap :: (a -> [b]) -> [a] -> [b] (Genera una lista usando la función generadora y la [a])
-- take :: Int -> [a] -> [a] (Devuelve una lista con los primeros Int elementos)
-- drop :: Int -> [a] -> [a] (Devuelve una lista con los últimos Int elementos)

permutaciones :: [a] -> [[a]]
permutaciones = foldr (\x rec -> concatMap (insertarCabeza x) rec) [[]]


insertarCabeza :: a -> [a] -> [[a]]
insertarCabeza elem xs = [take i xs ++ [elem] ++  drop i xs | i <- [0.. length xs]]

-- foldr aplica la función (\x rec -> concatMap (insertarCabeza x) rec) a cada elemento x de la lista.
--      el rec es la lista de permutaciones construidas hasta el momento.
--          (insertarCabeza x) inserta x en todas las posiciones posibles de cada permutación en rec.
--              concatMap aplica (insertarCabeza x) a cada lista en rec y las concatena.
 

-- II. Definir la función partes, que recibe una lista L y devuelve la lista de todas las listas formadas
-- por los mismos elementos de L, en su mismo orden de aparición.

partes :: [a] -> [[a]]
partes = foldr (\x rec -> rec ++ map (x:) rec) [[]]


-- III. Definir la función prefijos, que dada una lista, devuelve todos sus prefijos.

prefijos :: [a] -> [[a]]
prefijos xs = [take i xs | i <- [0.. length xs]]

sufijos :: [a] -> [[a]]
sufijos xs = [drop i xs | i <- [0.. length xs]]

-- IV. Definir la función sublistas que, dada una lista, devuelve todas sus sublistas (listas de elementos
-- que aparecen consecutivos en la lista original).

-- recr :: (head -> tail -> recTail -> recConHead) -> casoBase -> Lista -> RES
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z [] = z
recr f z (x:xs) = f x xs (recr f z xs)

sublistas :: [a] -> [[a]]
sublistas = recr (\x xs rec -> map (x:) (prefijos xs) ++ rec) [[]]

-- Sea [1,2,3]
-- Desde 1: prefijos de [1,2,3] → [ [1], [1,2], [1,2,3] ]
-- Desde 2: prefijos de [2,3] → [ [2], [2,3] ]
-- Desde 3: prefijos de [3] → [ [3] ]
-- La función le agrega a los prefijos desde el 2 (prefijos xs) el x al inicio (formando prefijos x:xs) y los concatena con rec.
-- La rec ya tiene los prefijos xs originales y el resto.