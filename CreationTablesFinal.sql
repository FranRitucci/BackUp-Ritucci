USE telecomunicaciones;

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
FOREIGN KEY (dni) REFERENCES sales(id_sale)
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
FOREIGN KEY (id_location) REFERENCES id(customers)
) auto_increment=1;

-- Tabla de auditoria

CREATE TABLE _auditoria_customers(
id_log INT PRIMARY KEY auto_increment,
customer_id INT NOT NULL,
by_user VARCHAR(100),
date_insert DATETIME
);