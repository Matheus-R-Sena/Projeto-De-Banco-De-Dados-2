-- Listar todos os times e seus senseis
USE trabalhoBancoDeDados2;

SELECT Time.nome AS Time, Ninja.nome AS Sensei
FROM Time
JOIN Sensei ON Time.id_time = Sensei.id_time
JOIN Ninja ON Sensei.id_sensei = Ninja.id;
