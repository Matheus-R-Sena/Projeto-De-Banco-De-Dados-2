-- Retorna os nomes dos times que nunca realizaram missões de rank S

USE TrabalhoBancoDeDados2;

SELECT Time.nome AS nome_time
FROM Time
LEFT JOIN Time_Missao tm ON Time.id_time = tm.id_time
LEFT JOIN Missao ON tm.id_missao = Missao.id
GROUP BY Time.nome
HAVING SUM(CASE WHEN Missao.rank = 'S' THEN 1 ELSE 0 END) = 0;