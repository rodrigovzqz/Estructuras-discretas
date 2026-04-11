1. Objetivo de la práctica:
   
    El objetivo de la práctica es implementar diversas funciones recursivas a listas en Haskell.


2. Tiempo requerido para la práctica:
   
    Calculo que me tomó de tres a cuatro horas.


3. Comentarios y problemas encontrados:

    No fueron problemas tal cual con las funciones, pero había hecho la primera (creo) función usando mod, luego vi lo del punto extra y dije: va. Y ahí batallé un ratillo porque no me cargaba (porque no le puse lo de import al archivo Auxiliar xd) y yo sonso no leí qué faltaba (xd), tons pensé que mis funciones taban mal o algo. Pero luego me acordé cuando revisé la práctica anterior y ps ya salió. :D


4. Responde en tu respectivo las siguientes dos preguntas:

   • ¿Qué es la Recursión de cola (tail recursion)?
   Es un tipo de recursión, donde una función se llama a sí misma, pero la llamada recursiva es la última operación que se realiza.
   
   • ¿Cuál es la relación entre las funciones de orden superior foldr y foldl con este tipo de recursión?
   La función foldl se parece a la recursión de cola, porque recorre la lista empezando desde la izquierda, y va acumulando el resultado mientras avanza.
   Por su parte, la función foldr se parece a la recursión normal, porque recorre la lista empezando desde la derecha y va acumulando el resultado mientras avanza. Primero recorre todo y luego resuelve al regresar.


5. Capturas del GHCI:

   Terminal tras git log.
   ![captura_terminal_practica5.png]