-- Obter todas as invocações de um determinado ninja
USE trabalhoBancoDeDados2;

SELECT Invocacao.nome_invocacao
FROM Invocacao
JOIN Ninja_Invocacao ON Invocacao.id_invocacao = Ninja_Invocacao.id_invocacao
JOIN Ninja ON Ninja_Invocacao.id = Ninja.id
WHERE Ninja.nome = 'Jiraiya';
