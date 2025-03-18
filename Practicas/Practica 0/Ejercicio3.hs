--data Maybe a = Nothing | Just a
--data Either a b = Left a | Right b

-- I. inverso, que dado un Float devuelve su inverso multiplicativo.
-- Si no esta definido, devolver Nothing.
inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso n = Just (1 / n)

-- II. aEntero, que convierte un Int a una expresión que puede ser Bool o Int. 
-- En el caso de los Bool, el Int que corresponde es 0 para False y 1 para True.
aEntero :: Either Int Bool -> Int
aEntero (Left n) = n
aEntero (Right valor) = if valor then 1 else 0