USE trabalhoBancoDeDados2;

-- -----------------------------------------------------
-- A função calcula o rank de um time com base no participante 
-- de menor rank (mais alto na hierarquia).
-- -----------------------------------------------------

DELIMITER $$

CREATE FUNCTION CalcularRankTime(
    p_id_time VARCHAR(5) 
) RETURNS CHAR(1) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE rankDoTime CHAR(1);

    SELECT CASE MIN(CASE n.rank
                        WHEN 'S' THEN 1
                        WHEN 'A' THEN 2
                        WHEN 'B' THEN 3
                        WHEN 'C' THEN 4
                        WHEN 'D' THEN 5
                        WHEN 'E' THEN 6
                   END)
                WHEN 1 THEN 'S'
                WHEN 2 THEN 'A'
                WHEN 3 THEN 'B'
                WHEN 4 THEN 'C'
                WHEN 5 THEN 'D'
                WHEN 6 THEN 'E'
           END INTO rankDoTime
    FROM Ninja n
    JOIN Ninja_Time nt ON n.id = nt.id
    WHERE nt.id_time = p_id_time;

    RETURN rankDoTime;
END $$

DELIMITER ;