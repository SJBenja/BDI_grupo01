> [!TIP]
> Para la fácil administración de los permisos en las bases de datos, SQL server proporciona varios roles, de estos roles existen dos tipos de roles en el nivel de base de datos: los roles fijos de base de datos que están predefinidos en la base de datos y los roles de base de datos definidos por el usuario que el usuario puede crear.
> Estos roles existen en todas las bases de datos. A excepción del rol de base de datos public, no se pueden cambiar los permisos asignados a los roles fijos de base de datos:
* SysAdmin: es el Administrador del sistema de base de datos, tiene permiso para todos los procesos como eliminar, agregar y modificar tablas, como también la modificación los permisos de demás usuarios.
* ABM: ABM significa Altas, Bajas y Modificaciones, y se refiere al sistema mediante el cual las aplicaciones de bases de datos se mantienen actualizadas. ... Los sistemas ABM suelen colocarse en un directorio sin acceso al resto de los usuarios, en general protegido con un nombre de usuario y una contraseña.
* Consulta: son el tipo de usuario que puede ver solamente las tablas que el SysAdmin permite.
>Los permisos de los roles de base de datos definidos por el usuario se pueden personalizar con las funciones GRANT, DENY y REVOKE:
- GRANT: Concede permisos sobre un elemento protegible a una entidad de seguridad
- DENY :Evita que la entidad de seguridad herede permisos por su pertenencia a grupos o roles. DENY tiene prioridad sobre todos los permisos, salvo que DENY no se aplique a los propietarios de objetos o miembros del rol fijo de servidor sysadmin.
- REVOKE:Quita un permiso concedido o denegado previamente.
