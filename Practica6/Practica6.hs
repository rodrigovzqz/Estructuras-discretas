module Practica6 where

import Auxiliar

data Recorrido = InOrden | PreOrden | PosOrden deriving (Show, Eq)


{- Función: nVacios
   
   Descripción: Devuelve el total de nodos vacios en un arbol.
   
   Uso: input1:  nVacios (( AB 4 ( Vacio ) ( AB 3 Vacio Vacio ) ) )
        output1: 3
-}

nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB _ t_i t_d) = nVacios t_i + nVacios t_d



{- Función: refleja

   Descripción: Hace que todos los subarboles izquierdos se vuelvan subarboles derechos y viceversa.

   Uso: input1:  refleja ( AB 4 Vacio ( AB 3 Vacio ( AB 5 Vacio Vacio ) ) )
        output1: AB 4 ( AB 3 ( AB 5 Vacio Vacio ) Vacio ) Vacio
-}

refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB r t_i t_d) = AB r (refleja t_d) (refleja t_i)



{- Función: minimo

   Descripción: Devuelva el elemento máximo o mínimo de un árbol (elige solo una de las dos funciones).

   Uso: input: minimo ( AB 9.0 ( AB 4.0 Vacio ( AB 5.0 Vacio ( AB 6.1 Vacio Vacio )) ) Vacio )
        output: 4.0
-}

minimo :: Ord a => Arbol a -> a
minimo Vacio = error "Arbol vacio"
minimo (AB r Vacio Vacio) = r
minimo (AB r t_i Vacio) = min r (minimo t_i)
minimo (AB r Vacio t_d) = min r (minimo t_d)
minimo (AB r t_i t_d) = min r (min (minimo t_i) (minimo t_d))



{- Función: recorrido

   Descripción: Devuelve una lista con los elementos de un arbol de acuerdo a alguno de los tres recorridos:
• Inorden
• PreOrden
• PostOrden

   Uso: input1:  recorrido ( AB 4 Vacio ( AB 3 Vacio ( AB 5 Vacio Vacio ) ) ) InOrden
        output1: [4, 3, 5]

        input2:  recorrido ( AB 4 Vacio ( AB 3 Vacio ( AB 5 Vacio Vacio ) ) ) PosOrden
        output2: [5, 3, 4]
-}

recorrido :: Arbol a -> Recorrido -> [a]
recorrido Vacio _ = []

recorrido (AB r t_i t_d) InOrden = recorrido t_i InOrden ++ [r] ++ recorrido t_d InOrden

recorrido (AB r t_i t_d) PreOrden = [r] ++ recorrido t_i PreOrden ++ recorrido t_d PreOrden

recorrido (AB r t_i t_d) PosOrden = recorrido t_i PosOrden ++ recorrido t_d PosOrden ++ [r]



{- Función: esBalanceado

   Descripción: Verifica si un árbol está balanceado, si lo esta regresa True, de lo contrario False.

   Uso: input:  esBalanceado ( AB 1 ( AB 2 Vacio Vacio ) ( AB 3 Vacio Vacio ) )
        output: True
-}



{- Función: listaArbol

   Descripción: Recibe una lista de elementos cualesquiera y regresa un árbol binario de busqueda, no necesariamente balanceado.

   Uso: input:  listaArbol [5, 3, 7, 1, 9]
        output: AB 5 ( AB 3 ( AB 1 Vacio Vacio ) Vacio ) ( AB 7 Vacio ( AB 9 Vacio Vacio ) )
-}

listaArbol :: Ord a => [a] -> Arbol a
listaArbol = construirArbol