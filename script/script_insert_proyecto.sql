-- SCRIPT "nombre del proyecto"
-- INSERCIÓN DEL LOTE DE DATOS

USE base_inventario;
go
---------------
-- Provincias
---------------
Insert into provincia (cod_provincia, descripcion) values (1, 'Capital Federal');
Insert into provincia (cod_provincia, descripcion) values (2, 'Buenos Aires');
Insert into provincia (cod_provincia, descripcion) values (3, 'Catamarca');
Insert into provincia (cod_provincia, descripcion) values (4, 'Chaco');
Insert into provincia (cod_provincia, descripcion) values (5, 'Chubut');
Insert into provincia (cod_provincia, descripcion) values (6, 'C�rdoba');
Insert into provincia (cod_provincia, descripcion) values (7, 'Corrientes');
Insert into provincia (cod_provincia, descripcion) values (8, 'Entre Rios');
Insert into provincia (cod_provincia, descripcion) values (9, 'Formosa');
Insert into provincia (cod_provincia, descripcion) values (10, 'Jujuy');
Insert into provincia (cod_provincia, descripcion) values (11, 'La Pampa');
Insert into provincia (cod_provincia, descripcion) values (12, 'La Rioja');
Insert into provincia (cod_provincia, descripcion) values (13, 'Mendoza');
Insert into provincia (cod_provincia, descripcion) values (14, 'Misiones');
Insert into provincia (cod_provincia, descripcion) values (15, 'Neuqu�n');
Insert into provincia (cod_provincia, descripcion) values (16, 'R�o Negro');
Insert into provincia (cod_provincia, descripcion) values (17, 'Salta');
Insert into provincia (cod_provincia, descripcion) values (18, 'San Juan');
Insert into provincia (cod_provincia, descripcion) values (19, 'San Luis');
Insert into provincia (cod_provincia, descripcion) values (20, 'Santa Cruz');
Insert into provincia (cod_provincia, descripcion) values (21, 'Santa Fe');
Insert into provincia (cod_provincia, descripcion) values (22, 'Santiago del Estero');
Insert into provincia (cod_provincia, descripcion) values (23, 'Tierra del Fuego');
Insert into provincia (cod_provincia, descripcion) values (24, 'Tucuman');
go 
--Select * from provincia

---------------
-- Departamentos
---------------
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (1,1,'Capital Federal');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (2,2,'La Plata');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (3,3,'San Fernando del Valle de Catamarca');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (4,4,'Resistencia');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (5,5,'Rawson');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (6,6,'C�rdoba');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7,7,'Corrientes');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (8,8,'Paran�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (9,9,'Formosa');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (10,10,'San Salvador de Jujuy');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (11,11,'Santa Rosa');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (12,12,'La Rioja');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (13,13,'Mendoza');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (14,14,'Posadas');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (15,15,'Neuqu�n');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (16,16,'Viedma');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (17,17,'Salta');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (18,18,'San Juan');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (19,19,'San Luis');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (20,20,'R�o Gallegos');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (21,21,'Santa Fe');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (22,22,'Santiago del Estero');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (23,23,'Ushuaia');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (24,24,'San Miguel de Tucum�n');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (2, 25, 'Bahia Blanca');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 26, 'Alvear');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 27, 'Bella Vista');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 28, 'Ber�n de Astrada');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 29, 'Bonpland');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 30, 'Chavarr�a');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 31, 'Concepci�n');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 33, 'Cruz de los Milagros');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 34, 'Curuz� Cuati�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 35, 'Empedrado');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 36, 'Esquina');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 37, 'Felipe Yofr�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 38, 'Garruchos');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 39, 'Gobernador Ingeniero Valent�n Virasoro');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 40, 'Gobernador Juan E. Mart�nez');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 41, 'Goya');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 42, 'Herlitzka');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 43, 'It� Ibat�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 44, 'Itat�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 45, 'Ituzaing�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 46, 'Juan Pujol');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 47, 'La Cruz');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values(7, 48, 'Libertad');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 49, 'Lomas de Vallejos');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 50, 'Loreto');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 51, 'Mariano I. Loza');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 52, 'Mburucuy�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 53, 'Mercedes');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 54, 'Mocoret�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 55, 'Monte Caseros');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 56, 'Nuestra Se�ora del Rosario de Caa Cat�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 57, 'Nueve de Julio');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 58, 'Palmar Grande');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 59, 'Paso de la Patria');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 60, 'Paso de los Libres');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 61, 'Pedro R. Fern�ndez');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 62, 'Perugorr�a');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 63, 'Pueblo Libertador');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 64, 'Riachuelo');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 65, 'Saladas');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 66, 'San Carlos');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values  (7, 67, 'San Cosme');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values  (7, 68, 'San Lorenzo');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values  (7, 69, 'San Luis del Palmar');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 70, 'San Miguel');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 71, 'San Roque');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 72, 'Santa Luc�a');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 73, 'Santa Rosa');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 74, 'Santo Tom�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 75, 'Sauce');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 76, 'Yapey�');
Insert into departamento ( cod_provincia, cod_departamento, descripcion) values (7, 77, 'Yataity Calle');
 go
--Select * from departamento

---------------
-- Distritos
---------------
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (1,1,0,'CABA', 'Av. Julio A. Roca 738', 01143438520);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (2,2,1,'Buenos Aires', 'Av. Gral Paz 12190', 01146879699);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (3,3,11,'Catamarca', 'San Martin 871', 037944221);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (4,4,18,'Chaco', 'Av. Italia 191', 036244558);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (5,5,13,'Chubut', 'Martin Cutillo 246', 028044210);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (6,6,2,'Cordoba', 'Rondeau 751', 035155320);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (7,7,10,'Corrientes', 'av. gral san martin 252', 4252525);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (8,8,17,'Entre Rios', 'Av. Almafuerte 1023', 034342429);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (9,9,22,'Formosa', 'Pringles 1070', 037044292);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (10,10,6,'Jujuy', 'Santibar 370', 0388432544);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (11,11,21,'La Pampa', 'Juan B. Justo 100',29544170);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (12,12,8,'La Rioja', 'Av. Ortiz de Campo 147', 03804426);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (13,13,4,'Mendoza', 'Pedro Molina 748', 02614258);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (14,14,15,'Misiones', 'Bolivar 48', 037644246);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (15,15,12,'Neuquen', 'Alderete 520', 029944803);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (16,16,20,'Rio Negro', 'Julio Roca 146', 29204231);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (17,17,5,'Salta', 'Pellegrini 252', 038742337);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (18,18,9,'San Juan', 'Av. Guillermo Rawson 377', 026442534);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (19,19,14,'San Luis', 'Av. Illia 487', 02664421);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (20,20,23,'Santa Cruz', 'Moreno 435', 029664208);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (21,21,7,'Santa Fe', 'Av. 27 de Febrero', 034245000);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (22,22,16,'Santiago del Estero', 'Av. Roca 777', 038542113);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (23,23,24,'Tierra del Fuego', '12 de Octubre', 02901421);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (24,24,3,'Tucuman', 'Av. Mate de Luna 425', 038143301);
insert into distrito(cod_provincia,cod_departamento,nro_distrito,descripcion,direccion,telefono) values (2,25,19,'Bahia Blanca', 'Montevideo 388', 029140300);

go
--Select * from distrito

---------------
-- Division
---------------
insert into division (cod_division,descripcion,tel_ip)
values (01,'Obras',8101000);
insert into division (cod_division,descripcion,tel_ip) 
values(02,'Administracion',8101001);
insert into division (cod_division,descripcion,tel_ip) 
values(03,'Ingenieria_Vial',8101002);
insert into division (cod_division,descripcion,tel_ip) 
values(04,'Conservacion',8101003);
insert into division (cod_division,descripcion,tel_ip) 
values(05,'Jefatura',8101004);
go
--Select * from division

---------------
-- Perfil
---------------

Insert into perfil(id_perfil,perfil) values (01,'administrador');
Insert into perfil(id_perfil,perfil) values (02,'consulta');
Insert into perfil(id_perfil,perfil) values (03,'abm');
go
--Select * from perfil

---------------
-- Hardware
---------------
insert into hardware ( id_hard, rubro, descripcion) values (01, 'TE', 'Telefono');
insert into hardware ( id_hard, rubro, descripcion) values (02, 'PC','PC');
insert into hardware ( id_hard, rubro, descripcion) values (03, 'MNT', 'Monitor');
insert into hardware ( id_hard, rubro, descripcion) values (04, 'PRINT', 'Impresora');
insert into hardware ( id_hard, rubro, descripcion) values (05, 'RW', 'Router');
insert into hardware ( id_hard, rubro, descripcion) values (06, 'SW', 'Switch');
insert into hardware ( id_hard, rubro, descripcion) values (07, 'NBK', 'Notebook');
insert into hardware ( id_hard, rubro, descripcion) values (08, 'HDD', 'Disco Rigido');
insert into hardware ( id_hard, rubro, descripcion) values (09, 'KEY', 'Teclado');
go
--Select * from hardware

---------------
-- Estado
---------------
insert into estado (id_estado, descripcion) values (01, 'en Reparacion';)
insert into estado (id_estado, descripcion) values(02, 'para Baja');
insert into estado (id_estado, descripcion) values(03, 'Producto Correcto');
insert into estado (id_estado, descripcion) values(04, 'Producto Deficiente');
insert into estado (id_estado, descripcion) values(05, 'Requiere Mantenimiento');
insert into estado (id_estado, descripcion) values(06, 'Stagging');
insert into estado (id_estado, descripcion) values(07, 'Stock Nuevo');
insert into estado (id_estado, descripcion) values(08, 'Stock Usado');
insert into estado (id_estado, descripcion) values(09, 'Stock Obsoleto');
insert into estado (id_estado, descripcion) values(10, 'Enviado a Proveedor');
go
--select * from estado

---------------
-- FABRICANTE--
---------------
-- PCs y Monitores principales
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (1, 'DELL');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (2, 'HP');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (3, 'LENOVO');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (4, 'ACER');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (5, 'ASUS');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (6, 'SAMSUNG');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (7, 'LG');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (8, 'VIEWSONIC');
-- Impresoras
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (9, 'EPSON');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (10, 'CANON');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (11, 'BROTHER');
-- Redes y UPS
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (12, 'CISCO');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (13, 'JUNIPER');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (14, 'HP PROCURVE');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (15, 'WESTERN DIGITAL');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (16, 'SEAGATE');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (17, 'TOSHIBA');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (18, 'ADATA');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (19, 'INTEL');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (20, 'AMD');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (21, 'BANGHO');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (22, 'KONICA MINOLTA');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (23, 'PANASONIC');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (24, 'APC (UPS)');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (25, 'EATON (UPS)');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (26, 'LOGITECH');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (27, 'GENIUS');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (28, 'RAZER');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (29, 'MICROSOFT');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (30, 'HYPERX');
INSERT INTO fabricante (id_fabricante, descripcion) VALUES (31, 'COOLER MASTER');

/*Agentes varios acomodar*/
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34458657,'Juan Manuel', 'Perez','Moreno 435', 4112233, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34851259,'Delmira', 'Basualdo','San Martin 584', 4231689, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34785589,'Alejandro','Romea', 'Santiago del Estero 500',4331611, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34256333,'Etilio', 'Romero', 'Moreno 121', 4233689, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34442542 ,'Nadia', 'Blanco', 'Av. General Paz 1444',4234489, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34159357,'Maria', 'Correa','Monte Agudo 98',24236689 , 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34859856,'Rebeca', 'Monte Verde','Sarmiento 905',4239589, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34125652,'Isabel', 'Lobato','Sarmiento 123',4233879 , 3, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34859958,'Gabriel', 'Gomez','Maipu 400', 4239689, 3, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34256669,'Hugo', 'Marconni','Catamarca 854', 4231689, 3, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34550209,'Ceferina', 'Machuca','Jujuy 512', 4232689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 24153695,'Maxima', 'Cardoso','San Lorenzo 147', 4233687, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 24785965,'Martin', 'Rodriguez','Marconni 954', 4234689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 24102536,'Carlos', 'Sotelo','San Luis 111', 4235689, 2, 7, 7,10) 
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 25869953,'Florencia', 'Lopez','Av. San Martin 852', 4236689, 3, 7, 7,10) 
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 25452020,'Silvia', 'Villalobos','Saavedra 16', 14237689, 1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 25856953,'Juan', 'Ratti','Uruguay 499',4238689, 1, 7, 7,10) 
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 25256352,'Graciela', 'Roch','Cordoba963', 4238689, 2, 7, 7,10) 
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 26123654,'Miguel', 'Nivea','Carlos Paz 149', 4238689, 2, 7, 7,10) 
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 26523696,'Alejandro', 'Villalba','San Martin 744', 4231689, 1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 27459685,'Rosa', 'Rojas','Alta Gracia 998', 4232689,2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 27856956,'Olga', 'Palacios','paraguay 544', 4233689,  2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 28528478,'Juana', 'Loreto','Av 9 de julio 1458', 4234689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 28459689,'Andrea', 'Saucedo','loreto 235', 4235689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 29452586,'Teresa', 'Gonzales','Paraguay 900', 4236689, 2, 7, 7,10) 
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 30456852,'Miguel', 'Lorenzo','Paraguay 754', 4237689, 3, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 31958998,'Marta', 'Arias','Brasil 402',4238689,  1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 32485788,'Abel', 'Luque','Av. Sarmiento 958', 4239687, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 32452159,'Marcelino', 'Maciel','Colon 164', 4215689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 32596367,'Cristina', 'Soloaga','Maipu 775', 4225689,2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 32201365,'Marcelo', 'Hermosilla','AV.Maipu 3542', 4235689, 3, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 33986951,'Cristina', 'Alcaraz','Pellegrini 1102', 4245689,1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 33785984,'Mirko', 'Lopez','Monte Azul 1400', 4255689, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34852123,'Felicitas', 'Barras','Mitre 452', 4265689, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34897489 ,'Diego', 'Goitia','Cordoba 96', 4275689, 1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 34526321,'Alberto', 'Gomez','Rivadavia 99', 4285689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 35102359,'Julio', 'Gomez','Av. Italia 4452', 4295689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 35895684,'Jose', 'Gonzales','San Lorenzo 1125', 4205689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 35854025,'Miguel', 'Silvestre','Av.Sarmiento 2001', 4215689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 36456968,'Raquel', 'Moreira','Jujuy 994', 4225689,2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 36854785,'Vanesa', 'Lopez','Pantaleon Gomez 45', 4235689, 4, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 37854986,'Ramon', 'Gonzales','Rivadavia 88', 4245689, 1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 38510245,'Geronimo', 'Escobar','Av.Antartida 4412', 4255689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 38485659,'Luis', 'Perez','Santa Fe 1415', 4265689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 38956950,'Ramon', 'Balbuena','Peru 1487', 4275689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 38748968,'Justa', 'Mancuello','Antartida 4545', 4285689, 1, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 39485968,'Anahi', 'Caceres', 'Corrientes 985',4295689, 3, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 39856953,'Walter', 'Silva','Moreno 654', 4135689, 2, 7, 7,10)
Insert into agente(cuil,nombre,apellido,direccion,telefono,cod_division,cod_provincia,cod_departamento,nro_distrito)  values ( 40899784,'Celeste', 'Barrionuevo','Pringles 985', 4235689,2, 7, 7,10)
go
--Select * from agente
