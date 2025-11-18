---------------------------
--BASE DE DATOS I
--PROYECTO: INVENTARIO DE SOPORTE INFORMATICO - EQUIPO 1
--INTEGRANTES:
--          - Sandoval, Juan Benjamin
--          - Sosa, Gustavo Daniel
--          - Vallejos, Gustavo Oscar

-- SCRIPT DML FINAL: Carga Masiva para Pruebas de Rendimiento en INVENTARIO (1,000,000 Registros)

USE base_inventario;
--GO

SET NOCOUNT ON; 

-- DECLARACIÓN DE VARIABLES Y RANGOS
DECLARE @ROWS_TO_INSERT INT = 1000000;
DECLARE @i INT = 1;
DECLARE @RandomFecha DATE;

-- Rango de fechas (desde 2021 hasta hoy)
DECLARE @StartDate DATE = '2021-01-01';
DECLARE @DateRangeInDays INT = DATEDIFF(day, @StartDate, GETDATE());

-- Variables para IDs aleatorios (Asumiendo rangos existentes en tablas de FKs)
DECLARE @RandomHardwareID INT;    
DECLARE @RandomEstadoID INT;      
DECLARE @RandomFabricanteID INT; 

PRINT 'Iniciando carga masiva de ' + CAST(@ROWS_TO_INSERT AS VARCHAR) + ' registros en INVENTARIO...';

BEGIN TRANSACTION
WHILE @i <= @ROWS_TO_INSERT
BEGIN
    -- Generar valores aleatorios para las FKs
    SET @RandomHardwareID = (SELECT ABS(CHECKSUM(NEWID())) % 7 + 1);    -- IDs de hardware (ej: 1 a 7)
    
    -- Seleccionar un id_estado VARCHAR válido (usaremos el ID 1 al 5 como referencia a los que cargó)
    DECLARE @RandomEstadoString VARCHAR(30) = (
        SELECT TOP 1 id_estado 
        FROM estado 
        ORDER BY NEWID()
    );      
    SET @RandomFabricanteID = (SELECT ABS(CHECKSUM(NEWID())) % 31 + 1); -- IDs 1 a 31 (para fabricante)
    
    -- Generar una fecha aleatoria dentro del rango
    SET @RandomFecha = DATEADD(day, (ABS(CHECKSUM(NEWID())) % @DateRangeInDays), @StartDate);

    -- Insertar el registro
    INSERT INTO inventario (
        id_hard, 
        id_estado, 
        nro_legajo,
        nro_serie,
        id_fabricante,
        modelo,
        observaciones,
        fecha_ingreso -- Columna para prueba de índice
    )
    VALUES (
        @RandomHardwareID,
        @RandomEstadoString, -- Estado (VARCHAR)
        'LEG-' + RIGHT('0000000' + CAST(@i AS VARCHAR(10)), 7), -- Nro. Legajo único
        'SER-' + CAST(@i AS VARCHAR(10)),
        @RandomFabricanteID,
        'Modelo_Opti-' + CAST(@RandomFabricanteID AS VARCHAR),
        'Registro simulado para prueba de índices',
        @RandomFecha
    );
    
    SET @i = @i + 1;

    -- Mostrar progreso
    IF @i % 50000 = 0
    BEGIN
        PRINT 'Progreso: ' + CAST(@i AS VARCHAR) + ' registros insertados.';
    END
END
COMMIT TRANSACTION

PRINT 'Carga masiva en INVENTARIO finalizada. ' + CAST(@ROWS_TO_INSERT AS VARCHAR) + ' registros insertados.';

SET NOCOUNT OFF;
--GO