-- Listar todos os ninjas e suas armas
USE trabalhoBancoDeDados2;

SELECT Ninja.nome AS Ninja, Arma.nome_arma AS Arma
FROM Ninja
JOIN Ninja_Arma ON Ninja.id = Ninja_Arma.id
JOIN Arma ON Ninja_Arma.id_arma = Arma.id_arma;
