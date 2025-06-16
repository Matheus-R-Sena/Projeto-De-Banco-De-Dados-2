USE TrabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Trigger associarKekkeiGenkai: Verifica se o clã do ninja inserido
-- possui Kekkei Genkai associadas. Caso positivo, associa o ninja
-- às Kekkei Genkai do clã.

-- Trigger associarKekkeiGenkaiUpdate: Verifica se o clã do ninja atualizado
-- foi alterado. Caso positivo, remove as associações anteriores do ninja 
-- às Kekkei Genkai do clã antigo e associa o ninja às Kekkei Genkai do novo 
-- clã, caso existam.
-- -----------------------------------------------------

DELIMITER $$

CREATE TRIGGER associarKekkeiGenkai
AFTER INSERT ON Ninja
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM KekkeiGenkai 
        WHERE id_cla = NEW.id_cla
    ) THEN
        INSERT INTO Ninja_Kekkei (id, id_kekkei)
        SELECT NEW.id, id_kekkei
        FROM KekkeiGenkai
        WHERE id_cla = NEW.id_cla;
    END IF;
END $$


CREATE TRIGGER associarKekkeiGenkaiUpdate
AFTER UPDATE ON Ninja
FOR EACH ROW
BEGIN
    IF NEW.id_cla <> OLD.id_cla THEN
        DELETE FROM Ninja_Kekkei
        WHERE id = NEW.id;

        IF EXISTS (
            SELECT 1 
            FROM KekkeiGenkai 
            WHERE id_cla = NEW.id_cla
        ) THEN
            INSERT INTO Ninja_Kekkei (id, id_kekkei)
            SELECT NEW.id, id_kekkei
            FROM KekkeiGenkai
            WHERE id_cla = NEW.id_cla;
        END IF;
    END IF;
END $$

DELIMITER ;