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
## A tener en cuenta  
```
1. Es importante es que las soluciones generadas en cada paso sean finitas, y que entre todas cubran todo
   el espacio de soluciones que se busca generar.
2. En caso de que haya más de una forma posible de ir recorriendo el espacio de búsqueda generando finitas
   soluciones en cada paso, conviene pensar cúal es la forma más sencilla.

Ejemplo:
* Queremos generar todas las listas finitas de enteros positivos.
* No nos sirve que el generador infinito nos vaya dando la longitud de la lista, porque para cada
  longitud hay infinitas listas posibles.
* Tampoco nos sirve que vaya generando el primer elemento de la lista y que los demás estén acotados por
  el primero, porque entonces nunca generaríamos las listas cuyo primer elemento no es el máximo
* En cambio la suma de los elementos de la lista sí es un buen valor para ir generando en cada paso, ya
  que hay una cantidad finita de listas para cada suma posible, y entre todas las sumas obtenemos
  todas las listas.
* Además las soluciones en cada paso son disjuntas, lo cual siempre es útil, ya que no tenemos que
  ocuparnos de eliminar soluciones repetidas
```
