Algoritmo de Compresión Huffman en Haskell

1. El objetivo del proyecto es implementar un sistema de compresión y descompresión de datos sin pérdida utilizando la Codificación de Huffman. El proyecto busca demostrar la eficiencia del uso de códigos de longitud variable frente a codificaciones de longitud fija (como ASCII) y aprovechar las ventajas del paradigma funcional para el manejo de estructuras de árboles binarios.

El programa opera siguiendo estos pasos lógicos:

1. 1. Análisis de Frecuencias:
Cuenta cuántas veces aparece cada carácter en el texto de entrada.

1. 2. Construcción del Árbol:
Crea nodos para cada carácter y los agrupa en un árbol binario de prioridad mínima (los menos frecuentes quedan más lejos de la raíz).

1. 3. Generación de Tabla:
Recorre el árbol para asignar una secuencia de bits (0 a la izquierda, 1 a la derecha) a cada carácter.

1. 4. Codificación:
Sustituye los caracteres del texto original por sus nuevos códigos binarios.

1. 5. Decodificación:
Utiliza el árbol generado para traducir la cadena de bits de vuelta al texto original.



2. Para ejecutar este proyecto, se utiliza el intérprete interactivo GHCi. Sigue estos pasos en la terminal:

2. 1. Iniciar el intérprete:
   ```bash
   ghci

2. 2. Cargar el archivo del proyecto:

:l Proyecto.hs

2. 3. Ejecutar la función principal:

main



3. El tiempo requerido fue de aproximadamente seis días con tiempos (horas) irregulares (xd): dos fines de semana y un lunes.