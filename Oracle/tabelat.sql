-- Fillimi i tabeles per njesi
CREATE TABLE Njesite_Matese
(
    Madhesia varchar2(50) PRIMARY KEY,
    Njesia varchar2(50) NOT NULL
)
--Perfundimi i tabeles per njesi

--Fillimi i tabeles Stacionet_Meteorologjike
CREATE TYPE Koordinatat AS OBJECT
(
    Gjeresia_Gjeografike float,
    Gjatesia_Gjeografike float
)

CREATE SEQUENCE sekuencaID START WITH 1;

CREATE TRIGGER trg_tabelaSEQ
BEFORE INSERT ON Stacionet_Meteorologjike
FOR EACH ROW

BEGIN 
    SELECT sekuencaID.NEXTVAL
    INTO     :new.StacioniID
    FROM dual;
END;

CREATE TABLE Stacionet_Meteorologjike
(
    StacioniID INTEGER,
    Emri_i_stacionit VARCHAR(50) NOT NULL,
    Koordinatat Koordinatat,
    Lartesia_mbidetare DECIMAL(6,2),
    Pellgu_Lumor VARCHAR(50), --NOT NULL
    PRIMARY KEY(StacioniID)
)
--Fundi i tabeles Stacionet_Meteorologjike

--Fillimi i tabeles Te_Dhenat_Klimatologjike
CREATE TYPE KMatje AS OBJECT
(
    Data_Koha TIMESTAMP,
    Temperatura FLOAT,
    Shtypja_Ajrit FLOAT,
    Lageshtia_Ajrit FLOAT,
    Reshje_Shiu FLOAT,
    Reshje_Bore FLOAT
)

CREATE TYPE Lista_MatjeveK 
AS TABLE OF Kmatje;

CREATE TABLE Te_Dhenat_Klimatologjike
(
    KId INTEGER PRIMARY KEY,
    StacioniID INTEGER,
    KMatje Lista_MatjeveK,
    Insolacioni FLOAT,
    Vranesirat INTEGER,
    FOREIGN KEY(StacioniID)
    REFERENCES Stacionet_Meteorologjike(StacioniID)
)
NESTED TABLE Kmatje STORE AS Kmatje_nested;
--Perfundimi i tabeles Te_Dhenat_Klimatologjike

--Fillimi i tabeles Temperatura_Tokes
CREATE TYPE Temperatura AS OBJECT
(
    Data_Koha TIMESTAMP,
    Temperatura_Tokes FLOAT,
    Thellesia_Tokes INTEGER
)
CREATE TYPE Lista_Temperature AS 
TABLE OF Temperatura;

CREATE TABLE Temperatura_Tokes
(
    TempTID INTEGER PRIMARY KEY,
    StacioniID INTEGER,
    Temperatura Lista_Temperature,
    FOREIGN KEY(StacioniID) 
    REFERENCES Stacionet_Meteorologjike(StacioniID)
)
NESTED TABLE Temperatura STORE AS Temp_nested;
--Perfundimi i tabeles Temperatura_Tokes

--Fillimi i tabeles Stacionet_hidrometrike
CREATE TABLE Stacionet_hidrometrike
(
    hidroStacioniID INTEGER,
    Pellgu_Lumor VARCHAR(50),
    Emri_Stacionit varchar(50) UNIQUE,
    Lumi varchar(40),
    Koordinatat koordinatat,
    Lartesia_mbidetare FLOAT,
    PRIMARY KEY(hidroStacioniID)
)
--Perfundimi i tabeles Stacionet_hidrometrike

--Fillimi i tabeles Te_Dhenat_Hidrometrike
CREATE TYPE HMatje AS OBJECT
(
    Data_Koha TIMESTAMP,
    Niveli_Ujit INTEGER,
    Prurja_Ujit FLOAT
)

CREATE TYPE Lista_MatjeveH AS TABLE OF HMatje

CREATE TABLE Te_Dhenat_Hidrometrike
(
    HId INTEGER,
    hidroStacioniID INTEGER,
    Distanca_Nga_Gryka DECIMAL(4,1),
    Siperfaqja_Ujembledhese DECIMAL(5,1),
    HMatjet Lista_MatjeveH,
    FOREIGN KEY (hidroStacioniID)
    REFERENCES Stacionet_hidrometrike(hidroStacioniID)
)
NESTED TABLE HMatjet STORE AS HMatje_nested

CREATE SEQUENCE h_sequence
    MINVALUE 1
    START WITH 15
    INCREMENT BY 1;
--Perfundimi i tabeles Te_dhenat_hidrometrike

--Fillimi i tabeles Cilesia e Ajrit
CREATE TYPE Ndotesit AS OBJECT
(
    Data_Koha TIMESTAMP,
    Ndotesi VARCHAR(50),
    Koncentrimi INTEGER,
    VleraMax_Lejueshme INTEGER
)
CREATE TYPE Lista_Ndotesit AS TABLE OF Ndotesit

CREATE TABLE Cilesia_Ajrit
(
    AId INTEGER PRIMARY KEY,
    Vendi VARCHAR2(60),
    Ndotja Lista_Ndotesit
)
NESTED TABLE Ndotja STORE AS Ndotja_nested
--Perfundimi i tabeles Cilesia e Ajrit

--Fillimi i tabeles Zhurma
CREATE TABLE Zhurma
(
    ZId INTEGER,
    Data_Koha TIMESTAMP,
    Tipi_Pranuesit VARCHAR2(30),
    Vlera_Zhurmes INTEGER,
    PRIMARY KEY (ZId)
);
--Perfundimi i tabeles Zhurma

--CONSTRAINT
ALTER TABLE KMatje_Nested ADD CONSTRAINT constrLageshtia CHECK(Lageshtia_Ajrit BETWEEN 0 AND 100)
ALTER TABLE Temp_Nested ADD CONSTRAINT constrThellesiaTokes CHECK(Thellesia_Tokes > 0)
ALTER TABLE Ndotja_nested ADD CONSTRAINT constrKoncentrimi CHECK(koncentrimi > 0 AND VleraMax_Lejueshme > 0)
ALTER TABLE Stacionet_Meteorologjike ADD CONSTRAINT emriStacionitConstr UNIQUE(Emri_i_Stacionit);
--CONSTRAINT