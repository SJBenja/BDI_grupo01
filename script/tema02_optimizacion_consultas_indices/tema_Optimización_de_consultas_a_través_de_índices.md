> [!Important]
> Tema 2: Optimización de consultas a través de índices.

La optimización de consultas a través de índices es el proceso de crear estructuras de datos que aceleran la recuperación de filas de una tabla. El motor de base de datos utiliza los índices de manera similar a cómo se usa el índice de un libro.

>>Tipos de Índices y sus Aplicaciones

| Tipo de Índice | Descripción |Almacenamiento y Clave | Aplicación Principal |
| :---: | :---: | :---: | :---: |
| Agrupado (Clustered) | Define el orden físico de almacenamiento de los datos en disco. Una tabla solo puede tener un índice agrupado. | La tabla de datos es la hoja final (nivel hoja) del índice. Se basa en la Clave Primaria por defecto. | Consultas que recuperan rangos de filas o que usan un orden de clasificación frecuente (ej. búsquedas por fechas). |
| No Agrupado (Non-Clustered) | Es una estructura separada de la tabla de datos, con punteros a las filas reales. Una tabla puede tener múltiples índices no agrupados. |  	Estructura de árbol B que almacena la(s) columna(s) del índice y un puntero a la fila de datos (PK o Row ID). | Consultas que buscan filas específicas o usan columnas frecuentemente usadas en las cláusulas WHERE, JOIN u ORDER BY. |
| Índice con Columnas Incluidas | Un tipo especial de índice No Agrupado que almacena columnas adicionales (no clave) en el nivel hoja. | El nivel hoja almacena las columnas clave más las columnas incluidas.	| Cubrir la Consulta (Covering Index): Permite que el motor obtenga todos los datos necesarios directamente del índice sin tener que acceder a la tabla base (lookup). |

🎯 Plan de Tareas y Criterios de Evaluación
El objetivo es demostrar el impacto de los índices agrupados en una consulta de rango (WHERE fecha BETWEEN X AND Y). Elegiremos la tabla agente_inventario o inventario agregando un campo fecha_ingreso para la carga masiva.

1. Preparación: Carga Masiva (Sin Índice)
Objetivo: Crear una base de datos grande para que la lentitud sin índice sea medible. Tabla Sugerida: agente_inventario (o inventario si tiene la columna fecha_ingreso).

Tarea:

Generar un script DML automatizado (ej. usando un WHILE loop o herramientas de generación de datos) para insertar al menos un millón (1,000,000) de registros en la tabla seleccionada.

Asegurar que la columna fecha (ej. fecha_alta o fecha_ingreso) tenga una distribución de valores a lo largo de un periodo significativo (ej. 5 años) para la prueba de rango.
2. Prueba 1: Búsqueda sin Índice
Tarea: Ejecutar la consulta de prueba de rango y registrar el rendimiento. Consulta de Prueba (Ejemplo):

``` SQL   
SELECT nro_legajo, nro_serie, modelo -- (Columnas a seleccionar)
FROM inventario -- (o agente_inventario)
WHERE fecha_ingreso BETWEEN '2020-01-01' AND '2020-12-31';
```

| Criterio a Registrar | Valor (Prueba 1: Sin Índice) |
| :---: | :---: |
| 'Plan de Ejecución' | Escaneo de Tabla (Table Scan) o Escaneo de Índice Agrupado (si la PK es auto-incremental) |
| 'Tiempo de Respuesta (ms)' | (Valor de tiempo alto, ej. 2000 ms) |
|**Costo (Estimado en %) ** | (Valor alto) |

3. Prueba 2: Índice Agrupado (Clustered Index)
Tarea: Crear un índice agrupado sobre la columna fecha_ingreso (o similar) y repetir la consulta.

Script DDL (Ejemplo - Si usas SQL Server/MySQL y la tabla no tiene Clustered Index):

``` SQL
CREATE CLUSTERED INDEX IX_Inventario_Fecha_C
ON inventario (fecha_ingreso ASC);
```

| Criterio a Registrar | Valor (Prueba 2: Índice Agrupado) |
| :---: | :---: |
| 'Plan de Ejecución' | Escaneo de Tabla (Table Scan) |
| 'Tiempo de Respuesta (ms)' | (Valor de tiempo bajo, ej. 50 ms) |
|**Costo (Estimado en %) ** | (Valor bajo) |

4. PruebaPrueba 3: Índice No Agrupado con Columnas Incluidas (Covering Index)
Tarea: Borrar el índice agrupado y crear un índice No Agrupado que cubra la consulta (es decir, que contenga las columnas fecha_ingreso y todas las columnas que se seleccionan en el SELECT).

Script DDL (Ejemplo):

``` SQL
-- Borrar el índice agrupado antes de crear el nuevo (si es necesario)
-- DROP INDEX IX_Inventario_Fecha_C ON inventario; 

CREATE NONCLUSTERED INDEX IX_Inventario_Covering
ON inventario (fecha_ingreso ASC) -- Columna de búsqueda (WHERE)
INCLUDE (nro_legajo, nro_serie, modelo); -- Columnas de selección (SELECT)
```

| Criterio a Registrar | Valor (Prueba 3: Índice No Agrupado con Columnas Incluidas)
| :---: | :---: |
| 'Plan de Ejecución' | Escaneo de Tabla (Table Scan) |
| 'Tiempo de Respuesta (ms)' | (Valor de tiempo bajo, ej. |
|**Costo (Estimado en %) ** | (Valor bajo)

5. Expresar las Conclusiones
Finalmente, las conclusiones deben centrarse en:

Diferencia de Rendimiento: Comparación de los tiempos de respuesta entre la búsqueda sin índice y las búsquedas con índice.

Análisis del Plan: Explicar cómo el Escaneo de Tabla (Prueba 1) difiere del Index Seek o Index Scan (Pruebas 2 y 3).

Ventaja del Índice Cubridor (Prueba 3): Explicar por qué el índice que incluyó las columnas seleccionadas fue (o debió ser) el más rápido, ya que el motor no tuvo que realizar una segunda operación de "Key Lookup" para obtener el resto de los datos.