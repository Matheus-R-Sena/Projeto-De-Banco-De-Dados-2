-- Listar todos os ninjas e suas respectivas vilas
USE trabalhoBancoDeDados2;

SELECT Ninja.nome AS Ninja, Vila.nome AS Vila
FROM Ninja
JOIN Vila ON Ninja.id_vila = Vila.id_vila;
