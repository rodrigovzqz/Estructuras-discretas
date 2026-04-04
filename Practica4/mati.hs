module Mati where

import Auxiliar


{- Función: mayorIgual

   Descripción: Recibe dos matrioscas. Devuelve un booleano que indica si la segunda matrioska que está dentro de la primera.

   Uso: input1:  mayorIgual Mati Mati
        output1: True
        
        input2:  mayorIgual (Cont(Cont(Mati))) (Cont(Cont(Cont(Mati))))
        output2: False
-}

mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati Mati = True
mayorIgual (Cont(n)) Mati = True
mayorIgual Mati (Cont(m)) = False
mayorIgual (Cont(n)) (Cont(m)) = mayorIgual n m


{- Función: aplana

   Descripción: Recibe una matrioska anidada.
   La convierte en una lista plana de todas las matrioskas que la componen, desde la más externa hasta la más interna.

   Uso: input1:  aplana Mati
        output1: [ Mati ]
        
        input2:  aplana ( Cont ( Cont Mati ) )
        output2: [ Cont ( Cont Mati ) , Cont Mati Mati ]
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana m =
  if m == Mati then [Mati]
  else Cont (extraer m) : aplana (extraer m)