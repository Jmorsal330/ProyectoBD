use tienda_musica;

delimiter //

-- función para calcular el precio total de una venta
create function calcular_precio_total(id_venta_in int) returns decimal(10, 2) deterministic
begin
    declare total decimal(10, 2);
    
    select sum(precio * cantidad)
    into total
    from venta_producto vp
    join producto p on vp.id_producto = p.id_producto
    where vp.id_venta = id_venta_in;
    
    return total;
end //

delimiter ;

select calcular_precio_total(1);

delimiter //

-- función para obtener la edad de un artista
create function calcular_edad_artista(id_artista_in int) returns int deterministic
begin
    declare edad int;
    
    select year(curdate()) - year(fecha_nacimiento)
    into edad
    from artista
    where id_artista = id_artista_in;
    
    return edad;
end //
delimiter ;

select calcular_edad_artista(1);

delimiter //


-- procedimiento para insertar una venta
create procedure insertar_venta(
    in id_venta_in int,
    in fecha_venta_in date,
    in id_empleado_in int,
    in id_cliente_in int
)
begin
    insert into venta (id_venta, fecha_venta, id_empleado, id_cliente)
    values (id_venta_in, fecha_venta_in, id_empleado_in, id_cliente_in);
end //
delimiter ;

-- call insertar_venta(1004 ,'2024-05-01', 1, 1);


delimiter //

-- procedimiento para obtener la suma de los salarios de todos los empleados en una tienda
create procedure sumar_salarios_tienda(in id_tienda_in int)
begin
    declare done int default false;
    declare salario_empleado decimal(10, 2);
    declare total decimal(10, 2) default 0;
    
    -- Cursor para recorrer los empleados de la tienda
    declare cur cursor for select salario from empleado where id_tienda = id_tienda_in;
    declare continue handler for not found set done = true;
    
    open cur;
    
    read_loop: loop
        fetch cur into salario_empleado;
        if done then
            leave read_loop;
        end if;
        
        -- Sumar el salario del empleado al total
        set total = total + salario_empleado;
    end loop;
    
    close cur;
    
    -- Mostrar el total de salarios
    select total as total_salarios;
end //



delimiter ;

call sumar_salarios_tienda(1);



delimiter //


-- Procedimiento para obtener el precio total de una venta e imprimirlo
create procedure obtener_precio_total_venta(in id_venta_in int)
begin
    declare precio_total decimal(10, 2);
    
    select calcular_precio_total(id_venta_in) into precio_total;
    
    select concat('El precio total de la venta ', id_venta_in, ' es: ', precio_total, ' € ');
end //

delimiter ;

call obtener_precio_total_venta(1);
