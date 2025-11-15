/*
====================================================================
 TEMA 01: Procedimientos y Funciones Almacenadas
 Proyecto: INVENTARIO DE SOPORTE INFORMATICO
 Equipo: EQUIPO 01
====================================================================
*/


-- Función Escalar: Devuelve el nombre completo de un agente a partir de su CUIL

CREATE FUNCTION dbo.fn_NombreCompletoAgente(@cuil BIGINT)
RETURNS VARCHAR(101) 
AS
BEGIN
    DECLARE @nombre_completo VARCHAR(101);
    SELECT @nombre_completo = CONCAT(nombre, ' ', apellido)
    FROM agente
    WHERE cuil = @cuil;
    RETURN ISNULL(@nombre_completo, 'Agente no encontrado');
END;
GO



-- Función de Tabla: Devuelve todos los equipos ACTIVOS asignados a un agente

CREATE FUNCTION dbo.fn_EquiposPorAgente(@cuil BIGINT)
RETURNS TABLE
AS
RETURN (
    SELECT 
        i.nro_legajo,
        h.descripcion AS tipo_equipo,
        i.modelo,
        i.nro_serie,
        ai.fecha_alta
    FROM agente_inventario ai
    INNER JOIN inventario i ON ai.id_inventario = i.id_inventario
    INNER JOIN hardware h ON i.id_hard = h.id_hard
    WHERE ai.cuil = @cuil AND ai.fecha_baja IS NULL
);
GO