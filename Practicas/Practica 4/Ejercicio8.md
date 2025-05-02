# Practica 4 / Ejercicio 8  
Determinar qué tipo representa $\sigma$ en cada uno de los siguientes juicios de tipado.  
## ⊢ succ(zero) : σ
```
σ := Nat

------------- t-0
⊢ zero : Nat
-------------------- t-Succ
⊢ succ(zero) : Nat
```
## ⊢ isZero(succ(zero)) : σ  
```
σ := Bool

------------- t-0
⊢ zero : Nat
-------------------- t-Succ
⊢ succ(zero) : Nat
--------------------------- t-isZero
⊢ isZero(succ(zero)) : Bool 
```
## ⊢ if (if true then false else false) then zero else succ(zero) : σ
```
σ := Nat

-------------- t-T      --------------- t-F       ---------------- t-F                               --------------- t-0
⊢ true : Bool           ⊢ false : Bool             ⊢ false : Bool                                     ⊢ zero : Nat
------------------------------------------------------------------- t-if      -------------- t-0     -------------------- t-succ
⊢ (if true then false else false) : Bool                                       ⊢ zero : Nat           ⊢ succ(zero) : Nat
-------------------------------------------------------------------------------------------------------------------------- T-if
⊢ if (if true then false else false) then zero else succ(zero) : σ
```
