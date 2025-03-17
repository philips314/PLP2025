# Practica 0 / Ejercicio 1 
## Dar el tipo y describir el comportamiento de las siguientes funciones del módulo Prelude de Haskell:  
### I. null  
`null :: Foldable t => t a -> Bool`  
+ `Foldable t =>` Indica que `t` es un tipo que pertenece a la clase de tipos `Foldable`. Es decir, una estructura de datos plegable.  
+ `t a` Representa que la estructura `t` contiene elementos de algún tipo `a`.  
+  `-> Bool` Nos indica que la función devuelve un `Bool`.
La función devuelve `True` si le pasamos una estructura vacía, y en caso contrario, devuelve un `False`.
