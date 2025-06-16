-- Encontrar todos os ninjas que fazem parte de um determinado time
USE trabalhoBancoDeDados2;

SELECT Ninja.nome
FROM Ninja
JOIN Ninja_Time ON Ninja.id = Ninja_Time.id
JOIN Time ON Ninja_Time.id_time = Time.id_time
WHERE Time.nome = 'Team 7';
