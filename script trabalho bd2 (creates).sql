SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS TrabalhoBancoDeDados2;
CREATE SCHEMA IF NOT EXISTS TrabalhoBancoDeDados2;
USE TrabalhoBancoDeDados2;

-- -----------------------------------------------------
-- Tabela Ninja
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ninja;

CREATE TABLE Ninja (
    id VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    `rank` CHAR(1),
    tipo CHAR(1),
    id_vila VARCHAR(5),
    id_cla VARCHAR(5),
    FOREIGN KEY (id_vila) REFERENCES Vila(id_vila),
    FOREIGN KEY (id_cla) REFERENCES Cla(id_cla)
);

-- -----------------------------------------------------
-- Tabela Clã
-- -----------------------------------------------------
DROP TABLE IF EXISTS Cla;

CREATE TABLE Cla (
    id_cla VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(100)
);

-- -----------------------------------------------------
-- Tabela Vila
-- -----------------------------------------------------
DROP TABLE IF EXISTS Vila;

CREATE TABLE Vila (
    id_vila VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(100)
);

-- -----------------------------------------------------
-- Tabela Missão
-- -----------------------------------------------------
DROP TABLE IF EXISTS Missao;

CREATE TABLE Missao (
    id VARCHAR(5) PRIMARY KEY,
    descricao TEXT,
    `rank`  CHAR(1)
);

-- -----------------------------------------------------
-- Tabela Kekkei Genkai
-- -----------------------------------------------------
DROP TABLE IF EXISTS KekkeiGenkai;

CREATE TABLE KekkeiGenkai (
    id_kekkei VARCHAR(5) PRIMARY KEY,
    nome_kekkei VARCHAR(100),
    id_cla VARCHAR(5),
    FOREIGN KEY (id_cla) REFERENCES Cla(id_cla)
);

-- -----------------------------------------------------
-- Tabela Time
-- -----------------------------------------------------
DROP TABLE IF EXISTS Time;

CREATE TABLE Time (
    id_time VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(100)
);

-- -----------------------------------------------------
-- Tabela Sensei
-- -----------------------------------------------------
DROP TABLE IF EXISTS Sensei;

CREATE TABLE Sensei (
    id_sensei VARCHAR(5) PRIMARY KEY,
    id_time VARCHAR(5),
    FOREIGN KEY (id_time) REFERENCES Time(id_time)
);

-- -----------------------------------------------------
-- Tabela Bijuu
-- -----------------------------------------------------
DROP TABLE IF EXISTS Bijuu;

CREATE TABLE Bijuu (
    id_bijuu VARCHAR(5) PRIMARY KEY,
    id VARCHAR(5),
    nome_bijuu VARCHAR(100),
    FOREIGN KEY (id) REFERENCES Ninja(id)
);

-- -----------------------------------------------------
-- Tabela Hokage
-- -----------------------------------------------------
DROP TABLE IF EXISTS Hokage;

CREATE TABLE Hokage (
    id VARCHAR(5) PRIMARY KEY,
    id_vila VARCHAR(5),
    FOREIGN KEY (id_vila) REFERENCES Vila(id_vila),
    FOREIGN KEY (id) REFERENCES Ninja(id)
);

-- -----------------------------------------------------
-- Tabela Invocação
-- -----------------------------------------------------
DROP TABLE IF EXISTS Invocacao;

CREATE TABLE Invocacao (
    id_invocacao VARCHAR(5) PRIMARY KEY,
    nome_invocacao VARCHAR(100)
);

-- -----------------------------------------------------
-- Tabela Chakra
-- -----------------------------------------------------
DROP TABLE IF EXISTS Chakra;

CREATE TABLE Chakra (
    id_chakra VARCHAR(5) PRIMARY KEY,
    natureza VARCHAR(100),
    cor VARCHAR(50),
    rotacao VARCHAR(50)
);

-- -----------------------------------------------------
-- Tabela Mestres
-- -----------------------------------------------------
DROP TABLE IF EXISTS Mestres;

CREATE TABLE Mestres (
    id_aprendiz VARCHAR(5),
    id_mestre VARCHAR(5) PRIMARY KEY,
    especialidade VARCHAR(100),
    FOREIGN KEY (id_aprendiz) REFERENCES Ninja(id)
);

-- -----------------------------------------------------
-- Tabela Jutsu
-- -----------------------------------------------------
DROP TABLE IF EXISTS Jutsu;

CREATE TABLE Jutsu (
    id_jutsu VARCHAR(5) PRIMARY KEY,
    nome_jutsu VARCHAR(100),
    tipo VARCHAR(50)
);

-- -----------------------------------------------------
-- Tabela Arma
-- -----------------------------------------------------
DROP TABLE IF EXISTS Arma;

CREATE TABLE Arma (
    id_arma VARCHAR(5) PRIMARY KEY,
    nome_arma VARCHAR(100),
    tipo VARCHAR(50)
);

-- -----------------------------------------------------
-- Tabela Selo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Selo;

CREATE TABLE Selo (
    id_selo VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(100)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Ninja_Arma
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ninja_Arma;

CREATE TABLE Ninja_Arma (
    id VARCHAR(5),
    id_arma VARCHAR(5),
    PRIMARY KEY (id, id_arma),
    FOREIGN KEY (id) REFERENCES Ninja(id),
    FOREIGN KEY (id_arma) REFERENCES Arma(id_arma)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Ninja_Invocacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ninja_Invocacao;

CREATE TABLE Ninja_Invocacao (
    id VARCHAR(5),
    id_invocacao VARCHAR(5),
    PRIMARY KEY (id, id_invocacao),
    FOREIGN KEY (id) REFERENCES Ninja(id),
    FOREIGN KEY (id_invocacao) REFERENCES Invocacao(id_invocacao)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Ninja_Chakra
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ninja_Chakra;

CREATE TABLE Ninja_Chakra (
    id VARCHAR(5),
    id_chakra VARCHAR(5),
    PRIMARY KEY (id, id_chakra),
    FOREIGN KEY (id) REFERENCES Ninja(id),
    FOREIGN KEY (id_chakra) REFERENCES Chakra(id_chakra)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Jutsu_Chakra
-- -----------------------------------------------------
DROP TABLE IF EXISTS Jutsu_Chakra;

CREATE TABLE Jutsu_Chakra (
    id_jutsu VARCHAR(5),
    id_chakra VARCHAR(5),
    PRIMARY KEY (id_jutsu, id_chakra),
    FOREIGN KEY (id_jutsu) REFERENCES Jutsu(id_jutsu),
    FOREIGN KEY (id_chakra) REFERENCES Chakra(id_chakra)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Selo_Jutsu
-- -----------------------------------------------------
DROP TABLE IF EXISTS Selo_Jutsu;

CREATE TABLE Selo_Jutsu (
    id_selo VARCHAR(5),
    id_jutsu VARCHAR(5),
    PRIMARY KEY (id_selo, id_jutsu),
    FOREIGN KEY (id_selo) REFERENCES Selo(id_selo),
    FOREIGN KEY (id_jutsu) REFERENCES Jutsu(id_jutsu)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Ninja_Time
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ninja_Time;

CREATE TABLE Ninja_Time (
    id VARCHAR(5),
    id_time VARCHAR(5),
    PRIMARY KEY (id, id_time),
    FOREIGN KEY (id) REFERENCES Ninja(id),
    FOREIGN KEY (id_time) REFERENCES Time(id_time)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Time_Missao
-- -----------------------------------------------------
DROP TABLE IF EXISTS Time_Missao;

CREATE TABLE Time_Missao (
    id_missao VARCHAR(5),
    id_time VARCHAR(5),
    PRIMARY KEY (id_missao, id_time),
    FOREIGN KEY (id_missao) REFERENCES Missao(id),
    FOREIGN KEY (id_time) REFERENCES Time(id_time)
);

-- -----------------------------------------------------
-- Tabela de Relacionamento Ninja_Kekkei
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ninja_Kekkei;

CREATE TABLE Ninja_Kekkei (
    id VARCHAR(5),
    id_kekkei VARCHAR(5),
    PRIMARY KEY (id, id_kekkei),
    FOREIGN KEY (id) REFERENCES Ninja(id),
    FOREIGN KEY (id_kekkei) REFERENCES KekkeiGenkai(id_kekkei)
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
