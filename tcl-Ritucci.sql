SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 0;
USE telecomunicaciones;

-- Uso de transaccion para hacer insert de clientes en la tabla customers.
START TRANSACTION;
INSERT INTO customers
VALUES (NULL, "norma", "angeles", 52948563, 4, 29563775, "angelesnormita@live.com.ar", "Los nogales 5700", "residencial"),
(NULL, "hernan", "lopez", 12973655, 2, 54119736, "hernilo@gmail.com", "Av. Soberania 103", "corporativo"),
(NULL, "elba", "chuca", 11967418, 3, 52362157, "elchubaca@gmail.com", "Orquideas 633", "residencial"),
(NULL, "raul", "ramirez", 36934555, 4, 03699334, "rr777@gmail.com", "Ingeniero schur 1800", "corporativo"),
(NULL, "belinda", "saenz", 05666956, 5, 34903025, "bsaenz07@hotmail.com", "oso pardo 560", "residencial");
ROLLBACK;
COMMIT;
SELECT * FROM customers;

-- STORED PROCEDURE CON TRANSACCION - Incrementa el precio actual del servicio en el procentaje que le sea indicado.
-- En el primer parametro IN se le indica el ID del servicio a actualizar y en el segundo el porcentaje a actualizar. En este caso por ejemplo actualizo en un 10% el servicio ID 2(Internet200mb)
DELIMITER ==

DROP PROCEDURE IF EXISTS sp_actualizar_precio;

CREATE PROCEDURE sp_actualizar_precio(IN id_servicio INT, IN porcentaje_aumento DECIMAL(5,2))
BEGIN
    -- Declarar variables para el manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- En caso de error, ejecuta un ROLLBACK para deshacer la transacción
        ROLLBACK;
    END;

    -- Inicio de la transacción
    START TRANSACTION;

    -- Actualiza el precio del servicio
    UPDATE services
    SET price_monthly = price_monthly * (1 + porcentaje_aumento / 100)
    WHERE id_service = id_servicio;

    -- Confirma la transacción si no hay errores
    COMMIT;
END 
==
CALL sp_actualizar_precio(2, 10);









