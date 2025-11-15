USE base_inventario;
GO

-- 1. PROVINCIA
INSERT INTO provincia (cod_provincia, descripcion) VALUES
(10, 'Corrientes'),
(20, 'Misiones'),
(30, 'Chaco');
GO

-- 2. DEPARTAMENTO
INSERT INTO departamento (cod_provincia, cod_departamento, descripcion) VALUES
(10, 1, 'Capital'),
(10, 2, 'San Roque'),
(20, 1, 'Posadas'),
(30, 1, 'Resistencia');
GO

-- 3. DISTRITO
INSERT INTO distrito (cod_provincia, cod_departamento, nro_distrito, descripcion, direccion, telefono) VALUES
(10, 1, 1, 'Distrito Central', 'Av. 9 de Julio 123', '3794123456'),
(10, 1, 2, 'Distrito Norte', 'Av. Libertad 456', '3794654321'),
(10, 2, 1, 'Distrito San Roque', 'Roca 789', '3794777888'),
(20, 1, 1, 'Distrito Posadas', 'Mitre 789', '3764111222'),
(30, 1, 1, 'Distrito Resistencia', 'Sarmiento 1000', '3624123123');
GO

-- 4. DIVISION
INSERT INTO division (cod_division, descripcion, tel_ip) VALUES
(1, 'Soporte Técnico', 101),
(2, 'Administración', 102),
(3, 'Redes', 103),
(4, 'Desarrollo', 104);
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
(5, 'AIO', 'All-in-One'),
(6, 'UPS', 'Uninterruptible Power Supply');
GO

-- 7. FABRICANTE
INSERT INTO fabricante (id_fabricante, descripcion) VALUES
(1, 'Dell'),
(2, 'HP'),
(3, 'Lenovo'),
(4, 'Samsung'),
(5, 'Epson'),
(6, 'APC');
GO

-- 8. AGENTE 
INSERT INTO agente (cuil, nombre, apellido, direccion, telefono, cod_division, cod_provincia, cod_departamento, nro_distrito) VALUES
(20111222333, 'Juan', 'Pérez', 'San Martín 100', '3794111111', 1, 10, 1, 1),
(27222333444, 'María', 'Gómez', 'Belgrano 200', '3794222222', 2, 10, 1, 2),
(20333444555, 'Carlos', 'López', 'Rivadavia 300', '3794333333', 3, 10, 2, 1),
(27444555666, 'Ana', 'Rodríguez', 'Sarmiento 400', '3794444444', 1, 20, 1, 1),
(20555666777, 'Luis', 'Fernández', 'Pellegrini 500', '3624555666', 4, 30, 1, 1);
GO

-- 9. INVENTARIO
INSERT INTO inventario (id_hard, id_estado, nro_legajo, nro_serie, id_fabricante, modelo, observaciones) VALUES
(1, 'ACT', 'LEG00001', 'SN-DELL-12345', 1, 'OptiPlex 7010', 'PC escritorio gerencia'),
(2, 'ACT', 'LEG00002', 'SN-LEN-67890', 3, 'ThinkPad T14', 'Notebook soporte'),
(3, 'STG', 'LEG00003', 'SN-SAM-11223', 4, 'S24R350', 'Monitor 24 pulgadas'),
(4, 'BAJ', 'LEG00004', 'SN-EP-33445', 5, 'L380', 'Impresora multifunción vieja'),
(1, 'REP', 'LEG00005', 'SN-HP-55667', 2, 'EliteDesk 800', 'En reparación por fuente'),
(5, 'STG', 'LEG00006', 'SN-DELL-77889', 1, 'OptiPlex AIO', 'Listo para asignar'),
(6, 'ACT', 'LEG00007', 'SN-APC-99001', 6, 'Back-UPS 600', 'UPS oficina central');
GO

-- 10. PERFIL
INSERT INTO perfil (id_perfil, perfil) VALUES
(1, 'Administrador'),
(2, 'Operador');
GO

-- 11. USUARIO
INSERT INTO usuario (id_perfil, cuil, contraseña) VALUES
(1, 20111222333, 'admin123'),  
(2, 27222333444, 'op123456'),  
(2, 20333444555, 'op789012');  
GO

-- 12. AGENTE_INVENTARIO (asignaciones históricas y activas)
-- Asignaciones ACTIVAS (fecha_baja IS NULL)
INSERT INTO agente_inventario (id_inventario, cuil, fecha_alta, fecha_baja, observaciones) VALUES
(1, 20111222333, '2024-01-10', NULL, 'Asignación inicial gerencia'),
(2, 27222333444, '2024-02-15', NULL, 'Notebook para soporte diario'),
(7, 20333444555, '2025-10-01', NULL, 'UPS asignada a servidor');

-- Asignación HISTÓRICA (dada de baja)
INSERT INTO agente_inventario (id_inventario, cuil, fecha_alta, fecha_baja, observaciones) VALUES
(4, 27444555666, '2023-05-20', '2024-03-01', 'Equipo dado de baja por obsoleto');