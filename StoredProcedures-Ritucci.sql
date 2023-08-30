-- STORED PROCEDURE 1 - Incrementa el precio actual del servicio en el procentaje que le sea indicado.alter
-- En el primer parametro IN se le indica el ID del servicio a actualizar y en el segundo el porcentaje a actualizar. En este caso por ejemplo actualizo en un 10% el servicio ID 2(Internet200mb)
DELIMITER ??
CREATE PROCEDURE sp_actualizar_precio(IN id_servicio INT, IN porcentaje_aumento DECIMAL(5,2))
BEGIN
    UPDATE services
    SET price_monthly = price_monthly * (1 + porcentaje_aumento / 100)
    WHERE id_service = id_servicio;
END
??
CALL sp_actualizar_precio(2, 10);

 -- STORED PROCEDURE 2 - Registra la venta en la table SALES y descuenta el stock del equipo correspondiente en las tablas STOCK_EQUIPMENT y en la tabla STOCK_DISTRIBUTION 
 -- Descuenta 1 unidad del ITEM(equipo)dependiendo el equipo que se vendio y la localidad donde se vendio
 
 DELIMITER !!

CREATE PROCEDURE sp_registrar_venta(IN id_sale INT, IN name_service VARCHAR(30), IN date_sale DATE, IN id_employee INT, IN item_name VARCHAR(30), IN id_location INT)
BEGIN
    -- Actualizar stock general
    UPDATE stock_equipment
    SET total_quantity = total_quantity - 1
    WHERE stock_equipment.item_name = item_name;

    -- Actualizar stock de sucursal
    UPDATE stock_distribution
    SET quantity_location = quantity_location - 1
    WHERE stock_distribution.item_name = item_name AND stock_distribution.id_location = id_location;

    -- Registrar la venta en la tabla de ventas
    INSERT INTO sales (id_sale, name_service, date_sale, id_employee, item_name, id_location)
    VALUES (id_sale, name_service, date_sale, id_employee, item_name, id_location);
END;
!!

DROP PROCEDURE sp_registrar_venta;

CALL sp_registrar_venta(NULL, "internet 200mb", "2023-08-26", 1, "modem docsis2.0", 1);
