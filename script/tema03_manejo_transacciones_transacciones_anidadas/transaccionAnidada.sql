USE base_inventario_v2;
go


--TRANSACCION ANIDADA

BEGIN TRY

-- Iniciar la transacción principal
BEGIN TRANSACTION;

 -- Transaccion principal
 -- Insertar un nuevo agente
    INSERT INTO agente (cuil, nombre, apellido, direccion, telefono, cod_division, cod_provincia, cod_departamento, nro_distrito)
    VALUES (33900123, 'Hugo', 'Gomez', 'Av. Beltran 123', 4321127, 01, 1, 1, 0);

-- Capturar el ID generado (en SQL Server)
DECLARE @id_hard INT = SCOPE_IDENTITY();

-- Insertar nuevo hardware
BEGIN TRY
    INSERT INTO hardware (id_hard, rubro, descripcion)
    VALUES (03, 'Notebook', 'Notebook Lenovo ThinkPad');

-- Insetar nuevo estado
    INSERT INTO estado (id_estado, descripcion)
    VALUES ('03', 'Activo');

 -- Insertar un nuevo fabricante
    INSERT INTO fabricante (id_fabricante, descripcion)
    VALUES (3, 'Lenovo');

-- Insertar un nuevo registro en inventario
    INSERT INTO inventario (nro_legajo, id_hardware, id_estado, cuil, nro_serie, id_fabricante, modelo, observaciones, nro_legajo_original)
    VALUES ('LEG001', 03, '03', 34900123, 'SN123456789', 3, 'ThinkPad T14', 'Asignado a agente nuevo', NULL);

-- Insertar relación entre agente_inventario
    INSERT INTO agente_inventario (id_inventario, cuil, fecha_alta, fecha_baja, cod_provincia, cod_departamento, observaciones)
    VALUES (1, 34900123, GETDATE(), NULL, 1, 1, 'Alta inicial del equipo');

-- Confirmar toda la transacción si no hubo errores graves
COMMIT TRANSACTION;
PRINT ' Transacción completada exitosamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT ' Error en la transacción: ' + ERROR_MESSAGE();
END CATCH;
