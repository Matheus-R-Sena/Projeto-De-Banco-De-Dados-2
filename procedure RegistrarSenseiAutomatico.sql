USE trabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Procedure para registrar automaticamente um sensei 
-- em um time com base no ninja de maior rank
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE RegistrarSenseiAutomatico(
    IN p_id_time VARCHAR(5) 
)
BEGIN
    DECLARE sensei_id VARCHAR(5); 

    SELECT n.id
    INTO sensei_id
    FROM Ninja n
    JOIN Ninja_Time nt ON n.id = nt.id
    WHERE nt.id_time = p_id_time
    ORDER BY CASE n.rank
                WHEN 'S' THEN 1
                WHEN 'A' THEN 2
                WHEN 'B' THEN 3
                WHEN 'C' THEN 4
                WHEN 'D' THEN 5
                WHEN 'E' THEN 6
             END ASC
    LIMIT 1;

    IF sensei_id IS NULL THEN
        SELECT 'Nenhum ninja disponível para ser sensei neste time.' AS Mensagem;
        
    ELSE
        INSERT INTO Sensei (id_sensei, id_time)
        VALUES (sensei_id, p_id_time);

        SELECT CONCAT('O ninja com ID ', sensei_id, ' foi definido como sensei do time ', p_id_time, '.') AS Mensagem;
    END IF;
END $$

DELIMITER ;