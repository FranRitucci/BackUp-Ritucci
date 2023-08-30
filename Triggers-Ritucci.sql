USE TELECOMUNICACIONES;

-- 1- TRIGGER DE LA TABLA CUSTOMERS QUE GENERA UN LOG EN LA TABLA TR_AUDITORY_CUSTOMERS CADA VEZ QUE SE HACE EL ALTA DE UN CLIENTE EN LA TABLA CUSTOMERS, REGISTRANDO EL ID DEL CLIENTE
-- EL USUARIO QUE LO CARGO Y LA FECHA Y HORA.
DELIMITER %%
CREATE TRIGGER tr_autodiry_customers
AFTER INSERT ON customers
FOR EACH ROW
INSERT INTO _auditoria_customers (customer_id, by_user, date_insert)
VALUES (NEW.id, USER(), CURRENT_TIMESTAMP());
END %%

-- Tabla de auditoria(ESTA EN EL SCRIPT CREATIONTABLESFINAL)
CREATE TABLE _auditoria_customers(
id_log INT PRIMARY KEY auto_increment,
customer_id INT NOT NULL,
by_user VARCHAR(100),
date_insert DATETIME
);

-- iNSERT DE PRUEBA PARA EL TRIGGER (ESTA EN EL SCRIPT SCRIPTINS+RITUCCI)
INSERT INTO customers VALUES
(NULL, "hector", "correa", 17894221, 2, 38008850, "correahector17@yahoo.com.ar", "Asuncion 100", "corporativo");

SELECT * FROM customers;
SELECT * FROM _auditoria_customers;

-- 2- TRIGGER DE LA TABLA SALES. Al registrar una venta en este tabla, aunque el valor(PRICE) del servicio que se vendio este incorrecto, registrara en la tabla el valor vigente segun
-- la tabla SERVICES
DELIMITER ##
CREATE TRIGGER validar_price_sales
BEFORE INSERT ON sales
FOR EACH ROW
BEGIN
    DECLARE service_price DECIMAL(10, 2);
    IF NEW.price <= 0 THEN
        SELECT price_monthly INTO service_price FROM services WHERE name_service = NEW.name_service;
        SET NEW.price = service_price;
        ELSEIF NEW-price >0 THEN
        SELECT price_monthly INTO service_price FROM services WHERE name_service = NEW.name_service;
        SET NEW.price = service_price;
    END IF;
END ##

SELECT * FROM services;
SELECT * FROM sales;

--Insert un registro de venta para probar funcionamiento del TRIGGER
INSERT INTO sales 
VALUES (NULL, "internet 200Mb", CURRENT_DATE(), 2, 0, "modem docsis1.0", 1);