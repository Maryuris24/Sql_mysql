create database registros;
use registros;

create table Auditoria(
Usuario varchar(30),
Equipo varchar(30),
Fecha datetime,
Operacion varchar(30),
tabla varchar(30)
);

use sakila;

#insertar
delimiter $$

create trigger audi_in after insert on staff for each row begin
	insert into registros.Auditoria(
    usuario,equipo,fecha,operacion,tabla
    ) values(
    user(),@@hostname,current_timestamp(),"Insertar","Staff"
    );
    
end; $$

insert into `sakila`.`staff` (`first_name`, `last_name`, `address_id`,`email`,`store_id`,`active`,`username`,`password`)
values ('Maryuris', 'Huete', 7, 'mmhn@gmail.com', 2, 1, 'admin','987654');

#actualizar
delimiter $$

create trigger audi_up after update on staff for each row begin
	insert into registros.Auditoria(
    usuario,equipo,fecha,operacion,tabla
    ) values(
    user(),@@hostname,current_timestamp(),"Actualizar","Staff"
    );
    
end; $$

update staff set username = 'melisa'
where staff_id = 3;

#borrar
delimiter $$

create trigger audi_de after delete on staff for each row begin
	insert into registros.Auditoria(
    usuario,equipo,fecha,operacion,tabla
    ) values(
    user(),@@hostname,current_timestamp(),"Borrar","Staff"
    );
    
end; $$

delete from staff where staff_id = 3;