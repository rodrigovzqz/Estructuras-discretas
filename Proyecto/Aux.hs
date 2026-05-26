module Aux where



{- Función: ArbolHuffman

   Descripción:
   Tipo de dato para representar un árbol de Huffman.

   Hoja:
   Guarda un caracter y su frecuencia.

   Nodo:
   Guarda el peso total y dos subárboles.
-}

data ArbolHuffman
    = Hoja Char Int
    | Nodo Int ArbolHuffman ArbolHuffman
    deriving (Eq, Show)




{- Función: peso

   Descripción:
   Regresa el peso (la frecuencia) de un nodo del árbol.

   Uso:
   input:  peso (Hoja 'A' 3)
   output: 3
-}

peso :: ArbolHuffman -> Int
peso (Hoja _ f) = f
peso (Nodo f _ _) = f



{- Función: esUnico

   Descripción:
   Determina si el árbol contiene un solo símbolo.

   Uso:
   input:  esUnico (Hoja 'A' 5)
   output: True
-}

esUnico :: ArbolHuffman -> Bool
esUnico (Hoja _ _) = True
esUnico _ = False



{- Función: obtenerChar

   Descripción:
   Extrae el caracter almacenado en una hoja.

   Uso:
   input:  obtenerChar (Hoja 'H' 2)
   output: 'H'
-}

obtenerChar :: ArbolHuffman -> Char
obtenerChar (Hoja c _) = c
obtenerChar _ = error "No es hoja"




{- Función: frecuencias

   Descripción:
   Calcula las frecuencias de cada caracter de una cadena.
   Las ordena de manera descendente.

   Uso:
   input:  frecuencias "AABBBCC"
   output: [('B',3),('A',2),('C',2)]
-}

frecuencias :: String -> [(Char, Int)]
frecuencias texto =
    ordenarFrecuencias (contar texto [])



{- Función: contar

   Descripción:
   Recorre el texto acumulando frecuencias.

   Uso:
   input:  contar "ABA" []
   output: [('A',2),('B',1)]
-}

contar :: String -> [(Char, Int)] -> [(Char, Int)]
contar [] acc = acc
contar (x:xs) acc =
    contar xs (insertar x acc)



{- Función: insertar

   Descripción:
   Inserta un caracter en la lista de frecuencias o incrementa su frecuencia.

   Uso:
   input:  insertar 'A' [('A',2),('B',1)]
   output: [('A',3),('B',1)]
-}

insertar :: Char -> [(Char, Int)] -> [(Char, Int)]
insertar c [] = [(c,1)]
insertar c ((x,n):xs)
    | c == x    = (x, n+1) : xs
    | otherwise = (x, n) : insertar c xs




{- Función: ordenarFrecuencias

   Descripción:
   Ordena una lista de frecuencias de
   manera descendente usando inserción.

   Uso:
   input:  ordenarFrecuencias [('A',2),('B',5)]
   output: [('B',5),('A',2)]
-}

ordenarFrecuencias :: [(Char, Int)] -> [(Char, Int)]
ordenarFrecuencias [] = []
ordenarFrecuencias (x:xs) =
    insertarOrdenado x (ordenarFrecuencias xs)



{- Función: insertarOrdenado

   Descripción:
   Inserta una frecuencia respetando
   el orden descendente.

   Uso:
   input:  insertarOrdenado ('A',4) [('B',5),('C',2)]
   output: [('B',5),('A',4),('C',2)]
-}

insertarOrdenado :: (Char,Int) -> [(Char,Int)] -> [(Char,Int)]
insertarOrdenado x [] = [x]
insertarOrdenado (c1,f1) ((c2,f2):xs)
    | f1 >= f2  = (c1,f1):(c2,f2):xs
    | otherwise = (c2,f2) : insertarOrdenado (c1,f1) xs



{- Función: crearHojas

   Descripción:
   Convierte una lista de frecuencias
   en hojas del árbol Huffman.

   Uso:
   input:  crearHojas [('A',2),('B',1)]
   output: [Hoja 'A' 2, Hoja 'B' 1]
-}

crearHojas :: [(Char, Int)] -> [ArbolHuffman]
crearHojas [] = []
crearHojas ((c,f):xs) =
    Hoja c f : crearHojas xs



{- Función: ordenarArboles

   Descripción:
   Ordena árboles Huffman por peso
   de menor a mayor.

   Uso:
   input:  ordenarArboles [Hoja 'A' 3, Hoja 'B' 1]
   output: [Hoja 'B' 1, Hoja 'A' 3]
-}

ordenarArboles :: [ArbolHuffman] -> [ArbolHuffman]
ordenarArboles [] = []
ordenarArboles (x:xs) =
    insertarArbol x (ordenarArboles xs)



{- Función: insertarArbol

   Descripción:
   Inserta un árbol respetando
   el orden ascendente por peso.
-}

insertarArbol :: ArbolHuffman -> [ArbolHuffman] -> [ArbolHuffman]
insertarArbol a [] = [a]
insertarArbol a (x:xs)
    | peso a <= peso x = a:x:xs
    | otherwise = x : insertarArbol a xs



{- Función: construirArbol

   Descripción:
   Construye el árbol de Huffman
   combinando los árboles de menor peso.

   Uso:
   input:  construirArbol [Hoja 'A' 2, Hoja 'B' 3]
   output: Nodo 5 (Hoja 'A' 2) (Hoja 'B' 3)
-}

construirArbol :: [ArbolHuffman] -> ArbolHuffman
construirArbol [] =
    error "No se puede construir un árbol vacío"
construirArbol [a] = a
construirArbol arboles =
    construirArbol nuevos
    where
        ordenados = ordenarArboles arboles
        (a:b:resto) = ordenados
        nuevo =
            Nodo (peso a + peso b) a b
        nuevos = nuevo : resto



{- Función: arbolHuffman

   Descripción:
   Construye el árbol Huffman completo
   a partir de una cadena.

   Uso:
   input:  arbolHuffman "ABA"
   output: árbol Huffman correspondiente
-}

arbolHuffman :: String -> ArbolHuffman
arbolHuffman texto =
    construirArbol
        (crearHojas (frecuencias texto))



{- Función: mostrarArbol

   Descripción:
   Convierte el árbol Huffman en String
   para mostrarlo en pantalla.
-}

mostrarArbol :: ArbolHuffman -> String
mostrarArbol (Hoja c f) =
    "[" ++ [c] ++ ":" ++ show f ++ "]"
mostrarArbol (Nodo f izq der) =
    "(" ++ show f ++ " " ++ mostrarArbol izq ++ " " ++ mostrarArbol der ++ ")"



{- Función: codigos

   Descripción:
   Genera la tabla de códigos Huffman.

   Uso:
   input:  codigos (arbolHuffman "ABA")
   output: [('A',"1"),('B',"0")]
-}

codigos :: ArbolHuffman -> [(Char,String)]
codigos arbol =
    generar arbol ""



{- Función: generar

   Descripción:
   Recorre el árbol generando los
   códigos binarios.
-}

generar :: ArbolHuffman -> String -> [(Char,String)]
generar (Hoja c _) "" =
    [(c,"0")]
generar (Hoja c _) camino =
    [(c, camino)]
generar (Nodo _ izq der) camino =
    generar izq (camino ++ "0") ++ generar der (camino ++ "1")



{- Función: buscarCodigo

   Descripción:
   Busca el código asociado
   a un caracter.

   Uso:
   input:  buscarCodigo 'A' [('A',"0"),('B',"1")]
   output: "0"
-}

buscarCodigo :: Char -> [(Char,String)] -> String
buscarCodigo _ [] = []
buscarCodigo c ((x,code):xs)
    | c == x    = code
    | otherwise = buscarCodigo c xs



{- Función: codificar

   Descripción:
   Convierte una cadena de texto
   a su representación Huffman.

   Uso:
   input:  codificar arbol "ABA"
   output: "101"
-}

codificar :: ArbolHuffman -> String -> String
codificar arbol texto
    | esUnico arbol =
        replicar (length texto) '0'
    | otherwise =
        cod texto (codigos arbol)



{- Función: cod

   Descripción:
   Función auxiliar para codificar.
-}

cod :: String -> [(Char,String)] -> String
cod [] _ = []
cod (x:xs) tabla =
    buscarCodigo x tabla ++ cod xs tabla



{- Función: replicar

   Descripción:
   Genera una cadena con n repeticiones
   de un caracter.

   Uso:
   input:  replicar 4 'A'
   output: "AAAA"
-}

replicar :: Int -> Char -> String
replicar 0 _ = []
replicar n c =
    c : replicar (n-1) c



{- Función: decodificar

   Descripción:
   Convierte una cadena binaria Huffman
   a texto normal.

   Uso:
   input:  decodificar arbol "101"
   output: "ABA"
-}

decodificar :: ArbolHuffman -> String -> String
decodificar arbol bits
    | esUnico arbol =
        replicar (length bits) (obtenerChar arbol)
    | otherwise =
        aux arbol arbol bits



{- Función: aux

   Descripción:
   Función auxiliar para recorrer
   el árbol durante la decodificación.
-}

aux :: ArbolHuffman -> ArbolHuffman -> String -> String
aux _ (Hoja c _) [] =
    [c]
aux _ _ [] =
    []
aux raiz (Hoja c _) bits =
    c : aux raiz raiz bits
aux raiz (Nodo _ izq der) (b:bs)
    | b == '0' =
        aux raiz izq bs
    | b == '1' =
        aux raiz der bs
    | otherwise =
        error "Bit invalido"



{- Función: frecuenciasArbol

   Descripción:
   Obtiene las frecuencias almacenadas
   en las hojas del árbol.
-}

frecuenciasArbol :: ArbolHuffman -> [(Char,Int)]
frecuenciasArbol (Hoja c f) =
    [(c,f)]
frecuenciasArbol (Nodo _ izq der) =
    frecuenciasArbol izq ++ frecuenciasArbol der



{- Función: sumaFrecuencias

   Descripción:
   Suma todas las frecuencias.
-}

sumaFrecuencias :: [(Char,Int)] -> Int
sumaFrecuencias [] = 0
sumaFrecuencias ((_,f):xs) =
    f + sumaFrecuencias xs



{- Función: buscarFrecuencia

   Descripción:
   Busca la frecuencia de un caracter.
-}

buscarFrecuencia :: Char -> [(Char,Int)] -> Int
buscarFrecuencia _ [] = 0
buscarFrecuencia c ((x,f):xs)
    | c == x    = f
    | otherwise = buscarFrecuencia c xs



{- Función: sumaPonderada

   Descripción:
   Calcula la suma ponderada de los
   tamaños de los códigos.
-}

sumaPonderada :: [(Char,String)] -> [(Char,Int)] -> Int
sumaPonderada [] _ = 0
sumaPonderada ((c,code):xs) frecs =
    buscarFrecuencia c frecs * length code + sumaPonderada xs frecs



{- Función: longitudPromedio

   Descripción:
   Calcula la longitud promedio
   del código Huffman.
-}

longitudPromedio :: ArbolHuffman -> Double
longitudPromedio arbol =
    fromIntegral s / fromIntegral t
    where
        tabla = codigos arbol
        frecs = frecuenciasArbol arbol
        s = sumaPonderada tabla frecs
        t = sumaFrecuencias frecs



{- Función: porcentajeCompresion

   Descripción:
   Calcula el porcentaje de compresión
   entre el texto original y el comprimido.

   Uso:
   input:  porcentajeCompresion "HOLA" "0101"
   output: 87.5
-}

porcentajeCompresion :: String -> String -> Double
porcentajeCompresion original comprimido =
    ((fromIntegral o - fromIntegral c)/fromIntegral o)*100
    where
        o = length original * 8
        c = length comprimido