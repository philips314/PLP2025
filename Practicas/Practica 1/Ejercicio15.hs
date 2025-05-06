--I. tipo RoseTree
data RoseTree a = RoseTree a [RoseTree a]

--II. esquema de recursión estructural
foldRose :: (a -> [b] -> b) -> RoseTree a -> b
foldRose f (RoseTree raiz hijos) = f raiz (map (foldRose f) hijos)

--III. hojas
hojasRT :: RoseTree a -> [a]
hojasRT = foldRose (\root rec -> if null rec then [root] else concat rec) 
--Observar que rec es el resultado de aplicar recursivamente foldRose a cada hijo. 
--Es una lista de listas de todos los hijos del roseTree, por eso el concat

--IV. distancias
distanciasRT :: RoseTree a -> [Integer]
distanciasRT = foldRose (\_ rec -> if null rec then [1] else map (+1) (concat rec))

--V. altura
alturaRT :: RoseTree a -> Integer
alturaRT = foldRose (\_ rec -> if null rec then 1 else maximum rec + 1)