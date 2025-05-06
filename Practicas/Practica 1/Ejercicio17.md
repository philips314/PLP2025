# Práctica 1 / Ejercicio 17  
## Indicar el valor de la siguiente expresión...  
`[ x | x <- [1..3], y <- [x..3], (x + y) "mod" 3 == 0 ]`
```
1. x <- [1..3]: recorre x = 1, 2, 3
2. y <- [x..3]: para cada x, y va desde x hasta 3.
3. Filtra los pares (x, y) tales que x + y ≡ 0 mod 3, y devuelve solo el valor de x en esos casos.
  Observar inicio de la lista por comprensión [x | ...]
4. [1,3]: resultado final
```
## Las tres leyes de la generación infinita
```
1. Nunca debe usarse más de un generador infinito.
2. El generador infinito siempre va a la izquierda de cualquier otro generador.
3. Los generadores infinitos deben usarse únicamente para generar infinitas soluciones
```
