-- Encontrar todos os ninjas que têm uma Kekkei Genkai específica
USE trabalhoBancoDeDados2;

SELECT Ninja.nome
FROM Ninja
JOIN Ninja_Kekkei ON Ninja.id = Ninja_Kekkei.id
JOIN KekkeiGenkai ON Ninja_Kekkei.id_kekkei = KekkeiGenkai.id_kekkei
WHERE KekkeiGenkai.nome_kekkei = 'Byakugan';
