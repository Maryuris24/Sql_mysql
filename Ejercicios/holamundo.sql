use biblioteca;

DELIMITER $$
CREATE FUNCTION holamundo()
RETURNS varchar(20) deterministic
BEGIN
RETURN "Holamundo";
END$$
DELIMITER ;

set global log_bin_trust_function_creators = 1;

select holamundo(); 