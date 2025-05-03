# Practica 2 / Ejercicio 9    
## Dadas las funciones altura y cantNodos definidas en la práctica 1 para árboles binarios, demostrar la siguiente propiedad:
### I. `∀ x::AB a . altura x ≤ cantNodos x`
```hs
data AB a = Nil | Bin (AB a) a (AB a)

altura :: AB a -> Integer
altura = foldAB 0 f
    where f = \ri _ rd -> 1 + max ri rd

cantNodos :: AB a -> Integer
cantNodos = foldAB 0 g
    where g = \ri _ rd -> 1 + ri + rd

foldAB z f x = case x of
    Nil -> z
    (Bin i r d) -> f (rec i) r (rec d)
    where rec = foldAB z f
```
Por Induccion estructural sobre árboles binarios, basta probar que:
```
∀x:: AB a. P(x), donde P(x): altura x ≤ cantNodos x
```
**Caso base:** `P(Nil)`
```
altura Nil ≤ cantNodos Nil =  {altura ; cantNodos}
altura foldAB 0 f Nil ≤ foldAB 0 g Nil =  {f ; g}
0 ≤ 0

P(Nil) vale 
```
**Caso Inductivo:**`∀i::AB a. ∀r::a. ∀d::AB a. P(i) ∧ P(d) {HI} ⇒ P(Bin i r d) {TI}`  
**P(i):** `altura i ≤ cantNodos i`
**P(d):** `altura d ≤ cantNodos d`
**P(Bin i r d):** `altura (Bin i r d) ≤ cantNodos (Bin i r d)`
```
Desarrollo el lado izquierdo de la desigualdad:
altura (Bin i r d) =  {altura}
foldAB 0 f (Bin i r d) =  {foldAB}
f (foldAB 0 f i) r (foldAB 0 f d) = {f}
1 + max (foldAB 0 f i) (foldAB 0 f d) =  {altura}
1 + max (altura i) (altura d) =  {HI}
1 + max (altura i) (altura d) ≤ 1 + max (cantNodos i) (cantNodos d) =  {≤ ; INT}
max (altura i) (altura d) ≤ max (cantNodos i) (cantNodos d) =  

Es decir: altura (Bin i r d) ≤ cantNodos (Bin i r d). Vale la propiedad.
```

preguntar si se puede usar (o hay que separar en casos):   
∀ a, b ∈ ℕ. max a b ≤ a + b
