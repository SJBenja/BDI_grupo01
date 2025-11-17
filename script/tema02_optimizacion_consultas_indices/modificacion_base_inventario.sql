/*TEMA 03: Optimización de consultas a través de índices
 Proyecto: INVENTARIO DE SOPORTE INFORMATICO
 Equipo: EQUIPO 01
====================================================================
*/
-- DDL para agregar la columna de fecha necesaria para la prueba de índice.

USE base_inventario;
GO

-- Agrega la columna 'fecha_ingreso' a la tabla 'inventario'
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = N'fecha_ingreso' AND Object_ID = Object_ID(N'inventario'))
BEGIN
    ALTER TABLE inventario
    ADD fecha_ingreso DATE NULL; -- Inicialmente NULL, se llenará con el script DML
END
GO

--SELECT * FROM inventario AS i 