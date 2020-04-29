create database RestauranteRancho;
use RestauranteRancho;


--  Crear tablas 

create table sucursal
(
idSucursal int auto_increment,
nombreSucursal varchar(30)not null,
direccionSucursal varchar(30)not null,
ciudadSucursal varchar(20)not null,
telefonoSucursal int not null,
primary key(idSucursal)
);

create table recervacion
(
idRecervacion int auto_increment,
hora time not null,
fechaRecervacion date not null,
estadoRecervacion enum("Activa","Cancelada")not null,
tipoDeEvento varchar(20)not null, 
cantidadClientes int not null,
idCliente int,
idSucursal int,
primary key(idRecervacion)
);


create table queja
(
idQueja int auto_increment,
fechaDeQueja date not null,
comentario varchar(500)not null,
prioridad int not null,
respuesta varchar(500),
idSucursal int,
idCliente int,
primary key(idQueja)
);

create table cliente 
(
idCliente int auto_increment,
nombre varchar(30)not null,
apellido varchar(30)not null,
fechaDeNacimiento date not null,
numeroDocumento int not null,
direccion varchar(150)not null,
ciudad varchar(30)not null,
primary key(idCliente)
);

create table respuesta
(
idRespuesta int auto_increment,
fechaRespuesta date not null,
calificacion int not null,
idCliente int,
idPreguntas int,
primary key(idRespuesta)
);

create table preguntas 
(
idPreguntas int auto_increment,
texPreguntas text not null,
clasificar enum("importante","Muy importante")not null,
primary key(idPreguntas)
);

create table encuesta
(
idEncuesta int auto_increment,
idAdministrador int,
fechaDeInicioEncuesta date not null,
fechaDeFinEncuesta date not null, 
primary key(idEncuesta)
);

create table administrador
(
idAdministrador int auto_increment, 
idUsuario int,
nombreAdministrador varchar(30)not null, 
apellidoAdministrador varchar(30)not null,
fechaNacimiento date not null,
NOdocumentoAdministrador int not null,
telefonoAdministrador int not null,
direccionAdministrador varchar(30)not null,
ciudadAdministrador varchar(30)not null,
primary key(idAdministrador)
);

create table promociones 
(
idPromociones int auto_increment,
idAdministrador int,
producto varchar(15)not null,
 inicioPromocion date not null,
 finPromocion date not null,
 imagenPromocion blob not null,
 primary key(idPromociones)
);

create table detallePromocion
(
idDetallePromocion int auto_increment,
idProducto int,
idPromociones int,
precioPromociones double not null,
describcionPromocion varchar(500)not null,
primary key(idDetallePromocion)
);

create table producto 
(
idProducto int auto_increment,
nombreProducto varchar(20)not null, 
imagenProducto blob not null,
costoUnitario double not null,
descripcion varchar(100)not null,
primary key(idProducto)
);


create table usuario
(
idUsuario int auto_increment,
correo varchar(45),
contraceña varchar(20),
bloquear varchar(10),
activar varchar(10),
primary key(idUsuario)
);

create table preguntas_Has_respuesta
(
idPreguntas int,
idencuesta int,
foreign key(idEncuesta)references encuesta,
foreign key(idpreguntas)references pregunta
);
create table cliente_Has_promociones
(
idCliente int,
idPromociones int,
foreign key(idCliente)references cliente ,
foreign key(idPromociones)references promociones
);
create table Empleado(
idEmpleado int auto_increment,
nombreEmpleado varchar(20)not null,
apellidoEmpleado varchar(20)not null,
numeroDocumento int (15)not null,
fechaNacimiento date not null,
DescripcionEmpleado varchar (200)not null,
fotoEmpleado blob,
idtipodoc int,
primary key(idEmpleado)
);
create table tipoDoc(
idTipoDoc int auto_increment,
tipoDocumento varchar(5)not null,
primary key(idTipoDoc)
);
alter table recervacion add foreign key(idCliente)references cliente(idCliente);
alter table recervacion add foreign key(idSucursal)references sucursal(idSucursal);
alter table queja add foreign key(idSucursal)references sucursal(idSucursal);
alter table queja add foreign key(idCliente)references cliente(idCliente);
alter table respuesta add foreign key(idCliente)references cliente(idCliente);
alter table respuesta add foreign key(idPreguntas)references preguntas(idCliente);
alter table encuesta add foreign key(idAdministrador)references administrador(idAdministrador);
alter table promociones add foreign key(idadministrador)references administrador(idAdministrador);
alter table detallepromocion add foreign key(idPromociones)references promociones(idpromociones);
alter table detallepromocion add foreign key(idproducto)references promociones(idpromociones);
alter table administrador add foreign key(idUsuario)references usuario(idUsuario);
alter table empleado add foreign key(idtipodoc)references tipodoc(idTipodoc);

show tables;

select count(*) as "numero de tablas" from Information_Schema.Tables where TABLE_TYPE = 'BASE TABLE' 
and table_schema = 'RestauranteRancho' ;



insert into cliente(nombre , apellido, fechadenacimiento, numerodocumento, direccion, ciudad)
VALUES
(
"ANDREA MARCELA ","BARRAGAN GARCIA","1995-10-10",52987453,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("9ANDREA YOHANNA" ,"PINZON YEPES","1981-12-29",52880406,"Carrera 46 No. 47-66 – Piso 7 Centro Comercial Punto de la Oriental  ","Bogota"),
("ALVARO CALDERON" ,"ARTUNDUAGA","1996-07-01",19442527,"Carrera 10 No. 27-51- Edificio Residencias Tequendama -Torre Norte - Oficina 201  ","Bogota"),
("CELMIRA PATRICIA" ,"ARROYAVE CORREDOR","2001-01-07",52265956,"Avenida 1AE No. 18-08 Barrio Los Caobos  ","Bogota"),
("CLAUDIA MARCELA" ,"NAVARRETE CORTES","2001-01-07",52428220,"Carrera 30 No. 8A-80 Edificio Banco Cafetero Piso 2  ","Bogota"),
("CLAUDIA PATRICIA" ,"GALLO CIFUENTES","2001-01-07",52427093,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("DIANA CAROLINA" ,"PALACIOS ZAQUE","2001-01-07",35353993,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("DIANA MARCELA" ,"HERRERA HERRERA","2001-01-07",52146038,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("DIANA PATRICIA" ,"BENAVIDEZ SOLORZA","2001-01-07",52252464,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("FANNY ESMERALDA" ,"PAEZ GONZALEZ","2001-01-07",52556028,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("GILMA" ,"ESPINOSA DIAZ","2001-01-07",28892971,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("GRACIELA ","TORRES TORRES","2001-01-07",41781216,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("GLORIA AMPARO ","PEREZ OSSA","2001-01-07",51562804,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("GUSTAVO ADOLFO ","DIAZ VERA","2001-01-07",13541790,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("HERMES JACOBO ","GARCIA GUACANEME","2001-01-07",79514499,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("INGRID MAGALY ","GONZALEZ ROMERO","2001-01-07",52504235,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("JOHANNA ULLOA ","GUARIN","2001-01-07",52386987,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("JORGE HERNANDO" ,"DUEÑAS GOMEZ","2001-01-07",19296439,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("JORGE HUMBERTO" ,"REINA RUEDA","2001-01-07",79055667,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("JUAN DE JESUS" ,"VALENCIA AREVALO","2001-01-07",79503076,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("KAREN IVETTE", "MANOSALVA GOMEZ","2001-01-07",52848172,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("KETTY ","LOPEZ CONEO","2001-01-07",45761623,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota"),
("KETTY ","LOZANO PEREA","2001-01-07",54255464,"Carrera 10 No. 27 – 27 Edificio Bachue ","Bogota");

insert into administrador(idusuario,nombreAdministrador,apellidoAdministrador,fechaNacimiento,nodocumentoadministrador,telefonoAdministrador,direccionAdministrador,ciudadadministrador)
values(1,"Antonio josé","reodrigo camacho","1991-02-12",123456789,987654321,"call 134 bis 93 b 51", "Bogota");

insert into encuesta(idAdministrador,fechaDeInicioEncuesta,fechaDeFinEncuesta)
values(1,"2019-12-1","2019-12-31"),
(1,"2019-01-1","2019-02-1"),
(1,"2019-02-1","2019-03-1"),
(1,"2019-03-1","2019-04-1"),
(1,"2019-04-1","2019-05-1"),
(1,"2019-05-1","2019-06-1"),
(1,"2019-06-1","2019-07-1"),
(1,"2019-07-1","2019-08-1");

insert into producto(nombreProducto,imagenProducto,costoUnitario,descripcion)
values ("hamburguesa","img_pan_para_hamburguesa_28980_orig.jpg",9000,"la hamburguesa tiene carne de nobillo"),
("Perro","img_pan_para_hamburguesa_28980_orig.jpg",7000,"El perro tiene salchicha americana"),
("salchipapa","img_pan_para_hamburguesa_28980_orig.jpg",11000,"traen queso, jamon,pollo,champiñon,carne desmechada"),
("mazorcada","img_pan_para_hamburguesa_28980_orig.jpg",15000,"tiene de todo"),
("Pataconada","img_pan_para_hamburguesa_28980_orig.jpg",15000,"Mango");

insert into preguntas(texPreguntas,clasificar)
values("Tuvo una buena experiencia en nuestro restaurante","importante"),
("¿Te encuentras satisfecho con nuestro servicio?","importante"),
("¿Crees que nuestro menú es variado?","importante"),
("¿Considera usted que tardan en atenderte?","importante"),
("¿Recibio su ordenaste?","importante");

insert into promociones(idAdministrador,producto,inicioPromocion,finpromocion,imagenPromocion)
values(1,"hamburguesa","2019-12-1","2020-01-15","k.png"),
(1,"Perro","2019-12-1","2020-01-15","k.png");

insert into queja(fechaDeQueja,comentario,prioridad,respuesta,idSucursal,idCliente)
values("2019-12-7","La atencion ha sido pesima",1,"---",1,7),
("2019-11-17","La sopa tenia un pelo",2,"---",1,4),
("2019-12-4","Alimentos en mal estado",2,"---",1,9);

insert into recervacion(hora,fechaRecervacion,EstadoRecervacion,tipoDeEvento,CantidadClientes,idCliente,idSucursal)
values("6:00:00","2019-12-24",1,"Cumpleaños",13,6,1),
("3:00:00","2019-12-24",1,"Cumpleaños",12,1,1),
("1:00:00","2019-12-31",1,"Cumpleaños",8,2,1),
("4:00:00","2019-12-15",1,"Cumpleaños",7,3,1);
insert into empleado(nombreEmpleado,apellidoEmpleado,numeroDocumento,fechaNacimiento,DescripcionEmpleado,idTipoDoc)
values("Juan Antonio","Melo Roberto",100458792,"1999-02-13","Se encarga de elborar las carnes de la parrilla",1);
insert into tipoDoc(TipoDocumento)
values("C.C"),("T.P"),("R.C"),("C.E");
select * from recervacion;
select * from queja;
select * from producto;
select * from cliente;
select * from administrador;
select * from encuesta;


desc administrador;
desc cliente ;
desc cliente_has_Promociones;
desc detallepromocion;
desc encuesta;
desc producto;
desc preguntas;
desc preguntas_has_respuesta;
desc promociones;
desc queja;
desc recervacion;
desc respuesta;
desc sucursal;
desc usuario;
desc empleado;
-- ver promociones--
select inicioPromocion,finPromocion, imagenPromocion
from promociones;
-- ver empleados vista administrador --
select * from empleado;
-- calificar producto --
select nombreProducto,imagenProducto,Descripcion
from producto;
-- Calificar empleado --
select nombreEmpleado, descripcionEmpleado,fotoempleado
from empleado;
-- consultar calificaciones usuario --
select 