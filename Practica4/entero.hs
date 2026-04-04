module Entero where

import Auxiliar



{- Función: multiEnt
   
   Descripción: Recibe dos enteros y regresa el producto de ellos.
   
   Uso: input:  multiEnt (Neg(Succ(Succ(Succ(Succ Zero))))) (Succ(Succ Zero))

        output: Neg (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))
-}

multiEnt :: Entero -> Entero -> Entero
multiEnt Zero m = Zero
multiEnt n Zero = Zero
multiEnt (Succ n) m = sumaEnt m (multiEnt n m)
multiEnt (Neg n) m = Neg (multiEnt n m)