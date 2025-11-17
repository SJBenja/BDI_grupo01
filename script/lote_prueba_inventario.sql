USE base_inventario;
GO

-- 1. PROVINCIA
INSERT INTO provincia (cod_provincia, descripcion) VALUES
(10, 'Corrientes'),
(20, 'Misiones');
GO

-- 2. DEPARTAMENTO
INSERT INTO departamento (cod_provincia, cod_departamento, descripcion) VALUES
(10, 1, 'Capital'),
(10, 2, 'San Roque'),
(20, 1, 'Posadas');
GO

-- 3. DISTRITO
INSERT INTO distrito (cod_provincia, cod_departamento, nro_distrito, descripcion, direccion, telefono) VALUES
(10, 1, 1, 'Distrito Central', 'Av. 9 de Julio 123', 3794123456),
(10, 1, 2, 'Distrito Norte', 'Av. Libertad 456', 3794654321),
(10, 2, 1, 'Distrito San Roque', 'Roca 789', 3794777888),
(20, 1, 1, 'Distrito Posadas', 'Mitre 789', 3764111222);
GO

-- 4. DIVISION
INSERT INTO division (cod_division, descripcion, tel_ip) VALUES
(1, 'Soporte Técnico', 101),
(2, 'Administración', 102),
(3, 'Redes', 103);
GO

-- 5. ESTADO
INSERT INTO estado (id_estado, descripcion) VALUES
('ACT', 'Activo'),
('STG', 'Staging'),
('BAJ', 'Dado de baja'),
('REP', 'En reparación');
GO

-- 6. HARDWARE
INSERT INTO hardware (id_hard, rubro, descripcion) VALUES
(1, 'PC', 'Computadora de escritorio'),
(2, 'NB', 'Notebook'),
(3, 'MON', 'Monitor'),
(4, 'IMP', 'Impresora'),
(5, 'AIO', 'All-in-One');
GO

-- 7. FABRICANTE
INSERT INTO fabricante (id_fabricante, descripcion) VALUES
(1, 'Dell'),
(2, 'HP'),
(3, 'Lenovo'),
(4, 'Samsung');
GO

-- 8. AGENTE (CUIL como INT, según diccionario y script oficial)
-- Nota: CUIL real = 11 dígitos, pero el modelo usa INT → ajustamos a 8 dígitos
INSERT INTO agente (cuil, nombre, apellido, direccion, telefono, cod_division, cod_provincia, cod_departamento, nro_distrito) VALUES
(20111222, 'Juan', 'Pérez', 'San Martín 100', 3794111111, 1, 10, 1, 1),
(27222333, 'María', 'Gómez', 'Belgrano 200', 3794222222, 2, 10, 1, 2),
(20333444, 'Carlos', 'López', 'Rivadavia 300', 3794333333, 3, 10, 2, 1),
(27444555, 'Ana', 'Rodríguez', 'Sarmiento 400', 3794444444, 1, 20, 1, 1);
GO

-- 9. INVENTARIO (NRO_LEGAJO y NRO_SERIE como INT, según script oficial)
INSERT INTO inventario (id_hard, id_estado, nro_legajo, nro_serie, id_fabricante, modelo, observacion) VALUES
-- Equipos en ACT → tendrán asignación activa
(1, 'ACT', 1001, 123456789, 1, 'OptiPlex 7010', 'PC gerencia'),
(2, 'ACT', 1002, 987654321, 3, 'ThinkPad T14', 'Notebook soporte'),
-- Equipos en STG → sin asignación (listos para asignar)
(3, 'STG', 1003, 112233445, 4, 'S24R350', 'Monitor nuevo'),
(5, 'STG', 1004, 556677889, 1, 'OptiPlex AIO', 'All-in-One libre'),
-- Equipos en BAJ/REP → sin asignación
(4, 'BAJ', 1005, 334455667, 2, 'L380', 'Impresora vieja'),
(1, 'REP', 1006, 778899001, 2, 'EliteDesk 800', 'En reparación');
GO

-- 10. PERFIL
INSERT INTO perfil (id_perfil, perfil) VALUES
(1, 'Administrador'),
(2, 'Operador');
GO

-- 11. USUARIO
INSERT INTO usuario (id_perfil, cuil, contraseña) VALUES
(1, 20111222, 'admin123'),
(2, 27222333, 'op123456');
GO

-- 12. AGENTE_INVENTARIO (coherente con el estado del equipo)
-- SOLO para equipos en 'ACT' → asignaciones ACTIVAS (fecha_baja = NULL)
INSERT INTO agente_inventario (id_inventario, cuil, fecha_alta, observaciones) VALUES
(1, 20111222, '2024-01-10', 'Asignación inicial gerencia'),
(2, 27222333, '2024-02-15', 'Notebook para soporte');

-- Para equipos en 'BAJ', se puede tener una asignación HISTÓRICA
INSERT INTO agente_inventario (id_inventario, cuil, fecha_alta, fecha_baja, observaciones) VALUES
(4, 20333444, '2023-05-20', '2024-03-01', 'Equipo dado de baja');

