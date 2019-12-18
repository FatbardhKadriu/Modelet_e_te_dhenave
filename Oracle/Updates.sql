INSERT INTO Njesite_Matese VALUES ('Koordinata', 'Grade(�)');
INSERT INTO Njesite_Matese VALUES('Lartesia mbidetare', 'Meter(m)');
INSERT INTO Njesite_Matese VALUES('Insolacioni(Diellosja)', 'Ore(h)');
INSERT INTO Njesite_Matese VALUES('Vranesirat', 'Pa dimension');
INSERT INTO Njesite_Matese VALUES('Temperatura', 'Grade celsius');
INSERT INTO Njesite_Matese VALUES('Shtypja e Ajrit', 'Hekto Paskal(hPa)');
INSERT INTO Njesite_Matese VALUES('Lageshtia e Ajrit', 'Perqindje(%)');
INSERT INTO Njesite_Matese VALUES('Reshje Shiu', 'Milimeter(mm)');
INSERT INTO Njesite_Matese VALUES('Reshje Bore', 'Centimeter(cm)');
INSERT INTO Njesite_Matese VALUES('Thellesia e Tokes', 'Centimeter(cm)');
INSERT INTO Njesite_Matese VALUES('Distanca nga Gryka', 'Kilometer(km)');
INSERT INTO Njesite_Matese VALUES('Siperfaqja Ujembledhese', 'Kilometer ne katror(km^2)');
INSERT INTO Njesite_Matese VALUES('Niveli i ujit', 'Centimeter(cm)');
INSERT INTO Njesite_Matese VALUES('Prurja e ujit', 'Meter ne kub per sekond(m^3/s)');
INSERT INTO Njesite_Matese VALUES('Koncentrimi i ndotesit', 'Mikrogram per meter kub(ug/m^3)');

INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor) 
              VALUES ( 'Brezovic�', Koordinatat(42.22169, 21.00166), 915, 'Lepenc');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor)
              VALUES ('Dragash', Koordinatat(42.06236, 20.64678), 1060, 'Plav�');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor) 
              VALUES ('Ferizaj', Koordinatat(42.37568, 21.13703), 578, 'Lepenc');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor)
              VALUES ('Junik', Koordinatat(42.48414, 20.26761), 618, 'Drini i Bardh�');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor) 
              VALUES ('Mitrovic�', Koordinatat(42.89378, 20.87317), 510, 'Ibri');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor)
              VALUES ('Pej�', Koordinatat(42.66564, 20.30508), 498, 'Drini i Bardh�');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor)
              VALUES ('Podujev�', Koordinatat(42.93385, 21.19789), 620, 'Ibri');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor) 
              VALUES ('Prishtin�', Koordinatat(42.64899, 21.13708), 573, 'Ibri');
INSERT INTO Stacionet_Meteorologjike(Emri_i_stacionit, Koordinatat, Lartesia_mbidetare, Pellgu_Lumor) 
              VALUES ('Prizren', Koordinatat(42.24751, 20.73567), 402, 'Drini i Bardh�');


UPDATE Stacionet_Meteorologjike S
    SET S.Koordinatat.Gjeresia_Gjeografike = 42.9,
           S.Koordinatat .Gjatesia_Gjeografike = 21.1
WHERE S.Emri_i_stacionit = 'Podujev�';


INSERT INTO Te_Dhenat_Klimatologjike VALUES 
(101,  2, Lista_MatjeveK(KMatje('15-DEC-2019 07:00:00 AM', -8.2, 945.4, 88, 0, 7),
                         KMatje('12-DEC-2019 02:00:00 PM', -5.1, 941.1, 85, 0, 4), 
                         KMatje('12-DEC-2019 09:00:00 PM', -6.1, 955.4, 84, 0, 6)),3, 8);
                                                 
INSERT INTO Te_Dhenat_Klimatologjike VALUES 
(103,  3, Lista_MatjeveK(KMatje('15-DEC-2019 07:00:00 AM', -7.2, 888.4, 78, 0, 2),
                         KMatje('12-DEC-2019 02:00:00 PM', -4.1, 921.1, 55, 0, 3), 
                         KMatje('12-DEC-2019 09:00:00 PM', -4.1, 945.4, 74, 0, 4)),5, 2);
INSERT INTO Te_Dhenat_Klimatologjike VALUES 
(104,  7, Lista_MatjeveK(KMatje('15-DEC-2019 07:00:00 AM', 7.2, 884.4, 71, 0, 0),
                         KMatje('12-DEC-2019 02:00:00 PM', 9.1, 921.1, 55, 0, 0), 
                         KMatje('12-DEC-2019 09:00:00 PM', 4.1, 845.4, 74, 0, 0)),7, 4);

INSERT INTO Temperatura_Tokes VALUES (1, 3, Lista_Temperature(Temperatura('15-DEC-2019 07:00:00 AM', 2.2, 5),
                                                              Temperatura('15-DEC-2019 02:00:00 PM', 2.9, 10),
                                                              Temperatura('15-DEC-2019 02:00:00 PM', 7.8, 100)));
INSERT INTO Temperatura_Tokes VALUES (2, 8, Lista_Temperature(Temperatura('15-DEC-2019 07:00:00 AM', 3.9, 5),
                                                              Temperatura('15-DEC-2019 02:00:00 PM', 7.9, 100)));
                                                              
INSERT INTO Stacionet_Hidrometrike VALUES (124,'Drini i Bardh�', 'Gryk�', 'Bistrica Pej�s', koordinatat(42.66175, 20.25122), 581);
INSERT INTO Stacionet_Hidrometrike VALUES (126,'Drini i Bardh�', 'Gjakov�', 'Ereniku', koordinatat(42.36954, 20.42086), 341);
INSERT INTO Stacionet_Hidrometrike VALUES (127,'Drini i Bardh�', 'Prizren', 'Bistrica Prizrenit', koordinatat(42.1943, 20.7739), 525);
INSERT INTO Stacionet_Hidrometrike VALUES (128,'Drini i Bardh�', 'Berkov�', 'Lumi i Istogut', koordinatat(42.67754, 20.52122), 401);
INSERT INTO Stacionet_Hidrometrike VALUES (129,'Drini i Bardh�', 'Drelaj', 'Bistrica e Pej�s', koordinatat(42.47754, 20.44122), 965);
INSERT INTO Stacionet_Hidrometrike VALUES (130,'Drini i Bardh�', 'Klin�', 'Lumi Klina', koordinatat(42.77754, 20.74122), 380);
INSERT INTO Stacionet_Hidrometrike VALUES (131,'Drini i Bardh�', 'Mirush�', 'Lumi Mirusha', koordinatat(42.27754, 20.44174), 366);
INSERT INTO Stacionet_Hidrometrike VALUES (132,'Drini i Bardh�', 'Piran�', 'Drini i Bardh�', koordinatat(42.17124, 20.42022), 299);
INSERT INTO Stacionet_Hidrometrike VALUES (133,'Ibri', 'Lluzhan', 'Llapi', koordinatat(42.27124, 20.11022), 565);
INSERT INTO Stacionet_Hidrometrike VALUES (134,'Ibri', 'Milloshev�', 'Lumi Llap', koordinatat(42.57124, 20.54022), 534);
INSERT INTO Stacionet_Hidrometrike VALUES (135,'Lepenci', 'Brod', 'Lepenci', koordinatat(42.67124, 20.17022), 634);
INSERT INTO Stacionet_Hidrometrike VALUES (136,'Ibri', 'Kacanik', 'Lumi Nerodime', koordinatat(42.77124, 20.11722), 478);
INSERT INTO Stacionet_Hidrometrike VALUES (137,'Ibri', 'Vragoli', 'Lumi Sitnica', koordinatat(42.21244, 20.14022), 536);    

INSERT INTO Te_Dhenat_Hidrometrike VALUES (h_sequence.NEXTVAL, 124, 29.4, 114, Lista_MatjeveH(HMatje('15-DEC-2019 12:00:00 AM', 48, 0.6)));
INSERT INTO Te_Dhenat_Hidrometrike VALUES (h_sequence.NEXTVAL, 126, 41, 102, Lista_MatjeveH(HMatje('15-DEC-2019 12:00:00 AM', 41, 0.2),                                                                                                                                       HMatje('15-DEC-2019 :5:00:00 PM', 40, 0.2)));
INSERT INTO Te_Dhenat_Hidrometrike VALUES (h_sequence.NEXTVAL, 127, 16.3, 158, Lista_MatjeveH(HMatje('15-DEC-2019 12:00:00 AM', 46, 1.1),
                                                                                               HMatje('15-DEC-2019 :5:00:00 PM', 44, 1.2)));    
INSERT INTO Te_Dhenat_Hidrometrike VALUES (h_sequence.NEXTVAL, 128, 15.3, 148, Lista_MatjeveH(HMatje('15-DEC-2019 12:00:00 AM', 36, 0.1),
                                                                                               HMatje('15-DEC-2019 :5:00:00 PM', 44, 0.2)));   
                                                                                               
                                                                                               
INSERT INTO Cilesia_Ajrit VALUES (11, 'Prishtin�', Lista_Ndotesit(Ndotesit( '15-DEC-2019 12:00:00 AM', 'PM2.5', 26, 25),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'PM10', 51, 50),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'SO2', 151, 150),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'NO2', 40, 40),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'O3', 121, 120)));
                                                                  
INSERT INTO Cilesia_Ajrit VALUES (12, 'Podujev�', Lista_Ndotesit(Ndotesit( '17-DEC-2019 12:00:00 AM', 'PM2.5', 19, 25),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'PM10', 29, 50),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'SO2', 100, 150),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'NO2', 25, 40),
                                                                  Ndotesit( '15-DEC-2019 12:00:00 AM', 'O3', 101, 120)));
                                                                  
INSERT INTO Zhurma VALUES (10, '17-DEC-2019 07:00:00 AM', 'Vendbanime Rurale', 30);
INSERT INTO Zhurma VALUES (11, '17-DEC-2019 08:00:00 AM', 'Vendbanime Urbane', 40);
INSERT INTO Zhurma VALUES (12, '17-DEC-2019 09:00:00 AM', 'Vendbanime Industriale', 50);
INSERT INTO Zhurma VALUES (13, '17-DEC-2019 10:00:00 AM', 'Sholl�', 35);
INSERT INTO Zhurma VALUES (14, '17-DEC-2019 11:00:00 AM', 'Spitali', 40);
INSERT INTO Zhurma VALUES (15, '17-DEC-2019 12:00:00 AM', 'Kultet', 40);
INSERT INTO Zhurma VALUES (16, '17-DEC-2019 01:00:00 PM', 'Parqet Nacionale', 50);
INSERT INTO Zhurma VALUES (17, '17-DEC-2019 02:00:00 PM', 'Fushat rekreative aktive', 50);
INSERT INTO Zhurma VALUES (18, '17-DEC-2019 03:00:00 PM', 'Objektet Komerciale', 65);


/*****   U P D A T E   *****/
UPDATE TABLE (SELECT Ndotja FROM Cilesia_Ajrit WHERE Vendi = 'Prishtin�') N
SET VALUE(N) = Ndotesit('16-DEC-2019 12:00:00 AM', 'O3', 122, 120)
WHERE  VALUE(N) = Ndotesit('15-DEC-2019 12:00:00 AM', 'O3', 121, 120);

/*****   D E L E T E    *****/
  DELETE FROM TABLE(SELECT Ndotja FROM Cilesia_Ajrit WHERE Vendi = 'Podujev�') P
  WHERE  VALUE(P) = Ndotesit('15-DEC-2019 12:00:00 AM', 'O3', 101, 120);
  
