# Práctica 4 / Ejercicio Extra sobre AB  
Sea la siguiente extensión de cálculo-λ tipado con árboles binarios.
```
σ ::= . . . | ABσ
M, N, O ::= . . . | Nilσ | Bin(M,N,O) | raiz(M) | der(M) | izq(M) | esNil(M)
```
## a. Definir reglas de tipado para los nuevos constructores de términos.  
```
Constructores...

                                Γ ⊢ M : ABσ     Γ ⊢ N : σ     Γ ⊢ O : ABσ
------------------- t-Nil      -------------------------------------------- t-Bin    
Γ ⊢ Nilσ : ABσ                  Γ ⊢ Bin(M,N,O) : ABσ

Observadores...

Γ ⊢ M : ABσ                Γ ⊢ M : ABσ                Γ ⊢ M : ABσ               Γ ⊢ M : ABσ
---------------- t-raiz   ------------------ t-izq   ----------------- t-der    ------------------ t-esNil
Γ ⊢ raiz(M) : σ            Γ ⊢ izq(M) : ABσ           Γ ⊢ der(M) : ABσ          Γ ⊢ esNil(M) : Bool
```
## b. Cómo se extiende el conjunto de los valores?  
```
Bin es un VALOR si y solo si sus componentes son valores (árbol izquierdo, raíz y árbol derecho).

V ::= . . . | Nilσ | Bin(V,V,V)
```
## c. Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. Importante: no olvidar las reglas de congruencia.  
```
Hay 7 reglas de congruencia, uno para cada término (el Nil no tiene)
-> RECORDAR MANTENER ORDEN PARA EL DETERMINISMO.

     M → M'                                            N → N'                                   O -> O'
---------------------------- cg-Bizq       ----------------------------- cg-Br     --------------------------------- cg-Bder
 Bin(M,N,O) →  Bin(M',N,O)                  Bin(V1,N,O) →  Bin(V1,N',O)             Bin(V1,V2,O) →  Bin(V1,V2,O')

    M → M'                            M → M'
------------------- cg-izq      ------------------- cg-der
 izq(M) → izq(M')                der(M) → der(M')

      M → M'                               M → M'
-------------------- cg-raiz       -------------------- cg-π2
 raiz(M) → raiz(M')                 esNil(M) → esNil(M')

Reglas de computo...            
raiz(Bin(V1,V2,V3)) -> V2  {cm-raiz}
der(Bin(V1,V2,V3)) -> V3  {cm-der}
izq(Bin(V1,V2,V3)) -> V1  {cm-izq}
esNil(Nilσ) -> True  {cm-esNil}
esNil(Bin(V1,V2,V3)) -> False  {cm-esNil}
```
## d. Agregar el término `Case M` y completar las reglas.    
```
Tener en cuenta que al agregar el Case como término, no tengo razones para agregar valores nuevos.
M, N, O ::= ... | Case M of Nil -> N
                            Bin(i,r,d) -> O

Reglas de computo...
Case Nilσ of Nil -> N; Bin(i,r,d) -> O ----> N  {cm-cNil}
Case Bin(V1,V2,V3) of Nil -> N; Bin(i,r,d) -> O ----> O{i := V1, r := V2, d := V3}  {cm-cBin}

Regla de tipado...

 Γ ⊢ M : ABσ    Γ ⊢ N : τ     Γ, i:ABσ, r:σ, d:ABσ ⊢ O : τ
------------------------------------------------------------- t-case    
 Γ ⊢ Case M of Nil -> N; Bin(i,r,d) -> O : τ

Regla de congruencia (Solo para el M, no debo hacerlo ni para el N, ni el O)

                                    M --> M'
---------------------------------------------------------------------------------- cg-case    
Case M of Nil -> N; Bin(i,r,d) -> O  ----->  Case M' of Nil -> N; Bin(i,r,d) -> O
```
## e. Reducir el siguiente término.  
`case (if ((λx:Bool.x) true) then Bin(Nil_{Nat},1,Nil_{Nat}) else Nil_{Nat}) of Nil -> false; Bin(i,r,d) -> isZero(r)`
```
case (if ((λx:Bool.x) true) then Bin(Nil_{Nat},1,Nil_{Nat}) else Nil_{Nat}) of Nil -> false; Bin(i,r,d) -> isZero(r) ----> {cg-case ; cg-if ; β (por la lambda que toma el true)}
case (if true then Bin(Nil_{Nat},1,Nil_{Nat}) else Nil_{Nat}) of Nil -> false; Bin(i,r,d) -> isZero(r) -------> {cg-case ; cm-if}
case Bin(Nil_{Nat},1,Nil_{Nat}) of Nil -> false; Bin(i,r,d) -> isZero(r) -------->  {cm-cBin}
isZero(r){i := Nil_{Nat}, r := 1, d := Nil_{Nat}} =  {SUST (no es una reducción)}
isZero(1) -----> {cm-isZero}
false
```
## f. Definir observadores con case.
```
⟂_{σ} := fix λx:σ.x (INDEFINIDO DE TIPO SIGMA)
raiz_{σ} := λx:AB_{σ}. case x of Nil -> ⟂_{σ}; Bin(i,r,d) -> r
der_{σ} :=  λx:AB_{σ}. case x of Nil -> ⟂_{σ}; Bin(i,r,d) -> d
izq_{σ} := λx:AB_{σ}. case x of Nil -> ⟂_{σ}; Bin(i,r,d) -> i
esNil_{σ} := λx:AB_{σ}. case x of Nil -> True; Bin(i,r,d) -> False
```
## g. Extender considerando nuevo término: `M ::= ... | map(M,N)`
```
Considerar:
map(λx:Nat.isZero(x), Bin(Nil_{Nat}, 1, Nil_{Nat})) ---->^{+}
Bin(Nil_{Bool}, False, Nil_{Bool})

Regla de tipado:

 Γ ⊢ M:ABσ -> ABτ    Γ ⊢ N:ABσ   
-------------------------------- t-map  
      Γ ⊢ map(M,N) : ABτ            

El conjunto de valores no cambia porque se trata de una operación (se puede computar/reducir a un valor).

Reglas de congruencia: 

          M -----> M'                          M -----> M'
---------------------------- cg-map1   ----------------------------- cg-map2  
  map(M,N) --->  map(M',N)              map(V1,M) --->  map(V1,M')

Reglas de computo:

map(V, Bin(V1, V2, V3)) ----> Bin (map(V,V1), V V2, map(V,V3))  {cm-mB}

           Γ ⊢ V : σ -> τ
------------------------------------- {cm-mB}
     map(V, Nil_{σ}) ----> Nil_{τ}   
```
