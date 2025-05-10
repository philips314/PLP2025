-- I. Definir y dar el tipo del esquema de recursión foldNat sobre los naturales. Utilizar el tipo Integer de
-- Haskell (la función va a estar definida sólo para los enteros mayores o iguales que 0).
-- foldr :: (head -> recCola -> recConCabeza) -> respuestaCasoBase -> lista -> res

foldNat :: b -> (Integer -> b -> b)  -> Integer -> b
foldNat  cZero cSucc 0 = cZero
foldNat cZero cSucc n = cSucc n (rec (n-1))
    where rec = foldNat cZero cSucc 

-- II. Utilizando foldNat, definir la función potencia.

potencia :: Integer -> Integer -> Integer
potencia n = foldNat  1 (\_ rec -> n * rec) 

-- potencia 2 2
-- = foldNat (\_ rec -> 2 * rec) 1 2
-- = 2 * (foldNat (\_ rec -> 2 * rec) 1 1)
-- = 2 * (2 * (foldNat (\_ rec -> 2 * rec) 1 0))
-- = 2 * (2 * 1) = 2 * 2 = 4
