-- Retorna o nome dos ninjas, o total de missões realizadas, o número 
-- de missões de rank S e a porcentagem dessas missões em relação ao 
-- total de missões realizadas por cada ninja.

USE TrabalhoBancoDeDados2;

SELECT Ninja.nome AS nome_ninja,
    COUNT(tm.id_missao) AS total_missoes,
    SUM(CASE WHEN Missao.rank = 'S' THEN 1 ELSE 0 END) AS missoes_rank_s,
    (SUM(CASE WHEN missao.rank = 'S' THEN 1 ELSE 0 END) / COUNT(tm.id_missao)) * 100 AS porcentagem_rank_s
FROM Ninja 
INNER JOIN Ninja_Time nt ON Ninja.id = nt.id
INNER JOIN Time_Missao tm ON nt.id_time = tm.id_time
INNER JOIN Missao ON tm.id_missao = Missao.id
GROUP BY Ninja.nome;