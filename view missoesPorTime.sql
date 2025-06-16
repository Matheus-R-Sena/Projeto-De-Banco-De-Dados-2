USE TrabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Organiza informações sobre os times, seus senseis 
-- e as missões realizadas, incluindo as descrições das missões e seus ranks,
-- colocando os dados em uma única linha para cada time.
-- -----------------------------------------------------

CREATE VIEW MissoesPorTime AS
SELECT 
    t.nome AS nome_time,
    s.id_sensei AS id_sensei,
    n.nome AS nome_sensei,
    GROUP_CONCAT(DISTINCT CONCAT('Missão: ', m.descricao, ' (Rank: ', m.`rank`, ')') SEPARATOR '; ') AS missoes
FROM Time t
LEFT JOIN Sensei s ON t.id_time = s.id_time
LEFT JOIN Ninja n ON s.id_sensei = n.id
LEFT JOIN Time_Missao tm ON t.id_time = tm.id_time
LEFT JOIN Missao m ON tm.id_missao = m.id
GROUP BY t.nome, s.id_sensei, n.nome;
