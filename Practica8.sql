use PuntoVenta2
select * from Proveedor


-- Trigger Insert
create Trigger TriggerIns
on Proveedor
after insert as
begin 
	select * from Proveedor
	select * from Inserted
end

-- Comprobación de Trigger
insert into Proveedor values(4,'Kellogs',89765423) --Funciona
drop trigger TriggerIns
select *  from Proveedor


-- Trigger Update
create Trigger TriggerUpd
on Proveedor
instead of update as
begin 
	select * from Proveedor
end
-- Comprobación de Trigger--
update Proveedor set vNombre = 'Memin Pingüin' where iIdProv=4
select * from Proveedor
drop Trigger TriggerUpd
select * from Proveedor


-- Trigger Delete--
create Trigger TriggerDel
on Proveedor
after delete
as
begin 
	select * from Proveedor
	select * from deleted
end 
-- Comprobación del Trigger --
delete from Proveedor where iIdProv = 4
select * from Proveedor
drop Trigger TriggerDel
insert into Proveedor values(4,'Kellogs',89765423)
select * from Proveedor