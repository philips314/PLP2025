# Practica 2 / Ejercicio 3 
## Considerar las siguientes funciones y demostrar las siguientes propiedades:
```
     length :: [a] -> Int
{L0} length [] = 0
{L1} length (x:xs) = 1 + length xs
     duplicar :: [a] -> [a]
{D0} duplicar [] = []
{D1} duplicar (x:xs) = x : x : duplicar xs
     append :: [a] -> [a] -> [a]
{A0} append [] ys = ys
{A1} append (x:xs) ys = x : append xs ys
(++) :: [a] -> [a] -> [a]
{++} xs ++ ys = foldr (:) ys xs
     ponerAlFinal :: a -> [a] -> [a]
{P0} ponerAlFinal x = foldr (:) (x:[])
     reverse :: [a] -> [a]
{R0} reverse = foldl (flip (:)) []
{FR0} foldr _ z []     = z
{FR1} foldr f z (x:xs) = f x (foldr f z xs)
{M0}: map _ []     = []
{M1}: map f (x:xs) = f x : map xs
{FL0}: foldl _ z [] = z
{FL1}: foldl f z (x:xs) = foldl f (f z x) xs
{FLIP}: flip f x y = f y x
```
### I. `∀xs::[a]. length (duplicar xs) = 2 * length xs`  
Por induccion estructural tenemos dos casos: Base e inductivo...  
Predicado unario: `P(xs) = length (duplicar xs) = 2 * length xs`  
**Caso base:** `P([])`  
```
length (duplicar []) = 2 * len0gth []  
length [] = 2 * length []  {D0} 
0 = 2 * 0 {L0}x2
0 = 0  {INT}

P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
* **P(xs)**: `length (duplicar xs) = 2 * length xs` {HI}  
* **P(x:xs)**: `length (duplicar (x:xs)) = 2 * length (x:xs)` {TI}
```
Por un lado:
length (duplicar (x:xs)) =  {D1}
length (x : x : duplicar xs) =  {L1}
1 + length (x : duplicar xs) =  {L1}
1 + 1 + length (duplicar xs) =  {INT}
2 + length (duplicar xs) =  {HI}
2 + 2 * length xs

Por el otro:
2 * length (x:xs) =  {L1}
2 * (1 + length xs) = {INT}
2 + 2 * length xs

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
### II. `∀xs::[a]. ∀ys::[a]. length (append xs ys) = length xs + length ys`  
```
```
