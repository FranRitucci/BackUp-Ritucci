CREATE SCHEMA telecomunicaciones;
USE telecomunicaciones;

                                                                   -- DESDE AQUI LA CREACION DE TABLAS

CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
dni BIGINT UNIQUE,
location INT NOT NULL,
phone INT,
email VARCHAR(30),
adress VARCHAR(30),
category VARCHAR(30)
) auto_increment=1;

CREATE TABLE services_customers(
id_customer INT NOT NULL AUTO_INCREMENT,
id_service INT NOT NULL,
id_employee INT NOT NULL,
description_serv VARCHAR(30) NOT NULL PRIMARY KEY,
FOREIGN KEY (id_customer) REFERENCES customers(id)
) auto_increment=1;

CREATE TABLE services(
id_service INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
name_service VARCHAR(30),
price_monthly DECIMAL(6,2),
FOREIGN KEY (name_service) REFERENCES services_customers(description_serv)
) auto_increment=1;

CREATE TABLE sales(
id_sale INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
name_service VARCHAR(30),
date_sale DATE,
id_employee INT NOT NULL,
price DECIMAL(6,2),
item_name VARCHAR(30),
id_location INT,
FOREIGN KEY (id_employee) REFERENCES services(id_service)
) auto_increment=1;

CREATE TABLE employees(
id_employee INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
dni BIGINT NOT NULL UNIQUE,
phone INT,
id_location INT,
income DATE,
FOREIGN KEY (id_location) REFERENCES sales(id_sale)
) auto_increment=1;

CREATE TABLE stock_equipment(
item_name VARCHAR(30) NOT NULL PRIMARY KEY,
id_service INT NOT NULL,
total_quantity INT,
id_employee INT NOT NULL,
FOREIGN KEY (id_employee) REFERENCES employees(id_employee),
FOREIGN KEY (id_service) REFERENCES services(id_service)
);

CREATE TABLE stock_distribution(
id_stock_regedit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_location INT NOT NULL,
item_name VARCHAR(30),
quantity_location INT,
storage_name VARCHAR(30),
FOREIGN KEY (item_name) REFERENCES stock_equipment(item_name)
) auto_increment=1;

CREATE TABLE locations(
location_name VARCHAR(30) PRIMARY KEY,
id_location INT NOT NULL UNIQUE,
manager VARCHAR(30),
quantity_employees INT,
start_activities DATE,
FOREIGN KEY (id_location) REFERENCES customers(id)
) auto_increment=1;

-- Tabla de auditoria

CREATE TABLE _auditoria_customers(
id_log INT PRIMARY KEY auto_increment,
customer_id INT NOT NULL,
by_user VARCHAR(100),
date_insert DATETIME
);

                                                       -- DESDE AQUI LA INSERCION DE DATOS (VIA INSERT INTO)

INSERT INTO customers VALUES
(NULL, "sandra", "perez", 52698325, 1, 56228745, "sandrap@gmail.com", "Sauces 1450", "residencial"),
(NULL, "martin", "lopez", 41784523, 2, 54119637, "martinlopez@gmail.com", "Av. falsa 123", "residencial"),
(NULL, "elba", "edelmira", 51284963, 3, 54009753, "elbaedel@gmail.com", "Las Margaritas 3210", "residencial"),
(NULL, "raul", "jael", 22943255, 4, 1184226397, "rauljael@gmail.com", "Rivadavia 1037", "corporativo"),
(NULL, "mabel", "gomez", 01594321, 5, 42518964, "mabegomez@gmail.com", "Los troncos 6550", "residencial"),
(NULL, "lorena", "hertz", 46389428, 1, 11479536, "lorehertz@hotmail.com", "Av. Lavalle 500", "residencial"),
(NULL, "ramiro", "alterio", 40098297, 1, 43789454, "ramialterio@gmail.com", "Tambues 1200", "residencial");

INSERT INTO services_customers VALUES
(NULL, 1, 2, "internet 100Mb"),
(NULL, 2, 1, "internet 200Mb"),
(NULL, 3, 3, "TV + INT 100Mb"),
(NULL, 4, 1, "TV + INT 200Mb"),
(NULL, 5, 4, "TV + INT 100Mb + TEL"),
(NULL, 6, 5, "TV + INT 200Mb + TEL");

INSERT INTO services VALUES
(NULL, "internet 100Mb", 2000.00),
(NULL, "internet 200Mb", 4000.50),
(NULL, "TV + INT 100Mb", 3500.00),
(NULL, "TV + INT 200Mb", 5500.80),
(NULL, "TV + INT 100Mb + TEL", 5900.00),
(NULL, "TV + INT 200Mb + TEL", 8950.00);

INSERT INTO sales (id_sale, name_service, date_sale, id_employee)
VALUES (NULL, "internet 100Mb", "2017-05-15", 2),
(NULL, "internet 200Mb", "2019-08-09", 1),
(NULL, "TV + INT 100Mb", "2018-03-10", 3),
(NULL, "TV + INT 200Mb", "2018-01-12", 1),
(NULL, "TV + INT 100Mb + TEL", "2017-02-19", 4),
(NULL, "TV + INT 200Mb + TEL", "2020-12-28", 5);

INSERT INTO employees VALUES
(NULL, "santiago", "san juan", 19591285, 58947311, 2, "2017-04-24"),
(NULL, "lucia", "mendoza", 19588247, 52618399, 1, "2015-06-15"),
(NULL, "rocio", "estanislao", 25444132, 56664185, 3, "2010-01-16"),
(NULL, "roberto", "puig", 23876932, 66774537, 4, "2012-09-03"),
(NULL, "solange", "gonzalez", 15562939, 54237141, 5, "2015-12-11");

INSERT INTO stock_equipment VALUES
("modem docsis1.0", 1, 200, 1),
("modem docsis2.0", 2, 185, 3),
("Central-Home1.0", 3, 301, 1),
("Central-Home2.0", 4, 301, 1),
("Central-Home+TEL1.0", 5, 156, 4),
("Central-Home+TEL2.0", 6, 99, 4);

INSERT INTO stock_distribution VALUES
(NULL, 1, "modem docsis1.0", 80, "Vedia 1230"),
(NULL, 1, "modem docsis2.0", 69, "Vedia 1230"),
(NULL, 1, "Central-Home1.0", 100, "Vedia 1230"),
(NULL, 1, "Central-Home2.0", 95, "Vedia 1230"),
(NULL, 1, "Central-Home+TEL1.0", 45, "Saenz 500"),
(NULL, 1, "Central-Home+TEL2.0", 21, "Saenz 500"),
(NULL, 2, "modem docsis1.0", 30, "Batalla de San Lorenzo 150"),
(NULL, 2, "modem docsis2.0", 29, "Batalla de San Lorenzo 150"),
(NULL, 2, "Central-Home1.0", 51, "Batalla de San Lorenzo 150"),
(NULL, 2, "Central-Home2.0", 51, "Batalla de San Lorenzo 150"),
(NULL, 2, "Central-Home+TEL1.0", 27, "Batalla de San Lorenzo 150"),
(NULL, 2, "Central-Home+TEL2.0", 21, "Batalla de San Lorenzo 150"),
(NULL, 3, "modem docsis1.0", 30, "Calle110 320"),
(NULL, 3, "modem docsis2.0", 29, "Calle110 320"),
(NULL, 3, "Central-Home1.0", 50, "Calle110 320"),
(NULL, 3, "Central-Home2.0", 51, "Calle110 320"),
(NULL, 3, "Central-Home+TEL1.0", 27, "Calle110 320"),
(NULL, 3, "Central-Home+TEL2.0", 19, "Nogales 9000"),
(NULL, 4, "modem docsis1.0", 35, "Ruta 5 Km1.5"),
(NULL, 4, "modem docsis2.0", 29, "Ruta 5 Km1.5"),
(NULL, 4, "Central-Home1.0", 50, "Rotonda310 Ala 1"),
(NULL, 4, "Central-Home2.0", 53, "Rotonda310 Ala 1"),
(NULL, 4, "Central-Home+TEL1.0", 30, "Rotonda310 Ala 1"),
(NULL, 4, "Central-Home+TEL2.0", 19, "Rotonda310 Ala 1"),
(NULL, 5, "modem docsis1.0", 25, "Ruta 1 Km30"),
(NULL, 5, "modem docsis2.0", 29, "Ruta 1 Km30"),
(NULL, 5, "Central-Home1.0", 50, "Ruta 1 Km30"),
(NULL, 5, "Central-Home2.0", 51, "Ruta 1 Km30"),
(NULL, 5, "Central-Home+TEL1.0", 27, "Ruta 1 Km30"),
(NULL, 5, "Central-Home+TEL2.0", 19, "Ruta 1 Km30");

INSERT INTO locations VALUES
("Santa Fe", 1, "Sergio Ladin", 120, "2005-04-10"),
("Parana", 2, "Manuel Otero", 99, "2005-04-10"),
("Posadas", 3, "Carlos Gariño", 90, "2005-12-05"),
("Corrientes", 4, "Juan Pampin", 110, "2006-02-20"),
("Resistencia", 5, "Roberto Anim", 105, "2006-02-25");

                                                                         -- DESDE AQUI LA CREACION DE VISTAS

-- VISTA 1. Permite visualizar aquellos clientes que registren un dominio de correo "@gmail.com". 
-- En ocasiones algunos dominios como por ejemplo GMAIL o HOTMAIL ingresan en lista negra el dominio de nuestra empresa por envio masico de spam y esto
-- crea inconvenientes para poder contactar por este medio a los clientes. Sabiendo el dominio de correo que nos tiene en black list podemos identificar mediante esta vista rapidamente
-- cuales van a ser los clientes que tendran que ser contactados por otras vias alternativas o que bien no podran ser informados a tiempo de la factura etc.
CREATE VIEW correo_gmail AS
(
SELECT first_name, dni, email
FROM customers
WHERE email like upper('%@gmail.com')
);
-- SELECT* FROM correo_gmail;

-- VISTA 2. Es un join entre 3 tablas, permite ver los clientes que tienen servicios activos, mas alla de los clientes registrados en la tabla de clientes que quiza esten en ella pero NO tengan servicio activo
CREATE VIEW servicios_activos AS
(
SELECT id, first_name, location 
FROM customers C JOIN services_customers SC ON (C.id = SC.id_customer)
JOIN services S ON (SC.id_service = S.id_service)
);
-- SELECT* FROM servicios_activos;

-- VISTA 3. Obtiene las ventas que se han realizado segun el año. Puede permitir hacer un balance de las ventas que se han reaizado, la vista podria modiciarse al año en particular que se quiera consultar.
CREATE VIEW ventas_año_2017 AS
SELECT id_sale, name_service, date_sale
FROM sales
WHERE date_sale >= '2017-01-01' AND date_sale < '2018-01-01';
-- SELECT* FROM ventas_año_2017;

-- VISTA 4. Pudiendo ajustarse al "id-service" que sea necesario consultar, se obtiene de esta vista el equipo(item) y la cantidad disponible de acuerdo al "id_service" indicado.
CREATE OR REPLACE VIEW stock_by_service AS
(
SELECT item_name, total_quantity 
FROM stock_equipment SE 
JOIN services S 
ON SE.id_service = S.id_service
WHERE S.id_service = 3
);
-- SELECT * FROM stock_by_service;

-- VISTA 5. Vista de los equipos(items) en su total general y en su total parcial segun su localidad.
CREATE OR REPLACE VIEW stock_by_location AS
(
SELECT id_location, SE.item_name, quantity_location, SE.total_quantity
FROM stock_distribution SD
JOIN stock_equipment SE
ON SD.item_name = SE.item_name
);
-- SELECT* FROM stock_by_location;

                                                              -- DESDE AQUI LA CREACION DE FUNCIONES

-- FUNCION 1. Permite conocer la cantidad de ventas que tiene un empleado. Al llamarla se le ingresa al ID del empleado(POR EJEMPLO "1")  y la funcion devuelve la cantidad de ventas segun los registros.
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
-- SELECT ventas_vendedor(1);

-- FUNCION 2. Resuelve si el stock de un "equipo" que nosotros ingresamos como parametro(POR EJEMPLO "modem docsis2.0"), es suficiente o no entendiendo como condicion que 190 o mas es "suficiente"

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
-- SELECT stock_suficiente("modem docsis2.0");

                                                       -- DESDE AQUI LA CREACION DE STORED PROCEDURE

-- STORED PROCEDURE 1 - Incrementa el precio actual del servicio en el procentaje que le sea indicado.
-- En el primer parametro IN se le indica el ID del servicio a actualizar y en el segundo el porcentaje a actualizar. En este caso por ejemplo actualizo en un 10% el servicio ID 2(Internet200mb)
DELIMITER ??
CREATE PROCEDURE sp_actualizar_precio(IN id_servicio INT, IN porcentaje_aumento DECIMAL(5,2))
BEGIN
    UPDATE services
    SET price_monthly = price_monthly * (1 + porcentaje_aumento / 100)
    WHERE id_service = id_servicio;
END
??
-- CALL sp_actualizar_precio(2, 10);

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

-- CALL sp_registrar_venta(NULL, "internet 200mb", "2023-08-26", 1, "modem docsis2.0", 1);

                                                                   -- DESDE AQUI LA CREACION DE TRIGGERS

-- 1- TRIGGER DE LA TABLA CUSTOMERS QUE GENERA UN LOG EN LA TABLA TR_AUDITORY_CUSTOMERS CADA VEZ QUE SE HACE EL ALTA DE UN CLIENTE EN LA TABLA CUSTOMERS, REGISTRANDO EL ID DEL CLIENTE
-- EL USUARIO QUE LO CARGO Y LA FECHA Y HORA.
DELIMITER %%
CREATE TRIGGER tr_autodiry_customers
AFTER INSERT ON customers
FOR EACH ROW
INSERT INTO _auditoria_customers (customer_id, by_user, date_insert)
VALUES (NEW.id, USER(), CURRENT_TIMESTAMP());
END 
%%

-- Tabla de auditoria(ESTA EN EL SCRIPT CREATIONTABLESFINAL)
-- CREATE TABLE _auditoria_customers(
-- id_log INT PRIMARY KEY auto_increment,
-- customer_id INT NOT NULL,
-- by_user VARCHAR(100),
-- date_insert DATETIME);

-- iNSERT DE PRUEBA PARA EL TRIGGER
-- INSERT INTO customers VALUES
-- (NULL, "hector", "correa", 17894221, 2, 38008850, "correahector17@yahoo.com.ar", "Asuncion 100", "corporativo");

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

-- Insert DE un registro de venta para probar funcionamiento del TRIGGER
-- INSERT INTO sales 
-- VALUES (NULL, "internet 200Mb", CURRENT_DATE(), 2, 0, "modem docsis1.0", 1);