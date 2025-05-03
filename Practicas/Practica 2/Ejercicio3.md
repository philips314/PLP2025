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
           filter :: (a -> Bool) -> [a] -> [a]
{FILTER0}: filter p [] = []
{FILTER1}: filter p (x:xs) = if p x then x : filter p xs else filter p xs
      elem :: a -> [a] -> Bool
{E0}: elem e [] = false
{E1}: elem e (x:xs) = e == x || elem e xs
```
### I. `∀xs::[a]. length (duplicar xs) = 2 * length xs`  
Por extencionalidad funcional e induccion estructural tenemos dos casos: Base e inductivo...  
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
Por extensionalidad funcional e induccion estructural en xs tenemos dos casos: Base e inductivo...  
Predicado unario: `P(xs) = ∀ys::[a]. length (append xs ys) = length xs + length ys`  
**Caso base:** `P([])`  
```
No escribo el "∀ys::[a]" pero saber que esta presente.

Por un lado:
length (append [] ys) =     {A0} 
length ys

Por el otro:
length [] + length ys =     {L0}
0 + length ys =     {INT}
length ys

P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
* **P(xs)**: `∀ys::[a]. length (append xs ys) = length xs + length ys` {HI}  
* **P(x:xs)**: `∀ys::[a]. length (append (x:xs) ys) = length (x:xs) + length ys` {TI}
```
No escribo el "∀ys::[a]" pero saber que esta presente.

Por un lado:
length (append (x:xs) ys) =     {A1}
length (x : append xs ys) =     {L1}
1 + length (append xs ys) =     {HI}
1 + length xs + length ys


Por el otro:
length (x:xs) + length ys = {L1}
1 + length xs + length ys


Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
### III. `∀xs::[a]. ∀x::a. append [x] xs = x:xs`  
Por extensionalidad funcional e induccion estructural en xs tenemos dos casos: Base e inductivo...  
Predicado unario: `∀x::a. P(xs) = append [x] xs = x:xs`  
**Caso base:** `P([])`  
```
No escribo el "∀x::a." pero saber que esta presente.

Por un lado:
append [x] [] =     {A1}
x : append [] [] =      {A0}
x : [] =     {:}
[x]

Por el otro:
x:[] =     {:}
[x]

P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(y:xs) {TI}`  
Donde:  
* **P(xs)**: `∀x::a. append [x] xs = x:xs` {HI}  
* **P(y:xs)**: `∀x::a. append [x] (y:xs) = x : (y:xs)` {TI}
```
No escribo el "∀x::a." pero saber que esta presente.

Por un lado:
append [x] (y:xs) =     {A1}
x : append [] (y:xs) =     {A0}
x : (y:xs) =     {:}
(x:y:xs)

Por el otro:
x : (y:xs) =     {:}
(x:y:ys)

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
### IV. `∀xs::[a]. ∀f::(a->b). length (map f xs) = length xs`  
Por extensionalidad funcional e induccion estructural en xs tenemos dos casos: Base e inductivo...  
Predicado unario: `P(xs) = ∀f::(a->b). length (map f xs) = length xs`  
**Caso base:** `P([])`  
```
No escribo el "∀f::(a->b)" pero saber que esta presente.

length (map f []) = length []
length (map f []) = length []     {M0;L0}
length [] = 0     {L0}
0 = 0

P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
* **P(xs)**: `∀f::(a->b). length (map f xs) = length xs` {HI}  
* **P(x:xs)**: `∀f::(a->b). length (map f (x:xs)) = length (x:xs)` {TI}
```
No escribo el "∀f::(a->b)" pero saber que esta presente.

Por un lado:
length (map f (x:xs)) =     {M0}
length (f x : map f xs) =     {L1}
1 + length (map f xs) =     {HI}
1 + length xs

Por el otro:
length (x:xs) =     {L1}
1 + length xs

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
### V. `∀xs::[a]. ∀p::a->Bool. ∀e::a. ((elem e (filter p xs)) ⇒ (elem e xs)) (asumiendo Eq a)`  
Por extensionalidad funcional e induccion estructural en xs tenemos dos casos: Base e inductivo...  
Predicado unario: `P(xs) = ∀p::a->Bool. ∀e::a. ((elem e (filter p xs)) ⇒ (elem e xs)) (asumiendo Eq a)`  
**Caso base:** `P([])`  
```
No escribo el "∀p::a->Bool. ∀e::a." pero saber que esta presente.

Por el antecedente de la implicación:
((elem e (filter p [])) =     {FILTER0}
(elem e []) =     {E0}
false

Como: false ⇒ Q ≡ true 
P([]) vale.

```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde (asumiendo Eq a):  
* **P(xs)**: `∀p::a->Bool. ∀e::a. ((elem e (filter p xs)) ⇒ (elem e xs))` {HI}  
* **P(x:xs)**: `∀p::a->Bool. ∀e::a. ((elem e (filter p (x:xs))) ⇒ (elem e (x:xs)))` {TI}
```
No escribo el "∀p::a->Bool. ∀e::a." pero saber que esta presente.
Sea ((elem e (filter p (x:xs))) ⇒ (elem e (x:xs)))

Analizamos el antecedente de la implicación:
((elem e (filter p (x:xs))) =     {FILTER1}
(elem e (if p x then x : filter p xs else filter p xs))

Por extensionalidad de Bool tengo dos casos para (p x)
{1a} p x = true
     {BOOL; IF}
     (elem e (x : filter p xs)) =     {E1}
     (e==x || elem e (filter p xs))

     Por extensionalidad de Bool tengo dos casos para (e==x)
     {1b} (e==x) = true
               {BOOL; ||}
               true ==> como (e==x) la implicación nos queda: true ⇒ true ≡ true
     {2b} (e==x) = false
               {BOOL; ||}
               elem e (filter p xs) =     {HI}
               (elem e (filter p xs)) ⇒ (elem e xs) ==> Obtengo la misma implicación por {HI}
{2a} p x = false
     {BOOL; IF}
     (elem e (filter p xs)) =     {HI}
     (elem e (filter p xs)) ⇒ (elem e xs)) ==> Obtengo la misma implicación por {HI}

∴vale P(x:xs) y se prueba la propiedad.
```
### VI. `∀xs::[a]. ∀x::a. ponerAlFinal x xs = xs ++ (x:[])`  
Por extensionalidad funcional e induccion estructural en xs tenemos dos casos: Base e inductivo...  
Predicado unario: `P(xs) = ∀x::a. ponerAlFinal x xs = xs ++ (x:[])`  
**Caso base:** `P([])`  
```
No escribo el "∀x::a." pero saber que esta presente.

Por un lado:
ponerAlFinal x [] =     {P0}
foldr (:) (x:[]) [] =     {F0}
(x:[]) =     {:}
[x]

Por el otro:
[] ++ (x:[]) =     {++}
(x:[]) =     {:}
[x]


P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(y:xs) {TI}`  
Donde:  
* **P(xs)**: `∀x::a. ponerAlFinal x xs = xs ++ (x:[])` {HI}  
* **P(y:xs)**: `∀x::a. ponerAlFinal x (y:xs) = (y:xs) ++ (x:[])` {TI}
```
No escribo el "∀x::a." pero saber que esta presente.

Por un lado:
ponerAlFinal x (y:xs) =     {P0}
foldr (:) (x:[]) (y:xs) =     {FR1; :}
(:) y (foldr (:) ([x]) xs) =     {:}
y : (foldr (:) ([x]) xs)


Por el otro:
(y:xs) ++ (x:[]) =     {++; :}
foldr (:) ([x]) (y:xs) =     {FR1}
(:) y (foldr (:) [x] xs) =     {:}
y : (foldr (:) [x] xs)


Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
### VII. `reverse = foldr (\x rec -> rec ++ (x:[])) []`  
Por extensionalidad funcional, basta ver que: `∀ys::[a]. P(ys), donde P(ys): reverse ys = foldr (\x rec -> rec ++ (x:[])) [] ys`  
Por induccion estructural sobre ys tenemos dos casos: Base e inductivo...   
**Caso base:** `P([])`  
```
Por un lado:
reverse [] =     {R0}
foldl (flip (:)) [] []     = {FL0}
[]

Por el otro:
foldr (\x rec -> rec ++ (x:[])) [] [] =     {FR0}
[]

P([]) vale.
```
**Caso inductivo:** `∀ys::[a]. ∀y::a. P(ys) {HI} => P(y:ys) {TI}`  
Donde:  
* **P(ys)**: `reverse ys = foldr (\x rec -> rec ++ (x:[])) [] ys` {HI}  
* **P(y:ys)**: `reverse (y:ys) = foldr (\x rec -> rec ++ (x:[])) [] (y:ys)` {TI}
```
Por un lado:
reverse (y:ys) =     {R0}
foldl (flip (:)) [] (y:ys) =     {FL1}
foldl (flip (:)) ((flip (:)) [] y) ys =     {FLIP}
foldl (flip (:)) ((:) y []) ys =     {:}
foldl (flip (:)) ([y]) ys =     {LEMA}
reverse ys ++ [y]

Por el otro:
foldr (\x rec -> rec ++ (x:[])) [] (y:ys) =     {FR1}
(\x rec -> rec ++ (x:[])) y (foldr \x' rec -> rec ++ (x':[])) [] ys) =     {B; donde x=y}
((foldr \x' rec -> rec ++ (x':[])) [] ys) ++ (y:[]) =     {:}
(foldr \x' rec -> rec ++ [x']) [] ys) ++ ([y]) =     {HI; recordar que y es el primer elemento de la lista y x' es el segundo}
reverse ys ++ [y]

Llegamos a lo mismo de ambos lados del igual. ∴vale P(y:ys) y se prueba la propiedad.
```  
Tengo que definir un LEMA.  
∀xs::[a]. P(xs): ` ∀y::a. foldl (flip (:)) [y] xs = reverse xs ++ [y]`  
**Caso base:** `P([])`  
```
Por un lado:
foldl (flip (:)) [y] [] =     {FL0}
[y]

Por el otro:
reverse [] ++ [y] =     {R0}
foldl (flip (:)) [] [] ++ [y] =     {FL0}
[] ++ [y] =     {++}
[y]

P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde ∀xs::[a]. Tengo:  
* **P(xs)**: `∀y::a. foldl (flip (:)) [y] xs = reverse xs ++ [y]` {HI}  
* **P(x:xs)**: `∀y::a. foldl (flip (:)) [y] (x:xs) = reverse (x:xs) ++ [y]` {TI}
```
Por un lado:
foldl (flip (:)) [y] (x:xs) =     {FL1}
foldl (flip (:)) ((flip (:)) [y] x) xs =     {FLIP}
foldl (flip (:)) ((:) x [y]) xs =     {:}
foldl (flip (:)) [x,y] xs =     {HI}
reverse xs ++ [x,y] 

Por el otro:
reverse (x:xs) ++ [y] =     {R0}
(foldl (flip (:)) [] (x:xs)) ++ [y] =     {FL1}
foldl (flip (:)) ((flip (:)) [] x) xs ++ [y] =     {FLIP}
foldl (flip (:)) ((:) x []) xs ++ [y] =     {:}
foldl (flip (:)) [x] xs ++ [y] =     {HI}
reverse xs ++ [x] ++ [y] =     {++}
reverse xs ++ [x,y]

Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```
### VIII. `∀xs::[a]. ∀ x::a. head (reverse (ponerAlFinal x xs)) = x ??`    
Por extensionalidad funcional e induccion estructural en xs tenemos dos casos: Base e inductivo...  
Predicado unario: `P(xs) = `  
**Caso base:** `P([])`  
```
No escribo el "" pero saber que esta presente.



P([]) vale.
```
**Caso inductivo:** `∀xs::[a]. ∀ x::a. P(xs) {HI} => P(x:xs) {TI}`  
Donde:  
* **P(xs)**: `` {HI}  
* **P(x:xs)**: `` {TI}
```
No escribo el "" pero saber que esta presente.

Por un lado:

Por el otro:


Llegamos a lo mismo de ambos lados del igual. ∴vale P(x:xs) y se prueba la propiedad.
```  
