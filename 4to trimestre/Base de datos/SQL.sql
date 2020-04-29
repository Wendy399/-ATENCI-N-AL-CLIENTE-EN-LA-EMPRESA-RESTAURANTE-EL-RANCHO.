create database RestauranteElRancho;
use RestauranteElRanco;
create table cliente 
(
idCliente int (9),
nombre varchar(30),
correo varchar(40),
contrasena varchar(10),
fechaDeNacimiento date,
primary key (idCliente)
);

create table producto
(
idProducto int(9),
nombreProducto varchar(20),
imagen blob,
describcion varchar(100),
costo float(100),
primary key (idProducto)
);

create table promocion
( 
idPromocion int(9),
producto varchar(20),
fechaApertura date,
fechacaduciadad date,
primary key (idPromocion)
);
