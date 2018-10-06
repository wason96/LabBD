use PuntoVenta

select * from Cajero
select * from Proveedor
select * from Precio_Producto
select * from Producto
select * from Producto_Comprado
select * from Cliente

insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (1, 'Osmar Morales', 'M')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (2, 'Susana Rivera', 'V')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (3, 'Laura Navarro', 'M')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (4, 'Ramon Castro', 'V')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (5, 'Rosa Gonzalez', 'V')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (6, 'Francisco Treviño', 'M')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (7, 'Gabriela Motes', 'M')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (8, 'Alejandro Moya', 'V')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (9, 'Javier Iglesias', 'V')
insert into Cajero (iID_Cajero, vNombre_Cajero, cTurno_Cajero) values (10, 'Maria Tamez', 'M')


insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (1, 'Sabritas')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (2, 'Gamesa')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (3, 'Bimbo')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (4, 'Fud')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (5, 'Coca-Cola')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (6, 'Encanto')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (7, 'Marlboro')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (8, 'Marinela')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (9, 'Adams')
insert into Proveedor (iID_Proveedor, vNombre_Proveedor) values (10, 'Kotex')

insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('refresco', 20.31, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('papas fritas', 10, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('chicles', 6, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('chocolate', 10, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('dona', 15.1, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('cafe de cafetera', 14.6, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('sandwich partido en dos', 24, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('termo', 30, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('lentes de sol', 120, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('gomas', 12, 0)
insert into Producto (vDescripcion_Producto, fPrecio_Venta, fDescuento) values ('agua', 13.68, 0)

insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',1 , 20.31 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',2 , 10 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',3 , 6 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',4 , 10 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',5 , 15.1 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',6 , 14.6 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',7 , 24)
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',8 , 30 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',9 , 120 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',10 , 12 )
insert into Precio_Producto (dFecha_Precio, iID_Producto, fPrecio) values ('2018-09-01',11 , 13.68 )

insert into Producto_Comprado (tCant_Producto, iID_Producto) values (6, 8)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (3, 6)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (8, 4)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (3, 2)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (7, 1)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (8, 11)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (2, 9)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (1, 10)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (6, 3)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (4, 5)
insert into Producto_Comprado (tCant_Producto, iID_Producto) values (12, 7)

insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (1, 1, '2154653212', 'cliente1@gmail.com', 5)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (2, 1, '5445646645', 'cliente2@gmail.com', 3)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (3, 1, '3215152054', 'cliente3@gmail.com', 20)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (4, 1, '32548502151', 'cliente4@gmail.com', 24)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (5, 1, '48954112312', 'cliente5@gmail.com', 28)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (6, 1, '2165156131', 'cliente6@gmail.com', 17)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (7, 1, '65145610051', 'cliente7@gmail.com', 34)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (8, 1, '2305408463', 'cliente8@gmail.com', 16)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (9, 1, '64058498461', 'cliente9@gmail.com', 50)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (10, 1, '321232313', 'cliente10@gmail.com', 13)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (11, 1, '654897463', 'cliente11@gmail.com', 49)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (12, 1, '2305405423', 'cliente12@gmail.com', 34)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (13, 1, '2515416312', 'cliente13@gmail.com', 15)
insert into Cliente (iID_Cliente, bRegistrado ,vTelefono_Cliente, vCorreo_Cliente, tNum_Visitas) values (14, 1, '6894132100', 'cliente14@gmail.com', 24)

select * from Pago
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (1, 'efectivo', 67.61, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (2, 'efectivo', 24.15, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (3, 'tarjeta', 35, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (4, 'efectivo', 61.34, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (5, 'efectivo', 10, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (6, 'tarjeta', 84.50, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (7, 'tarjeta', 173.24, 'none')
insert into Pago (iID_Pago, vForma_Pago, fTotal_Pago,vNotas) values (8, 'efectivo', 16.4, 'none')

delete from Pago where iID_Pago= 6
delete from Pago where iID_Pago= 3
delete from Pago where iID_Pago= 1
delete from Cliente where iID_Cliente= 9
delete from Cliente where iID_Cliente= 7

update Proveedor set vNombre_Proveedor= 'Bonafont' where iID_Proveedor = 3
update Proveedor set vNombre_Proveedor= 'Barcel' where iID_Proveedor = 6
update Proveedor set vNombre_Proveedor= 'Orbit' where iID_Proveedor = 9
update Producto set vDescripcion_Producto= 'cigarros' where iID_Producto = 3
update Producto set vDescripcion_Producto= 'jamon' where iID_Producto = 1
select * from Pago