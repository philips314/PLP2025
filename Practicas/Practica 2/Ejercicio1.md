# Practica 2 / Ejercicio 1  
## Sean las siguientes definiciones de funciones:
- intercambiar (x,y) = (y,x)  {IN}
- espejar (Left x) = Right x  {ELeft}
- espejar (Right x) = Left x  {ERight}
- asociarI (x,(y,z)) = ((x,y),z)  {AI}
- asociarD ((x,y),z)) = (x,(y,z))  {AD}
- flip f x y = f y x  {FLIP}
- curry f x y = f (x,y)  {CURRY}
- uncurry f (x,y) = f x y  {UNCURRY}
## Demostrar las siguientes igualdades usando los lemas de generación cuando sea necesario:  
### I. `∀p::(a,b). intercambiar (intercambiar p) = p`  
```
Por principio de inducción sobre pares, basta con probar:  
∀x::a. ∀y::b. intercambiar (intercambiar (x, y)) = (x, y)

intercambiar (intercambiar (x, y)) = (x, y)
intercambiar (y, x) = (x, y)  {IN}
(x, y) = (x, y) {IN}
```
### II. `∀p::(a,(b,c)). asociarD (asociarI p) = p`  
```
Por principio de inducción sobre pares, basta con probar:  
∀x::a. ∀y::b. ∀z::c. asociarD (asociarI (x, (y, z))) = (x, (y, z))

asociarD (asociarI (x, (y, z))) = (x, (y, z)) 
asociarD ((x, y), z) = (x, (y, z))  {AI}
asociarD ((x, y), z) = (x, (y, z))  {AD}
(x, (y, z)) = (x, (y, z))
```  
### III. `∀ p::Either a b. espejar (espejar p) = p`  
```

```
