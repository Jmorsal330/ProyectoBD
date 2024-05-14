use tienda_musica;

-- Este trigger se activa antes de que se actualice el salario de un empleado. Si el nuevo salario es mayor al salario actual, se imprimirá un mensaje.
delimiter //
create trigger before_update_salario
before update on empleado
for each row
begin
    if new.salario > old.salario then
        set @mensaje_salario = concat('Aumento de salario: El salario del empleado ', new.id_empleado, ' ha cambiado de ', old.salario, ' a ', new.salario);
        signal sqlstate '45000'
        set message_text = @mensaje_salario;
    end if;
end;
//
delimiter ;

-- ejemplo de uso
-- insert into empleado (id_empleado, nombre, apellido1, apellido2, fechainiciocontrato, salario, id_tienda, id_jefe) values (0, 'Juan', 'Pérez', 'García', '2023-01-01', 3000.00, 1, null);

-- update empleado set salario = 3500.00 where id_empleado = 0;

-- Este trigger se activa después de insertar o actualizar un registro en la tabla producto_proveedor. Si la cantidad de un producto es menor a 10, se imprimirá un mensaje de advertencia.
delimiter //
create trigger after_insert_producto_proveedor
after insert on producto_proveedor
for each row
begin
    if new.cantidad < 10 then
        set @mensaje_stock = concat('Alerta de stock: La cantidad del producto ', new.id_producto, ' con proveedor ', new.id_proveedor, ' es ', new.cantidad);
        signal sqlstate '45000'
        set message_text = @mensaje_stock;
    end if;
end;
//
delimiter ;

delimiter //
create trigger after_update_producto_proveedor
after update on producto_proveedor
for each row
begin
    if new.cantidad < 10 then
        set @mensaje_stock = concat('Alerta de stock: La cantidad del producto ', new.id_producto, ' con proveedor ', new.id_proveedor, ' es ', new.cantidad);
        signal sqlstate '45000'
        set message_text = @mensaje_stock;
    end if;
end;
//
delimiter ;

-- ejemplo de uso
-- insert into proveedor (id_proveedor, nombre, direccion, email, telefono) values (0, 'Proveedor A', 'Calle Falsa 123', 'contacto@proveedora.com', '123456789');

-- insert into producto (id_producto, nombre, duraccion, genero, fecha_salida, precio, tipo_producto) values (0, 'Producto A', 60, 'Rock', '2022-01-01', 15.99, 'CD');

-- insert into producto_proveedor (id_producto, id_proveedor, cantidad) values (0, 0, 5);
