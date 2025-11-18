---------------------------
--BASE DE DATOS I
--PROYECTO: INVENTARIO DE SOPORTE INFORMATICO - EQUIPO 1
--INTEGRANTES:
--          - Sandoval, Juan Benjamin
--          - Sosa, Gustavo Daniel
--          - Vallejos, Gustavo Oscar
--          - Vargas, Hernán Ezequiel
--CREACION DE USUARIOS Y ASIGNACION DE ROLES.
---------------------------
USE master;
GO

-- ==========================================================
-- 1. CREACIÓN DE ROLES PERSONALIZADOS EN BASE DE DATOS
-- ==========================================================
USE base_inventario;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'ROL_SYSADMIN')
    CREATE ROLE ROL_SYSADMIN;
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'ROL_ABM')
    CREATE ROLE ROL_ABM;
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'ROL_CONSULTA')
    CREATE ROLE ROL_CONSULTA;
GO

-- ==========================================================
-- 2. CREACIÓN DE LOGINS Y USUARIOS
-- ==========================================================

-- A. ROL_SYSADMIN (Administrador)
CREATE LOGIN [Administrador_Login] WITH PASSWORD = 'Admin1234',
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
GO
USE base_inventario;
CREATE USER [Benjamin] FOR LOGIN [Administrador_Login];
-- Se asigna al rol personalizado ROL_SYSADMIN
EXEC sp_addrolemember 'ROL_SYSADMIN', 'Benjamin';
GO

-- B. ROL_ABM (Altas, Bajas, Modificaciones)
CREATE LOGIN [ABM_Login] WITH PASSWORD = 'Abm1234',
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF,
DEFAULT_DATABASE=base_inventario;
GO
USE base_inventario;
CREATE USER [govallejos] FOR LOGIN [ABM_Login];
-- Se asigna al rol personalizado ROL_ABM
EXEC sp_addrolemember 'ROL_ABM', 'govallejos';
GO

-- C. ROL_CONSULTA (Solo Lectura)
CREATE LOGIN [Consulta_Login] WITH PASSWORD = 'Consulta1234', -- Contraseña modificada para mayor seguridad
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF,
DEFAULT_DATABASE=base_inventario;
GO
USE base_inventario;
CREATE USER [dgsosa] FOR LOGIN [Consulta_Login];
-- Se asigna al rol personalizado ROL_CONSULTA
EXEC sp_addrolemember 'ROL_CONSULTA', 'dgsosa';
GO


-- ==========================================================
-- 3. ASIGNACIÓN DE PERMISOS DETALLADOS (GRANT / DENY)
-- ==========================================================
USE base_inventario;
GO

-- A. PERMISOS PARA ROL_SYSADMIN: Control total sobre la Base de Datos
GRANT CONTROL TO ROL_SYSADMIN;
GO

-- B. PERMISOS PARA ROL_ABM: CRUD en Tablas Transaccionales
-- Tablas transaccionales: inventario y agente_inventario
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.inventario TO ROL_ABM;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.agente_inventario TO ROL_ABM;

-- Se otorga SELECT general a ROL_ABM sobre el esquema dbo para que pueda ver tablas maestras (agente, division, etc.)
GRANT SELECT ON SCHEMA::dbo TO ROL_ABM;
GO

-- C. PERMISOS PARA ROL_CONSULTA: Solo Lectura
-- Se otorga SELECT general a ROL_CONSULTA sobre todo el esquema
GRANT SELECT ON SCHEMA::dbo TO ROL_CONSULTA;

-- Ejemplo de DENY (Denegación Específica)
-- Se deniega la lectura a la tabla 'usuario' (ej. contiene datos sensibles)
DENY SELECT ON dbo.usuario TO ROL_CONSULTA;
GO