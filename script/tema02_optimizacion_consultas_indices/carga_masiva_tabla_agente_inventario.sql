---------------------------
--BASE DE DATOS I
--PROYECTO: INVENTARIO DE SOPORTE INFORMATICO - EQUIPO 1
--INTEGRANTES:
--          - Sandoval, Juan Benjamin
--          - Sosa, Gustavo Daniel
--          - Vallejos, Gustavo Oscar
--          - Vargas, Hernán Ezequiel
-- SCRIPT DML: Carga Masiva para Pruebas de Rendimiento en AGENTE_INVENTARIO (1,000,000 Registros)

USE base_inventario;
GO

SET NOCOUNT ON; 

-- DECLARACIÓN DE VARIABLES
DECLARE @ROWS_TO_INSERT INT = 1000000;
DECLARE @i INT = 1;
DECLARE @RandomFechaAlta DATE;
DECLARE @RandomFechaBaja DATE;

-- RANGO DE FECHAS (5 años de historial)
DECLARE @StartDate DATE = '2021-01-01';
DECLARE @EndDate DATE = '2025-12-31';
DECLARE @DateRangeInDays INT = DATEDIFF(day, @StartDate, @EndDate);

PRINT 'Iniciando carga masiva de ' + CAST(@ROWS_TO_INSERT AS VARCHAR) + ' registros en AGENTE_INVENTARIO...';

BEGIN TRANSACTION
WHILE @i <= @ROWS_TO_INSERT
BEGIN
    -- 1. Seleccionar un ID_INVENTARIO ALEATORIO y existente (desde 1 hasta 1,000,000)
    -- ASUMIMOS que la tabla INVENTARIO ya tiene 1M de registros con IDs del 1 al 1,000,000.
    DECLARE @RandomInventarioID INT = (SELECT ABS(CHECKSUM(NEWID())) % 1000000 + 1); 
    
    -- 2. Seleccionar un CUIL ALEATORIO y existente (de los 130 agentes cargados)
    DECLARE @RandomCUIL BIGINT = (SELECT TOP 1 cuil FROM agente ORDER BY NEWID());

    -- 3. Generar una fecha de alta aleatoria
    SET @RandomFechaAlta = DATEADD(day, (ABS(CHECKSUM(NEWID())) % @DateRangeInDays), @StartDate);

    -- 4. Simular la fecha de baja (NULL para 80% de los registros, fecha posterior para 20%)
    IF (ABS(CHECKSUM(NEWID())) % 100) < 20
    BEGIN
        -- Baja: Fecha posterior a la alta (máximo 60 días después)
        SET @RandomFechaBaja = DATEADD(day, (ABS(CHECKSUM(NEWID())) % 60 + 1), @RandomFechaAlta);
    END
    ELSE
    BEGIN
        -- Asignación activa
        SET @RandomFechaBaja = NULL;
    END

    -- Insertar el registro (el DDL actualizado NO incluye cod_provincia ni cod_departamento)
    INSERT INTO agente_inventario (
        id_inventario,
        cuil,
        fecha_alta,
        fecha_baja,
        observaciones
    )
    VALUES (
        @RandomInventarioID,
        @RandomCUIL,
        @RandomFechaAlta,
        @RandomFechaBaja,
        'Asignacion simulada: ' + CAST(@i AS VARCHAR)
    );
    
    SET @i = @i + 1;

    IF @i % 50000 = 0
    BEGIN
        PRINT 'Progreso: ' + CAST(@i AS VARCHAR) + ' registros insertados.';
    END
END
COMMIT TRANSACTION

PRINT 'Carga masiva en AGENTE_INVENTARIO finalizada. ' + CAST(@ROWS_TO_INSERT AS VARCHAR) + ' registros insertados.';
--GO
SET NOCOUNT OFF;

-- Fin del Script DML para Carga Masiva en AGENTE_INVENTARIO