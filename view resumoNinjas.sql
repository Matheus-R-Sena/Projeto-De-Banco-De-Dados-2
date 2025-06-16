USE TrabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Reúne informações detalhadas sobre os ninjas, incluindo 
-- vila de origem, clã, Kekkei Genkai e tipos de chakra associados, apresentando 
-- todos os dados em uma única linha para cada ninja.
-- -----------------------------------------------------

CREATE VIEW ResumoNinjas AS
SELECT 
    n.id AS ninja_id,
    n.nome AS nome_ninja,
    n.idade,
    v.nome AS vila,
    c.nome AS cla,
    GROUP_CONCAT(DISTINCT kg.nome_kekkei SEPARATOR ', ') AS kekkei_genkai,
    GROUP_CONCAT(DISTINCT ch.natureza SEPARATOR ', ') AS tipos_chakra
FROM Ninja n
LEFT JOIN Vila v ON n.id_vila = v.id_vila
LEFT JOIN Cla c ON n.id_cla = c.id_cla
LEFT JOIN Ninja_Kekkei nk ON n.id = nk.id
LEFT JOIN KekkeiGenkai kg ON nk.id_kekkei = kg.id_kekkei
LEFT JOIN Ninja_Chakra nc ON n.id = nc.id
LEFT JOIN Chakra ch ON nc.id_chakra = ch.id_chakra
GROUP BY n.id, n.nome, n.idade, v.nome, c.nome;
