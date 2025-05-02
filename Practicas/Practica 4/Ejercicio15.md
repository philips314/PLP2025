# Practica 4 / Ejercicio 15  
Dado el conjunto de valores visto en clase: `V := λx: τ. M | true | false | zero | succ(V)`
Determinar si cada una de las siguientes expresiones es o no un valor:
## a. (λx: Bool. x) true
Es una `aplicación` que reduce al valor `true`, pero no lo es.
## b. λx: Bool. 2  
Si, es una `abstracción`
## c. λx: Bool. pred(2)  
Si, es una `abstracción`
## d. λy: Nat. (λx: Bool. pred(2)) true
Si, es una `abstracción`
## e. x 
No, no es un valor.
## f. succ(succ(zero))  
No, ya que puede reducir a `2`
