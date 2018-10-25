use PuntoVenta2

--CREAR BASE DE DATOS PARA PRACTICA
create table Sucursal(
iIdSucursal int not null primary key,
vNombre varchar(50) not null,
vUbicacion varchar(75) not null,
iCP int not null,
)

insert into Sucursal values (1, 'Aurrera', 'Sendero', 66030)
insert into Sucursal values (2, 'Aurrera', 'Gonzalitos', 64610)
insert into Sucursal values(3, 'HEB','Las Lomas', 66045)
insert into Sucursal values(4, 'HEB','Escobedo', 66031)

create table Cajero(
iIdEmpleado int not null primary key,
vNombres varchar(100) not null,
vApellidoPat varchar(50) not null,
vApellidoMat varchar(50) not null,
iEdad int not null,
cTurno char not null,
iSucursal int not null foreign key references Sucursal(iIdSucursal)
)

insert into Cajero values (1,'Bruno','Martinez','Tovar',19,1,1)
insert into Cajero values (2,'Laura Denise','Navarro','Reyes',19,2,1)
insert into Cajero values (3,'Osmar Francisco','Morales','Martinez',21,1,1)
insert into Cajero values (4,'Alondra','Rivas','Mora',18,2,1)
insert into Cajero values (5,'Cesar Alejandro','Saucedo','Coronado',20,2,2)
insert into Cajero values (6,'Lesly Alejandra','Limas','Macias',18,1,2)
insert into Cajero values (7,'Estefany','Limas','Macias',18,2,2)
insert into Cajero values (8,'Mauro','Duque','Montemayor',19,1,3)
insert into Cajero values (9,'Jose Arturo','Moore','Orozco',20,1,3) 
insert into Cajero values (10,'Diana Geraldine','Perez','Huerta',18,2,3)   

create table Proveedor(
iIdProv int not null primary key,
vNombre varchar(50) not null,
iContacto int not null
)

insert into Proveedor values (1, 'Lala', 84463447)
insert into Proveedor values (2,'Coca-Cola', 89076543)
insert into Proveedor values (3, 'Bimbo', 81654783)

create table CategoriaProd(
iIdCat int not null primary key,
vNombre varchar(50) not null,
)
insert into CategoriaProd values (1, 'Lacteos')
insert into CategoriaProd values (2, 'Bebidas')
insert into CategoriaProd values (3, 'Panes')

create table Producto(
uIdProducto uniqueidentifier not null primary key,
vNombre varchar (30) not null,
fPrecio float not null,
iIdProv int not null foreign key references Proveedor(iIdProv), 
iIdCat int not null foreign key references CategoriaProd(iIdCat)
)

insert into Producto values (NEWID(),'Leche Entera 1 lto',14.99,1,1)
insert into Producto values (NEWID(),'Crema 250g',11.99,1,1)
insert into Producto values (NEWID(),'Yogurt Fresa 1 lto',12.99,1,1)
insert into Producto values (NEWID(),'Powerade 500 ml',11.99,2,2)
insert into Producto values (NEWID(),'Joya Manzana 600 ml',12.99,2,2)
insert into Producto values (NEWID(),'Coca Cola 600 ml',10.99,2,2)

--INICIO DE PRACTICA 7. STORED PROCEDURES


--SCRIPT
create procedure Proc_Script as
select c.vNombres as 'Nombre Cajero', c.cTurno as 'Turno',
 s.vNombre as 'Tienda', s.vUbicacion as 'Ubicacion' from Cajero as c join Sucursal as s 
 on c.iSucursal = s.iIdSucursal



--5 VISTAS
create procedure Proc_Vista1 as
Update Cajeros_Sucursal1 set Turno = 'M'
where Turno = 1


create procedure Proc_Vista2 as
Update Cajeros_Sucursal1 set Turno = 'V'
where Turno = 2


create proc Proc_Vista3
@sucursal varchar(50)
as
select * from Cajeros_Turno1 where Sucursal=@sucursal

create proc Proc_Vista4
@nombre varchar(50)
as
select * from Cajeros_Sucursal1 where Nombre_Completo like @nombre

create proc Proc_Vista5
@sucursal varchar(50)
as
Select * from Cajeros_Sucursal1 where Nombre_Sucursal like @sucursal


--FUNCION
create function ObtenerTurno(@IdEmpleado int) returns varchar(50) as

begin
	
	declare @verif int;
	declare @turno varchar(50);


	set @verif= (Select c.cTurno from Cajero as c where c.iIdEmpleado = @IdEmpleado);

	if(@verif=1)
		begin
			 set @turno='Matutino';
		end
	else if(@verif=2)
		begin
			 set @turno='Vespertino';
		end
	else if(@verif=3)
		begin
			 set @turno='Nocturno';
		end

	return @turno
end