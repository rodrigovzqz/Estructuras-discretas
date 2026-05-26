module Main where

import Aux

--Función principal

{- Función: main

   Descripción:
   Ejecuta el programa principal
   de compresión Huffman.
-}

main :: IO ()

main = do

    putStrLn "=================================="
    putStrLn "      HUFFMAN EN HASKELL"
    putStrLn "=================================="

    --Ejemplo

    putStrLn "\nEjemplo"

    let ejemplo = "haskellhuffman"

    ejecutarEjemplo ejemplo

    --Entrada del usuario
    
    putStrLn "\nUsuario"
    putStrLn "\nIngresa un texto:"

    texto <- getLine

    if texto == ""
        then
            putStrLn "\nERROR: No se permite texto vacio."

        else
            ejecutarEjemplo texto



--Función: ejecutarEjemplo

{- Función: ejecutarEjemplo

   Descripción:
   Ejecuta todas las funciones
   principales del algoritmo Huffman.

   Uso:
   input:  ejecutarEjemplo "HOLA"
   output: Muestra frecuencias, árbol,
           codificación y decodificación.
-}

ejecutarEjemplo :: String -> IO ()
ejecutarEjemplo texto = do

    putStrLn "\nTexto original:"
    putStrLn texto

    --Frecuencias
    
    let frecs = frecuencias texto
    putStrLn "\nFrecuencias descendentes:"
    print frecs

    --Árbol
    
    let arbol = arbolHuffman texto
    putStrLn "\nArbol Huffman:"
    putStrLn (mostrarArbol arbol)

    --Códigos

    let tabla = codigos arbol
    putStrLn "\nTabla de codigos:"
    print tabla

    --Codificación

    let comprimido = codificar arbol texto
    putStrLn "\nTexto codificado:"
    putStrLn comprimido

    --Decodificación
    
    let decodificado = decodificar arbol comprimido
    putStrLn "\nTexto decodificado:"
    putStrLn decodificado

    --Longitud promedio

    let promedio = longitudPromedio arbol
    putStrLn "\nLongitud promedio del codigo:"
    print promedio

    --Compresión

    let porcentaje =
            porcentajeCompresion texto comprimido
    putStrLn "\nPorcentaje de compresion:"
    print porcentaje

    --Tamaños

    let bitsOriginal =
            length texto * 8
    let bitsComprimidos =
            length comprimido
    putStrLn "\nBits originales:"
    print bitsOriginal
    putStrLn "\nBits comprimidos:"
    print bitsComprimidos