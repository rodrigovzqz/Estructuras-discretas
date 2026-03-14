1. ¿Cuál es la diferencia entre Num e Int?
   
    Int es un tipo de dato concreto. Representa números enteros fijos.
    
    Num no es un tipo de dato, sino una interfaz, y agrupa a todos los tipos que se comportan como números. Así, si una función recibe un Num, entonces puede aceptar un Int, un Integer, un Float o un Double.

    Capturas del GHCI:

    ![terminal_haskell_int_num.png]



2. Se necesita producir una lista infinita de todos los pares distintos (x, y) de números naturales. No importa en qué orden se enumeren los pares, siempre que estén todos. Di si la siguiente definición hace su trabajo si crees que no, proporciona tu propia versión y justificala:

allPairs =[( x , y ) | x <- [0..] , y <- [0..]]

La definición anterior no funciona como se esperaría, ya que las listas por comprensión no están acotadas. Entonces, al intentar agotar todas las posibilidades del generador de la derecha (y) antes de pasar al siguiente elemento del generador de la izquierda (x), como el generador de y es infinito ([0, 1, 2, 3, ...]), el programa se queda atrapado en el primer valor de x (x = 0) sin poder salir ya que nunca acaba el de la izquierda.


allPairs :: [(Int, Int)]
allPairs = [(x, s - x) | s <- [0..], x <- [0..s]]

Primero, dado que ahora la suma es acotada, el generador externo s <- [0..] define la suma de los componentes del par. Como el generador interno x <- [0..s] es finito, para cada valor de s, sólo hay s + 1 combinaciones posibles. Y dado que cada bloque de suma s es finito, es posible terminar de imprimirlos y pasar al siguiente valor de s.
