# Practica 4 / Ejercicio 22.  
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
case M of {[] -> N | h :: t -> O} : p

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
