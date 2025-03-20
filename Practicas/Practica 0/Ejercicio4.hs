-- Ejercicio 4 | Definir las siguientes funciones sobre listas:

-- I. limpiar.
borrar :: Char -> String -> String
borrar c  = filter (/= c)

limpiar :: String -> String -> String
limpiar "" palabra = palabra
limpiar (x:xs) palabra = limpiar xs (borrar x palabra)

-- II. difPromedio.
lengthFloat :: [a] -> Float
lengthFloat = fromIntegral . length

calcularPromedio :: [Float] -> Float
calcularPromedio notas = sum notas / lengthFloat notas

difPromedio :: [Float] -> [Float]
difPromedio notas = map (subtract (calcularPromedio notas)) notas

-- III. todosIguales.
todosIguales :: [Int] -> Bool
todosIguales [x] = True
todosIguales (x:xs) = (x == head xs) && todosIguales xs
