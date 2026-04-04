module Auxiliar where


data Natural = Cero | Suc Natural deriving (Eq, Show)

data Entero = Zero | Succ Entero | Neg Entero deriving (Eq, Show)

data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)



{- Función: sumaN
   
   Descripción: Recibe dos números naturales y los suma.
   
   Uso: input:  sumaN (Suc(Suc(Suc(Cero)))) (Suc(Suc(Cero)))

        output: Suc (Suc (Suc (Suc (Suc Cero))))
-}

sumaN :: Natural -> Natural -> Natural
sumaN n Cero = n
sumaN Cero m = m
sumaN (Suc(m)) n = sumaN m (Suc(n))



{- Función: multiN
   
   Descripción: Recibe dos números naturales y los multiplica.
   
   Uso: input:  multuN (Suc(Suc(Suc(Cero)))) (Suc(Suc(Cero)))

        output: Suc (Suc (Suc (Suc (Suc (Suc Cero)))))
-}

multiN :: Natural -> Natural -> Natural
multiN Cero m  = Cero
multiN n Cero = Cero
multiN (Suc(n)) m = sumaN m (multiN n m)



{- Función: mayorEnt
   
   Descripción: Recibe dos números enteros.
   Devuelve un booleano que indica si el primer valor es mayor al segundo.
   
   Uso: input:  sumaN (Suc(Suc(Suc(Cero)))) (Suc(Suc(Cero)))

        output: Suc (Suc (Suc (Suc (Suc Cero))))
-}

mayorEnt :: Entero -> Entero -> Bool
mayorEnt (Succ n) Zero = True
mayorEnt Zero (Succ m) = False
mayorEnt (Neg n) Zero = False
mayorEnt Zero (Neg m) = True
mayorEnt (Neg n) (Succ m) = False
mayorEnt (Succ n) (Neg m) = True
mayorEnt (Succ n) (Succ m) = mayorEnt n m
mayorEnt (Neg n) (Neg m) = not (mayorEnt n m)



{- Función: sumaEnt
   
   Descripción: Recibe dos enteros y regresa la suma de ellos.
   
   Uso: input:  suma_ent (Neg(Succ(Succ(Succ(Succ Zero))))) (Succ(Succ Zero))

        output: Neg (Succ (Succ Zero))
-}

sumaEnt :: Entero -> Entero -> Entero
sumaEnt Zero (Succ m) = (Succ m)
sumaEnt Zero (Neg m) = (Neg m)
sumaEnt (Succ n) Zero = (Succ n)
sumaEnt (Neg n) Zero = (Neg n)
sumaEnt (Succ n) (Succ m) = Succ(sumaEnt n (Succ m))
sumaEnt (Neg n) (Neg m) = Neg (sumaEnt n m)
sumaEnt (Succ n) (Neg m) = if (Succ n) == m then Zero else restaEnt (Succ n) m
sumaEnt (Neg n) (Succ m) = if n == (Succ m) then Zero else restaEnt (Succ m) n




{- Función: restaEnt
   
   Descripción: Recibe dos enteros y regresa la resta de ellos.
   
   Uso: input:  resta_ent (Succ(Succ(Succ(Succ Zero)))) (Succ(Succ Zero))

        output: (Succ (Succ Zero))
-}

restaEnt :: Entero -> Entero -> Entero
restaEnt (Succ n) Zero = (Succ n)
restaEnt (Neg n) Zero = (Neg n)
restaEnt Zero (Neg m) = m
restaEnt Zero (Succ m) = Neg (Succ m)
restaEnt (Succ n) (Succ m) = if ((Succ n) == (Succ m)) then Zero else if (mayorEnt (Succ n) (Succ m)) then restaEnt n m else Neg (restaEnt m n)
restaEnt (Neg n) (Neg m) = sumaEnt (Neg n) m
restaEnt (Succ n) (Neg m) = sumaEnt (Succ n) m
restaEnt (Neg n) (Succ m) = Neg (Succ (sumaEnt n m))



{- Función: extraer

   Descripción: Recibe una matrioska.
   Devuelve lo que hay dentro de la matrioska.
   

   Uso: input1:  extraer Mati
        output1: Mati
        
        input2:  extraer (Cont (Mati))
        output2: Mati
-}

extraer :: Matrioska -> Matrioska
extraer (Cont n) = n
extraer Mati = Mati 