1. Objetivo de la práctica:
   
    El objetivo de la práctica es implementar diversas funciones a árboles en Haskell.


2. Tiempo requerido para la práctica:
   
    Calculo que me tomó de tres a cuatro horas (en lo que cenaba o me distraía jsjsj).


3. Comentarios y problemas encontrados:

    Las funciones auxiliares para listaArbol me causaban ambiguedad porque definí el tipo de dato Arbol en los dos archivos, pero luego ya lo pasé todo al Auxiliar y ya salió.


4. 1. Basándote en el tipo de dato Arbol construye las representaciones gráficas de dos árboles binarios, cada árbol debe tener entre 3 y 5 niveles. Estas representaciones debes adjuntarlas en tu respectivo README.md usando la sintaxis para generar árboles de la herramienta Mermaid.

Árbol 1:
```mermaid
graph TB
    A(10)
    B(5)
    C(15)
    D(3)
    E(7)
    F(12)
    G(18)

    A -- izq --> B
    A -- der --> C

    B -- izq --> D
    B -- der --> E

    C -- izq --> F
    C -- der --> G

    D -- izq --> V1[Vacio]
    D -- der --> V2[Vacio]

    E -- izq --> V3[Vacio]
    E -- der --> V4[Vacio]

    F -- izq --> V5[Vacio]
    F -- der --> V6[Vacio]

    G -- izq --> V7[Vacio]
    G -- der --> V8[Vacio]
```

Árbol 2:
```mermaid
graph TB
    A(8)
    B(4)
    C(12)
    D(2)
    E(6)
    F(10)
    G(14)
    H(1)
    I(3)

    A -- izq --> B
    A -- der --> C

    B -- izq --> D
    B -- der --> E

    C -- izq --> F
    C -- der --> G

    D -- izq --> H
    D -- der --> I

    E -- izq --> V1[Vacio]
    E -- der --> V2[Vacio]

    F -- izq --> V3[Vacio]
    F -- der --> V4[Vacio]

    G -- izq --> V5[Vacio]
    G -- der --> V6[Vacio]

    H -- izq --> V7[Vacio]
    H -- der --> V8[Vacio]

    I -- izq --> V9[Vacio]
    I -- der --> V10[Vacio]
```


4. 2. Crear la representación visual de los siguientes árboles:

a) AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))

```mermaid
graph TB
    A(4)
    B(3)
    C(5)

    A -- izq --> B
    A -- der --> C

    B -- izq --> V1[Vacio]
    B -- der --> V2[Vacio]

    C -- izq --> V3[Vacio]
    C -- der --> V4[Vacio]
```

b) AB 3 (AB 7 (AB 12 Vacio Vacio) Vacio) (AB 6 (AB 11 Vacio Vacio) (AB
10 Vacio Vacio))

```mermaid
graph TB
    A(3)
    B(7)
    C(6)
    D(12)
    E(11)
    F(10)

    A -- izq --> B
    A -- der --> C

    B -- izq --> D
    B -- der --> V1[Vacio]

    C -- izq --> E
    C -- der --> F

    D -- izq --> V2[Vacio]
    D -- der --> V3[Vacio]

    E -- izq --> V4[Vacio]
    E -- der --> V5[Vacio]

    F -- izq --> V6[Vacio]
    F -- der --> V7[Vacio]
```

c) AB 8 (AB 6 (AB 1 Vacio (AB 4 (AB 2 Vacio Vacio) Vacio)) (AB 7 Vacio
Vacio)) (AB 15 Vacio Vacio)

```mermaid
graph TB
    A(8)
    B(6)
    C(15)
    D(1)
    E(7)
    F(4)
    G(2)

    A -- izq --> B
    A -- der --> C

    B -- izq --> D
    B -- der --> E

    D -- izq --> V1[Vacio]
    D -- der --> F

    F -- izq --> G
    F -- der --> V2[Vacio]

    E -- izq --> V3[Vacio]
    E -- der --> V4[Vacio]

    C -- izq --> V5[Vacio]
    C -- der --> V6[Vacio]

    G -- izq --> V7[Vacio]
    G -- der --> V8[Vacio]
```

5. Consulta arbolesHaskell_6 nota.hs de nuestro repositorio oficial y responde a las siguientes preguntas:

• De acuerdo al ejemplo de la función foldl o foldr el árbol resultante es un BST balanceado?
El árbol que se obtiene con foldr o foldl cumple con la propiedad de BST, porque la función de inserción mantiene el orden correcto de los elementos, pero no necesariamente queda balanceado porque eso depende del orden en que estén los datos en la lista. Por eso, en algunos casos, el árbol puede terminar completamente inclinado hacia un lado.

• De manera conceptual, ¿cuál seria la idea para que foldr o foldl nos ayude a insertar BST balanceados?
Las funciones foldr y foldl no son suficientes para balancear, ya que el balance depende del orden de inserción.
Para que el árbol quede balanceado habría que acomodar los datos antes, ordenándolos o construyendo el árbol a partir del elemento medio de forma recursiva para que el fold solo sea el mecanismo de inserción. Pero el balance vendría de preparar los datos.

• ¿Cúales son las ventajas que tienen las funciones foldl sobre foldr?
La función foldl usa menos memoria cuando se usa de forma estricta, porque evita acumular demasiadas evaluaciones pendientes, y por eso es mejor para acumuladores, sumas o conteos.

• ¿Cúales son las ventajas que tienen las funciones foldr sobre foldl?
La función foldr preserva la recursión natural de las listas, y por eso puede trabajar con listas infinitas. Por ello es útil con estructuras recursivas como árboles.

6. Capturas del GHCI:

   Terminal tras git log.
   ![Captura_terminal_practica6.png]
  