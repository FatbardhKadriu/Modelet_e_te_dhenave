CREATE VIEW CilesiaAjrit_View AS
SELECT C.Aid,
              C.Vendi,
              N.Ndotesi,
              N.Data_Koha,
              N.Koncentrimi,
              N.VleraMax_Lejueshme
FROM Cilesia_Ajrit c, TABLE(c.ndotja) n

CREATE VIEW Te_DhenatH_View AS
SELECT H.HId,
              s.Emri_Stacionit,
              H.Distanca_Nga_Gryka,
              H.Siperfaqja_Ujembledhese,
              M.Data_Koha,
              M.Niveli_Ujit,
              M.Prurja_Ujit
FROM Te_Dhenat_Hidrometrike H , TABLE(H.HMatjet) M, Stacionet_Hidrometrike s
WHERE H.hidroStacioniID = s.hidroStacioniID

CREATE VIEW TE_DHENATK_VIEW AS
SELECT   T.KId , 
                m.Emri_i_stacionit,
                C.Data_Koha ,
                C.Temperatura,
                C.Shtypja_Ajrit,
                C.Lageshtia_Ajrit,
                C.Reshje_Shiu,
                C.Reshje_Bore,
                T.Insolacioni,
                T.Vranesirat
FROM Te_Dhenat_Klimatologjike T,  TABLE(T.KMatje) C, Stacionet_Meteorologjike m
WHERE T.StacioniID = m.StacioniID

CREATE VIEW ZHURMA_VIEW AS
SELECT Zid, Data_Koha, Tipi_Pranuesit, Vlera_Zhurmes 
    FROM Zhurma

INSERT INTO Zhurma_View VALUES (20, '17-DEC-2019 03:00:00 PM', 'Fabrikat', 66);

UPDATE Zhurma_View 
    SET Vlera_Zhurmes = 65
    WHERE ZId = 19;
    
select * from Zhurma_View;