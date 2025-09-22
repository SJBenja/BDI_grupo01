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

**TEMA 1 " ---- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.


**TEMA 2 " ----- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.

...

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros.

 **a) Cómo se realizó el Trabajo Práctico**
Vestibulum rutrum feugiat molestie. Nunc id varius augue. Ut augue mauris, venenatis et lacus ut, mattis blandit urna. Fusce lobortis, quam non vehicula scelerisque, nisi enim ultrices diam, ac tristique libero ex nec orci.

 **b) Herramientas (Instrumentos y procedimientos)**
Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros. Integer interdum id orci id rutrum. Curabitur facilisis lorem sed metus interdum accumsan. 


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum. 



### Diagrama conceptual (opcional)
![diagrama_relacional](link donde se encuentra el la imagen del diagrama conceptual)

### Diagrama relacional
![diagrama_relacional](link donde se encuentra el la imagen del diagrama relacional)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.txt) del diccionario de datos.


### Desarrollo TEMA 1 "----"

Fusce auctor finibus lectus, in aliquam orci fermentum id. Fusce sagittis lacus ante, et sodales eros porta interdum. Donec sed lacus et eros condimentum posuere. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

... 


## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus. 



## BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item
 3. List item
 4. List item
 5. List item

