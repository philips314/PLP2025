-- I. curry, dada una función de dos argumentos, devuelve su equivalente currificada.
curry :: ((a, b) -> c) -> a -> b -> c
curry = \f -> \x -> \y -> f (x, y)


-- II. uncurry, dada una función currificada de dos argumentos, devuelve su versión no currificada equivalente.
uncurry :: (a -> b -> c) -> ((a,b) -> c)
uncurry = \f -> \(x, y) -> f x y


-- III. curryN, que dada una función de un número arbitrario de argumentos devuelva su versión currificada.
-- Creo que no se puede, pero tengo mis dudas.
-- curryN :: ((a1, a2,..., an) -> b) -> a1 -> a2 -> ... -> an -> b
-- curryN f a1 a2 ... an = f (a1, a2,..., an)
