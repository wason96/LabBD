--INTEGRANTES
--EIMY VERONICA RODRIGUEZ RODRIGUEZ 1807142
--BRUNO MARTINEZ TOVAR 1687064
--OSMAR FRANCISCO MORALES MARTINEZ 1887839
--LAURA DENISE NAVARRO REYES 1726593
--JUAN CARLOS ESQUIVEL RANGEL 1807521


--CREACION DE BASE DE DATOS -------------------------------------------------------------------
--CREACION DE BASE DE DATOS -------------------------------------------------------------------
--CREACION DE BASE DE DATOS -------------------------------------------------------------------


create database Punto_de_Venta
use Punto_de_Venta

create table Proveedor(
	iId_Proveedor int primary key,
	vNombre_Pvd varchar(50) NOT NULL,
	iTelefono_Pvd bigint NOT NULL,
	cTipo_Pvd char(1) NOT NULL,
	bStatus_Pvd bit NOT NULL,
)

create table Producto_Area(
	iIdArea_Pd tinyint primary key,
	vNombre_Area varchar(50) NOT NULL,
)

create table Producto(
	iCodigoBarras_Pd bigint primary key,
	vNombre_Pd varchar(200) NOT NULL,
	iId_Proveedor int foreign key references Proveedor(iId_Proveedor),
	iIdArea_Pd tinyint foreign key references Producto_Area(iIdArea_Pd),
	bStatus_Pd bit NOT NULL,
)

create table Producto_Precio(
	iCodigoBarras_Pd bigint foreign key references Producto(iCodigoBarras_Pd) NOT NULL,
	dFecha_Inicio datetime NOT NULL,
	mPrecio_Pd decimal NOT NULL,
)

create table Almacen(
	iCodigoBarras_Pd bigint foreign key references Producto(iCodigoBarras_Pd) NOT NULL,
	mPrecio_Compra decimal NOT NULL,
	iCantidad_Pd bigint NOT NULL,
)

create table Puesto_Empleado(
	iIdPuesto_Edo tinyint primary key,
	vNombre_Puesto varchar(25) NOT NULL,

)

create table Cuenta_Empleado(
	iIdCuenta_Edo int primary key,
	iCodigo_Acceso int NOT NULL,
	cPrivilegio_Edo char(1) NOT NULL,
)

create table Empleado(
	iId_Empleado int primary key,
	vNombre_Edo varchar(50) NOT NULL,
	vApellidoP_Edo varchar(50) NOT NULL,
	vApellidoM_Edo varchar(50) NOT NULL,
	iTelefono_Edo bigint NOT NULL,
	iIdPuesto_Edo tinyint  foreign key references Puesto_Empleado(iIdPuesto_Edo)NOT NULL,
	iIdCuenta_Edo int foreign key references Cuenta_Empleado(iIdCuenta_Edo) NOT NULL,
	bStatus_Edo bit NOT NULL,
)

create table Cliente(
	iId_Cliente int primary key,
	vNombre_Cl varchar(50) NOT NULL,
	vApellidoP_Cl varchar(50) NOT NULL,
	vApellidoM_Cl varchar(50) NOT NULL,
	iTelefono_Cl bigint NOT NULL,
	vRFC_Cl varchar(13) NOT NULL,
	bStatus_Cl bit NOT NULL,
)

create table Tarjeta_Puntos(
	iId_Tarjeta uniqueidentifier primary key,
	iId_Cliente int foreign key references Cliente(iId_Cliente),
	iPuntos_Disp int NOT NULL,
)

create table Header_Factura(
	iId_HFactura int primary key,
	iId_Cliente int foreign key references Cliente(iId_CLiente) NOT NULL,
	iId_Empleado int foreign key references Empleado(iId_Empleado) NOT NULL,
	dFecha_Venta datetime NOT NULL,
	iTotal_Venta decimal NOT NULL,
	bStatus_HF bit NOT NULL,
)

create table Prov_MP(
	iId_ProvMP int primary key,
	vNombre_ProvMP varchar(50),
)

create table MetodoPago(
	iIdMetodo_Pago tinyint primary key not null,
	vNombre_MP varchar(25) not null,
	iId_Proveedor int foreign key references Prov_MP(iId_ProvMP),
	bStatus_MP bit not null
)

create table Pago_Factura(
	iIdPago_Factura uniqueidentifier primary key not null,
	iId_HFactura int foreign key references Header_Factura(iId_HFactura),
	iIdMetodo_Pago tinyint foreign key references MetodoPago(iIdMetodo_Pago) NOT NULL,
	iCantidad_PagoF decimal NOT NULL,
	bStatus_PagoF bit NOT NULL,
)

create table Producto_Factura(
	iId_ProdF int primary key NOT NULL,
	iId_HFactura int foreign key references Header_Factura(iId_HFactura) NOT NULL,
	iId_Producto bigint foreign key references Producto(iCodigoBarras_Pd) NOT NULL,
	iCantidad_PdF int NOT NULL,
	bStatus_PdF bit NOT NULL,
)

create table Descuento(
	iId_Descuento int primary key,
	iCodigoBarras_Pd bigint foreign key references Producto(iCodigoBarras_Pd) NOT NULL,
	vNombre_D varchar(50) NOT NULL,
	iPorcentaje_D int NOT NULL,
	dtFecha_InD datetime NOT NULL,
	dtFecha_FinD datetime NOT NULL,
)

create table Devolucion_Producto(
	iIdDevolucion_Pd int NOT NULL,
	iCodigoBarras_Pd bigint foreign key references Producto(iCodigoBarras_Pd) NOT NULL,
	dtFecha_DePd datetime NOT NULL,
	vDescripcion varchar(50) NOT NULL,
	dPrecio_DePd decimal NOT NULL,
)

create table Descuento_Factura(
	iId_HFactura int foreign key references Header_Factura(iId_HFactura) NOT NULL,
	iId_Descuento int foreign key references Descuento(iId_Descuento) NOT NULL,
	iCant_DF int NOT NULL,
)

--INSERTS  -------------------------------------------------------------------------------------
--INSERTS  -------------------------------------------------------------------------------------
--INSERTS  -------------------------------------------------------------------------------------

insert into Producto_Area values(1, 'Lácteos')
insert into Producto_Area values(2, 'Jugos y Bebidas')
insert into Producto_Area values(3, 'Postres Congelados')
insert into Producto_Area values(4, 'Dulces y Chocolates')
insert into Producto_Area values(5, 'Galletas')
insert into Producto_Area values(6, 'Salsas y Aderezos')
insert into Producto_Area values(7, 'Botanas y Fruta Seca')
insert into Producto_Area values(8, 'Pan y Tortillas Empacados')
insert into Producto_Area values(9, 'Enlatados y Conservas')
insert into Producto_Area values(10, 'Especias y Sazonadores')
insert into Producto_Area values(11, 'Café, Té y Sustitutos')
insert into Producto_Area values(12, 'Cereales y Barras')
insert into Producto_Area values(13, 'Mermeladas y Miel')
insert into Producto_Area values(14, 'Arroz, Frijol y Semillas')
insert into Producto_Area values(15, 'Aceites de Cocina')
insert into Producto_Area values(16, 'Alimentos Instantáneos')
insert into Producto_Area values(17, 'Leche Evaporada, Condensada, otros')
insert into Producto_Area values(18, 'Pastelillos')

insert into Proveedor values(1,'The Coca Cola Company México', '018007044400', 'p', 1)
insert into Proveedor values(2,'Sello Rojo', '018006277656', 'p', 1)
insert into Proveedor values(3,'Mexenil', '018007006050', 'p', 1)
insert into Proveedor values(4,'Alpura', '018000025787', 'p', 1)
insert into Proveedor values(5,'Bimbo', '018009102030', 'p', 1)
insert into Proveedor values(6,'Bonafont', '018009992662', 'p', 1)
insert into Proveedor values(7,'Nestlé', '018003637853', 'p', 1)
insert into Proveedor values(8,'Sabritas', '018009019500', 'p', 1)
insert into Proveedor values(9,'PepsiCo', '018000032762', 'p', 1)
insert into Proveedor values(10,'McCormick & Company', '018000031807', 'p', 1)
insert into Proveedor values(11,'Unilever', '018007157444', 'p', 1)
insert into Proveedor values(12,'Marinela', '018009102300', 'p', 1)
insert into Proveedor values(13,'Papas Genéricas', '018002323792', 'p', 1)
insert into Proveedor values(14,'Cocas Genéricas', '018007890345', 'p', 1)
insert into Proveedor values(15,'Tacos Doña Lala', '018000987654', 'p', 1)

insert into Producto values(00750102051534, 'Leche Entera 250ml', 2, 1, 1)
insert into Producto values(00750102051530, 'Leche Entera 500ml', 2, 1, 1)
insert into Producto values(00750102051526, 'Leche Entera 1L', 2, 1, 1)
insert into Producto values(00750102051522, 'Leche Deslactosada 1L', 2, 17, 1)
insert into Producto values(00750105532168, 'COCA-COLA 500ml Botella', 1, 2, 1)
insert into Producto values(00750105531250, 'Sprite 500ml Botella', 1, 2, 1)
insert into Producto values(00750105533300, 'Fanta 500ml Botella', 1, 2, 1)
insert into Producto values(00750105534000, 'Sidral Mundet 500ml Botella', 1, 2, 1)
insert into Producto values(00750106555678, 'Gansito', 12, 18, 1)
insert into Producto values(00750106532334, 'Barritas: Fresa', 12, 5, 1)
insert into Producto values(00750106510001, 'ChocoRoles', 12, 18, 1)
insert into Producto values(00750106506432, 'Pingüinos', 12, 18, 1)
insert into Producto values(00750106545852, 'Príncipe', 12, 5, 1)
insert into Producto values(00750106545851, 'Canelitas', 12, 5, 1)
insert into Producto values(00750106548000, 'Triki-trakes', 12, 5, 1)
insert into Producto values(00750106516173, 'Submarinos: Fresa', 12, 18, 1)
insert into Producto values(00750106500540, 'Sponch', 12, 5, 1)
insert into Producto values(00750106511308, 'Suavicremas: Vainilla', 12, 5, 1)
insert into Producto values(00750107040645, 'Mermelada', 7, 13, 1)
insert into Producto values(00750105861106, 'Leche evaporada carnation clavel la original 360 g', 1, 17, 1)

insert into Producto_Precio values (00750102051534, '20180707', 10)
insert into Producto_Precio values (00750102051530, '20180621', 15)
insert into Producto_Precio values (00750102051526, '20180621', 20)
insert into Producto_Precio values (00750102051522, '20180501', 20)
insert into Producto_Precio values (00750105532168, '20180501', 12)
insert into Producto_Precio values (00750105531250, '20180621', 12)
insert into Producto_Precio values (00750105533300, '20180501', 12)
insert into Producto_Precio values (00750105534000, '20180501', 12)
insert into Producto_Precio values (00750106555678, '20180501', 10)
insert into Producto_Precio values (00750106532334, '20180707', 15)
insert into Producto_Precio values (00750106510001, '20180707', 15)
insert into Producto_Precio values (00750106506432, '20180621', 15)
insert into Producto_Precio values (00750106545852, '20180501', 17)
insert into Producto_Precio values (00750106545851, '20180501', 15)
insert into Producto_Precio values (00750106548000, '20180707', 16)
insert into Producto_Precio values (00750106516173, '20180501', 18)
insert into Producto_Precio values (00750106500540, '20180621', 13)
insert into Producto_Precio values (00750106511308, '20180707', 18)
insert into Producto_Precio values (00750107040645, '20180621', 20)
insert into Producto_Precio values (00750105861106, '20180131', 15)

insert into Almacen values (00750102051534, 10, 75)
insert into Almacen values (00750102051530, 15, 56)
insert into Almacen values (00750102051526, 20, 50)
insert into Almacen values (00750102051522, 20, 23)
insert into Almacen values (00750105532168, 12, 33)
insert into Almacen values (00750105531250, 12, 24)
insert into Almacen values (00750105533300, 12, 54)
insert into Almacen values (00750105534000, 12, 67)
insert into Almacen values (00750106555678, 10, 12)
insert into Almacen values (00750106532334, 15, 23)
insert into Almacen values (00750106510001, 15, 28)
insert into Almacen values (00750106506432, 15, 65)
insert into Almacen values (00750106545852, 17, 54)
insert into Almacen values (00750106545851, 15, 75)
insert into Almacen values (00750106548000, 16, 86)
insert into Almacen values (00750106516173, 18, 54)
insert into Almacen values (00750106500540, 13, 35)
insert into Almacen values (00750106511308, 18, 87)
insert into Almacen values (00750107040645, 20, 50)
insert into Almacen values (00750105861106, 15, 25)

insert into Cuenta_Empleado values (1,6452,1)
insert into Cuenta_Empleado values (2,8254,1)
insert into Cuenta_Empleado values (3,1793,1)
insert into Cuenta_Empleado values (4,1379,1)
insert into Cuenta_Empleado values (5,3791,1)
insert into Cuenta_Empleado values (6,2468,1)
insert into Cuenta_Empleado values (7,0275,1)
insert into Cuenta_Empleado values (8,3416,0)
insert into Cuenta_Empleado values (9,6962,0)
insert into Cuenta_Empleado values (10,7316,1)
insert into Cuenta_Empleado values (11,2481,0)

insert into Descuento values (1,750102051522, 'Descuento Leche', 10, '20180707', '20180708')
insert into Descuento values (2,750102051526, 'Descuento Leche', 10, '20180621', '20180628')
insert into Descuento values (3,750102051530, 'Descuento Leche', 10, '20180621', '20180629')
insert into Descuento values (4,750102051534, 'Descuento Leche', 10, '20180501', '20180610')
insert into Descuento values (5,750105531250, 'Descuento Refresco', 15, '20180501', '20180520')
insert into Descuento values (6,750105532168, 'Descuento Refresco', 15, '20180621', '20180712')
insert into Descuento values (7,750105533300, 'Descuento Refresco', 15, '20180501', '20180608')
insert into Descuento values (8,750105534000, 'Descuento Refresco', 15, '20180501', '20180528')
insert into Descuento values (9,750105861106, 'Descuento Leche', 10, '20180501', '20180613')
insert into Descuento values (10,750106500540, 'Descuento Galletas', 20, '20180707', '20180721')
insert into Descuento values (11,750106506432, 'Descuento Postres', 20, '20180707', '20180719')

insert into Puesto_Empleado values (1,'Cajero')
insert into Puesto_Empleado values (2, 'Administrador')

insert into Empleado values (1,'Osmar Francisco','Morales','Martinez',33487952,1,1,1)
insert into Empleado values (2,'Laura Denise','Navarro','Reyes',19143048,2,2,0)
insert into Empleado values (3,'Bruno','Martinez','Tovar',21796438,1,3,1)
insert into Empleado values (4 ,'Alondra','Rivas','Mora',18176483,1,4,1)
insert into Empleado values (5,'Cesar Alejandro','Saucedo','Coronado',20015437,2,5,0)
insert into Empleado values (6,'Lesly Alejandra','Limas','Limas',18970164,2,6,1)
insert into Empleado values (7,'Estefany','Limas','Macias',18824901,2,7,0)
insert into Empleado values (8,'Mauro','Duque','Montemayor',24379104,1,8,0)
insert into Empleado values (9,'Arturo','Moore','Orozco',20349627,1,9,1) 
insert into Empleado values (10,'Diana Geraldine','Perez','Huerta',14253718,2,10,1) 
insert into Empleado values (11,'Paulina','Navarrro','Reyes',97853416,1,1,0)  

insert into Prov_MP values (1,'Banamex')
insert into Prov_MP values (2,'Bancomer')
insert into Prov_MP values (3,'HSBC')
insert into Prov_MP values (4,'Santander')
insert into Prov_MP values (5,'BanRegio')
insert into Prov_MP values (6,'Empresa Local')
insert into Prov_MP values (7,'Banxico')

insert into MetodoPago values (1,'Tarjeta de Crédito', 1,1 )
insert into MetodoPago values (2,'Tarjeta de Crédito', 2,1 )
insert into MetodoPago values (3,'Tarjeta de Crédito', 3,1 )
insert into MetodoPago values (4,'Tarjeta de Crédito', 4,1 )
insert into MetodoPago values (5,'Tarjeta de Crédito', 5,1 )
insert into MetodoPago values (6,'Tarjeta de Débito', 1,1 )
insert into MetodoPago values (7,'Tarjeta de Débito', 2,1 )
insert into MetodoPago values (8,'Tarjeta de Débito', 3,1 )
insert into MetodoPago values (9,'Tarjeta de Débito', 4,1 )
insert into MetodoPago values (10,'Tarjeta de Débito', 5,1 )
insert into MetodoPago values (11,'Tarjeta de Puntos', 6,1 )
insert into MetodoPago values (12,'Efectivo', 7,1 )

insert into Cliente values (001, 'Enrique', 'Acevedo', 'Ruiz',8111479865, 'ACRE681121AE3',1)
insert into Cliente values (002, 'Carolina', 'Acosta', 'Canto',8158965775, 'ACCC740724RF6',1)
insert into Cliente values (003, 'Joaquin Hugo', 'Arroyo', 'Soto',8148569235, 'ARSJ620303DC3',1)
insert into Cliente values (004, 'Maria', 'Caballero', 'Valle',8116859645, 'CAVM940515CD2',1)
insert into Cliente values (005, 'Prudenciano', 'Cadena', 'Palacios',8178452254, 'CAPP851007TF5',1)
insert into Cliente values (006, 'Nicolás', 'Cerrillo', 'Garnica',8187988545, 'CEGN870630KL9',1)
insert into Cliente values (007, 'María Manuela', 'Figueroa', 'Salmorán',8174569585, 'FISM901231DR1',1)
insert into Cliente values (008, 'Antonio', ' Garcia', 'Marin',8187985568, 'GAMA870627TK7',1)
insert into Cliente values (009, 'Jose', 'Ibañez', 'Saenz',8187882663, 'IBSJ800415CD1',1)
insert into Cliente values (010, 'Ignacio', 'Puchol', 'Torres',8187956325, 'PUTI660613ZZ6',1)

insert into Tarjeta_Puntos values (NEWID(), 001, 25)
insert into Tarjeta_Puntos values (NEWID(), 002, 452)
insert into Tarjeta_Puntos values (NEWID(), 003, 98)
insert into Tarjeta_Puntos values (NEWID(), 004, 136)
insert into Tarjeta_Puntos values (NEWID(), 005, 341)
insert into Tarjeta_Puntos values (NEWID(), 006, 91)
insert into Tarjeta_Puntos values (NEWID(), 007, 254)
insert into Tarjeta_Puntos values (NEWID(), 008, 425)
insert into Tarjeta_Puntos values (NEWID(), 009, 79)
insert into Tarjeta_Puntos values (NEWID(), 010, 5)

insert into Header_Factura values(1, 001, 1, '20180620',200,1)
insert into Header_Factura values(2, 002, 2, '20180720',125,1)
insert into Header_Factura values(3, 003, 3, '20180623',16,1)
insert into Header_Factura values(4, 004, 4, '20180730',138,1)
insert into Header_Factura values(5, 005, 5, '20180527',234,1)
insert into Header_Factura values(6, 006, 6, '20180615',164,1)
insert into Header_Factura values(7, 007, 7, '20180613',173,1)
insert into Header_Factura values(8, 008, 8, '20180709',354,1)
insert into Header_Factura values(9, 009, 9, '20180920',368,1)
insert into Header_Factura values(10, 010, 10, '20180912',146,1)

insert into Producto_Factura values (1,1,750102051522,2,1)
insert into Producto_Factura values (2,2,750106506432,4,1)
insert into Producto_Factura values (3,3,750106532334,3,1)
insert into Producto_Factura values (4,4,750106555678,5,1)
insert into Producto_Factura values (5,5,750102051534,5,1)
insert into Producto_Factura values (6,6,750105532168,2,1)
insert into Producto_Factura values (7,7,750105534000,1,1)
insert into Producto_Factura values (8,8,750102051526,3,1)
insert into Producto_Factura values (9,9,750106510001,2,1)
insert into Producto_Factura values (10,10,750106545852,3,1)
insert into Producto_Factura values (10,10,750106545852,3,1)

insert into Descuento_Factura values (1,1,2)
insert into Descuento_Factura values (2,2,6)
insert into Descuento_Factura values (3,3,7)
insert into Descuento_Factura values (4,4,10)
insert into Descuento_Factura values (5,5,12)
insert into Descuento_Factura values (6,6,3)
insert into Descuento_Factura values (7,7,5)
insert into Descuento_Factura values (8,8,1)
insert into Descuento_Factura values (9,9,3)
insert into Descuento_Factura values (10,10,6)

insert into Pago_Factura values(NEWID(),1,1, 200,0)
insert into Pago_Factura values(NEWID(),2,3,125,1)
insert into Pago_Factura values(NEWID(),3,12,16,1)
insert into Pago_Factura values(NEWID(),4,2, 138,0)
insert into Pago_Factura values(NEWID(),5,11,234,1)
insert into Pago_Factura values(NEWID(),6,4, 164,0)
insert into Pago_Factura values(NEWID(),7,5, 173,0)
insert into Pago_Factura values(NEWID(),8,10, 354,0)
insert into Pago_Factura values(NEWID(),9,8, 368,1)
insert into Pago_Factura values(NEWID(),10,9,146,0)

insert into Devolucion_Producto values (1,750106510001,'20180707', 'Caducado',15)
insert into Devolucion_Producto values (2,750106511308,'20180707', 'Caducado',18)
insert into Devolucion_Producto values (3,750106516173,'20180501', 'Caducado',18)
insert into Devolucion_Producto values (4,750106532334,'20180707', 'Caducado',15)
insert into Devolucion_Producto values (5,750106545851,'20180501', 'Caducado',15)
insert into Devolucion_Producto values (6,750106545852,'20180501', 'Caducado',17)
insert into Devolucion_Producto values (7,750106548000,'20180707', 'Caducado',16)
insert into Devolucion_Producto values (8,750106555678,'20180501', 'Caducado',10)
insert into Devolucion_Producto values (9,750107040645,'20180621', 'Caducado',20)

select * from Producto_Area
select * from Proveedor
select * from Producto
select * from Producto_Precio
select * from Almacen
select * from Cuenta_Empleado
select * from Descuento
select * from Puesto_Empleado
select * from Empleado
select * from Prov_MP
select * from MetodoPago
select * from Cliente
select * from Tarjeta_Puntos
select * from Header_Factura
select * from Producto_Factura
select * from Descuento_Factura
select * from Pago_Factura
select * from Devolucion_Producto

--TRIGGERS----------------------------------------------------------------------------------------------
--TRIGGERS----------------------------------------------------------------------------------------------
--TRIGGERS----------------------------------------------------------------------------------------------


--Triggers Almacen--
create trigger Almacen_Ins
on Almacen
after insert
as
begin
	select * from inserted
	select * from Almacen
end

create trigger Almacen_Upd
on Almacen
after update
as
begin
	select * from inserted
	select * from Almacen
end

create trigger Almacen_Del
on Almacen
after delete
as
begin
	select * from deleted
	select * from Almacen
end

--Triggers Cliente--
create trigger Cliente_Ins
on Cliente
after insert
as
begin
	select * from inserted
	select * from Cliente
end

create trigger Cliente_Upd
on Cliente
after update
as
begin
	select * from inserted
	select * from Cliente
end

create trigger Cliente_Del
on Cliente
after delete
as
begin
	select * from deleted
	select * from Cliente
end

--Triggers Descuento--
create trigger Descuento_Ins
on Descuento
after insert
as
begin
	select * from inserted
	select * from Descuento
end

create trigger Descuento_Upd
on Descuento
after update
as
begin
	select * from inserted
	select * from Descuento
end

create trigger Descuento_Del
on Descuento
after delete
as
begin
	select * from deleted
	select * from Descuento
end

--Triggers Empleado--
create trigger Empleado_Ins
on Empleado
after insert
as
begin
	select * from inserted
	select * from Empleado
end

create trigger Empleado_Upd
on Empleado
after update
as
begin
	select * from inserted
	select * from Empleado
end

create trigger Empleado_Del
on Empleado
after delete
as
begin
	select * from deleted
	select * from Empleado
end

--Triggers Producto--
create trigger Producto_Ins
on Producto
after insert
as
begin
	select * from inserted
	select * from Producto
end

create trigger Producto_Upd
on Producto
after update
as
begin
	select * from inserted
	select * from Producto
end

create trigger Producto_Del
on Producto
after delete
as
begin
	select * from deleted
	select * from Producto
end

--Triggers Proveedor--
create trigger Proveedor_Ins
on Proveedor
after insert
as
begin
	select * from inserted
	select * from Proveedor
end

create trigger Proveedor_Upd
on Proveedor
after update
as
begin
	select * from inserted
	select * from Proveedor
end

create trigger Proveedor_Del
on Proveedor
after delete
as
begin
	select * from deleted
	select * from Proveedor
end

--Triggers Prov_MP--
create trigger Prov_MP_Ins
on Prov_MP
instead of insert
as
begin
	select * from Prov_MP
end

create trigger Prov_MP_Upd
on Prov_MP
after update
as
begin
	print('No puedes editar esto')
end

create trigger Prov_MP_Del
on Prov_MP
instead of delete
as
begin
	print('No puedes borrar esto')
end

--Triggers Puesto_Empleado--
create trigger Puesto_Empleado_Ins
on Puesto_Empleado
instead of insert
as
begin
	print('No tienes permiso de agregar informacion')
end

create trigger Puesto_Empleado_Upd
on Puesto_Empleado
after update
as
begin
	print('No tiene permiso de editar ')
end

create trigger Puesto_Empleado_Del
on Puesto_Empleado
instead of delete
as
begin
	print('No tienes permiso de borrar')
end

--VISTAS--------------------------------------------------------------------------------------
--VISTAS--------------------------------------------------------------------------------------
--VISTAS--------------------------------------------------------------------------------------

CREATE VIEW ProductosRegistrados
AS
	select COUNT(iCodigoBarras_Pd) as CantidadDeProductos
	FROM Producto

CREATE VIEW ProductosProveedores
AS
	select Products.vNombre_Pd as NombreProducto, Company.vNombre_Pvd as NombreProveedor
	from Producto as Products 
	INNER JOIN Proveedor as Company 
	on Products.iId_Proveedor = Company.iId_Proveedor

CREATE VIEW VentasPorEmpleado
AS
		SELECT COUNT(iId_Empleado) AS VentasPorEmpleado, iId_Empleado
		FROM Header_Factura
		GROUP BY iId_Empleado

CREATE VIEW VentasPorFecha
AS
		SELECT COUNT(dFecha_Venta) AS VentaPorFecha, dFecha_Venta
		FROM Header_Factura
		GROUP BY dFecha_Venta

CREATE VIEW ComprasPorCliente
AS
		SELECT COUNT(iId_Cliente) AS ComprasCliente, iId_Cliente
		FROM Header_Factura
		GROUP BY iId_Cliente

CREATE VIEW PuntosCliente
AS
		SELECT (c.vNombre_Cl + ' ' + c.vApellidoP_Cl) as Nombre, tp.iPuntos_Disp as Puntos
		FROM Cliente as c
		inner join Tarjeta_Puntos as tp
		on c.iId_Cliente = tp.iId_Cliente

CREATE VIEW PuestoEmpleados
AS
		SELECT (e.vNombre_Edo + ' ' + e.vApellidoP_Edo) as NombreEmpleado, p.vNombre_Puesto as Puesto
		FROM Empleado as e
		inner join Puesto_Empleado as p
		on e.iIdPuesto_Edo = p.iIdPuesto_Edo

CREATE VIEW Productos_Con_Descuento
AS
		SELECT p.vNombre_Pd as Producto, d.iPorcentaje_D as Descuento
		FROM Producto as p
		inner join Descuento as d
		on p.iCodigoBarras_Pd=d.iCodigoBarras_Pd

CREATE VIEW Datos_Cliente
AS
		SELECT (c.vNombre_Cl + ' ' + c.vApellidoP_Cl + ' ' + c.vApellidoM_Cl) as Nombre_Completo,
		 c.iTelefono_Cl as Telefono, c.vRFC_Cl as RFC, c.bStatus_Cl as Estado
		FROM Cliente as c

CREATE VIEW Datos_Proveedor
AS
		SELECT p.iId_Proveedor as ID, p.vNombre_Pvd as Proveedor, p.iTelefono_Pvd as Telefono, 
		p.cTipo_Pvd as Tipo, p.bStatus_Pvd as Estado
		FROM Proveedor as p

--PROCEDURES

CREATE PROCEDURE ProductoIdPrecio(@valor bigint)
as begin
	select * from Producto_Precio
	where iCodigoBarras_Pd = @valor

	select * from Producto
	where iCodigoBarras_Pd = @valor

end
GO

exec ProductoIdPrecio 750106545851

CREATE PROCEDURE EmpleadoCuentaSelect(@valor2 int)
as begin
	select * from Empleado
	where iId_Empleado = @valor2

	select * from Empleado_Cuenta
	where iId_Empleado = @valor2

end
GO

CREATE PROCEDURE ClienteTPSelect(@valor3 int)
as begin
	select * from Cliente
	where iId_Cliente = @valor3

	select * from Tarjeta_Puntos
	where iId_Cliente = @valor3

end
GO

CREATE PROCEDURE SelectProductoArea(@valor4 int )
as begin
	select * from Producto
	where iIdArea_Pd = @valor4

	select * from Producto_Area
	where iIdArea_Pd = @valor 4

end
GO

CREATE PROCEDURE SelectFacturaEmpleado(@valor5 int )
as begin
	select * from Header_Factura
	where iId_Empleado = @valor4

	select * from Cliente
	where iId_Empleado = @valor4

end
GO
 
 CREATE PROCEDURE SelectFacturaCliente(@valor5 int )
as begin
	select * from Header_Factura
	where iId_Cliente = @valor5

	select * from Cliente
	where iId_Cliente = @valor5

end
GO
