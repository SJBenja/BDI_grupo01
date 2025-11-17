---------------------------
--BASE DE DATOS I
--PROYECTO: INVENTARIO DE SOPORTE INFORMATICO - EQUIPO 1
--INTEGRANTES:
--          - Sandoval, Juan Benjamin
--          - Sosa, Gustavo Daniel
--          - Vallejos, Gustavo Oscar
--          - Vargas, Hernán Ezequiel
--Consulta de prueba sobre la tabla inventario para evaluar el impacto de los índices
USE base_inventario;
GO

-- Consulta de Prueba 1
--La siguiente consulta de rango, la cual afectará un subconjunto de los datos, 
--demostrando el impacto del índice en la búsqueda por periodo
SELECT nro_legajo, nro_serie, modelo, fecha_ingreso, id_fabricante, observaciones
FROM inventario
WHERE fecha_ingreso BETWEEN '2022-01-01' AND '2022-12-31';
GO
-- Sin índice, esta consulta puede ser lenta debido a la necesidad de escanear toda la tabla.
-- Con el índice en 'fecha_ingreso', la consulta debería ser significativamente más rápida.
-- Fin de la consulta de prueba: tiempo de respuesta
--Tiempo de ejecución esperado: Sin índice, la consulta puede tardar varios segundos o más,
--dependiendo del tamaño de la tabla. Con el índice, el tiempo de ejecución debería reducirse a milisegundos.

-- Consulta de indices agrupados
/*Este índice modificará la forma en que los datos se almacenan físicamente en el disco, 
 * ordenándolos por fecha, lo que debería resultar en una mejora significativa en el tiempo 
 * de respuesta para las consultas de rango*/
-- 1. SQL Server solo permite un Índice Agrupado (Clustered Index) por tabla.
-- El id_inventario ya tiene un Índice Agrupado Único porque las claves primarias (PK) se crean como agrupadas por defecto 
-- en SQL Server, a menos que se especifique lo contrario. Por lo que primero deberemos solucionar un error de integridad referencial 
-- de Primary Key y Foreing Key, ya que el inconveniente esta con la tabla agente_inventario en la relacion.

-- DDL: ELIMINAR LA CLAVE FORÁNEA EN AGENTE_INVENTARIO
ALTER TABLE agente_inventario
DROP CONSTRAINT FK_agenteInventario_inventario;
--GO
PRINT '1. Clave Foránea FK_agenteInventario_inventario eliminada.';
--Siguiente paso es Eliminar la Primary Key Agrupada (PK)
-- Ya que la FK ya no existe, podemos eliminar la PK de inventario (que es el índice agrupado actual)
-- DDL: ELIMINAR LA PRIMARY KEY CLUSTERED EN INVENTARIO
ALTER TABLE inventario
DROP CONSTRAINT PK__inventar__013AEB5183065DC3; -- Utilizamos el nombre exacto de la restricción (PK__inventar__013AEB5183065DC3)
--GO
PRINT '2. Primary Key Agrupada en id_inventario eliminada.';

--Ahora si podemos crear el Nuevo Índice Agrupado (Prueba 2).
-- 2. Crear el Índice Agrupado en la columna de fecha de ingreso
-- DDL: CREAR EL NUEVO ÍNDICE AGRUPADO EN FECHA_INGRESO (PRUEBA 2)
CREATE CLUSTERED INDEX IX_Inventario_Fecha_Agrupado
ON inventario (fecha_ingreso ASC);
--GO
PRINT '3. Índice Agrupado IX_Inventario_Fecha_Agrupado creado.';
--Ahora nos queda recrear la Clave Foránea (Opcional pero Recomendado)
--Aunque es una prueba de rendimiento, es buena práctica restaurar la integridad referencial inmediatamente.
-- DDL: RECREAR LA CLAVE FORÁNEA
ALTER TABLE agente_inventario
ADD CONSTRAINT FK_agenteInventario_inventario 
FOREIGN KEY (id_inventario) 
REFERENCES inventario(id_inventario);
--GO
PRINT '4. Clave Foránea restaurada.';

--Prueba 2 de rendimiento
--Ahora puede proceder con la Prueba 2
SELECT nro_legajo, nro_serie, modelo, id_fabricante, observaciones
FROM inventario
WHERE fecha_ingreso BETWEEN '2022-01-01' AND '2022-12-31';

--Para poder realizar la prueba 3 pasamos a la preparación y Ejecución de Índice Cubridor
-- para esto primero debemos eliminar el índice agrupado creado anteriormente
-- DDL: ELIMINAR ÍNDICE AGRUPADO Y CREAR ÍNDICE CUBRIDOR
-- 1. Elimina el Índice Agrupado (Prueba 2)
DROP INDEX IX_Inventario_Fecha_Agrupado ON inventario;
--GO
-- 2. Crea el Índice NO Agrupado Cubridor (Prueba 3)
CREATE NONCLUSTERED INDEX IX_Inventario_Covering
ON inventario (fecha_ingreso ASC) 
INCLUDE (nro_legajo, nro_serie, modelo, id_fabricante, observaciones); 
--GO
PRINT 'Preparación lista para la Prueba 3 (Índice Cubridor).';
--Y volvemos a ejecutar la primer consulta de prueba1
/*Propósito de la Consulta
*Medición Base (Sin Índice): Demostrará un rendimiento muy lento, resultando en un Table Scan o Clustered Index Scan (si existe uno en otra columna).
*Medición con Índice Agrupado (Prueba 2): El plan de ejecución cambiará a un Index Seek de rango o Index Scan rápido, ya que los datos están físicamente ordenados 
*por fecha.
*Medición con Índice Cubridor (Prueba 3): Logrará el mejor rendimiento, ya que el motor encontrará todos los datos solicitados 
*(las columnas del SELECT) directamente en la estructura del índice, evitando las lentas búsquedas de clave (Key Lookups) en la tabla base.*/
--Fin consultas sobre tabla inventario

--Inicio consultas sobre tabla agente_inventario

--consultas sobre la tabla agente_inventario (PRUEBA 1)
-- Demostrar la mejora de rendimiento al buscar datos por rangos de tiempo (fecha_ingreso / fecha_alta) en tablas de gran volumen 
--(1,000,000 de registros), comparando el rendimiento de un Table Scan inicial (Prueba 1) frente a distintas estrategias de indexación (Pruebas 2 y 3).
-- Consulta de prueba sobre la tabla agente_inventario para evaluar el impacto de los índices
-- Consulta de rango para agentes activos en un periodo específico
-- CONSULTA DE PRUEBA: Buscar todas las asignaciones realizadas en el año 2023.
SELECT id_inventario, cuil, observaciones
FROM agente_inventario
WHERE fecha_alta BETWEEN '2023-01-01' AND '2023-12-31';
-- Sin índice, esta consulta puede ser lenta debido a la necesidad de escanear toda la tabla.
-- Con el índice en 'fecha_alta', la consulta debería ser significativamente más rápida.
-- Fin de la consulta de prueba
--Tiempo de ejecución esperado: Sin índice, la consulta puede tardar varios segundos o más,
--dependiendo del tamaño de la tabla. Con el índice, el tiempo de ejecución debería reducirse a milisegundos.
GO

-- Consulta de índices agrupados (PRUEBA 2)
--Consiste en crear un Índice Agrupado sobre la columna utilizada en la cláusula WHERE (ej. fecha_ingreso en inventario). 
--Un índice agrupado define el orden físico en que los datos se almacenan en el disco.
--Impacto Esperado: Al ordenar la tabla por fecha_ingreso o fecha_alta, la base de datos ya no necesita escanear toda la tabla. 
-- Simplemente se dirige al inicio del rango de fechas solicitado (ej. '2022-01-01') y lee secuencialmente hasta el final del rango ('2022-12-31').
--Plan de Ejecución Esperado: El motor utilizará un Index Seek de rango o un Index Scan rápido.
--Resultados Esperados: Reducción drástica del tiempo de ejecución (pasando de segundos a milisegundos o fracciones de segundo).
-- DDL: CREAR ÍNDICE AGRUPADO EN AGENTE_INVENTARIO (PRUEBA 2)
CREATE CLUSTERED INDEX IX_AgenteInv_FechaAlta_C
ON agente_inventario (fecha_alta ASC);
--GO
PRINT '2. Índice Agrupado IX_AgenteInv_FechaAlta_C creado. ¡LISTO PARA LA PRUEBA 2!';
--Acción: Ejecute la consulta y registre el tiempo.

--Cosulta ÍNDICE NO AGRUPADO CUBRIDOR (PRUEBA 3)
--La Prueba 3 consiste en crear un Índice No Agrupado Cubridor. Este índice se crea sobre la columna de búsqueda (fecha_ingreso) y 
--utiliza la cláusula INCLUDE para almacenar copias de todas las demás columnas que se necesitan en la consulta (SELECT).
--Impacto Esperado: El motor de la base de datos puede satisfacer la consulta por completo solo leyendo la estructura del índice, 
--sin tener que volver a buscar en la tabla base (eliminando los costosos Key Lookups). Es el índice más eficiente para una consulta específica.
--Plan de Ejecución Esperado: El plan mostrará un Index Seek sin mostrar la operación de Key Lookup.
--Resultados Esperados: Tiempo de ejecución óptimo, superando ligeramente al Índice Agrupado, especialmente en columnas muy anchas o tablas sin índice agrupado.
-- DDL: PREPARACIÓN Y CREACIÓN DE ÍNDICE CUBRIDOR (PRUEBA 3)
-- 1. Eliminar el índice agrupado de la Prueba 2
DROP INDEX IX_AgenteInv_FechaAlta_C ON agente_inventario;
GO
-- 2. Crear índice cubridor (CORREGIDO: solo incluye columnas válidas del SELECT)
CREATE NONCLUSTERED INDEX IX_AgenteInv_Covering
ON agente_inventario (fecha_alta ASC)
INCLUDE (id_inventario, cuil, observaciones);
GO
--Acción: Ejecute la consulta y registre el tiempo. El plan de ejecución debería mostrar un Index Seek sin Key Lookups.

--Solucion de inconvenientes con indices en tabla agente_inventario
-- 1. Eliminar el indice excistente por defecto. 
-- DDL: ELIMINAR LA PRIMARY KEY CLUSTERED (ÍNDICE AGRUPADO EXISTENTE)

-- Utilice el nombre de restricción que le dio el error: PK__agente_i__3213E83F379BE030
ALTER TABLE agente_inventario
DROP CONSTRAINT PK__agente_i__3213E83F379BE030; --Aqui va el numero exacto de indice
--GO
PRINT '1. Primary Key Agrupada en id eliminada.';
--pasar a Prueba 2

