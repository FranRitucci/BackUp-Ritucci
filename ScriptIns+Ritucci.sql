USE telecomunicaciones;

INSERT INTO customers VALUES
(NULL, "sandra", "perez", 52698325, 1, 56228745, "sandrap@gmail.com", "Sauces 1450", "residencial"),
(NULL, "martin", "lopez", 41784523, 2, 54119637, "martinlopez@gmail.com", "Av. falsa 123", "residencial"),
(NULL, "elba", "edelmira", 51284963, 3, 54009753, "elbaedel@gmail.com", "Las Margaritas 3210", "residencial"),
(NULL, "raul", "jael", 22943255, 4, 1184226397, "rauljael@gmail.com", "Rivadavia 1037", "corporativo"),
(NULL, "mabel", "gomez", 01594321, 5, 42518964, "mabegomez@gmail.com", "Los troncos 6550", "residencial"),
(NULL, "ramiro", "alterio", 40098297, 1, 43789454, "ramialterio@gmail.com", "Tambues 1200", "residencial");

INSERT INTO customers VALUES
(NULL, "lorena", "hertz", 46389428, 1, 11479536, "lorehertz@hotmail.com", "Av. Lavalle 500", "residencial");

INSERT INTO customers VALUES
(NULL, "hector", "correa", 17894221, 2, 38008850, "correahector17@yahoo.com.ar", "Asuncion 100", "corporativo");

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

INSERT INTO sales VALUES
(NULL, "internet 100Mb", "2017-05-15", 2),
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