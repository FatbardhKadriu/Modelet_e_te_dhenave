--Te shfaqen te gjitha te dhenat te Njesite Matese
select * from Njesite_Matese;

--Te shfaqen te dhenat klimatologjike
SELECT * FROM Te_DhenatK_View

/***** Query : Listoni t� gjitha stacionet meteorologjike q� n� dat�n 12 dhjetor 2019 dhe or�n 02:00 PM nuk kan� pasur reshje bore *****/
SELECT   DISTINCT(S.Emri_i_stacionit) , C.Data_Koha
FROM     Te_Dhenat_Klimatologjike T, TABLE(T.KMatje) C, Stacionet_Meteorologjike S
WHERE   C.Reshje_Bore = 0  AND  C.Data_Koha = '12-DEC-2019 02:00:00 PM' AND  T.StacioniID = S.StacioniID;

--Te shfaqen te dhenat hidrologjike
SELECT * FROM Te_DhenatH_View

--DATA DICTIONARY
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, LAST_ANALYZED
    FROM DBA_TAB_COLUMNS
    WHERE OWNER = 'SYSTEM'
    ORDER BY TABLE_NAME;

SELECT CLUSTER_NAME FROM USER_CLUSTERS;

--Te shfaqen te dhenat e cilesise se Ajrit
select * from CilesiaAjrit_View

SELECT   S.StacioniID, 
                S.Emri_i_stacionit, 
                S.Koordinatat.Gjatesia_Gjeografike, 
                S.Koordinatat.Gjeresia_Gjeografike, 
                S.Lartesia_mbidetare, 
                S.Pellgu_Lumor
FROM Stacionet_Meteorologjike S;

SELECT   T.KId, 
                T.StacioniID,
                C.Data_Koha,
                C.Temperatura,
                C.Shtypja_Ajrit,
                C.Lageshtia_Ajrit,
                C.Reshje_Shiu,
                C.Reshje_Bore,
                T.Insolacioni,
                T.Vranesirat
FROM Te_Dhenat_Klimatologjike T,  TABLE(T.KMatje) C;


/*****    WINDOWING    *****/
SELECT
         C.Data_Koha, C.Temperatura, C.Shtypja_Ajrit, C.Lageshtia_Ajrit,
         SUM(Reshje_Bore) OVER() AS total_reshje_bore,
         SUM(Reshje_Bore) OVER(PARTITION BY C.Data_Koha) AS tot_reshje_bore
FROM     Te_Dhenat_Klimatologjike T, TABLE(T.KMatje) C
ORDER BY C.Data_Koha;

SELECT
         C.Data_Koha, C.Temperatura, C.Shtypja_Ajrit, C.Lageshtia_Ajrit,S.Pellgu_Lumor,
         ROW_NUMBER() OVER(PARTITION BY S.Emri_i_Stacionit order by S.Pellgu_Lumor desc) AS row_num1,
         ROW_NUMBER() OVER(PARTITION BY S.Emri_i_Stacionit ORDER BY S.Pellgu_Lumor, C.Data_Koha desc) AS row_num2
FROM Te_Dhenat_Klimatologjike T, TABLE(T.KMatje) C, Stacionet_Meteorologjike S
WHERE T.StacioniID = S.StacioniID;

*****    R A N K I N G    *****/
SELECT C.Vendi,N.Koncentrimi,
              RANK() OVER (ORDER BY N.Koncentrimi ASC) AS Rank
FROM Cilesia_Ajrit C, TABLE (C.Ndotja) N
WHERE N.Koncentrimi > 50;

SELECT E.TempTID,
              E.StacioniID,
              T.Data_Koha,
              T.Temperatura_Tokes,
              T.Thellesia_Tokes
FROM Temperatura_Tokes E, TABLE(E.Temperatura) T;

/*****    R A N K I N G    *****/
    SELECT ZId, Data_Koha, Tipi_Pranuesit, Vlera_Zhurmes, 
                 Row_Number() over (ORDER BY Vlera_Zhurmes DESC) AS RN,
                 RANK() OVER (ORDER BY Vlera_Zhurmes DESC) AS RNK1,
                 DENSE_RANK() OVER (ORDER BY Vlera_Zhurmes DESC) AS DRNK
    FROM Zhurma;


SELECT S.hidroStacioniID,
              S.Pellgu_Lumor,
              S.Emri_Stacionit,
              S.Lumi,
              S.Koordinatat.Gjeresia_Gjeografike,
              S.Koordinatat.Gjatesia_Gjeografike,
              S.Lartesia_Mbidetare
FROM Stacionet_Hidrometrike S;

/*****  C U R S O R  *****/
SET SERVEROUTPUT ON;
DECLARE 
    emri_Lumit VARCHAR2(30);
    CURSOR Stacionet_Hidrometrike_Cursor IS
    SELECT S.Lumi
    FROM Stacionet_Hidrometrike S
    WHERE S.Pellgu_Lumor = 'Drini i Bardh�';
BEGIN 
    OPEN Stacionet_Hidrometrike_Cursor;
    LOOP
        FETCH Stacionet_Hidrometrike_Cursor INTO emri_Lumit;
        DBMS_OUTPUT.PUT_LINE(emri_Lumit);
        EXIT WHEN Stacionet_Hidrometrike_Cursor%NOTFOUND;
    END LOOP;
    CLOSE Stacionet_Hidrometrike_Cursor;
END;

SELECT H.HId,
              H.hidroStacioniID,
              H.Distanca_Nga_Gryka,
              H.Siperfaqja_Ujembledhese,
              M.Data_Koha,
              M.Niveli_Ujit,
              M.Prurja_Ujit
FROM Te_Dhenat_Hidrometrike H , TABLE(H.HMatjet) M;

SELECT C.Aid,
              C.Vendi,
              N.Ndotesi,
              N.Data_Koha,
              N.Koncentrimi,
              N.VleraMax_Lejueshme
FROM Cilesia_Ajrit c, TABLE(c.ndotja) n;

/***** QUERY : Listoni t� gjitha vendet q� jan� t� rrezikuara nga ndotja e ajrit dhe ndot�sit p�rkat�s*****/
SELECT C.Vendi,
              N.Ndotesi
FROM Cilesia_Ajrit C, TABLE (C.Ndotja) N
WHERE (N.Koncentrimi - N.VleraMax_Lejueshme) > 0;

--Te gjendet numri i zhurmave sipas vleres se zhurmes
SELECT Vlera_Zhurmes, count(ZId) as "Numri i zhurmave"
FROM Zhurma 
GROUP BY Vlera_Zhurmes
HAVING count(Zid)>0

--Te gjenden numri i lumenjeve qe derdhen ne pellgjet perkatese perveq Lepencit
SELECT Pellgu_Lumor, count(*) as "Numri i lumenjve"
FROM Stacionet_hidrometrike
GROUP BY Pellgu_Lumor
HAVING Pellgu_Lumor <> 'Lepenci'


