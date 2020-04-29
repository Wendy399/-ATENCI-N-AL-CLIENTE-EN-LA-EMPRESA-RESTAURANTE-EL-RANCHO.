create database RestauranteRancho;
use RestauranteRancho;


--  Crear tablas 



create table reservacion
(
idReservacion int auto_increment,
nombre varchar(30) not null,
apellido varchar(30) not null,
email varchar(30) not null,
telefono long not null,
Motivo varchar(100) not null,
fecha date,
hora time,
estado enum("Aceptado","Rechazado"),
idUsuario int,
primary key(idReservacion)
);


create table cliente 
(
NumDocumento  int(11),
Nombreclien  varchar(30)not null,
ApellidoClien  varchar(30)not null,
primary key(numDocumento)
);



create table preguntas 
(
idPreguntas int auto_increment,
texPreguntas text not null,
idEncuesta int,
primary key(idPreguntas)
);

create table encuesta
(
idEncuesta int auto_increment,
fechaDeInicioEncuesta date not null,
fechaDeFinEncuesta date not null, 
primary key(idEncuesta)
);

create table promociones 
(
idPromociones int auto_increment,
idAdministrador int,
NombrePromocion varchar(50)not null,
horaInicio time not null,
horaFin time not null,
 inicioPromocion date not null,
 finPromocion date not null,
 imagenPromocion blob not null,
 primary key(idPromociones)
);

create table detallePromocion
(
idDetallePromocion int auto_increment,
idpromociones int,
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



create table Usuario
(
  numDocumento int (11)not null auto_increment,
  Correo varchar (45) unique,
  Contrasena varchar (100),
  Estado int (1),
  Rol int(1),

primary key (numDocumento)
);

create table administrador
(
numDocumento int (11)not null auto_increment,
nombreAdmi varchar(45)not null,
apellidoAdmi varchar(45)not null,
primary key(numDocumento)
);

create table cliente_Has_promociones
(
idCliente int,
idPromociones int,
foreign key(idCliente)references cliente ,
foreign key(idPromociones)references promociones
);

create table detallePregunta
(
numdocumento int,
idPreguntas int,
idencuesta int,
calificacion Enum("Muy mal","Mal","Regular","Buena","Muy buena"),
foreign key(idencuesta)references encuesta,
foreign key(numdocumento)references cliente,
foreign key(idPreguntas)references preguntas
);

alter table preguntas add foreign key(idEncuesta) references encuesta(idEncuesta);
alter table reservacion add foreign key(idusuario)references usuario(idusuario);
alter table promociones add foreign key(idadministrador)references administrador(idAdministrador);
alter table detallepromocion add foreign key(idPromociones)references promociones(idpromociones);


show tables;

select count(*) as "numero de tablas" from Information_Schema.Tables where TABLE_TYPE = 'BASE TABLE' 
and table_schema = 'RestauranteRancho' ;

insert into usuario(correo,contrasena,estado,rol,numDocumento)
values("tenshicastelblanco@gmail.com","123456",1,1,1000458057);

insert into cliente(numdocumento, nombreclien, apellidoclien)
values (1000458057, "Edwin","vanegas"); 	

INSERT INTO reservacion(nombre, apellido, email, telefono, motivo, fecha, hora, estado,idUsuario) 
VALUES ('jhonny','ricardo','seb.566@gmail.com','3112561621','Porque quiero','2020-12-12','24:24:00',1,1);




insert into encuesta(idAdministrador,fechaDeInicioEncuesta,fechaDeFinEncuesta,idusuario)
values(1,"2019-12-1","2019-12-31",1);

insert into producto(nombreProducto,imagenProducto,costoUnitario,descripcion)
values ("hamburguesa","img_pan_para_hamburguesa_28980_orig.jpg",9000,"la hamburguesa tiene carne de nobillo"),
("Perro","img_pan_para_hamburguesa_28980_orig.jpg",7000,"El perro tiene salchicha americana"),
("salchipapa","img_pan_para_hamburguesa_28980_orig.jpg",11000,"traen queso, jamon,pollo,champiñon,carne desmechada"),
("mazorcada","img_pan_para_hamburguesa_28980_orig.jpg",15000,"tiene de todo"),
("Pataconada","img_pan_para_hamburguesa_28980_orig.jpg",15000,"Mango");
insert into preguntas(texpreguntas,idencuesta)
values ("Le gusto la comida",1);

insert into preguntas(texPreguntas)
values("Tuvo una buena experiencia en nuestro restaurante"),
("¿Te encuentras satisfecho con nuestro servicio?"),
("¿Crees que nuestro menú es variado?"),
("¿Considera usted que tardan en atenderte?"),
("¿Recibio su ordenaste?");

insert into promociones(idAdministrador,nombrePromocion,horainicio,horafin,inicioPromocion,finpromocion,imagenPromocion)
values(1,"La salchichonada","10:25:00","24:00:00","2019-12-1","2020-01-15","k.png"),
(1,"Barbacoa de 10","10:25:00","24:00:00","2019-12-1","2020-01-15","k.png");





select * from producto;
select * from cliente;
select * from administrador;
select * from encuesta;


desc administrador;
desc cliente ;
desc cliente_has_Promociones;
desc detallepromocion;
desc producto;
desc preguntas;
desc promociones;
desc recervacion;
desc sucursal;
desc usuario;
-- ver promociones--
select inicioPromocion,finPromocion, imagenPromocion
from promociones;

-- calificar producto --

insert into detallepregunta(NumDocumento,idPreguntas,calificacion)
values(1000324470,1,4),
(1000324470,2,2),
(1000324470,3,1),
(1000324470,4,1),
(1000324470,5,5);

select cliente.Nombreclien, preguntas.texpreguntas, sum(calificacion)
from cliente,detallepregunta,preguntas
where cliente.NumDocumento=detallepregunta.NumDocumento and preguntas.idPreguntas=detallepregunta.idPreguntas;


select concat(nombreclien, apellidoclien) , encuesta.idencuesta, sum(calificacion)
from detallepregunta,cliente,encuesta,preguntas
where cliente.NumDocumento=detallepregunta.NumDocumento and preguntas.idPreguntas=detallepregunta.idPreguntas and encuesta.idEncuesta=preguntas.idEncuesta;

-- consultar ecuesta Administrador --
select idpreguntas,texpreguntas,fechadeinicioEncuesta,fechaDeFinEncuesta
from preguntas
inner join encuesta;
SELECT nombre , apellido from cliente,usuario
	where cliente.numDocumento=usuario.numDocumento;


-- consultar calificaciones administrador--

select concat(cliente.nombre," ",cliente.apellido),encuesta.idEncuesta,sum(preguntas.Calificacion)
from cliente,usuario,encuesta,preguntas
where cliente.idCliente=usuario.idUsuario and usuario.idUsuario=encuesta.idUsuario and encuesta.idEncuesta=preguntas.idEncuesta;


SELECT cliente.nombre, cliente.apellido  ,encuesta.idEncuesta,sum(preguntas.Calificacion)
	FROM cliente,usuario,encuesta,preguntas
	WHERE usuario.idUsuario=cliente.idUsuario and usuario.idUsuario=encuesta.idUsuario and encuesta.idEncuesta=preguntas.idEncuesta;

select nombre, correo 
from usuario,cliente 
where usuario.idUsuario=cliente.idUsuario;



select nombrecliente , idUsuario, correo
from usuario, cliente 
where idcliente=idusuario;


SELECT TEXPREGUNTAS FROM PREGUNTAS group by texpreguntas order by idencuesta desc limit 5;