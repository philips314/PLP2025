# Practica 2 / Ejercicio 2  
## Demostrar las siguientes igualdades utilizando el principio de extensionalidad funcional:
### I. `flip . flip = id`
```
Sean las siguientes definiciones:
flip f x y = f y x  {FLIP}
(f . g) x = f (g x)  {.}
id x = x  {ID}
```
Por principio de extensionalidad funcional, basta ver que:  
```
∀f::a->b->c. ∀x::a. ∀y::b. flip . flip f x y = id f x y

flip . flip f x y = id f x y
flip (flip f) x y = id f x y  {.}
flip f y x = id f x y  {FLIP}
f x y = id f x y  {FLIP}
id f x y = id f x y  {ID}
```
### II. `∀f::(a,b)->c. uncurry (curry f) = f`
```
Sean las siguientes definiciones:
curry f x y = f (x,y)  {CURRY}
uncurry f (x,y) = f x y  {UNCURRY}
```
Por principio de extensionalidad funcional, basta ver que:  
```
∀f::(a,b)->c. ∀x::a. ∀y::b. uncurry (curry f) (x,y) = f (x,y)

uncurry (curry f) (x,y) = f (x,y)
curry f x y = f (x,y)  {UNCURRY}
f (x,y) = f (x,y)  {CURRY}
```
### III. `flip const = const id`
```
Sean las siguientes definiciones:
flip f x y = f y x  {FLIP}
const x y = x  {CONST}
id x = x  {ID}
```
Por principio de extensionalidad funcional, basta ver que:  
```
∀x::a. ∀y::b. flip const x y = const id x y

flip const x y = const id x y

Por un lado:
flip const x y = {FLIP}
const y x = {CONST}
y

Por el otro:
const id x y = {CONST}
id y =  {ID}
y
```
### IV. `∀f::a->b. ∀g::b->c. ∀h::c->d. ((h . g) . f) = (h . (g . f))`
```
Sean las siguientes definiciones:
(f . g) x = f (g x)  {.}
```
Por principio de extensionalidad funcional, basta ver que:  
```
∀f::a->b. ∀g::b->c. ∀h::c->d. ∀x::a. ((h . g) . f) x = (h . (g . f)) x

((h . g) . f) x = (h . (g . f)) x

Por un lado:
((h . g) . f) x =  {.}
(h . g) (f x) =  {.}
h (g (f x))

Por el otro:
(h . (g . f)) x =  {.}
h ((g.f) x) =  {.}
h (g (f x))
```
