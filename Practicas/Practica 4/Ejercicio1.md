# Practica 4 / Ejercicio 1  
Determinar qué expresiones son sintácticamente válidas (es decir, pueden ser generadas con las gramáticas presentadas) y determinar a qué categoría pertenecen (expresiones de términos o expresiones de tipos):  
```
Términos
M ::= x | λx: τ. M | M M | true | false | if M then M else M | zero | succ(M) | pred(M) | isZero(M)
Donde la letra x representa un nombre de variable arbitrario. Dichos nombres se toman de un conjunto
infinito numerable dado X = {w, w1, w2, . . . , x, x1, x2, . . . , y, y1, y2, . . . , z, z1, z2, . . . }
Tipos
τ ::= Bool | Nat | τ → τ
$\checkmark$ $\times$ 
```
## a. x  
$\checkmark$ Es un término.
## b. x x  
$\checkmark$ Es una aplicación.
## c. M  
$\checkmark$ Es un término.
## d. M M
$\checkmark$ Es una aplicación.  
## e. true false  
$\checkmark$ Es una aplicación.  
## f. true succ(false true)  
$\checkmark$ Es una aplicación.  
## g. λx.isZero(x)  
$\times$ Le falta el tipo al x.
## h. λx: σ. succ(x)  
$\times$ No es valido, σ es un tipo cualquiera.
## i. λx: Bool. succ(x)  
$\checkmark$ Es sintácticamente válida, es una abstracción.
## j. λx: if true then Bool else Nat. x  
$\times$ if true then Bool else Nat no es un tipo valido para x.
## k. σ  
$\times$ No es una expresion sintácticamente válida, es un tipo cualquiera.  
## l. Bool  
$\checkmark$ Es un tipo válido.
## m. Bool → Bool  
$\checkmark$ Es un tipo válido.
## n. Bool → Bool → Nat  
$\checkmark$ Es un tipo válido.
## ñ. (Bool → Bool) → Nat  
$\checkmark$ Es un tipo válido.
## o. succ true  
$\times$ No es una expresion sintácticamente válida, le falta el parentesís.
## p. λx: Bool. if zero then true else zero succ(true)  
$\checkmark$ Es valida, pero no tipa.
