data AB a = Nil | Bin (AB a) a (AB a) deriving Show
-- El deriving Show me permite imprimir las variables.

--I. vacioAB.
vacioAB :: AB Bool -> Bool
vacioAB Nil = True
vacioAB (Bin _ _ _) = False

--II. negacionAB.
negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin izq valor der) = Bin (negacionAB izq) (not valor) (negacionAB der)


--III. productoAB.
productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin izq valor der) = productoAB izq * valor * productoAB der