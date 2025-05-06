data AIH a = Hoja a | Bin (AIH a) (AIH a)

--I. foldAIH
foldAIH :: (a -> b) -> (b -> b -> b) -> AIH a -> b
foldAIH cHoja cBin t = case t of
    Hoja h -> cHoja h
    Bin izq der -> cBin (rec izq) (rec der)
        where rec = foldAIH cHoja cBin


--II. altura y tamaño
altura :: AIH a -> Integer
altura = foldAIH (const 1) (\recIzq recDer -> 1 + max recIzq recDer)

tamaño :: AIH a -> Integer
tamaño = foldAIH (const 1) (\recIzq recDer -> 1 + recIzq + recDer)