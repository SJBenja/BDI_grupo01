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
    FROM agente_inventario AS ai
    INNER JOIN inventario AS i ON ai.id_inventario = i.id_inventario
    INNER JOIN hardware AS h ON i.id_hard = h.id_hard
    WHERE ai.cuil = @cuil AND ai.fecha_baja IS NULL
);
GO



-- Procedimiento: Asignar hardware a un agente

CREATE PROCEDURE sp_AsignarHardware
    @id_inventario INT,
    @cuil_agente BIGINT,
    @observaciones VARCHAR(250) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el agente exista
    IF NOT EXISTS (SELECT 1 FROM agente WHERE cuil = @cuil_agente)
    BEGIN
        THROW 50001, 'Agente con CUIL especificado no existe.', 1;
    END

    -- Validar que el equipo exista y esté en estado 'STG'
    IF NOT EXISTS (
        SELECT 1 FROM inventario 
        WHERE id_inventario = @id_inventario AND id_estado = 'STG'
    )
    BEGIN
        THROW 50002, 'El equipo debe estar en estado "STG" para asignarse.', 1;
    END

    -- Validar que no esté ya asignado activamente
    IF EXISTS (
        SELECT 1 FROM agente_inventario 
        WHERE id_inventario = @id_inventario AND fecha_baja IS NULL
    )
    BEGIN
        THROW 50003, 'El equipo ya está asignado activamente.', 1;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        -- Insertar asignación
        INSERT INTO agente_inventario (
            id_inventario, cuil, fecha_alta, observaciones
        )
        VALUES (
            @id_inventario, @cuil_agente, GETDATE(), @observaciones
        );

        -- Actualizar estado del equipo a 'ACT'
        UPDATE inventario 
        SET id_estado = 'ACT'
        WHERE id_inventario = @id_inventario;

        COMMIT;
        PRINT 'Asignación completada. Estado actualizado a "ACT".';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
GO



-- Procedimiento: Dar de baja una asignación de hardware

CREATE PROCEDURE sp_DarBajaAsignacion
    @id_inventario INT,
    @observaciones VARCHAR(250) = 'Baja solicitada'
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que exista una asignación activa
    IF NOT EXISTS (
        SELECT 1 FROM agente_inventario 
        WHERE id_inventario = @id_inventario AND fecha_baja IS NULL
    )
    BEGIN
        THROW 50004, 'No hay asignación activa para este equipo.', 1;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        -- Registrar fecha de baja
        UPDATE agente_inventario
        SET fecha_baja = GETDATE(), observaciones = @observaciones
        WHERE id_inventario = @id_inventario AND fecha_baja IS NULL;

        -- Cambiar estado del equipo a 'STG'
        UPDATE inventario
        SET id_estado = 'STG'
        WHERE id_inventario = @id_inventario;

        COMMIT;
        PRINT 'Baja registrada. Equipo en estado "STG".';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
GO



-- Procedimiento: Reporte por estado
CREATE PROCEDURE sp_ReporteEquiposPorEstado
    @estado_filtro VARCHAR(30) = NULL
AS
BEGIN
    SELECT 
        i.nro_legajo,
        h.descripcion AS hardware_tipo,
        f.descripcion AS fabricante,
        i.modelo,
        i.id_estado,
        e.descripcion AS estado_desc,
        ISNULL(dbo.fn_NombreCompletoAgente(ai.cuil), 'No asignado') AS asignado_a
    FROM inventario AS i
    INNER JOIN hardware AS h ON i.id_hard = h.id_hard
    INNER JOIN fabricante AS f ON i.id_fabricante = f.id_fabricante
    INNER JOIN estado AS e ON i.id_estado = e.id_estado
    LEFT JOIN agente_inventario AS ai ON i.id_inventario = ai.id_inventario AND ai.fecha_baja IS NULL
    WHERE (@estado_filtro IS NULL OR i.id_estado = @estado_filtro)
    ORDER BY i.id_estado, i.nro_legajo;
END;
GO




