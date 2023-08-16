USE telecomunicaciones;

-- Permite conocer la cantidad de ventas que tiene un empleado. Al llamarla se le ingresa al ID del empleado  y la funcion devuelve la cantidad de ventas segun los registros.
DELIMITER ??
CREATE FUNCTION ventas_vendedor (id_del_empleado INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_ventas INT;
    SELECT COUNT(id_employee) INTO total_ventas FROM sales WHERE id_employee = id_del_empleado;
    RETURN total_ventas;
END
??

SELECT ventas_vendedor(1);

-- Resuelve si el stock de un "equipo" que nosotros ingresamos como parametro, es suficiente o no entendiendo como condicion que 190 o mas es "suficiente"

DELIMITER ??
CREATE FUNCTION stock_suficiente (equipo VARCHAR(30))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE stock_status VARCHAR(30);

    SELECT 
        CASE
            WHEN EXISTS (SELECT 1 FROM stock_equipment WHERE item_name = equipo AND total_quantity < 190) THEN 'Menos de 190'
            ELSE 'Suficiente'
        END
    INTO stock_status;

    RETURN stock_status;
END
??

SELECT stock_suficiente("modem docsis2.0");