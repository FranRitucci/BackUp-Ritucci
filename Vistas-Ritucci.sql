-- VISTA 1. Permite visualizar aquellos clientes que registren un dominio de correo "@gmail.com". 
-- En ocasiones algunos dominios ingresan en lista negra el dominio de nuestra empresa por envio masico de spam y esto crea inconvenientes para poder contactar por este medio a los clientes. Sabiendo el dominio de correo que nos tiene en black list podemos identificar mediante esta vista rapidamente cuales van a ser los clientes que tendran que ser contactados por otras vias alternativas o que bien no podran ser informados a tiempo de la factura etc.
CREATE VIEW correo_gmail AS
(
SELECT first_name, dni, email
FROM customers
WHERE email like upper('%@gmail.com')
);
SELECT* FROM correo_gmail;

-- VISTA 2. Es un join entre 3 tablas, permite ver los clientes que tienen servicios activos, mas alla de los clientes registrados en la tabla de clientes que quiza esten en ella pero NO tengan servicio activo
CREATE VIEW servicios_activos AS
(
SELECT id, first_name, location 
FROM customers C JOIN services_customers SC ON (C.id = SC.id_customer)
JOIN services S ON (SC.id_service = S.id_service)
);
SELECT* FROM servicios_activos;

-- VISTA 3. Obtiene las ventas que se han realizado segun el año. Puede permitir hacer un balance de las ventas que se han reaizado, la vista podria modiciarse al año en particular que se quiera consultar.
CREATE VIEW ventas_año_2017 AS
SELECT id_sale, name_service, date_sale
FROM sales
WHERE date_sale >= '2017-01-01' AND date_sale < '2018-01-01';

SELECT* FROM ventas_año_2017;

-- VISTA 4. Pudiendo ajustarse al "id-service" que sea necesario consultar, se obtiene de esta vista el equipo(item) y la cantidad disponible de acuerdo al "id_service" indicado.
CREATE OR REPLACE VIEW stock_by_service AS
(
SELECT item_name, total_quantity 
FROM stock_equipment SE 
JOIN services S 
ON SE.id_service = S.id_service
WHERE S.id_service = 3
);
SELECT * FROM stock_by_service;

-- VISTA 5. Vista de los equipos(items) en su total general y en su total parcial segun su localidad
CREATE OR REPLACE VIEW stock_by_location AS
(
SELECT id_location, SE.item_name, quantity_location, SE.total_quantity
FROM stock_distribution SD
JOIN stock_equipment SE
ON SD.item_name = SE.item_name
);
SELECT* FROM stock_by_location;