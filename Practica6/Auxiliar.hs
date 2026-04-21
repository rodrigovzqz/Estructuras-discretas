module Auxiliar where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)



{- Función: insertar
   
   Descripción:
   Inserta un elemento en un árbol binario de búsqueda tal que los menores van a la izquierda y los mayores o iguales a la derecha.
   
   Uso: input1:  insertar 3 (AB 5 Vacio Vacio)
        output1: AB 5 (AB 3 Vacio Vacio) Vacio

        input2:  insertar 7 (AB 5 Vacio Vacio)
        output2: AB 5 Vacio (AB 7 Vacio Vacio)
-}

insertar :: Ord a => a -> Arbol a -> Arbol a
insertar x Vacio = AB x Vacio Vacio
insertar x (AB r t_i t_d)
    | x < r     = AB r (insertar x t_i) t_d
    | otherwise = AB r t_i (insertar x t_d)



{- Función: insertarLista

   Descripción:
   Inserta una lista de elementos en un árbol binario de búsqueda.
   Aplica la función insertar de forma secuencial desde el árbol dado.

   Uso: input:  insertarLista [3,7,1] (AB 5 Vacio Vacio)
        output: AB 5 (AB 3 Vacio (AB 1 Vacio Vacio)) (AB 7 Vacio Vacio)
-}

insertarLista :: Ord a => [a] -> Arbol a -> Arbol a
insertarLista [] arbol = arbol
insertarLista (y:ys) arbol = insertarLista ys (insertar y arbol)



{- Función: construirArbol

   Descripción:
   Construye un árbol binario de búsqueda a partir de una lista de elementos.
   Los elementos se insertan uno por uno en orden desde la izquierda hacia la derecha.

   Uso: input:  construirArbol [5,3,7,1,9]
        output: AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio)
                     (AB 7 Vacio (AB 9 Vacio Vacio))
-}

construirArbol :: Ord a => [a] -> Arbol a
construirArbol [] = Vacio
construirArbol (x:xs) = insertarLista xs (insertar x Vacio)
