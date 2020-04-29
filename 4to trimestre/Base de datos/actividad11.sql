create database Documento;
use Documento;
/* tabla MvtoDocumento */
 create table MvtoDocumento
 (   
	
    MovDoc varchar(5)not null,
    IDListaMvto varchar(3) not null,
    TipoDocumento varchar(3) not null

 );
 
 
/*llave primaria de MvtoDocumento*/
 
 alter table MvtoDocumento add 
 Primary key (MovDoc);
 
 
 
 /* tabla Mvto*/
 
 create table Mvto
 (
	IDListaMvto varchar(3)not null,
    nombreMvto varchar(20)not null
 );
 /*llave primaria de Mvto*/
 
 alter table Mvto add primary key (IDListaMvto);
 
 insert into Mvto (IDListaMvto,nombreMvto)
 values("001","Retiarar Dinero"),
 ("002","consignacion"),
 ("003","prestamos"),
 ("004","giros"),
 ("005","pagos");
 
 
 
 /*tabla tipoDocumento*/
 
 create table tipoDocumento
 (
	
    tipoDocumento varchar(3)not null,
    DescDocumento varchar(30)not null
 );
 /*llave primaria de tipodocumento*/
 
 alter table tipoDocumento add primary key(tipodocumento);
 
 insert into tipodocumento(tipodocumento,descdocumento)
 values ("001","Cheque"),
 ("002","pagare"),
 ("003","factura"),
 ("004","letras de cambio");
 
 /*llaves foranea de MvtoDocumento*/
 
 alter table  MvtoDocumento add constraint FK_MvtoDocumento_Mvto
 foreign key ( IDListaMvto)
 references Mvto(IDListaMvto);
 
 alter table MvtoDocumento add constraint FK_MvtoDocumento_tipoDocuemnto
 foreign key (tipoDocumento)
 references tipoDocumento(tipoDocumento);
 
 /*tabla MAestroDocumento*/
 
 create table MaestroDocumento
 (

ConsecDoc varchar(3),
fechaDoc date,
tipodocumento varchar(3),
codigo varchar(3),
IDcliente varchar(3)
 );
 /* llave primaria de MaestroDocumento*/
 alter table MaestroDocumento add primary key(ConsecDoc);
 /* tabla Empleado*/
 create table Empleado
 (
 
 codigo varchar(3),
 nombre varchar(20),
 apellido varchar(20)
 );
 
 
 /* ingresar datos */
 
 insert into empleado (codigo,nombre,apellido)
 values ("369","Jhonny","Ricardo"),
 ("147","Diana","espinosa"),
 ("564","Alfonso","Joestar");
 
 
 
 /*llave primaria de Empleado*/
 alter table Empleado add primary key (codigo);

 /*tabla Cliente*/
 create table cliente 
 (
 IDcliente varchar(3),
 RazonSocial varchar (20)
 );
 /* llave primaria de Cliente*/
 alter table cliente add primary key (IDcliente);
 
 /*llenar tabla cliente */
 
 insert into cliente(idcliente,razonsocial)
 values("001","quiere una casa"),
 ("007","quiere completar sus estudios"),
 ("041","quere almacenar su dinero");
 
 /*llaves foraneas de MaestroDocumento*/
alter table MaestroDocumento add constraint FK_MaestroDocumento_empleado 
 foreign key (codigo)
 references empleado(codigo);
 
  alter table Maestrodocumento add constraint FK_MaestroDocumento_cliente
 foreign key (Idcliente)
 references cliente(idcliente);
 
alter table Maestrodocumento add constraint FK_MaestroDocumento_tipoDocumento
 foreign key (tipodocumento)
 references tipoDocumento(tipodocumento);
 
 /*tabla DetalleDoc*/
 
 create table DetalleDoc 
 (
 item varchar(2)not null,
 Cantidad numeric (4)not null,
 presioUni numeric(5.2),
 descuento numeric (3),
 concepto varchar (20),
 ConsecDoc varchar(3),
 IdProducto varchar(2)
 );
 
 /*llave primaria de DetalleDoc*/
 alter table DetalleDoc add primary key(item);
 insert into detalledoc(item,cantidad,presioUni,descuento,consepto,consecdoc,idproducto)
 values ("01",0001,15000,300,"prestamo","001","01"),
 ("02",0002,25000,150,"retiro","002","02"),
 ("03",0003,25000,700,"giro","003","03");
 
 
/*tabla Producto*/
create table Producto
(
IdProducto varchar(2),
DesProducto varchar(15)

);	

/*llave primaria de Producto*/
alter table Producto add primary key(IdProducto);

insert into producto(idproducto,desproducto)
values("01","empanada"),
("02","pollo"),
("03","arroz");

/*llaves foraneas de DetalleDoc*/
alter table DetalleDoc add constraint FK_Producto_DetalleDoc
foreign key (IdProducto)
references producto(IdProducto);

alter table DetalleDoc add constraint FK_DetalleDoc_MaestroDocumento
 foreign key(ConsecDoc)
 references MaestroDocumento(ConsecDoc);
 
 /*tabla MaestroMvto*/
create table MaestroMvto
(
	ConsecMvto varchar(3),
    FechaMvto date,
    ValorMvto numeric (7.2),
    IDListaMvto varchar(3),
    IDPeriodoMod varchar (3)
);

/*llave primaria de MaestroMvto*/
alter table MaestroMvto  add primary key (ConsecMvto);

insert into maestromvto(consecmvto,fechamvto,valormvto,idlistamvto,idperiodomod)
values("745","2001-02-05","1500000","01","01"),
("695","2001-04-07","5400000","02","02"),
("745","2001-02-05","8000000","03","03");
/*tabla PeriodoMod*/
create table PeriodoMod
(
	IDPeriodoMod varchar(3),
    DiaMod varchar(1),
    AñoMov varchar(4),
    MesMod varchar(2)
);
/*llave primaria*/
alter table PeriodoMod add primary key (IDPeriodoMod);

insert into periodomob(idperiodomod,diamod,añomov,mesmod)
values ("111","1","2001","02"),
("222","2","2013","07"),
("333","3","2014","04");

/*llaves Foraneas de MaestroMvto*/
alter table MaestroMvto add constraint FK_MaestroMvto_IDListaMvto
foreign key (IDListaMvto)
references Mvto(IDListaMvto);

alter table MaestroMvto add constraint FK_MaestroMvto_IDPEriodoMod
foreign key (IDPeriodoMod)
references PeriodoMod(IDPeriodoMod);


