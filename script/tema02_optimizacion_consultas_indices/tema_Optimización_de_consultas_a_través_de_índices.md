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
El objetivo fue demostrar el impacto de los índices en dos consultas de rango, utilizando las tablas con carga masiva:

  1. [inventario](script/tema02_optimizacion_consultas_indices/carga_masiva_inventario.sql): con columna fecha_ingreso.
  2. [agente_inventario](script/tema02_optimizacion_consultas_indices/carga_masiva_agente_inventario.sql): con columna fecha_alta.

1. Preparación: Carga Masiva (Sin Índice)
Objetivo: Crear una base de datos grande para que la lentitud sin índice sea medible. Se insertó 1,000,000 de registros en ambas tablas (inventario y agente_inventario), con datos de fecha distribuidos a lo largo de 5 años.

2. Prueba 1: Búsqueda sin Índice
Tarea: Ejecutar la consulta de prueba de rango y registrar el rendimiento. Se asume que no existe ningún índice en las columnas de fecha (fecha_ingreso o fecha_alta).

>>>Consulta de Prueba (Ejemplo en agente_inventario):
``` SQL   
SELECT id_inventario, cuil, observaciones
FROM agente_inventario
WHERE fecha_alta BETWEEN '2023-01-01' AND '2023-12-31';
```

| Criterio a Registrar | Valor (Prueba 1: Sin Índice) | Observación |
| :---: | :---: | :---: |
| 'Plan de Ejecución' | Clustered Index Scan (PK en id) | El motor escanea el 100% del índice agrupado existente (la clave primaria id) para buscar las filas de fecha.|
| 'Tiempo de Respuesta (ms)' | ~2490 ms (2.5 segundos) | Tiempo base de ejecución lento, ya que se lee toda la tabla. |
|**Costo (Estimado en %) ** | 100% | Costo más alto. |

3. Prueba 2: Índice Agrupado (Clustered Index)
Tarea: Crear un índice agrupado sobre la columna de fecha y repetir la consulta. Se requirió eliminar el PRIMARY KEY existente, ya que actuaba como el índice agrupado por defecto.

Script DDL (Ejemplo para agente_inventario):

``` SQL
-- *** PASO PREVIO NECESARIO: Eliminar la PK Agrupada existente ***
-- La clave primaria 'PK__agente_i__[key]' actuaba como el único índice agrupado.
ALTER TABLE agente_inventario
DROP CONSTRAINT PK__agente_i__[key]; --key representa el valor de la clave primaria.
GO

-- CREAR ÍNDICE AGRUPADO EN LA COLUMNA DE FECHA
CREATE CLUSTERED INDEX IX_AgenteInv_FechaAlta_C
ON agente_inventario (fecha_alta ASC);
GO
```

| Criterio a Registrar | Valor (Prueba 2: Índice Agrupado) | Observación |
| :---: | :---: | :---: |
| 'Plan de Ejecución' | Clustered Index Seek | El motor va directamente al inicio del rango de fechas ('2023-01-01') y lee secuencialmente hasta el final del rango, de forma muy eficiente. |
| 'Tiempo de Respuesta (ms)' | ~306 ms | Mejora del 87.7% respecto a la Prueba 1. |
|**Costo (Estimado en %) ** | ~13% |

4. PruebaPrueba 3: Índice No Agrupado con Columnas Incluidas (Covering Index)
Tarea: Borrar el índice agrupado de la Prueba 2 y crear un índice No Agrupado que cubra la consulta (es decir, que contenga la columna de búsqueda y todas las columnas seleccionadas en el SELECT).

Script DDL (Ejemplo para agente_inventario):

``` SQL
-- Borrar el índice agrupado de la Prueba 2
DROP INDEX IX_AgenteInv_FechaAlta_C ON agente_inventario; 
GO

-- CREACIÓN DE ÍNDICE CUBRIDOR 
CREATE NONCLUSTERED INDEX IX_AgenteInv_Covering
ON agente_inventario (fecha_alta ASC) -- Columna de búsqueda (WHERE)
-- Columnas que cubren el SELECT (id_inventario, cuil, observaciones)
INCLUDE (id_inventario, cuil, observaciones); 
GO
```

| Criterio a Registrar | Valor (Prueba 3: Índice No Agrupado con Columnas Incluidas) | Observación |
| :---: | :---: | :---: |
| 'Plan de Ejecución' | Index Seek | El motor satisface la consulta leyendo solo el índice. |
| 'Tiempo de Respuesta (ms)' | ~289 ms | Mejora del 88.4% y la mejor ejecución global.| 
|**Costo (Estimado en %) ** | ~12% | |

5. Conclusiones Finales   

📈 Diferencia de Rendimiento y Análisis del Plan

| Comparación | Tiempo de Ejecución | Plan de Ejecución |
| :---: | :---: | :---: |
| Prueba 1 (Sin Índice) | ~2490 ms | Requiere leer el 100% de la tabla (Clustered Index Scan). |
| Prueba 2 (Índice Agrupado) | ~306 ms | Index Seek. Los datos están físicamente ordenados, por lo que la búsqueda es rápida. |
| Prueba 3 (Índice Cubridor) | ~289 ms | Index Seek. Es ligeramente más rápido al evitar cualquier acceso a la tabla base (PK) y obtener los resultados directamente del índice. |

El tiempo de respuesta se redujo de 2.5 segundos a menos de 300 milisegundos, demostrando que la indexación es una técnica vital de optimización.

🌟 Ventaja del Índice Cubridor (Prueba 3)   

El Índice Cubridor es la estrategia más eficiente para esta consulta específica porque:

> Se basa en la columna de búsqueda (fecha_alta). 

Cubre la Consulta: Al incluir las columnas id_inventario, cuil y observaciones, el motor de la base de datos no necesita realizar una costosa operación de "Key Lookup" (búsqueda en la tabla principal) para obtener los campos restantes.

Esta eliminación de acceso a la tabla base resulta en el menor tiempo de ejecución registrado, confirmando que un índice diseñado para cubrir una consulta es la forma más efectiva de acelerarla en tablas de alto volumen.