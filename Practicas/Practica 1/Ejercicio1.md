# Practica 1 / Ejercicio 1  
## Considerar las siguientes definiciones de funciones:  
```
max2 (x, y) | x >= y = x
            | otherwise = y
normaVectorial (x, y) = sqrt (x^2 + y^2)
subtract = flip (-)
predecesor = subtract 1
evaluarEnCero = \f -> f 0
dosVeces = \f -> f . f
flipAll = map flip
flipRaro = flip flip
```
### I. Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float).  
```
max2 :: (Float, Float) -> Float
normaVectorial :: (Float, Float) -> Float
subtract :: Float -> Float -> Float
predecesor :: Float -> Float
evaluarEnCero :: (Float -> a) -> a
# (.) :: (b -> c) -> (a -> b) -> a -> c
# f :: (a -> b)
# b = a para que pueda tipar con (.)
dosVeces :: (a -> a) -> a -> a
# map :: (a1 -> b1) -> [a1] -> [b1]
# flip :: (a -> b -> c) -> b -> a -> c
# a1 :: (a -> b -> c) y b1 :: b -> a -> c
flipAll :: [a -> b -> c] -> [b -> a -> c]
# flip1 :: (x -> y -> z) -> y -> x -> z ; flip2 :: (a -> b -> c) -> b -> a -> c
# x -> y -> z := (a -> b -> c) -> b -> a -> c
            # x :: (a -> b -> c)
            # y :: b
            # z :: a -> c
            # flipRaro :: y -> x -> z
flipRaro :: b -> (a -> b -> c) -> a -> c
```
### II. Indicar cuáles de las funciones anteriores no están currificadas. Para cada una de ellas, definir la función currificada correspondiente. Recordar dar el tipo de la función.   
```
asd
```
