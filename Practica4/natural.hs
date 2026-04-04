module Natural where

import Auxiliar


{- Función: a_natural
   
   Descripción: Recibe un entero no negativo. Regresa el entero en su estructura de dato natural.
   
   Uso: input1:  a_natural 0
        output1: Cero

   Uso: input2:  a_natural 1
        output2: Suc Cero
-}

a_natural :: Int -> Natural
a_natural n =
  if n == 0 then Cero
  else Suc (a_natural(n-1))



{- Función: a_entero
   
   Descripción: Recibe un dato natural. Regresa el dato en su estructura de dato entero.
   
   Uso: input1:  a_entero Cero
        output1: 0

   Uso: input2:  a_natural (Suc(Suc(Suc(Cero))))
        output2: 3
-}

a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (Suc n) = 1 + a_entero n



{- Función: potenciaNat
   
   Descripción: Recibe dos números naturales y eleva el primero a la potencia del segundo.
   
   Uso: input:  potenciaNat (Suc(Suc(Suc(Cero)))) (Suc(Suc(Cero)))

        output: Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Cero))))))))
-}

potenciaNat :: Natural -> Natural -> Natural
potenciaNat Cero Cero = Suc(Cero)
potenciaNat (Suc(n)) Cero = Suc(Cero)
potenciaNat Cero (Suc(m)) = Cero
potenciaNat (Suc(n)) (Suc(m)) = multiN (Suc(n)) (potenciaNat(Suc(n)) m)



{- Función: facNat
   
   Descripción: Recibe un número natural y devuelve el factorial del número.
   
   Uso: input:  facNat (Suc(Suc(Suc(Cero))))
        output: Suc (Suc (Suc (Suc (Suc (Suc Cero)))))
-}

facNat :: Natural -> Natural
facNat Cero = Suc(Cero)
facNat (Suc(n)) = multiN (Suc(n)) (facNat (n))

