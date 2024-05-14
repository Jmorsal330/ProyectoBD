drop database if exists tienda_musica;
create database tienda_musica;
use tienda_musica;
create table tienda (
   id_tienda int primary key,
   direccion varchar(255),
   ciudad varchar(100)
);
create table empleado (
   id_empleado int primary key,
   nombre varchar(100),
   apellido1 varchar(100),
   apellido2 varchar(100),
   fechainiciocontrato date,
   fechafincontrato date,
   salario decimal(10, 2),
   id_tienda int,
   id_jefe int,
   foreign key (id_tienda) references tienda(id_tienda),
   foreign key (id_jefe) references empleado(id_empleado)
);
create table cliente (
   id_cliente int primary key,
   nombre varchar(100),
   apellido1 varchar(100),
   apellido2 varchar(100),
   email varchar(255) unique,
   telefono varchar(20) unique
);
create table venta (
   id_venta int primary key,
   fecha_venta date,
   id_empleado int,
   id_cliente int,
   foreign key (id_empleado) references empleado(id_empleado),
   foreign key (id_cliente) references cliente(id_cliente)
);
create table producto (
   id_producto int primary key,
   nombre varchar(255),
   duraccion int,
   genero varchar(100),
   fecha_salida date,
   precio decimal(10, 2),
   tipo_producto varchar(100)
);
create table venta_producto (
   id_producto int,
   id_venta int,
   cantidad int,
   primary key (id_producto, id_venta),
   foreign key (id_producto) references producto(id_producto),
   foreign key (id_venta) references venta(id_venta)
);
create table proveedor (
   id_proveedor int primary key,
   nombre varchar(100),
   direccion varchar(255),
   email varchar(255) unique,
   telefono varchar(20)unique
);
create table producto_proveedor (
   id_producto int,
   id_proveedor int,
   cantidad int,
   primary key (id_producto, id_proveedor),
   foreign key (id_producto) references producto(id_producto),
   foreign key (id_proveedor) references proveedor(id_proveedor)
);
create table grupo (
   id_grupo int primary key,
   nombre varchar(100)
);
create table producto_grupo (
   id_producto int,
   id_grupo int,
   primary key (id_producto, id_grupo),
   foreign key (id_producto) references producto(id_producto),
   foreign key (id_grupo) references grupo(id_grupo)
);
create table artista (
   id_artista int primary key,
   nombre varchar(100),
   apellido1 varchar(100),
   apellido2 varchar(100),
   fecha_nacimiento date
);
create table grupo_artista (
   id_grupo int,
   id_artista int,
   numero_integrantes int,
   primary key (id_grupo, id_artista),
   foreign key (id_grupo) references grupo(id_grupo),
   foreign key (id_artista) references artista(id_artista)
);
