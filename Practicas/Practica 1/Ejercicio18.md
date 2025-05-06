# Práctica 1 / Ejercicio 18  
## Definir la lista infinita `paresDeNat::[(Int,Int)]` que contenga todos los pares de números naturales:

```
paresDeNat1 :: [(Int,Int)]
paresDeNat1 = [(x,y) | z <- [0..], x <- [0..z], y <- [0..z], x + y == z]

Para cada z en [0..]:
* Recorre todos los posibles pares (x, y) con x e y en [0..z]
* Se queda con los que cumplan x + y == z

paresDeNat2 :: [(Int,Int)]
paresDeNat2 = [(x, z - x) | z <- [0..], x <- [0..z]]
```
