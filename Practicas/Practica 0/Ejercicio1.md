# Practica 0 / Ejercicio 1 
## Dar el tipo y describir el comportamiento de las siguientes funciones del módulo Prelude de Haskell:  
### I. null  
`null :: Foldable t => t a -> Bool`  
+ `Foldable t =>` Indica que `t` es un tipo que pertenece a la clase de tipos `Foldable`. Es decir, una estructura de datos plegable.  
+ `t a` Representa que la estructura `t` contiene elementos de algún tipo `a`.  
+  `-> Bool` Nos indica que la función devuelve un `Bool`.  
La función retorna `True` si le pasamos una estructura vacía, y en caso contrario, devuelve un `False`.
### II. head  
`head :: [a] -> a`  
Devuelve el primer elemento de una lista, y retorna un error al recibir una lista vacía.  
### III. tail  
`tail :: [a] -> [a]`  
Devuelve la lista sin su primer elemento.  
### IV. init  
`init :: [a] -> [a]`   
Devuelve el primer elemento de una lista, y retorna un error al recibir una lista vacía.  
### V. last  
`last :: [a] -> a`  
Devuelve el último elemento de una lista, y retorna un error al recibir una lista vacía.  
