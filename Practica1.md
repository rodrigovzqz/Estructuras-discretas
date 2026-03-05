1. ¿Cuáles son las principales diferencias entre Haskell y RACKET?

    1.1. Sistema de tipos:
   
        Haskell es un lenguaje de tipado estadístico con un sistema de tipos fuerte y estático.
   
        RACKET, por otra parte, es un sistema de tipado dinámico, donde el tipo de variable se determina durante la ejecución.

    Esta diferencia puede afectar la seguridad y la predictibilidad del código.

   
    1.2. Sintaxis:
   
        Haskell utiliza la indentación (sangría) para definir bloques de código.
   
        Racket se apoya en los parentesis y la notación prefija.

    Esta variación en la sintaxis puede influir en la legibilidad y la facilidad para escribir código.


    1.3. Funcional vs. Multiparadigma:
   
        Haskell es primordialmente un lenguaje de programación funcional, que enfatiza la inmutabilidad y las funciones puras.

        Por el contrario, Racket es un lenguaje multiparadigma que admite estilos de programación imperativa, funcional y orientada a objetos.
   
    Esta distinción influye en los patrones de diseño y los enfoques utilizados en cada lenguaje.


    1.4. Herramientas y Ecosistema:
   
        Haskell posee un ecosistema robusto con herramientas como GHC para la compilación y Cabal para la gestión de paquetes.
   
        Racket cuenta con su propio IDE, DrRacket, y su gestor de paquetes, lo que hace que los procesos de desarrollo y mantenimiento sean distintos en cada lenguaje.


    1.5. Comunidad y Soporte:
   
        La comunidad de Haskell suele centrarse en conceptos de programación funcional e investigación.
   
        La comunidad de Racket es conocida por su énfasis en la educación, el diseño de lenguajes y las aplicaciones prácticas.

    Esta disparidad puede afectar la disponibilidad de recursos, librerías y el soporte para los desarrolladores en cada lenguaje.


Bibliografía: (N.d.). Stackshare.Io. Retrieved February 19, 2026, from https://stackshare.io/stackups/haskell-vs-racket


   
2. ¿Cuáles son las principales diferencias entre Haskell y Java?

    2.1. Sistema de Tipos:
   
        Haskell posee un sistema de tipos estático y puramente funcional. Su sistema se basa en la inferencia de tipos, lo que significa que el compilador deduce automáticamente los tipos de las expresiones, haciéndolo más conciso.

        Java tiene uno estático pero imperativo y orientado a objetos. Requiere anotaciones de tipo explícitas y se apoya en conceptos de POO como la herencia y el polimorfismo.


    2.2. Programación Funcional:

        Haskell es un lenguaje funcional puro; trata las computaciones como funciones matemáticas sin efectos secundarios y promueve la inmutabilidad.

        Java, aunque introdujo expresiones lambda en Java 8 para dar soporte funcional, sigue siendo primordialmente un lenguaje orientado a objetos que fomenta el estado mutable y la programación imperativa.


    2.3. Concurrencia:

        Haskell ofrece soporte nativo para programación concurrente y paralela mediante hilos ligeros y Memoria Transaccional de Software (STM).

        Java también permite la concurrencia a través de hilos y constructos sincronizados, pero requiere una gestión manual más exhaustiva y es más propenso a errores como condiciones de carrera (race conditions) y bloqueos mutuos (deadlocks).


    2.4. Recolección de Basura (Garbage Collection):

    Ambos utilizan recolección de basura, pero con enfoques distintos.

        Haskell emplea la evaluación perezosa (lazy evaluation), donde los valores se calculan solo cuando se necesitan.

        Java utiliza evaluación ansiosa (eager evaluation) y un recolector que libera periódicamente la memoria de objetos que ya no tienen referencias.


    2.5. Manejo de Excepciones:

        En Haskell, las excepciones se tratan como valores dentro del paradigma funcional y se propagan explícitamente mediante mónadas, lo que resulta en un manejo de errores más predecible.

        Java utiliza el mecanismo try-catch-finally, el cual puede derivar en un código más complejo y propenso a errores si no se gestiona con cuidado.


    2.6. Herramientas y Ecosistema:

        Java goza de un ecosistema maduro y masivo, ideal para el desarrollo empresarial a gran escala.

        Haskell tiene un ecosistema más pequeño, pero su comunidad destaca por un enfoque riguroso en la calidad y la corrección lógica, siendo la opción preferida en dominios como la verificación formal y el modelado matemático.


Bibliografía: (N.d.). Stackshare.Io. Retrieved February 19, 2026, from https://stackshare.io/stackups/haskell-vs-java



3. ¿Por qué Haskell no ha alcanzado una adopción significativa en la industria del software?
 
    Me parece que es por su sistema de tipos: estadístico, con un sistema de tipos fuerte y estático, lo que puede afectar la seguridad y la predictibilidad del código.
    Además, Haskell es primordialmente un lenguaje de programación funcional, por lo que enfatiza la inmutabilidad y las funciones puras, lo que influye en los patrones de diseño y los enfoques utilizados en Haskell a diferencia de otros lenguajes.
    Y, el hecho de que la comunidad de Haskell suela centrarse en conceptos de programación funcional e investigación genera una disparidad que puede afectar la disponibilidad de recursos, librerías y el soporte para los desarrolladores de Haskell, a diferencia de los desarrolladores de otros lenguajes.



4. Si pudieras realizar una analogía simple entre Git y GitHub, ¿cuál te viene a la mente?

    4.1. Git es más como un diario persona (local), donde:

        4.1.1. Commits: Son las entradas que escribes. Tú decides qué guardar y cuándo.

        4.1.2. Historial: Si quieres recordar qué hiciste en una fecha en específico, simplemente lo revisas (es como una bitácora).

        4.1.3. Privacidad: Está en tu computadora personal; nadie más puede verlo a menos que tú lo permitas.

        4.1.4. Control: Tú eres el único dueño de lo que sucede ahí dentro.


    4.2. GitHub es como una biblioteca pública (nube) a la que llevas una copia de tu diario para almacenarla, y tiene las siguientes características:

        4.2.1. Repositorio remoto: Es el estante donde dejas tu libro para que otros lo consulten.

        4.2.2. Colaboración: Si permites que otros escriban contigo, ellos pueden leer lo que hiciste, sugerir cambios o incluso copiar secciones para sus propios diarios.

        4.2.3. Respaldo: Si no tienes tu computadora al alcance (o queda inutilizada de alguna manera, como la mía XD (la anterior)), tu información sigue a salvo en la biblioteca.

        4.2.4. Interacción: La biblioteca tiene tablones de anuncios para discutir ideas y un sistema para aprobar qué páginas nuevas se agregan al libro oficial.
