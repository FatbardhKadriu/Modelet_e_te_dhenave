CREATE INDEX Te_Dhenat_Klimatologjike_Index ON KMatje_Nested(Data_Koha, Temperatura);

CREATE INDEX Temperatura_Tokes_Index ON Temp_Nested(Data_Koha, Temperatura_Tokes);

CREATE bitmap INDEX Stacionet_Hidrometrike_Index ON Stacionet_Hidrometrike(Pellgu_Lumor);

CREATE CLUSTER Te_Dhenat_H(HidroStacioniID INTEGER);
CREATE INDEX Te_Dhenat_H_Index ON CLUSTER Te_Dhenat_H;

CREATE INDEX Lista_Ndotesit_Index ON Ndotja_Nested(Koncentrimi - VleraMax_Lejueshme);

CREATE UNIQUE INDEX Zhurma_Index on Zhurma(Data_Koha, Tipi_Pranuesit);
