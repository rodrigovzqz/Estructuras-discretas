module Practica3 where

import Practica2

data Materias = AlgebraSuperiorI | EstructurasDiscretas | InglesI | IntroduccionACienciasDeLaComputacion | MatematicasParaLasCienciasAplicadas deriving (Eq, Show)



{- Función: creditos
   
   Descripción: Recibe un entero. Regresa la materia que tiene esos respectivos créditos.
   (Toma como referencia las materias de primer semestre de la carrera Ciencias de la Computación.)
   
   Uso: input:  creditos 4
        output: [InglesI]
-}

creditos :: Int -> [Materias]
creditos n =
  if n == 10 then [AlgebraSuperiorI, EstructurasDiscretas]
  else if n == 4 then [InglesI]
  else if n == 12 then [IntroduccionACienciasDeLaComputacion, MatematicasParaLasCienciasAplicadas]
  else []



{- Función: soloPares
   
   Descripción: Recibe una lista de tipo entero, y devuelve una lista únicamente con los números que sean pares de la lista original.

   Uso: input:  soloPares [1 ,2 ,3 ,4]
        output: [2 ,4]
-}

soloPares :: [Int] -> [Int]
soloPares xs = [x | x <- xs, esPar x]



{- Función: negativos

   Descripción: Cuenta los números negativos de una lista.

   Uso: input:  negativos [ -2 , -1 , 0 , 1 , 2]
        output: 2
-}

negativos :: [Int] -> Int
negativos xs = length [x | x <- xs, x < 0]



{- Función auxiliar: esPrimo

   Descripción: Indica si un número es primo.

   Uso: input1:  esPrimo 2
        output1: True

        input2:  esPrimo 1
        output2: False

-}

esPrimo :: Int -> Bool
esPrimo n =
  if n < 2 then False
  else [x | x <- [1..n], n `mod` x == 0] == [1, n]



{- Función: primos

   Descripción: Devuelve lo primos de la lista.

   Uso: input:  primos [1..20]
        output: [2 , 3 , 5 , 7 , 11 , 13 , 17 , 19]
-}

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]



{- Función auxiliar: tienenDivisorComun

   Descripción: Recibe tres números y determina si los primeros dos números: a y b, comparten algún factor común.
   Empieza a buscar desde un número d (que normalmente será 2) y verifica si el número actual d divide exactamente tanto a a como a b.

   Uso: input1:  tienenDivisorComun 3 4 2
        output1: False

        input2:  tienenDivisorComun 3 6 2
        output2: True

-}

tienenDivisorComun :: Int -> Int -> Int -> Bool
tienenDivisorComun a b d =
    if d > a || d > b then False
    else if a `mod` d == 0 && b `mod` d == 0 then True
    else tienenDivisorComun a b (d + 1)



{- Función: coprimos
   
   Descripción: Recibe un entero n y devuelve una lista de los coprimos de n.

   Uso: input:  coprimos 10
        output: [1 ,3 ,7 ,9]
-}

coprimos :: Int -> [Int]
coprimos n = [x | x <- [1..n], not (tienenDivisorComun x n 2)]