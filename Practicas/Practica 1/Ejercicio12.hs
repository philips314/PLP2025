data AB a = Nil | Bin (AB a) a (AB a)



--I. foldAB y recAB
-- recr :: (head -> tail -> recTail -> recConHead) -> casoBase -> Lista -> RES
-- foldAB :: casoBase -> (recIzq -> raiz -> recDer -> recCompleta) -> Arbol -> res
-- recAB :: casoBase -> (Arbol -> recIzq -> raiz -> recDer -> recCompleta) -> Arbol -> res

foldAB ::  b -> (b -> a -> b -> b) -> AB a -> b
foldAB  cNil cBin t = case t of
    Nil -> cNil
    Bin i v d -> cBin  (rec i)  v (rec d)
        where rec = foldAB cNil cBin

recAB :: b -> (AB a -> b -> a -> b -> b) -> AB a -> b
recAB cNil cBin t = case t of
    Nil -> cNil 
    Bin i v d -> cBin (Bin i v d) (rec i) v (rec d)
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
mejorSegunAB f (Bin izq raiz der) = foldAB raiz (\ri root rd -> compararTres f root ri rd) (Bin izq raiz der)
 
compararTres :: (a -> a -> Bool) -> a -> a -> a -> a
compararTres f root rootIzq rootDer = if (f root rootIzq && f root rootDer) then root else (if f rootIzq rootDer then rootIzq else rootDer) 


--IV. esABB :: Ord a => AB a -> Bool 
esABB :: Ord a => AB a -> Bool 
esABB = recAB True (\arbol ri _ rd -> esABBAUX arbol && ri && rd) 


esABBAUX :: Ord a => AB a -> Bool
esABBAUX Nil = True
esABBAUX (Bin Nil _ Nil) = True
esABBAUX (Bin Nil valor (Bin _ subValor _)) = valor < subValor
esABBAUX (Bin (Bin _ subValor _) valor Nil) = valor > subValor
esABBAUX (Bin (Bin _ subValorIzq _) valor (Bin _ subValorDer _)) = subValorDer > valor && subValorIzq < valor
