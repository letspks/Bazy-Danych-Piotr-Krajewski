--CREATE DATABASE gastro
Create SCHEMA hurt
CREATE TABLE hurt.produkt(
NazwaProduktu VARCHAR(40) PRIMARY KEY NOT NULL,
CenaN SMALLMONEY NOT NULL,
CenaB SMALLMONEY NOT NULL)

CREATE TABLE hurt.dost1(
Dostawca1 VARCHAR(40) PRIMARY KEY NOT NULL,
Adres1 VARCHAR(100) NOT NULL)

CREATE TABLE hurt.dost2(
Dostawca2 VARCHAR(40) PRIMARY KEY NOT NULL,
Adres2 VARCHAR(100) NOT NULL)

CREATE TABLE hurt.przewoz(
IDprzewozu INT PRIMARY KEY NOT NULL,
NazwaProduktu VARCHAR(40) NOT NULL,
Dostawca1 VARCHAR(40) NOT NULL,
Dostawca2 VARCHAR(40) NOT NULL
CONSTRAINT Dostawca1_FK FOREIGN KEY  (Dostawca1) 
REFERENCES hurt.dost1 (Dostawca1),
CONSTRAINT Dostawca2_FK FOREIGN KEY  (Dostawca2) 
REFERENCES hurt.dost2 (Dostawca2))

-- wypelnianie produktow
INSERT INTO hurt.produkt VALUES
(
'Makaron Nitki',
130,
150
);

INSERT INTO hurt.produkt VALUES
(
'Keczup pikantny',
200,
220
);

INSERT INTO hurt.produkt VALUES
(
'Sos pomidorowy',
89,
110
);

--wypelnianie dostawcow

INSERT INTO hurt.dost1 VALUES
(
'Makarony polskie',
'Turystyczna 40, 31-435 Kraków'
);
INSERT INTO hurt.dost1 VALUES
(
'Polskie przetwory',
'Wojska Polskiego 44a, 31-342 Kraków'
);
INSERT INTO hurt.dost2 VALUES
(
'Lubelski Makaron',
'Pi³sudzkiego 332a, 04-242 Lublin'
);
INSERT INTO hurt.dost2 VALUES
(
'Przetwory pomidorowe',
'Rolnicza 22/4 30-243 Tarnów'
);
INSERT INTO hurt.dost2 VALUES
(
'Ma³opolskie smaki',
'Mickiewicza 223/77, 35-434 Nowy Targ'
);

--wypelnianie przewozu

INSERT INTO hurt.przewoz VALUES
(
1,
'Makaron Nitki',
'Makarony polskie',
'Lubelski Makaron'
);
INSERT INTO hurt.przewoz VALUES
(
2,
'Keczup pikantny',
'Polskie przetwory',
'Przetwory pomidorowe'
);
INSERT INTO hurt.przewoz VALUES
(
3,
'Sos pomidorowy',
'Polskie przetwory',
'Ma³opolskie smaki'
);
Select * from hurt.przewoz
Select * from hurt.produkt