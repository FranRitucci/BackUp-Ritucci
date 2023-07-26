CREATE SCHEMA telecomunicaciones;

USE telecomunicaciones;

CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
dni INT UNIQUE,
phone INT,
email VARCHAR(30),
adress VARCHAR(30),
category VARCHAR(30)
);

CREATE TABLE services_customers(
id_customer INT NOT NULL AUTO_INCREMENT,
id_service INT NOT NULL,
id_employee INT NOT NULL,
description_serv VARCHAR(30) NOT NULL PRIMARY KEY,
FOREIGN KEY (id_customer) REFERENCES customers(id)
);

CREATE TABLE services(
id_service INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
name_service VARCHAR(30),
price_monthly NUMERIC,
FOREIGN KEY (name_service) REFERENCES services_customers(description_serv)
);

CREATE TABLE sales(
id_sale INT NOT NULL UNIQUE AUTO_INCREMENT,
name_service VARCHAR(30) PRIMARY KEY,
date_sale DATE,
id_employee INT NOT NULL,
FOREIGN KEY (id_sale) REFERENCES services(id_service)
);

CREATE TABLE employees(
id_employee INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
dni INT NOT NULL UNIQUE,
phone INT,
id_location INT,
income DATE,
FOREIGN KEY (first_name) REFERENCES sales(name_service)
);

CREATE TABLE stock_equipment(
item_name VARCHAR(30) NOT NULL PRIMARY KEY,
id_service INT NOT NULL,
total_quantity INT,
id_employee INT NOT NULL,
FOREIGN KEY (id_employee) REFERENCES employees(id_employee),
FOREIGN KEY (id_service) REFERENCES services(id_service)
);

CREATE TABLE stock_distribution(
location VARCHAR(30) NOT NULL,
item_name VARCHAR(30),
quantity INT PRIMARY KEY,
storage_name VARCHAR(30),
FOREIGN KEY (location) REFERENCES stock_equipment(item_name)
);

CREATE TABLE locations(
location_name VARCHAR(30) PRIMARY KEY,
id_location INT NOT NULL UNIQUE AUTO_INCREMENT,
id_customer INT NOT NULL,
manager VARCHAR(30),
quantity_employees INT,
start_activities DATE,
FOREIGN KEY (id_location) REFERENCES stock_distribution(quantity),
FOREIGN KEY (id_customer) REFERENCES customers(id)
);