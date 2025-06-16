USE trabalhoBancoDeDados2;

-- -----------------------------------------------------
-- A procedure planeja uma missão ao verificar se o time especificado 
-- possui o rank necessário para realizá-la. 
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE PlanejarMissao(
    IN p_id VARCHAR(5),
    IN p_descricao TEXT, 
    IN p_rank CHAR(1), 
    IN p_id_time VARCHAR(5) 
)
BEGIN
    DECLARE rank_time CHAR(1);
    DECLARE erro_ocorrido BOOLEAN DEFAULT FALSE;

    SET rank_time = CalcularRankTime(p_id_time);

    IF rank_time IS NULL THEN
        SELECT 'Time inexistente ou sem ninjas registrados.' AS Mensagem;
    ELSEIF 
        CASE rank_time
            WHEN 'S' THEN 1
            WHEN 'A' THEN 2
            WHEN 'B' THEN 3
            WHEN 'C' THEN 4
            WHEN 'D' THEN 5
            WHEN 'E' THEN 6
        END >
        CASE p_rank
            WHEN 'S' THEN 1
            WHEN 'A' THEN 2
            WHEN 'B' THEN 3
            WHEN 'C' THEN 4
            WHEN 'D' THEN 5
            WHEN 'E' THEN 6
        END THEN

        SELECT CONCAT(
            'O time não possui nível suficiente para missões de rank ', 
            p_rank, '. Nível atual do time: ', rank_time, '.'
        ) AS Mensagem;
        
    ELSE
        BEGIN
            DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
            BEGIN
                SET erro_ocorrido = TRUE;
            END;

            START TRANSACTION;

            INSERT INTO Missao (id, descricao, `rank`) 
            VALUES (p_id, p_descricao, p_rank);

            IF NOT erro_ocorrido THEN
                INSERT INTO Time_Missao (id_time, id_missao)
                VALUES (p_id_time, p_id);
            END IF;

            IF erro_ocorrido THEN
                ROLLBACK;
                SELECT 'Erro ao registrar a missão ou associá-la ao time. Verifique os dados inseridos.' AS Mensagem;
            ELSE
                COMMIT;
                
                SELECT 
                    t.id_time AS Codigo_do_Time, 
                    t.nome AS Nome_do_Time, 
                    m.id AS Codigo_da_Missao,
                    m.descricao AS Descricao_da_Missao,
                    n.id AS Codigo_do_Ninja, 
                    n.nome AS Nome_do_Ninja, 
                    n.rank AS Rank_do_Ninja
                FROM Time t
                LEFT JOIN Time_Missao tm ON t.id_time = tm.id_time
                LEFT JOIN Missao m ON tm.id_missao = m.id
                LEFT JOIN Ninja_Time nt ON t.id_time = nt.id_time
                LEFT JOIN Ninja n ON nt.id = n.id
                WHERE t.id_time = p_id_time AND m.id = p_id; 
            END IF;
        END;
    END IF; 
END $$

DELIMITER ;