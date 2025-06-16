-- Listar todas as vilas e seus respectivos Hokages
USE trabalhoBancoDeDados2;

SELECT Vila.nome AS Vila, Ninja.nome AS Hokage
FROM Vila
JOIN Hokage ON Vila.id_vila = Hokage.id_vila
JOIN Ninja ON Hokage.id = Ninja.id;
