--Creacion de BD
create database PuntoVenta2
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

select * from Sucursal


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

select *  from Cajero


create table Proveedor(
iIdProv int not null primary key,
vNombre varchar(50) not null,
iContacto int not null
)

insert into Proveedor values (1, 'Lala', 84463447)
insert into Proveedor values (2,'Coca-Cola', 89076543)
insert into Proveedor values (3, 'Bimbo', 81654783)

select * from Proveedor


create table CategoriaProd(
iIdCat int not null primary key,
vNombre varchar(50) not null,
)
insert into CategoriaProd values (1, 'Lacteos')
insert into CategoriaProd values (2, 'Bebidas')
insert into CategoriaProd values (3, 'Panes')

select * from CategoriaProd


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

select * from Producto

--Practica 5

create table Tarea(
iId int not null primary key,
vTarea varchar(50) not null
)
insert into Tarea values(1, 'Esto es un ejemplo')
insert into Tarea values(2, 'de lo de insert into')
insert into Tarea values(3, 'junto con el drop table')
insert into Tarea values(4, 'Este es el mismo ejemplo')
insert into Tarea values(5, 'para la practica 5')


select vNombres as Names_Only from Cajero
select vApellidoPat + ' ' + vApellidoMat as Apellidos from Cajero
select SUBSTRING(vNombres, 1 , 10) as Half_Names from Cajero
select vNombres + ' ' + vApellidoPat as Nombre_Apellido from Cajero 
select vNombres + ' ' + vApellidoPat + ' ' + vApellidoMat as Nombre_Completo from Cajero


select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal,s.vUbicacion,s.iCP from Cajero as c join Sucursal as s on s.iIdSucursal = c.iSucursal
select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal,s.vUbicacion,s.iCP from Cajero as c inner join Sucursal as s on s.iIdSucursal = c.iSucursal
select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal,s.vUbicacion,s.iCP from Cajero as c left join Sucursal as s on s.iIdSucursal = c.iSucursal
select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal,s.vUbicacion,s.iCP from Cajero as c right join Sucursal as s on s.iIdSucursal = c.iSucursal


select iIdEmpleado, vNombres as Nombre from Cajero where iEdad>19
select iIdEmpleado as Id_Turno1 from Cajero where cTurno=1
select vApellidoPat + ' ' + vApellidoMat as Apellidos_Suc2 from Cajero where iSucursal=3 order by Apellidos_Suc2 Desc
select vNombre as Nombre_Prod from Producto where fPrecio>12
select vNombre,fPrecio from Producto where iIdCat = 1

 
select iEdad, COUNT(iEdad) as Numero_Cajeros from Cajero group by iEdad
select fPrecio, Count(fPrecio) as Cantidad_Productos from Producto group by fPrecio
select p.iIdProv,pro.vNombre, Count(p.iIdProv) as Cant_Productos from Producto as p inner join Proveedor as pro on pro.iIdProv=p.iIdProv group by p.iIdProv,pro.vNombre  
select COUNT(vNombres) as Empelados_Sucursal1 from Cajero where iSucursal =1
select AVG(iEdad) as Edad_Promedio from Cajero 


select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal from Cajero as c join Sucursal as s on s.iIdSucursal = c.iSucursal group by c.cTurno,c.vNombres,c.iSucursal,s.vNombre
select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal from Cajero as c join Sucursal as s on s.iIdSucursal = c.iSucursal group by c.iSucursal,s.vNombre,c.vNombres,c.cTurno
select c.vNombres as Nombre, c.cTurno,c.iSucursal as Sucursal,s.vNombre as Nombre_Sucursal from Cajero as c join Sucursal as s on s.iIdSucursal = c.iSucursal group by s.vNombre,c.vNombres,c.iSucursal,c.cTurno

select * into #Tarea from Proveedor

select * from #Tarea

drop table #Tarea
drop table Tarea
