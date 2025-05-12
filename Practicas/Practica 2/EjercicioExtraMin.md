# Practica 2 / Ejercicio Extra Min    
## Considerar las siguientes definiciones:
### I. `∀xs::[a]. ∀ys::[a]. length (zip xs ys) = min (length xs) (length ys)`
```hs
    const :: a -> b -> a
{C} const = (\x -> \y -> x)

     length :: [a] -> Int
{L0} length [] = 0
{L1} length (x:xs) = 1 + length xs

    head :: [a] -> a
{H} head (x:xs) = x

     tail :: [a] -> [a]
{T0} tail [] = []
{T1} tail (x:xs) = xs

     null :: [a] -> Bool
{N0} null [] = True
{N1} null (x:xs) = False

     zip :: [a] -> [b] -> [(a,b)]
{Z0} zip [] _ = const []
{Z1} zip (x:xs) = \ys -> if null ys then [] else (x, head ys):zip xs (tail ys)

{LEMA} ∀xs::[a]. min (length xs) 0 = 0
RECORDAR ORDEN
```
Por Induccion estructural sobre listas en ys, defino `P(ys)`, y basta con probarlo:
```
∀ys::[a]. P(ys): ∀xs::[a]. length (zip ys xs) = min (length ys) (length xs)
No voy a seguir escribiendo los ∀ pero notar que estan presentes.
```
**Caso base:** `P([])`
```
Por lema de generación de listas en xs:
* Caso xs = []
* Caso xs = (x:xs)

{xs = []}
  Desarrollo el lado izquierdo de la igualdad:
  length (zip [] []) =  {Z0}
  length (const [] []) =  {C}
  length ((\x -> \y -> x) [] []) =  {B}
  length ((\y -> []) []) =  {B}
  length [] =  {L0}
  0

  Desarrollo el lado derecho de la igualdad:
  min (length []) (length [])  =  {L0x2}
  min 0 0 =  {min}
  0

{xs = (x:xs)}
  Desarrollo el lado izquierdo de la igualdad:
  length (zip (x:xs) []) =  {Z1}
  length ((\ys -> if null ys then [] else (x, head ys):zip xs (tail ys)) []) =  {B}
  length (if null [] then [] else (x, head []) : zip xs (tail [])) =  {por N0 null []=True ; if}
  length [] =  {L0}
  0
  
  Desarrollo el lado derecho de la igualdad:
  min (length (x:xs)) (length [])  =  {L0}
  min (length (x:xs)) 0 =  {LEMA}
  0

P([]) vale 
```
**Caso Inductivo:**`∀ys::[a]. P(ys) {HI} ⇒ P(y:ys) {TI}`   
**{HI}, P(ys):** `∀xs::[a]. length (zip xs ys) = min (length xs) (length ys)`  
**{TI}, P(y:ys):** `∀xs::[a]. length (zip xs (y:ys)) = min (length xs) (length (y:ys))`  
```
Por lema de generación de listas en xs:
* Caso xs = []
* Caso xs = (x:xs)

{xs = []}
  Desarrollo el lado izquierdo de la igualdad:
  length (zip [] (y:ys)) =  {Z0}
  length (const [] (y:ys)) =  {C}
  length ((\x -> \y -> x) [] (y:ys)) =  {Bx2}
  length [] =  {L0}
  0

  Desarrollo el lado derecho de la igualdad:
  min (length []) (length (y:ys)) =  {L0 ; L1}
  min 0 (1 + length ys)  {por LEMA2 length ys ≥ 0 ; por monotonia del min}
  0

  me queda:
  0 = 0 {INT}
  True

{xs = (x:xs)}
  Desarrollo el lado izquierdo de la igualdad:
  length (zip (x:xs) (y:ys)) =  {Z1}
  length ((\ys -> if null ys then [] else (x, head ys):zip xs (tail ys)) (y:ys)) =  {B}
  length (if null (y:ys) then [] else (x, head (y:ys)) : zip xs (tail (y:ys))) =  {por N1, null (y:ys)=false ; if}
  length ((x, head (y:ys)) : zip xs (tail (y:ys))) =  {H ; T1}
  length ((x,y) : zip xs ys) =  {L1}
  1 + length (zip xs ys)


  Desarrollo el lado derecho de la igualdad:
  min (length (x:xs)) (length (y:ys)) =  {L1x2}
  min (1 + length xs) (1 + length ys) =  {monotonia del min ; INT}
  1 + min (length xs) (length ys)

  me queda la siguiente igualdad:
  1 + length (zip xs ys) = 1 + min (length xs) (length ys)
  {INT}
  length (zip xs ys) = min (length xs) (length ys)
  {esto vale por HI}
  True

Como todos los casos valen, vale P(y:ys). Queda demostrado.
```
Defino un {LEMA2}: ∀xs::[a]. length xs ≥ 0.  
Por Induccion estructural sobre listas en xs, defino `P(xs)`, y basta con probar:  
```
∀xs::[a]. p(xs): length xs ≥ 0.
```
**Caso base:** `P([])`  
```
length [] ≥ 0 =  {L0}
0 ≥ 0 =  {≥}
True

P([]) vale
```
**Caso Inductivo:** `∀xs::[a]. P(xs) {HI} ⇒ P(x:xs) {TI}`  
**{HI}, P(xs):** `length xs ≥ 0`
**{TI}, P(x:xs):** `length (x:xs) ≥ 0`
```
Desarrollo el lado izquierdo de la desigualdad:
length (x:xs) =   {L1}
1 + length xs ≥ 0  {HI}

Por lo tanto: length (x:xs) ≥ 0
P(x:xs) vale.
```
