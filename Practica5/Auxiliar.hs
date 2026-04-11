module Auxiliar where

-- Suma
suma :: Int -> Int -> Int
suma a 0 = a
suma a b = suma (succ a) (pred b)

-- Resta (con a >= b)
resta :: Int -> Int -> Int
resta a 0 = a
resta a b = resta (pred a) (pred b)

-- Multiplicación
mult :: Int -> Int -> Int
mult _ 0 = 0
mult a b = suma a (mult a (pred b))

-- División entera
cociente :: Int -> Int -> Int
cociente a b
  | menor a b = 0
  | otherwise = succ (cociente (resta a b) b)

-- Residuo
residuo :: Int -> Int -> Int
residuo a b
  | menor a b = a
  | otherwise = residuo (resta a b) b

-- Comparación: a < b
menor :: Int -> Int -> Bool
menor 0 0 = False
menor 0 _ = True
menor _ 0 = False
menor a b = menor (pred a) (pred b)

-- Paridad
esPar :: Int -> Bool
esPar 0 = True
esPar 1 = False
esPar n = esPar (resta n 2)
