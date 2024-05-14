use tienda_musica;

-- 1. consulta de ventas por empleado con su salario promedio y total de ventas
create view ventas_por_empleado as 
select e.nombre, e.apellido1, e.apellido2, count(v.id_venta) as total_ventas, avg(e.salario) as salario_promedio
from empleado e
inner join venta v on e.id_empleado = v.id_empleado
group by e.nombre, e.apellido1, e.apellido2;

-- 2. consulta de productos vendidos por ciudad con su cantidad total vendida
create view productos_por_ciudad as
select t.ciudad, p.nombre, sum(vp.cantidad) as cantidad_total
from tienda t
inner join empleado e on t.id_tienda = e.id_tienda
inner join venta v on e.id_empleado = v.id_empleado
inner join venta_producto vp on v.id_venta = vp.id_venta
inner join producto p on vp.id_producto = p.id_producto
group by t.ciudad, p.nombre;

-- 3. consulta de los artistas de un grupo con más de 3 integrantes
select g.nombre as nombre_grupo, a.nombre as nombre_artista, a.apellido1, a.apellido2
from grupo g
inner join grupo_artista ga on g.id_grupo = ga.id_grupo
inner join artista a on ga.id_artista = a.id_artista
where ga.numero_integrantes > 3;

-- 4. consulta del cliente que ha realizado más compras y el total gastado
select c.nombre, c.apellido1, c.apellido2, count(v.id_venta) as total_compras, sum(p.precio * vp.cantidad) as total_gastado
from cliente c
inner join venta v on c.id_cliente = v.id_cliente
inner join venta_producto vp on v.id_venta = vp.id_venta
inner join producto p on vp.id_producto = p.id_producto
group by c.nombre, c.apellido1, c.apellido2
order by total_compras desc
limit 1;

-- 5. consulta de productos vendidos por cada tienda con su respectivo proveedor
select t.direccion, t.ciudad, p.nombre as nombre_producto, pr.nombre as nombre_proveedor
from tienda t
inner join empleado e on t.id_tienda = e.id_tienda
inner join venta v on e.id_empleado = v.id_empleado
inner join venta_producto vp on v.id_venta = vp.id_venta
inner join producto p on vp.id_producto = p.id_producto
inner join producto_proveedor pp on p.id_producto = pp.id_producto
inner join proveedor pr on pp.id_proveedor = pr.id_proveedor;

-- 6. consulta de ventas realizadas por empleados contratados después de 2020
select e.nombre, e.apellido1, e.apellido2, e.fechainiciocontrato 
from empleado e
inner join venta v on e.id_empleado = v.id_empleado
where e.fechainiciocontrato > '2020-01-01';

-- 7. consulta de productos con un precio mayor a $100 y que pertenecen al género "Rock"
select p.nombre, p.precio, p.genero
from producto p
where p.precio > 100 and p.genero = 'Rock';

-- 8. consulta de la dirección de las tiendas donde trabajan empleados cuyo salario es mayor a $3000
select t.direccion, t.ciudad, e.salario 
from tienda t
inner join empleado e on t.id_tienda = e.id_tienda
where e.salario > 3000;

-- 9. consulta de empleados que tienen un salario superior al salario promedio de todos los empleados de Miami:
select nombre, apellido1, apellido2 , salario 
from empleado
where salario > (
    select avg(salario)
    from empleado
    where id_tienda in (
        select  id_tienda
        from tienda
        where ciudad = 'Miami'
    )
);

