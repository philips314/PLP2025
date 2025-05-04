# Practica 2 / Ejercicio 11.  
Considerar las siguientes funciones:  
```
     inorder :: AB a -> [a]
{I0} inorder = foldAB [] (\ri x rd -> ri ++ (x:rd))

     elemAB :: Eq a => a -> AB a -> Bool
{A0} elemAB e = foldAB False (\ri x rd -> (e == x) || ri || rd)

     elem :: Eq a => [a] -> Bool
{E0} elem e = foldr (\x rec -> (e == x) || rec) False

       foldAB :: b -> (a -> b -> b -> b) -> AB a -> b
{FAB0} foldAB Nil = cNil
{FAB1} foldAB Bin izq v der =  cBin v (rec izq) (rec der)
          where rec = foldAB cNil cBin

	foldr :: (a -> b -> b) -> b -> [a] -> b
{F0} foldr f z [] = z
{F1} foldr f z (x:xs) = f x (foldr f z xs)
```
Demostrar la siguiente propiedad:  
`Eq a => ∀e::a . elemAB e = elem e . inorder`  
Por extensionalidad funcional, basta con probar que:  
`∀t::AB a. P(t): Eq a => ∀e::a. elemAB e t = elem e . inorder t`  
Uso inducción, tengo el caso base y el inductivo:   
**Caso base:** `P(Nil)`  
```
Por un lado:
elemAB e Nil =  {elemAB}
elemAB e foldAB False (\ri x rd -> (e == x) || ri || rd) Nil
```
**Caso inductivo:** `P(Nil) ∧ (P(izq) ∧ P(der)) {HI} => P(Bin izq r der) {TI}`  
```
```
