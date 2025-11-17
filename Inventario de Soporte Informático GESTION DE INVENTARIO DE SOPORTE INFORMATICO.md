# Proyecto de Estudio
    
**Estructura del documento principal:**

# PRESENTACIÓN (Inventario de Soporte Informático - GESTION DE INVENTARIO DE SOPORTE INFORMATICO)

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
- Sandoval, Juan Benjamin
- Sosa, Gustavo Daniel
- Vallejos, Gustavo Oscar
- Vargas, Hernán Ezequiel

**Año**: 2025

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

La sección de informática de la Dirección Nacional de vialidad del distrito Corrientes desea elaborar una base de datos con el relevamiento
de equipos informáticos (pc, monitores, teclados, mouse e impresoras, ups, redes, notebooks, proyectores, aio) actualmente en uso en la
repartición, detallando matrícula de cada uno.  
Se desea saber qué agente de la repartición posee equipos informáticos y que equipos están libres así también como aquellos equipos que
fueron dados de baja y su motivo. Asignando a los mismos un nombre correspondiente según ETAP v24.  
Conocer listas individuales de hardware, usuarios que los poseen y los que hay que renovar. Fecha de alta y última actualización de
hardware.  
Se contara con permisos al sistema por medio de login de usuarios, cada tipo de usuario tendra acceso a determinada información del
sistema de acuerdo a su nivel jerarquico.  
Ademas se contara con una seccion auditoria que se podra visualizar los movimientos de alta, baja y modificacion hecho por los usuarios,
dicha auditoria solo podra visualizarse por el usuario administrador.  
Para desarrollar este proyecto tomamos la idea de la migración de distintas planillas excel ya que no había precedencia de un sistema
similar. Para esto tratamos de combinar todos los datos de esas tablas y volcarlos a una base de datos.  
Para el acceso al sistema se pretende generar distintos perfiles de usuarios para poder lograr un acceso seguro al manejo de la
información y a distintos módulos que se incluyan en el inventario.  
Para esto nuestro sistema pretende resolver el problema de organización de las planillas excel en un solo lugar con las funcionalidades de
inventario, módulos de reporte por tipo de hardware, control de estados de equipos, alta, baja y modificación de datos de hardware,
estados y fabricantes, sistemas de BackUp.  

Este proyecto tendrá las siguientes restricciones para su funcionamiento:
1. Un hardware puede asignarse a un agente cuando este equipo es nuevo, o tambien puede darse el caso de asignar un hardware ya
utilizado (reasignandolo) siempre que este antes haya cambiado su estado a stagging, para su posterior alta nuevamente.
2. Cada Cuil de agente es único
3. El registro de inventario es único
4. El número de legajo de hardware es único
5. El login de usuario es por perfil y contraseña
6. El estado de un hardware debe ser único, no se debe sobreponer los estados a un hardware.  

### Definición o planteamiento del problema

El proyecto que se desea realizar está basado en un software que lleve a cabo el relevamiento de equipos informáticos dentro de la
Dirección Nacional de Vialidad en la provincia de Corrientes. En él se puede encontrar las asignaciones de hardware a distintos agentes
como así también el informe completo del parque informático que posee dicha repartición.  
Se limita la misma a la no incorporación de repuestos a corto plazo sino solo a los informes previstos para futuras auditorías. Se tiene en
cuenta también como limitación al tipo de perfil de usuario que solo podrá hacer uso del mismo sistema por parte del personal de la sección
informática.  
El sistema tiene las funcionalidades de :
- Login de usuarios según el perfil.
- Reportes por tipo de hardware.
- ABM tipo de harware, estados, fabricantes.
- Sistemas de BackUp.

Descartamos las siguientes funcionalidades ya que al ser un sistema muy extenso y lograr la mejor abstracción del problema de la
migración de las planillas Excel.
- Incorporación de insumos informáticos.
- Capacidad para gestionar números de legajos.
- ABM de agentes.

Y como mayor alcance hacemos la migración de 4 planillas excel con datos relevantes a usuarios, hardware, fabricantes y perfiles de
usuarios dentro de la sección Informática.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1 "Procedimientos y funciones almacenadas"** 
> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.


**TEMA 2 "Optimización de consultas a través de índices"** 
> [!IMPORTANT]  
> [Optimización de consultas a través de índices](script/tema02_optimizacion_consultas_indices/tema_Optimización_de_consultas_a_través_de_índices.md)

**TEMA 3 "Manejo de transacciones y transacciones anidadas"** 
> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.
...

**TEMA 4 "Manejo de permisos a nivel de usuario de bases de datos"** 
> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.

 **a) Cómo se realizó el Trabajo Práctico**
> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.

 **b) Herramientas (Instrumentos y procedimientos)**
> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum. 



### Diagrama conceptual (opcional)
![image](https://github.com/SJBenja/BDI_grupo01/blob/main/doc/image_onceptual.png "Diseño Conceptual")

### Diagrama relacional

![image][logo]

[logo]: https://github.com/SJBenja/BDI_grupo01/blob/main/doc/image_relacional.png "Diseño Relacional"

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


### Desarrollo TEMA 1 "Procedimientos y funciones almacenadas"

> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "Optimización de consultas a través de índices"

> [!IMPORTANT]  
> Aqui se encuentra el desarrollo del [scripts-> tema_2](script/tema02_optimizacion_consultas_indices/tema02_script.sql)

### Desarrollo TEMA 3 "Manejo de transacciones y transacciones anidadas"

> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_3](script/tema03_nombre_tema)

### Desarrollo TEMA 4 "Manejo de permisos a nivel de usuario de bases de datos"

> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_4](script/tema04_nombre_tema)

## CAPÍTULO V: CONCLUSIONES

> [!IMPORTANT]  
> Estos temas se desarrollaran en la segunda entrega.



## BIBLIOGRAFÍA DE CONSULTA
> [!IMPORTANT]  
> Bibliografia de la Catedra  
> 1. [Diseño de base de datos: Constructos básicos del modelo Entidad-Relación según la notación de P. Chen](https://elibro.net/es/ereader/unne/70030?page=86)
> 2. [Base de Datos: Entidad relación](https://elibro.net/es/ereader/unne/121283?page=52)
> 3. [Mapeo del esquema conceptual al esquema relacional](https://elibro.net/es/ereader/unne/121283?page=78)
> 4. [Procesos de normalización](https://elibro.net/es/ereader/unne/121283?page=87)
> 5. [CREAR bases de datos, tablas y restricciones. (CREATE)](https://elibro.net/es/ereader/unne/280623?page=52)
> 6. [MODIFICAR tablas, agregar/borrar restricciones y columnas (ALTER)](https://elibro.net/es/ereader/unne/280623?page=71)  
> 7. [Borrar base de datos y tablas (DROP / TRUNCATE)](https://elibro.net/es/ereader/unne/280623?page=77)
> 8. [SQL DDL aplicado a SQL Server (Ejemplos prácticos)](https://elibro.net/es/ereader/unne/70511?page=116)  

> [!TIP]  
> Documentacion de Herramientas  
> 9. [Documentacion de GitHub](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)  
> 10. [Documentacion de Visual Studio Code](https://code.visualstudio.com/docs/getstarted/settings)
