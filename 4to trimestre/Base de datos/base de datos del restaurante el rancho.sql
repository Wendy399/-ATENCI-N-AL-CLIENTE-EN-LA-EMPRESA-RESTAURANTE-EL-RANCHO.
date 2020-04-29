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
estadoRecervacion varchar(20)not null,
tipoDeEvento varchar(20)not null, 
cantidadClientes int not null,
idCliente int,
idSucursal int,
primary key(idRecervacion),
foreign key(idCliente)references Cliente,
foreign key(idSucursal)references sucursal 
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
primary key(idQueja),
foreign key(idSucursal)references sucursal,
foreign key(idCliente)references cliente
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
primary key(idRespuesta),
foreign key(idCliente)references cliente ,
foreign key(idPreguntas)references preguntas
);

create table preguntas 
(
idPreguntas int auto_increment,
texPreguntas text not null,
clasificar varchar (20)not null,
primary key(idPreguntas)
);

create table encuesta
(
idEncuesta int auto_increment,
idAdministrador int,
fechaDeInicioEncuesta date not null,
fechaDeFinEncuesta date not null, 
primary key(idEncuesta),
foreign key(idAdministrador)references administrador
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
primary key(idAdministrador),
foreign key(idUsuario)references usuario
);

create table promociones 
(
idPromociones int auto_increment,
idAdministrador int,
producto varchar(15)not null,
 inicioPromocion date not null,
 finPromocion date not null,
 imagenPromocion blob not null,
 primary key(idPromociones),
 foreign key(idAdministrador)references administrador
);

create table detallePromocion
(
idDetallePromocion int auto_increment,
idProducto int,
idPromociones int,
precioPromociones double not null,
describcionPromocion varchar(500)not null,
primary key(idDetallePromocion),
foreign key(idProducto)references producto,
foreign key(idPromociones)references promociones
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

show tables;

select count(*) as "numero de tablas" from Information_Schema.Tables where TABLE_TYPE = 'BASE TABLE' 
and table_schema = 'RestauranteRancho' ;

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

select * from cliente;
select * from administrador;
