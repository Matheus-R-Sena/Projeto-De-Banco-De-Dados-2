-- Obter todos os ninjas que pertencem a um clã específico
USE trabalhoBancoDeDados2;

SELECT Ninja.nome
FROM Ninja
JOIN Cla ON Ninja.id_cla = Cla.id_cla
WHERE Cla.nome = 'Uchiha';