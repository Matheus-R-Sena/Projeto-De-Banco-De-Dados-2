USE TrabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Estas triggers validam que o valor do campo `rank` na tabela `Ninja` 
-- esteja limitado aos valores permitidos ('a', 'b', 'c', 'd', 'e', 's') 
-- antes de uma operação de INSERT ou UPDATE.
-- -----------------------------------------------------

DELIMITER $$

CREATE TRIGGER validaRankInsert
BEFORE INSERT ON Ninja
FOR EACH ROW
BEGIN
    IF NEW.rank NOT IN ('a', 'b', 'c', 'd', 'e', 's') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor de rank deve ser "a", "b", "c", "d", "e" ou "s".';
    END IF;
END$$

CREATE TRIGGER validaRankUpdate
BEFORE UPDATE ON Ninja
FOR EACH ROW
BEGIN
    IF NEW.rank NOT IN ('a', 'b', 'c', 'd', 'e', 's') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor de rank deve ser "a", "b", "c", "d", "e" ou "s".';
    END IF;
END$$

DELIMITER ;