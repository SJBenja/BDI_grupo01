**Diseño de Transacciones en Bases de Datos**  

**Introducción**  

Una transacción es un conjunto de acciones llevadas a cabo por un usuario o un programa de aplicación que acceden o modifican el contenido de una base de datos. Estas acciones representan eventos del mundo real, como registrar una factura, dar de alta un cliente o eliminar un artículo del inventario. Las transacciones permiten que la base de datos se mantenga como un reflejo fiel de la realidad.  

Desde el punto de vista del Sistema de Gestión de Bases de Datos (SGBD), una transacción lleva a la base de datos de un estado consistente a otro estado consistente. El SGBD garantiza que, incluso ante fallos, la consistencia se mantenga, y que los cambios realizados por una transacción confirmada (commit) sean permanentes. Si la transacción no se puede finalizar, el sistema revierte sus efectos mediante un rollback.  

**Características del diseño de transacciones**  

El diseño de transacciones debe realizarse en las etapas iniciales del proceso de diseño lógico, con el fin de asegurar que el esquema sea capaz de soportar todas las operaciones necesarias. Para cada transacción, se deben documentar las siguientes características:  

• 	Datos que utiliza la transacción.  

• 	Características funcionales.  

• 	Salida esperada.  

• 	Importancia para los usuarios.  

• 	Frecuencia de utilización.  

**Tipos de transacciones**  

Las transacciones pueden clasificarse en tres tipos:  

• 	Transacciones de recuperación: acceden a los datos para visualizarlos, sin modificarlos.  

• 	Transacciones de actualización: insertan, modifican o eliminan datos.  

• 	Transacciones mixtas: combinan operaciones de recuperación y actualización.  

**Propiedades ACID**  

Las transacciones deben cumplir con las propiedades ACID, que garantizan su fiabilidad:  

• 	Atomicidad: la transacción se ejecuta completamente o no se ejecuta en absoluto.  

• 	Consistencia: la base de datos pasa de un estado válido a otro, respetando las reglas de integridad.  

• 	Aislamiento: las transacciones concurrentes no interfieren entre sí.  

• 	Durabilidad: una vez confirmada, la transacción es permanente, incluso ante fallos del sistema.  

**Transacciones anidadas**  

Una transacción anidada es aquella que se inicia dentro del alcance de otra transacción activa. Esta estructura permite modularizar operaciones complejas y es común en arquitecturas basadas en componentes. En estos casos, una función puede contener una transacción sin que el programador lo sepa, generando una transacción anidada al ser llamada dentro de un bloque BEGIN-COMMIT.  

La visibilidad de los cambios realizados por transacciones internas depende del DBMS. En algunos sistemas, los cambios no son visibles hasta que se confirma la transacción externa. Bases de datos como MySQL no permiten transacciones anidadas directamente, por lo que se requiere el uso de monitores de transacciones o frameworks especializados.  

**Control de Concurrencia en Transacciones**  

**Definición**  

El control de concurrencia es el conjunto de mecanismos que permiten que múltiples transacciones se ejecuten simultáneamente sin comprometer la integridad ni la consistencia de los datos. Es esencial en entornos multiusuario, donde varias operaciones pueden acceder o modificar los mismos datos al mismo tiempo.  

**Problemas comunes sin control de concurrencia**  

• 	Lecturas sucias: una transacción lee datos modificados por otra que aún no se ha confirmado.  

• 	Lecturas no repetibles: una transacción lee dos veces el mismo dato y obtiene resultados distintos.  

• 	Actualizaciones perdidas: dos transacciones modifican el mismo dato y una sobrescribe el cambio de la otra.  

**Técnicas de control de concurrencia**  

**1. Control basado en bloqueo (Locking)**
   
 • 	Bloqueo compartido (S): permite lectura concurrente.  

 • 	Bloqueo exclusivo (X): impide cualquier otro acceso.  

 • 	Bloqueo de dos fases (2PL): primero se adquieren todos los bloqueos, luego se liberan.  

 • 	Strict 2PL: los bloqueos se mantienen hasta el final de la transacción.  

**2. Control multiversión (MVCC)**
   
• 	Cada transacción accede a una versión consistente de los datos.  

• 	Evita bloqueos entre lecturas y escrituras.  

• 	Usado en PostgreSQL y MySQL (InnoDB).  

**3. Control por marcas de tiempo (Timestamp Ordering)**
   
• 	Las operaciones se ordenan según la marca de tiempo de inicio de cada transacción.  

• 	Si se detecta un conflicto, la transacción se aborta.  

**4. Control optimista**
   
• 	No utiliza bloqueos durante la ejecución.  

• 	Al finalizar, verifica si hubo conflictos.  

• 	Si los hay, se aborta y se reinicia.  


**Control de Concurrencia en Transacciones Anidadas**  

Las transacciones anidadas requieren técnicas adicionales para mantener el aislamiento y la reversibilidad dentro de estructuras jerárquicas de ejecución.  

**Técnicas aplicadas**  

**1. Savepoints**
   
Permiten definir puntos intermedios dentro de una transacción. Se puede hacer ROLLBACK TO SAVEPOINT  sin abortar toda la transacción. Simulan transacciones anidadas en sistemas como PostgreSQL y SQL Server.  

**2. Monitores de transacciones**
   
En arquitecturas basadas en componentes, se utilizan frameworks que gestionan transacciones internas automáticamente, sin intervención directa del programador.  

**3. Compensación**
   
Si una subtransacción falla, se ejecuta una transacción de compensación para revertir sus efectos. Muy útil en sistemas distribuidos.  

**4. Propagación de transacciones**
   
Define cómo se comporta una transacción interna respecto a la externa:  

• REQUIRES_NEW: crea una nueva transacción.  

• MANDATORY: debe ejecutarse dentro de una transacción existente.  

• NESTED: crea una transacción anidada real (si el DBMS lo permite).  


**Conclusión**  

El diseño adecuado de transacciones y el control de concurrencia son pilares fundamentales para garantizar la integridad, confiabilidad y rendimiento de los sistemas de bases de datos. La correcta implementación de propiedades ACID, junto con técnicas como bloqueo, MVCC y savepoints, permite construir sistemas robustos capaces de operar en entornos complejos y altamente concurrentes.  

