module Practica2 where

import Data.Bits


{- Función: sayHello
   
   Descripción: Recibe una cadena de texto y la devuelve en concatenación con "Hello!".
   
   Uso: input:  sayHello "Haskell"
        output: Hello, Haskell!
-}

sayHello :: String -> String
sayHello palabra = "Hello, " ++ palabra ++ "!"



{- Función: calcularPropina
   
   Descripción: Calcula la propinaa partir de una cuenta, que por defecto deja el 10% o 15%.
   
   Uso: input1:  calcularPropina 1000 10
        output1: 100.0
        
        input2:  calcularPropina 1000 15
        output2: 150.0
-}

calcularPropina :: Float -> Float -> Float
calcularPropina cuenta propina =
 if propina == 10 then cuenta * 0.10
 else if propina == 15 then cuenta * 0.15
 else error "Nao se pode, nomás 10 o 15 de propina"



{- Función: menor
   
   Descripción: Recibe 3 números y devuelve el menor de ellos
   
   Uso: input:  menor 1 2 3
        output: 1.0
-}

menor :: Float -> Float -> Float -> Float
menor x y z =
 if x < y && x < z then x
 else if y < z && y < x then y
 else if z < x && z < y then z
 else error "Eta vaina ta mal; algo hiciste raro. Escribe tres números distintos, o no va a funcionar"



{- Función: decide
   
   Descripción: Recibe un booleano y dos cadenas.
   Si el calor booleano es True, devuelve la primera cadena, de lo contrario, devuelve la segunda.
   
   Uso: input1:  True "False" "True"
        output1: "False"
        
        input2:  False "False" "True"
        output2: "True"
-}

decide :: Bool -> String -> String -> String
decide bool cadena1 cadena2 =
 if bool == True then cadena1
 else cadena2



{- Función: esDescendiente
   
   Descripción: Recibe cuatro parámetros de tipo entero: x, y, z, w.
   Devuelve un booleano: True, si los números fueron ingresados de manera descendente; False, si no.
   
   Uso: input1: 4 3 2 1 
        output1: True
        
        input2: 1 2 3 4 
        output2: False
-}

esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente x y z w =
 if x > y && y > z && z > w then True
 else False



{- Función: esDivisible
   
   Descripción: Recibe dos parámetros de tipo entero: x, y.
   Devuelve una salida: "x es divisible por y".
   
   Uso: input1:  esDivisible 6 3
        output1: True

        input2:  esDivisible 5 3
        output2: False

-}

esDivisible :: Int -> Int -> String
esDivisible x y =
 if x `mod` y == 0 then show x ++ " es divisible por " ++ show y
 else show x ++ " no es divisible por " ++ show y



{- Función: esPar
   
   Descripción: Si n es par, devuelve True, de lo contrario, False.
   
   Uso: input1:  esPar 0
        output1: True
       
        input2:  esPar 1
        output2: False
-}

esPar :: Int -> Bool
esPar n = (n .&. 1) == 0



{- Función: hipotenusa
   
   Descripción: Recibe dos parámetros de tipo float: b, h, donde b representa la base y h la altura.
   Devuelve un valor de tipo float que representael valor de la hipotenusa que se calcula respecto a la base y altura del triángulo rectángulo.
   
   Uso: input:  hipotenusa 3 4
        output: 5.0
-}

hipotenusa :: Float -> Float -> Float
hipotenusa b h = sqrt(b^2 + h^2)


{- Función: pendiente
   
   Descripción: Recibe dos parámetros que serán tuplasde dos elementos de tipo float; es decir: (x_1, y_1), (x_2, y_2).
   Devuelve un valor de tipo float que representa la pendiente de la rectaque pasa por dos puntos.
   
   Uso: input:  pendiente (0,0) (1,1)
        output: 1.0
-}

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x_1, y_1) (x_2, y_2) =
 if (x_2 - x_1) /= 0 then (y_2 - y_1)/(x_2 - x_1)
 else error "Parker, estás demente, quieres dividir entre 0?"



{- Función: distanciaPuntos

   Descripción: Recibe dos parámetros que son tuplasde dos elementos de tipo float; es decir: (x_1, y_1), (x_2, y_2).
   Devuelve un valor de tipo float que represente la distanciaentre los puntos (x_1, y_1) y (x_2, y_2).

   Uso: input:  distanciaPuntos (0,0) (0,6)
        output: 6.0
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x_1, y_1) (x_2, y_2) = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2)



{- Función: cuadrados
   
   Descripción: Recibe como parámetro una tupla de tipo entera.
   Devuelve una tupla de los cuadrados del parámetro.

   Uso: input:  cuadrados [1,2,3]
        output: [1,4,9]
-}

cuadrados :: [Int] -> [Int]
cuadrados xs = [x * x | x <- xs]