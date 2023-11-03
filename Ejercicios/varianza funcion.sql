use sakila;

delimiter $$
create function varianza()
returns double
begin 
    
    set @promedio = (select avg(amount) from payment);
    set @n = (select count(amount) from payment);
    set @total = (select sum(power(amount-@promedio, 2))/@n from payment);
	
    return @total; 
end; $$

drop function varianza;
select varianza()