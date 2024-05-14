# Proyecto Final de Bases de Datos - Tienda de Música

## Descripción del Proyecto

Este proyecto consiste en el diseño, desarrollo e implementación de una base de datos para una tienda de música. El objetivo es gestionar de manera eficiente la información relacionada con clientes, empleados, productos, proveedores, tiendas y ventas. La base de datos está normalizada hasta la tercera forma normal (3NF) para asegurar la integridad y eficiencia en el almacenamiento de datos.

## Entidades y Relaciones

Las entidades principales del proyecto incluyen:

- **Proveedor**: id_proveedor, nombre, direccion, email, teléfono
- **Tienda**: id_tienda, direccion, ciudad
- **Empleado**: id_empleado, nombre, apellido1, apellido2, fechaInicioContrato, fechaFinContrato, salario, id_tienda, id_jefe
- **Cliente**: id_cliente, nombre, apellido1, apellido2, email, teléfono
- **Venta**: id_venta, fecha_venta, id_empleado, id_cliente
- **Producto**: id_producto, nombre, duracion, genero, fecha_salida, precio, tipo_producto
- **Grupo**: id_grupo, nombre
- **Artista**: id_artista, nombre, apellido1, apellido2, fecha_nacimiento

Las relaciones entre estas entidades incluyen:

- Tienda-Empleado
- Empleado-Venta
- Cliente-Venta
- Venta-Producto
- Producto-Grupo
- Proveedor-Producto
- Grupo-Artista

## Consultas y Funcionalidades

El proyecto incluye varias consultas SQL avanzadas y funcionalidades adicionales como:

- Consultas de ventas por empleado, productos vendidos por ciudad, artistas de grupos con más de 3 integrantes, clientes con más compras, etc.
- Vistas para ventas por empleado y productos vendidos por ciudad.
- Funciones para calcular el precio total de una venta y la edad de un artista.
- Procedimientos almacenados para insertar ventas y sumar salarios de empleados.
- Triggers para gestionar cambios en los salarios y alertas de stock.

## Archivos

  - creacion_database_tienda_musica.sql
  - datos_database_tienda_musica.sql
  - consultas_vistas_database_tienda_musica.sql
  - funciones_procedimientos_tienda_musica.sql
  - triggers_database_tienda_musica.sql
  - Carpeta con Archivos .sql con los datos de cada tabla por separado

## Cómo Usar

1. Clonar el repositorio:

   ```sh
   git clone https://github.com/Jmorsal330/ProyectoBD.git
   ```

2. Con el repositorio clonado ya puedes ejecutar los Scripts por orden:
   
   1. creacion_database_tienda_musica.sql
   2. datos_database_tienda_musica.sql
   3. consultas_vistas_database_tienda_musica.sql
   4. funciones_procedimientos_tienda_musica.sql
   5. triggers_database_tienda_musica.sql
      
4. Con eso ya podrias usar la base de datos completa
