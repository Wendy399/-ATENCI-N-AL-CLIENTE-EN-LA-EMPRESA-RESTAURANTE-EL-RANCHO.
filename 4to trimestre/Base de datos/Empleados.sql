create database trabajo;
use trabajo;
create table CARGO
(
IDcargo int(4),
Cargo varchar(30),
primary key (IDcargo)
);

create table GENERO 
(
IDgenero char(15),
DescripcionGenero varchar(30),
primary key (IDGenero)
);
create table EMPLEADO
(
	ID int(4),
    Nombre varchar(20),
    Apellido varchar(20),
    FechaNacimiento date,
 	Salario float,
    
	primary key(ID)
);

alter table EMPLEADO add constraint FK_EMPLEADO_CARGO
foreign key(CARGO)
references CARGO(CARGO);


alter table EMPLEADO add constraint FK_EMPLEADO_GENERO
foreign key(GENERO)
references GENERO(GENERO);

show tables;
	 






