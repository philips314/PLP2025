# Practica 4 / Ejercicio 13  
Sean σ, τ, ρ tipos. Según la definición de sustitución, calcular:  
## a. (λy: σ. x (λx: τ. x)){x := (λy : ρ. x y)} 
``` 
(λy: σ. x (λx: τ. x)){x := (λy: ρ. x y)} =  {y != x, y ∉ fv(N)}
λy: σ. x (λx: τ. x){x := (λy: ρ. x y)} =    {APP}
λy: σ. x{x := (λy: ρ. x y)} (λx: τ. x){x := (λy: ρ. x y)} =  {x es libre en la 1er λ;  el x esta ligada en la 2da λ}
λy: σ. (λy: ρ. x y)(λx: τ. x)
```
## b. (y (λv: σ. x v)){x := (λy : τ. v y)}
```
(y (λv: σ. x v)){x := (λy : τ. v y)} =  {APP}
y{x := (λy : τ. v y)}  (λv: σ. x v){x := (λy : τ. v y)} = {x ∉ fv(λv: σ. x v)} =  {y!=x; v!=x pero v ∈ fv(N) -> renombrar variable ligada v{v := z}}
y (λv: σ. x v){v:=z}{x := (λy : τ. v y)} =
y (λz: σ. x z){x := (λy : τ. v y)} =  {x esta libre en la λ}
y(λz: σ. (λy : τ. v y) z)      
```
