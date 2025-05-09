# Practica 4  
## Ejercicio 22.  
Este ejercicio extiende el Cálculo Lambda tipado con listas.  
Comenzamos ampliando el conjunto de tipos:  
τ ::= . . . | [τ]  
M, N, O ::= . . . | $[ ]_τ$ | M :: N | case M of {[] $\leadsto$ N | h :: t $\leadsto$ O} | foldr M base $\leadsto$ N; rec(h, r) $\leadsto$ O   
donde:  
* [τ] representa el tipo de las listas cuyas componentes son de tipo τ
* $[ ]_σ$ es la lista vacía cuyos elementos son de tipo σ.  
* M :: N agrega M a la lista N.  
* case M of {[ ] $\leadsto$ N | h :: t $\leadsto$ O} es el observador de listas. Por su parte, los nombres de variables que se indiquen luego del | (h y t en este caso) son variables que pueden aparecer libres en O y deberán ligarse con la cabeza y cola de la lista respectivamente.  
* foldr M base $\leadsto$ N; rec(h, r) $\leadsto$ O es el operador de recursión estructural (no currificado). Los nombres de variables indicados entre paréntesis (h y r en este caso) son variables que pueden aparecer libres en O y deberán ser ligadas con la cabeza y el resultado de la recursión respectivamente.  
Por ejemplo:  
* case zero :: succ(zero) :: $[ ]_{Nat}$ of {[ ] $\leadsto$ False | x :: xs $\leadsto$ isZero(x)} $\twoheadrightarrow$ True  
* foldr 1 :: 2 :: 3 :: (λx: [Nat]. x) $[ ]_{Nat}$ base $\leadsto$ zero; rec(head, rec) $\leadsto$ head + rec $\twoheadrightarrow$ 6
## a. Mostrar el árbol sintáctico para los dos ejemplos dados.  
```
Hecho en papel...
```
## b. Agregar reglas de tipado para las nuevas expresiones.  
```
                              
-------------- t-[]        
Γ ⊢ []τ : [τ]     

 Γ ⊢ M:τ  Γ ⊢ N:[τ]        
---------------------- t-tail
 Γ ⊢ M::N : [τ]                   

 Γ ⊢ M:[τ]      Γ ⊢ N:p     Γ,h:τ, t:[τ] ⊢ O:p
-------------------------------------------------- t-case
 Γ ⊢ case M of {[] -> N | h :: t -> O} : p

 Γ ⊢ M:[τ]    Γ ⊢ N:p     Γ, h:τ, r:p ⊢ O:p 
---------------------------------------------- t-foldr
 Γ ⊢ foldr M base ⇝ N; rec(h, r) ⇝ O : p

FOLDR:
M es una lista de elementos de tipo τ
N es el caso base, de tipo p
O es el caso recursivo, donde h es el "head" y r el resultado de la recursión
```
## c. Demostrar el siguiente juicio de tipado (recomendación: marcar variables libres y ligadas en el término antes de comenzar).  
### x : Bool, y : [Bool] ⊢ foldr x :: x :: y base $\leadsto$ y; rec(y, x) $\leadsto$ if y then x else $[ ]_{Bool}$ : [Bool]  
```
                                        -------------------------------- t-var   -------------------------------- t-var
                                        x : Bool, y : [Bool] ⊢ x : Bool          x : Bool, y : [Bool] ⊢ y : [Bool]
-------------------------------- t-var  --------------------------------------------------------------------------- t-tail
x : Bool, y : [Bool] ⊢ x : Bool         x : Bool, y : [Bool] ⊢ x :: y : [Bool]
------------------------------------------------------------------------------- t-tail               (*)                                                            (+)
x : Bool, y : [Bool] ⊢ x :: x :: y :: [Bool]                                             x : Bool, y : [Bool] ⊢ y : [Bool]      x : Bool, y : [Bool], y':Bool, x:[Bool] ⊢ if y' then x' else []_{Bool} : [Bool]
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- t-foldr
x : Bool, y : [Bool] ⊢ foldr x :: x :: y base -> y; rec(y', x') -> if y' then x' else []_{Bool} : [Bool]


(*):
--------------------------------- t-var
x : Bool, y : [Bool] ⊢ y : [Bool]



(+):
---------------------------------------------------- t-var    ------------------------------------------------------- t-var     ------------------------------------------------------- t-[]
x : Bool, y : [Bool], y':Bool, x':[Bool] ⊢ y' : Bool           x : Bool, y : [Bool], y':Bool, x':[Bool] ⊢ x' : [Bool]           x : Bool, y : [Bool], y':Bool, x':[Bool] ⊢ []_{Bool} : [Bool]
------------------------------------------------------------------------------------------------------- t-if
x : Bool, y : [Bool], y':Bool, x':[Bool] ⊢ if y' then x' else []_{Bool} : [Bool]

```
## d. Mostrar cómo se extiende el conjunto de valores. Estos deben reflejar la forma de las listas que un programa podría devolver.  
```
V ::= ... | []τ | V :: V
```
## e. Agregar los axiomas y reglas de reducción asociados a las nuevas expresiones.  
```
Reglas de congruencia:
* El cg-tail solo con head porque si no rompe el determinismo.
* En cg-tail N es un valor V

    M-->M'     
------------------ cg-tail
 M::V ---> M'::V

                                M-->M'
----------------------------------------------------------------------------- cg-case
case M of {[] -> N | h :: t -> O} ---->  case M' of {[] -> N | h :: t -> O}

                                M-->M'
----------------------------------------------------------------------------- cg-foldr
foldr M base ⇝ V1; rec(h, r) ⇝ V2 ------>  foldr M base ⇝ V1; rec(h, r) ⇝ V2 

Reglas de computo:
case [] of {[] -> N | h :: t -> O} ----->  N  {cm-c[]}
case V1::V2 of {[] -> N | h :: t -> O} ----->  O{h := V1, t := V2}  {cm-cTail}
foldr [] base ⇝ N; rec(h, r) ⇝ O ----------> N  {cm-fBase}
foldr V1::V2 base ⇝ N; rec(h, r) ⇝ O ----------> O{h := V1, r := foldr V2 base ⇝ N; rec(h', r') ⇝ O}  {cm-fTail}
```
## Ejercicio 23  
A partir de la extensión del ejercicio 22, definir una nueva extensión que incorpore expresiones de la forma map(M, N), donde N es una lista y M una función que se aplicará a cada uno de los elementos de N.  
Importante: tener en cuenta las anotaciones de tipos al denir las reglas de tipado y semántica.  
Extensión del conjunto de términos.  
```
Observo que no es necesario extender el conjunto de tipos ni el de valores.
M, N, O ::= . . . | map(M,M)
```
Reglas de tipado.  
```
 Γ ⊢ M: σ -> τ      Γ ⊢ N:[σ]     
---------------------------------- t-map
 Γ ⊢ map(M:N) : [τ]
```
Reglas de semantica operacional.
```
Reglas de congruencia:

          M -----> M'                         
---------------------------- cg-map1  
  map(M,N) --->  map(M',N)

        M -----> M'
------------------------------ cg-map2  
  map(V1,M) --->  map(V1,M')

Reglas de computo:

map(V, []_{σ}) -----> Nil_{τ}  {cg-m[]}
map(V, V1::V2) -----> V V1 :: (map(V,V2))  {cg-mTail}
```
## Ejercicio 24  
A partir de la extensión del ejercicio 22, agregaremos términos para representar listas por comprensión, con un selector y una guarda, de la siguiente manera: `[M | x ← S, P]`   
donde:  
* x es el nombre de una variable que puede aparecer libre en los términos M y P.
* para cada valor de la lista representada por el término S, se sustituye x en P y, de resultar verdadero, se agrega M con x sustituido al resultado.

Tener en cuenta: `[ expresión | generadores, filtros ]`
* las expresiones son de tipo σ
* Los generadores toman una variable de tipo τ que salen de una lista de tipo [τ]
* los filtros son un Bool que se evalua sustituyendo x:τ
* Resulta en una lista de tipo [σ]


Definir las reglas de tipado, el conjunto de valores y las reglas de semántica para esta extensión.  
Extensión del conjunto de términos.  
```
Observo que no es necesario extender el conjunto de tipos ni el de valores.
M, N, O ::= . . . | [M | x ← S, P]
```
Reglas de tipado.  
```
 Γ, x:τ ⊢ P: Bool     Γ ⊢ S:[τ]       Γ, x:τ ⊢ M : σ
----------------------------------------------------------- t-comp
 Γ ⊢ [M | x ← S, P] : [σ]
```

Reglas de semantica operacional.
```
Reglas de congruencia:


Reglas de computo:
[M | x ← []τ, P] ------> []σ  {cm-comp[]}

    P{x := V1}
--------------------------------------------------
[M | x ← V1::V2, P] ---------> 
```

