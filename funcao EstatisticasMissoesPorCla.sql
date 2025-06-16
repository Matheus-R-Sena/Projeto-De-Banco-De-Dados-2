USE trabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Função que retorna estatísticas das missões realizadas por um 
-- clã específico, incluindo o total de missões, quantidade por 
-- rank, e porcentagem de missões rank S.
-- -----------------------------------------------------

DELIMITER $$

CREATE FUNCTION EstatisticasMissoesPorCla(
    p_id_cla VARCHAR(5)
) RETURNS VARCHAR(1000)
    READS SQL DATA
BEGIN
    DECLARE resultado VARCHAR(1000);
    DECLARE total_missoes INT DEFAULT 0;
    DECLARE missoes_rank_a INT DEFAULT 0;
    DECLARE missoes_rank_b INT DEFAULT 0;
    DECLARE missoes_rank_c INT DEFAULT 0;
    DECLARE missoes_rank_d INT DEFAULT 0;
    DECLARE missoes_rank_e INT DEFAULT 0;
    DECLARE missoes_rank_s INT DEFAULT 0;
    DECLARE porcentagem_rank_s DECIMAL(5, 2) DEFAULT 0;

    SELECT COUNT(DISTINCT tm.id_missao) INTO total_missoes
    FROM Cla c
    JOIN Ninja n ON c.id_cla = n.id_cla
    JOIN Ninja_Time nt ON n.id = nt.id
    JOIN Time_Missao tm ON nt.id_time = tm.id_time
    WHERE c.id_cla = p_id_cla;

    SELECT 
        COUNT(DISTINCT CASE WHEN m.`rank` = 'A' THEN tm.id_missao ELSE NULL END),
        COUNT(DISTINCT CASE WHEN m.`rank` = 'B' THEN tm.id_missao ELSE NULL END),
        COUNT(DISTINCT CASE WHEN m.`rank` = 'C' THEN tm.id_missao ELSE NULL END),
        COUNT(DISTINCT CASE WHEN m.`rank` = 'D' THEN tm.id_missao ELSE NULL END),
        COUNT(DISTINCT CASE WHEN m.`rank` = 'E' THEN tm.id_missao ELSE NULL END),
        COUNT(DISTINCT CASE WHEN m.`rank` = 'S' THEN tm.id_missao ELSE NULL END)
    INTO 
        missoes_rank_a,
        missoes_rank_b,
        missoes_rank_c,
        missoes_rank_d,
        missoes_rank_e,
        missoes_rank_s
    FROM Cla c
    JOIN Ninja n ON c.id_cla = n.id_cla
    JOIN Ninja_Time nt ON n.id = nt.id
    JOIN Time_Missao tm ON nt.id_time = tm.id_time
    JOIN Missao m ON tm.id_missao = m.id
    WHERE c.id_cla = p_id_cla;

    IF total_missoes > 0 THEN
        SET porcentagem_rank_s = (missoes_rank_s * 100) / total_missoes;
    END IF;

    SET resultado = CONCAT(
        'Clã: ', p_id_cla, ', ',
        'Total de missões: ', total_missoes, ', ',
        'Rank A: ', missoes_rank_a, ', ',
        'Rank B: ', missoes_rank_b, ', ',
        'Rank C: ', missoes_rank_c, ', ',
        'Rank D: ', missoes_rank_d, ', ',
        'Rank E: ', missoes_rank_e, ', ',
        'Rank S: ', missoes_rank_s, ', ',
        'Porcentagem Rank S: ', porcentagem_rank_s, '%'
    );

    RETURN resultado;
END $$

DELIMITER ;