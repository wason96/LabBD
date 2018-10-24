use PuntoVenta2

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

-- Comienzo de Practica 6
select * from Cajero 
select * from Producto


-- 3 Subconsultas
select * from 
	(select iEdad, count(iEdad) as Cantidad_Cajeros from Cajero group by iEdad ) 
as Cant_Cajeros order by iEdad desc

select * from
(select * from Cajero where iIdEmpleado >=5)
as Cajeros order by vNombres asc

select * from
(select vNombre, count(vNombre) as Cant_Sucursales from Sucursal group by vNombre)
as Cant_Sucursales

-- Subconsulta con with
with Cajeros_Suc_1 as
(select *  from Cajero)
select *  from Cajeros_Suc_1 where iSucursal =1

-- Crear 5 Vistas
create view Cajeros_Turno1 as 
select c.vNombres + ' ' + c.vApellidoPat + ' ' + c.vApellidoMat as Nombre_Completo, c.cTurno as Turno, s.vNombre as Sucursal
from Cajero as c inner join Sucursal as s on c.iSucursal = s.iIdSucursal where c.cTurno=1

select * from Cajeros_Turno1 

create view Cajeros_Turno2 as 
select c.vNombres + ' ' + c.vApellidoPat + ' ' + c.vApellidoMat as Nombre_Completo, c.cTurno as Turno, s.vNombre as Sucursal
from Cajero as c inner join Sucursal as s on c.iSucursal = s.iIdSucursal where c.cTurno=2

select * from Cajeros_Turno2

create view Productos_Prov1 as
select p.vNombre as Nombre_Producto,p.fPrecio as Precio_Producto,pro.vNombre as Nombre_Proovedor 
from Producto as p inner join Proveedor as pro on p.iIdProv = pro.iIdProv where p.iIdProv = 1

select * from Productos_Prov1 

create view Productos_Prov2 as
select p.vNombre as Nombre_Producto,p.fPrecio as Precio_Producto,pro.vNombre as Nombre_Proovedor 
from Producto as p inner join Proveedor as pro on p.iIdProv = pro.iIdProv where p.iIdProv = 2

select * from Productos_Prov2 

create view Cajeros_Sucursal1 as 
select c.vNombres + ' ' + c.vApellidoPat + ' ' + c.vApellidoMat as Nombre_Completo, c.cTurno as Turno, s.vNombre as Nombre_Sucursal
from Cajero as c inner join Sucursal as s on c.iSucursal = s.iIdSucursal where c.iSucursal=1

select * from Cajeros_Sucursal1 

-- 1 Consulta Dinámica -- 
declare @id varchar(50)
set @id = ' where iIdEmpleado >=5' 
declare @query varchar(50)
set @query = 'select * from Cajero' + @id
exec(@query)