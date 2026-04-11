module Practica5 where

import Auxiliar

import Data.Char (toUpper)



{- Función: hollerBack

   Descripción:
   Recibe una cadena en minusculas.
   Devuelve la cadena en mayúsculas.

   Uso: input:  hollerBack "minusculas"
        output: MINUSCULAS

-}

hollerBack :: String -> String
hollerBack [] = []
hollerBack (x:xs) = toUpper x : hollerBack xs



{- Función: decimal_binario.

   Descripción:
   Toma un entero en decimal.
   Regresa una lista de enteros en notación binaria.

 Uso: input:  decimal_binario 0
     output: 0
-}

decimal_binario :: Int -> [Int]
decimal_binario 0 = [0]
decimal_binario n = aux n
  where
    aux 0 = []
    aux x = aux (cociente x 2) ++ [residuo x 2]



{- Función: replica
   
   Descripción:
   Toma un entero x y un entero n.
   Devuelve una lista que consta de n apariciones de x.

   Uso: input:  replica 2 5
        output: [2 ,2 ,2 ,2 ,2]
-}

replica :: Int -> Int -> [Int]
replica _ 0 = []
replica x n = [x] ++ (replica x (n-1))



{- Función: recupera_elemento

   Descripción:
   Toma una lista.
   Devuelve el elemento del índice especificado en la lista.

   Uso: input:  [2 ,4 ,6] 1
        output: 4
-}

recupera_elemento :: [Int] -> Int -> Int
recupera_elemento (x:_) 0 = x
recupera_elemento (_:xs) n = recupera_elemento xs (n-1)



{- Función: rota

   Descripción:
   Toma una lista.
   Traslada el primer elemento de una lista xs al final.
   Se repite esta acción n veces usando la lista resultante en cada paso.

   Uso: input1:  [1 ,2 ,3 ,4 ,5] 2
        outout1: [3 ,4 ,5 ,1 ,2]
        
        input2:  [1 ,2 ,3 ,4 ,5] 13
        output2: [4 ,5 ,1 ,2 ,3]
-}

rota :: [a] -> Int -> [a]
rota [] _ = []
rota xs 0 = xs
rota (x:xs) n = rota (xs ++ [x]) (n - 1)



{- Función: extranio

   Descripción:
   Recibe un entero positivo.
   Regresa una lista de elementos del mismo tipo.
   Aplica el siguiente algoritmo:
   
   Algoritmo extranio:
   Toma como entrada un entero positivo n.
   Si n es par, el algoritmo lo divide sobre dos.
   Si n es impar, el algoritmo lo multiplica por tres y agrega uno.
   El algoritmo repite esto, hasta que n es uno.

   Uso: input:  extranio 13
        output: [13 ,40 ,20 ,10 ,5 ,16 ,8 ,4 , 2 , 1]
-}

extranio :: Int -> [Int]
extranio 1 = [1]
extranio n
  | esPar n  = n : extranio (cociente n 2)
  | otherwise = n : extranio (suma (mult 3 n) 1)