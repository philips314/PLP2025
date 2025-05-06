--I. mapPares
mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares _ [] = []
mapPares f ((x,y):xs) =  f x y : mapPares f xs 

--II. armarPares
armarPares :: [a] -> [b] -> [(a,b)]
armarPares [] ys = []
armarPares _ [] = []
armarPares (x:xs) (y:ys) = (x,y) : armarPares xs ys

--III. mapDoble
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble _ [] ys = []
mapDoble _ _ [] = []
mapDoble f (x:xs) (y:ys) = f x y : mapDoble f xs ys