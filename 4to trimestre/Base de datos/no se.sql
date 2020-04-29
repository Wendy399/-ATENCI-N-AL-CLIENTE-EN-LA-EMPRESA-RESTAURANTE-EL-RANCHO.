drop DATABASE company;
 
USE company;
 
CREATE TABLE departments (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    number TINYINT UNSIGNED NOT NULL,
    name VARCHAR(32) NOT NULL,
    location VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB;
 
CREATE TABLE employees (
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    number MEDIUMINT UNSIGNED NOT NULL,
    name VARCHAR(32) NOT NULL,
    job VARCHAR(32) NOT NULL,
    hire_date DATETIME NOT NULL,
    salary SMALLINT UNSIGNED NOT NULL,
    commission SMALLINT UNSIGNED NULL,
    id_employee MEDIUMINT UNSIGNED NULL,
    id_department SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_employee) REFERENCES employees(id),
    FOREIGN KEY(id_department) REFERENCES departments(id)
) ENGINE=InnoDB;
 
INSERT INTO departments(number, name, location)
VALUES
(101, 'Cuentas', 'Madrid'),
(76, 'I+D', 'Sevilla'),
(25, 'Ventas', 'Barcelona'),
(88, 'E-commerce', 'Barcelona');
 
INSERT INTO employees(number, name, job, hire_date, salary, commission, id_employee, id_department)
VALUES
(1, 'Julián', 'Director general', '2004-11-10', 4000, NULL, NULL, 1),
(10, 'Pepa', 'Jefe de cuentas', '2004-11-10', 3500, 300, 1, 1),
(11, 'Juan', 'Director técnico', '2004-11-25', 3600, NULL, 1, 2),
(12, 'Marta', 'Jefa de ventas', '2004-11-19', 2500, 500, 1, 3),
(13, 'Ignacio', 'Director e-commerce', '2004-11-10', 2300, 700, 1, 4),
(88, 'Carlos', 'Administrativo', '2004-12-11', 1200, NULL, 2, 1),
(89, 'Silvia', 'Contable', '2004-12-11', 1300, NULL, 2, 1),
(90, 'María', 'Administrativa', '2004-12-11', 1200, NULL, 2, 1),
(91, 'Pedro', 'Contable', '2004-12-11', 1300, NULL, 2, 1),
(92, 'Teresa', 'Ingeniera', '2004-12-11', 2100, NULL, 3, 2),
(93, 'Isabel', 'Ingeniera Técnica', '2004-12-28', 1800, NULL, 3, 2),
(94, 'Javier', 'Ingeniero Técnico', '2004-12-11', 1800, NULL, 3, 2),
(95, 'Fernando', 'Ingeniero', '2004-12-11', 2100, NULL, 3, 2),
(96, 'Laura', 'Comercial', '2004-12-30', 2100, 500, 4, 3),
(97, 'Montse', 'Comercial', '2004-12-27', 1800, 600, 4, 3),
(100, 'Jorge', 'Comercial', '2004-12-30', 1800, 500, 4, 3),
(102, 'Arturo', 'Comercial', '2004-12-12', 2100, 550, 4, 3),
(105, 'Juan', 'Programador', '2004-12-11', 1800, NULL, 5, 4),
(109, 'Pepe', 'Programador', '2005-01-01', 1700, NULL, 5, 4),
(110, 'Juan', 'SEO', '2005-01-01', 2000, 200, 5, 4),
(112, 'Pepe', 'Analista', '2005-01-01', 1700, NULL, 5, 4);


SELECT * FROM departments;

SELECT * FROM employees;




