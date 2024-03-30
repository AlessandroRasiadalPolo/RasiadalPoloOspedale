CREATE DATABASE IF NOT EXISTS ospedalePhp;
USE ospedalePhp;


CREATE TABLE IF NOT EXISTS Paziente(
    CodF varchar(150) NOT NULL PRIMARY KEY,
    Nome varchar(100) NOT NULL,
    Cognome varchar(100) NOT NULL,
    DataNascita date NOT NULL,
    Sesso varchar(20) NOT NULL,
    Email varchar(100) NOT NULL,
    Password varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS CondizioneMedica(
    Anno date NOT NULL,
    Paziente varchar(150) NOT NULL,
    Analisi JSON,
    Operazioni JSON,
    FOREIGN KEY(Paziente) REFERENCES Paziente(CodF) ON DELETE CASCADE,
    PRIMARY KEY(Anno, Paziente)
);

CREATE TABLE IF NOT EXISTS Descrive(
    Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Paziente varchar(150) NOT NULL,
    Anno DATE NOT NULL,
    FOREIGN KEY (Anno, Paziente) REFERENCES CondizioneMedica(Anno, Paziente) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Ospedale(
    Nome varchar(100) NOT NULL PRIMARY KEY,
    Indirizzo varchar(100) NOT NULL,
    Città varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Medico(
    CodF varchar(150) NOT NULL PRIMARY KEY,
    Password varchar(100) NOT NULL,
    Specializzazione varchar(100) NOT NULL,
    Ospedale varchar(100) NOT NULL,
    FOREIGN KEY(Ospedale) REFERENCES Ospedale(Nome)
);

CREATE TABLE IF NOT EXISTS Orario(
    DataDisponibile TIMESTAMP NOT NULL,
    Medico varchar(150) NOT NULL,
    Disponibile ENUM("SI", "NO") NOT NULL,
    FOREIGN KEY(Medico) REFERENCES Medico(CodF),
    PRIMARY KEY(DataDisponibile, Medico)
);

CREATE TABLE IF NOT EXISTS Appuntamento(
    DataAppuntamento Date,
    Medico varchar(150) NOT NULL,
    Paziente varchar(150) NOT NULL,
    FOREIGN KEY(Medico) REFERENCES Medico(CodF),
    FOREIGN KEY(Paziente) REFERENCES Paziente(CodF),
    PRIMARY KEY(DataAppuntamento, Paziente)
);