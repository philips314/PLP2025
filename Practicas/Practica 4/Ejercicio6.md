# Practica 4 / Ejercicio 6  
Dar una derivación o explicar por qué no es posible dar una derivación para cada uno de los siguientes juicios de tipado:  
## a. ⊢ if true then zero else succ(zero) : Nat  
```
                                           -------------- t-0
                                           ∅ ⊢ zero: Nat
--------------t-True   -------------- t-0  ---------------- t-succ
∅ ⊢ true: Bool         ∅ ⊢ zero: Nat       succ(zero): Nat
--------------------------------------------------------- t-if
∅ ⊢ if true then zero else succ(zero) : Nat
```
## b. x : Nat, y : Bool ⊢ if true then false else (λz : Bool. z) true : Bool  
```
                                                                              --------------------------------------- t-VAR
                                                                               x : Nat, y : Bool, z: Bool ⊢ z: bool
                                                                              --------------------------------------------------t-ABS        ------------------------------- t-T
                                                                               x : Nat, y : Bool ⊢ (λz : Bool. z): Bool -> Bool              x : Nat, y : Bool ⊢ true: Bool
------------------------------ t-T    ------------------------------- t-F     ----------------------------------------------------------------------------------------------- t-APP
x : Nat, y : Bool ⊢ true: Bool       x : Nat, y : Bool ⊢ false: Bool          x : Nat, y : Bool ⊢ (λz : Bool. z) true: Bool
---------------------------------------------------------------------------------------------------------------------------- t-if
x : Nat, y : Bool ⊢ if true then false else (λz : Bool. z) true : Bool 
```
## c. ⊢ if λx: Bool. x then zero else succ(zero) : Nat  
```
                                                          --------------- t-0
NO TIPA                                                    ∅ ⊢ zero: Nat
-------------------------       -------------- t-0        ---------------------- t-succ
∅ ⊢ (λx: Bool. x): Bool         ∅ ⊢ zero: Nat             ∅ ⊢ succ(zero): Nat
----------------------------------------------------------------------------------- t-if
∅ ⊢ if λx: Bool. x then zero else succ(zero) : Nat
```
## d. x : Bool → Nat, y : Bool ⊢ x y : Nat  
```

----------------------------------------- t-VAR       ---------------------------------- t-VAR
x : Bool → Nat, y : Bool ⊢ x: Bool -> Nat             x : Bool → Nat, y : Bool ⊢ y: Bool
------------------------------------------------------------------------------------------ t-APP
x : Bool → Nat, y : Bool ⊢ x y : Nat
```
