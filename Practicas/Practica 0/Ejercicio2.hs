-- Ejercicio 2 | Definir las siguientes funciones:

-- I. valorAbsoluto, que dado un número devuelve su valor absoluto.
valorAbsoluto :: Float -> Float
valorAbsoluto x = if x<0 then -x else x  

-- II. bisiesto, que dado un "año" indica si el mismo es bisiesto.
bisiesto :: Int -> Bool
bisiesto n = (mod n 4 == 0) && ((mod n 100 /= 0) || (mod n 400 == 0))

-- III. factorial, definida únicamente para enteros positivos.
factorial :: Int -> Int
factorial 0 = 1
factorial n = n*factorial(n-1)

-- IV. cantDivisoresPrimos, dado un Int positivo devuelve la cantidad de divisores primos.
cantDivisores :: Int -> Int
cantDivisores 1 = 1
cantDivisores n = length (filter (\x -> mod n x == 0) [1..n])

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = cantDivisores n == 2

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos 1 = 1
cantDivisoresPrimos n = length (filter (\x -> mod n x == 0 && esPrimo x) [1..n])


