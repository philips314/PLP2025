data AB a = Nil | Bin (AB a) a (AB a)


--I. foldAB y recAB
-- recr :: (head -> tail -> recTail -> recConHead) -> casoBase -> Lista -> RES

foldAB ::  b -> (b -> a -> b -> b) -> AB a -> b
foldAB  cNil cBin t = case t of
    Nil -> cNil
    Bin i v d -> cBin  (rec i) v (rec d)
        where rec = foldAB cNil cBin

recAB :: b -> (AB a -> a -> AB a -> b -> b -> b) -> AB a -> b
recAB cNil cBin t = case t of
    Nil -> cNil 
    Bin i v d -> cBin i v d (rec i) (rec d)
        where rec = recAB cNil cBin


--II. esNil, altura y cantNodos
esNil :: AB a -> Bool
esNil Nil = True
esNil (Bin i v d) = False

altura :: AB a -> Int
altura = foldAB 0 (\ri _ rd -> 1 + max ri rd)

cantNodos :: AB a -> Int
cantNodos = foldAB 0 (\ri _ rd -> 1 + ri + rd)

--III. mejorSegun :: (a -> a -> Bool) -> AB a -> a
mejorSegunAB :: (a -> a -> Bool) -> AB a -> a
mejorSegunAB _ Nil = error "AB Nulo"
mejorSegunAB f (Bin izq raiz der) = foldAB raiz (\ri root rd -> g (g ri root) rd ) (Bin izq raiz der)
    where g x y = if f x y then x else y
 

--IV. esABB :: Ord a => AB a -> Bool 
