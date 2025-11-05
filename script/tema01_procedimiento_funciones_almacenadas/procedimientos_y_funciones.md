---
# Procedimientos y Funciones Almacenadas


Los procedimientos y funciones almacenadas representan un componente fundamental para el desarrollo de soluciones robustas, eficientes y seguras. Aunque ambos sirven para encapsular lógica que puede ser reutilizada, tienen algunas diferencias clave en cuanto a su propósito, comportamiento y características.

---

## Procedimientos Almacenados (Stored Procedures)

Un procedimiento almacenado es un conjunto de instrucciones T-SQL que se almacena en la base de datos bajo un nombre definido por el usuario. Puede aceptar parámetros de entrada y salida, y se utiliza principalmente para ejecutar operaciones repetitivas o transacciones que involucran la manipulación de datos.

Un procedimiento almacenado está diseñado para **ejecutar una acción o un proceso**.

* **Propósito principal:** Realizar operaciones en la base de datos. Es ideal para tareas complejas que involucran lógica de negocio.
* **Modificación de datos:** Puede (y suele) usarse para modificar datos (`INSERT`, `UPDATE`, `DELETE`).
* **Valor de retorno:** No está obligado a devolver un solo valor.
    * Puede no devolver **nada**.
    * Puede devolver **uno o varios conjuntos de resultados** (como varias sentencias `SELECT`).
    * Puede devolver valores a través de parámetros de **salida** (`OUT`).
* **Cómo se llama:** Se invoca con una instrucción específica, como `EXECUTE` o `CALL`. No puedes usarlo directamente dentro de una sentencia `SELECT`.
### Sintaxis
```sql
CREATE PROCEDURE nombre_procedimiento
    @parametro1 tipo_dato [= valor_predeterminado],
    @parametro2 tipo_dato [= valor_predeterminado],
    ...
AS
BEGIN
    -- Lógica del procedimiento (SELECT, INSERT, UPDATE, etc.)
END
```

**Ejemplo de uso:** Un procedimiento llamado `sp_AgregarProducto` que acepta tres parámetros (nombre, precio y stock) y los usa para ejecutar un INSERT.
```sql
CREATE PROCEDURE sp_AgregarProducto
    @nombre_nuevo VARCHAR(100),
    @precio_nuevo DECIMAL(10, 2),
    @stock_nuevo INT
AS
BEGIN
    INSERT INTO Productos (nombre, precio, stock)
    VALUES (@nombre_nuevo, @precio_nuevo, @stock_nuevo);
    
    PRINT 'Producto agregado exitosamente.';
END
```

**Uso del Procedimiento:**
```sql
EXEC sp_AgregarProducto 
    @NombreNuevo = 'Mouse Óptico', 
    @PrecioNuevo = 45.50, 
    @StockNuevo = 120;
```
---

## Funciones Almacenadas (User-Defined Functions)

Las funciones almacenadas, conocidas como User-Defined Functions (UDF), son similares a los procedimientos, pero con la diferencia de que devuelven un valor único o una tabla, y pueden ser utilizadas dentro de sentencias SQL como parte de expresiones o condiciones. 

Una función almacenada está diseñada para **calcular y devolver un valor específico**.

Existen tres tipos principales de funciones definidas por el usuario en SQL Server: escalar, de tabla en línea y de tabla multisentencia.

* **Propósito principal:** Realizar un cálculo y devolver un resultado.
* **Modificación de datos:** **No deben** modificar datos. Su trabajo es solo de consulta (`SELECT`) y cálculo.
* **Valor de retorno:** **Debe** devolver un solo valor.
    * Puede ser un valor **escalar** (un número, una fecha, un texto).
    * Puede ser una **tabla** (en el caso de las "Funciones con valores de tabla").
* **Cómo se llama:** Se puede usar *directamente* dentro de otras sentencias SQL, como `SELECT` o `WHERE`, como si fuera una columna más.

### Sintaxis
 **Función escalar**
```sql
CREATE FUNCTION nombre_funcion
(
    @parametro1 tipo_dato,
    @parametro2 tipo_dato
)
RETURNS tipo_retorno
AS
BEGIN
    DECLARE @resultado tipo_retorno;
    -- Lógica para calcular @resultado
    RETURN @resultado;
END
```
**Función de tabla (inline)**
```sql
CREATE FUNCTION nombre_funcion
(
    @parametro tipo_dato
)
RETURNS TABLE
AS
RETURN (
    -- Una única instrucción SELECT
    SELECT columna1, columna2
    FROM tabla
    WHERE condicion_con_parametro
);
```
**Ejemplo de uso:** Una función llamada `CalcularIVA` que recibe un precio y devuelve el precio más el 21%.
```sql
CREATE FUNCTION dbo.CalcularIVA
(
    @PrecioBase DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2) -- Define el tipo de dato que va a devolver
AS
BEGIN
    DECLARE @PrecioFinal DECIMAL(10, 2);
    SET @PrecioFinal = @PrecioBase * 1.21;
    
    RETURN @PrecioFinal; -- Devuelve el valor calculado
END
```
**Uso de la Función:**
```sql
SELECT
    Nombre,
    Precio,
    dbo.CalcularIVA(Precio) AS PrecioConIVA
FROM
    Productos;
```
---

## Diferencias Clave: Procedimiento vs. Función


| Característica | Procedimiento Almacenado | Función Almacenada |
| :--- | :--- | :--- |
| **Propósito Principal** | Ejecutar acciones (un proceso) | Calcular y devolver un valor |
| **Valor de Retorno** | Opcional. Puede ser 0, 1 o múltiples sets de resultados, o parámetros `OUT`. | **Obligatorio**. Debe devolver un único valor (escalar) o una tabla. |
| **Uso en SQL** | Se llama con `EXECUTE` o `CALL`. | Se puede usar *dentro* de sentencias `SELECT`, `WHERE`, `HAVING`. |
| **Modificación de Datos** | **Sí**. Ideal para `INSERT`, `UPDATE`, `DELETE`. | **No**. (O no debería). Solo para `SELECT` y cálculos. |
| **Parámetros** | Puede tener parámetros de entrada (`IN`), salida (`OUT`) o ambos. | Solo puede tener parámetros de entrada. |
| **Optimización del rendimiento** | Ideal para operaciones complejas o transaccionales que afectan múltiples tablas. | Ideal para cálculos, validaciones o transformaciones ligeras y repetitivas. |
| **Contexto de uso** | Operaciones de negocio, validaciones, inserciones o actualizaciones masivas. | Cálculos matemáticos, formateo de datos o consultas derivadas. |
| **Permisos** | Puede tener permisos de ejecución específicos y controlar acceso a tablas. | Se rige por permisos de selección; no puede tener transacciones explícitas. |
| **Tipo de retorno** | Ninguno o conjunto de resultados (`SELECT`). | Escalar (un solo valor) o tabla (`TABLE`). |
| **Ejemplo de Invocación** | `EXEC sp_MiProcedimiento;` | `SELECT dbo.mi_Funcion(columna) FROM mi_Tabla;` |


---

## Ventajas de Usarlos

Usar tanto procedimientos como funciones tiene grandes beneficios:

* **Reutilización:** Escribes el código una vez y lo llamas muchas veces.
* **Rendimiento:** El motor de la base de datos puede "precompilar" y optimizar el plan de ejecución de ese código.
* **Seguridad:** Puedes dar permiso a un usuario para *ejecutar* un procedimiento (que inserta datos) sin darle permiso directo para *insertar* en la tabla.
* **Mantenimiento:** Si la lógica de negocio cambia (por ejemplo, el cálculo del IVA), solo lo modificas en un lugar (la función) y todos los reportes que la usan se actualizan automáticamente.

---

## Conclusión

Las funciones y procedimientos almacenados son herramientas clave para crear sistemas de bases de datos que sean robustos, eficientes y seguros. Implementarlos correctamente ayuda a mejorar el rendimiento, reducir errores y centralizar la lógica del negocio. Sin embargo, es importante planificar y controlar su uso para evitar problemas de mantenimiento o sobrecarga en el servidor.
