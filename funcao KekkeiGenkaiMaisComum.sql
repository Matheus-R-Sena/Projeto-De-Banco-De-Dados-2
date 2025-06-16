USE trabalhoBancoDeDados2;

-- -----------------------------------------------------
-- determina qual é a Kekkei Genkai mais comum em um 
-- determinado clã, com base nos ninjas associados a ele.
-- -----------------------------------------------------

DELIMITER $$

CREATE FUNCTION KekkeiGenkaiMaisComum(
    p_id_cla VARCHAR(5) 
) RETURNS VARCHAR(100) 
    READS SQL DATA
BEGIN
    DECLARE kekkei_mais_comum VARCHAR(100);
    DECLARE qtd_max INT; 

    SELECT kg.nome_kekkei, COUNT(nk.id) AS qtd
    INTO kekkei_mais_comum, qtd_max
    FROM KekkeiGenkai kg
    JOIN Ninja_Kekkei nk ON kg.id_kekkei = nk.id_kekkei
    JOIN Ninja n ON nk.id = n.id
    WHERE kg.id_cla = p_id_cla 
    GROUP BY kg.nome_kekkei
    ORDER BY qtd DESC
    LIMIT 1; 

    RETURN kekkei_mais_comum; 
END $$

DELIMITER ;