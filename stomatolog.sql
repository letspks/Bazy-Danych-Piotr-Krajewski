--CREATE DATABASE stomatologia;
--CREATE SCHEMA historia;
CREATE TABLE historia.pracownicy(
IDPracownika VARCHAR(5) PRIMARY KEY NOT NULL,
NazwaLekarza VARCHAR(60) NOT NULL)

CREATE TABLE historia.pacjenci(
IDPacjenta VARCHAR(5) PRIMARY KEY NOT NULL,
NazwaPacjenta VARCHAR(60) NOT NULL)

CREATE TABLE historia.zabiegi(
IDZabiegu VARCHAR(4) PRIMARY KEY NOT NULL,
NazwaZabiegu VARCHAR(30) NOT NULL)


CREATE TABLE historia.wizyty(
DataGodzinaWizyty DATETIME PRIMARY KEY NOT NULL,
IDPacjenta VARCHAR(5) NOT NULL,
IDPracownika VARCHAR(5) NOT NULL,
CONSTRAINT IDPacjenta_FK_wizyty FOREIGN KEY  (IDPacjenta) 
REFERENCES historia.pacjenci (IDPacjenta),
CONSTRAINT IDPracownika_FK_wizyty FOREIGN KEY  (IDPracownika) 
REFERENCES historia.pracownicy (IDPracownika)
)

CREATE TABLE historia.wykonanezabiegi(
IDZabiegu VARCHAR(4) NOT NULL,
DataGodzinaWizyty DATETIME PRIMARY KEY NOT NULL,
CONSTRAINT Data_FK FOREIGN KEY  (DataGodzinaWizyty) 
REFERENCES historia.wizyty (DataGodzinaWizyty),
CONSTRAINT IDZabiegu_FK FOREIGN KEY  (IDZabiegu) 
REFERENCES historia.zabiegi (IDZabiegu))


--wypelnianie lekarzy
INSERT INTO historia.pracownicy VALUES
(
'S1101',
'Maria Nowak'
);

INSERT INTO historia.pracownicy VALUES
(
'S1024',
'Jan Kowalski'
);

INSERT INTO historia.pracownicy VALUES
(
'S1045',
'Anna Jab³oñska'
);

INSERT INTO historia.pracownicy VALUES
(
'S1034',
'Marek Potocki'
);

--wypelnianie pacjentow

INSERT INTO historia.pacjenci VALUES
(
'P100',
'Anna Jeleñ'
);
INSERT INTO historia.pacjenci VALUES
(
'P105',
'Jaros³aw Nicpoñ'
);
INSERT INTO historia.pacjenci VALUES
(
'P108',
'Joanna Nosek'
);

INSERT INTO historia.pacjenci VALUES
(
'P120',
'Jan Ka³u¿a'
);
INSERT INTO historia.pacjenci VALUES
(
'P130',
'Jerzy Lis'
);
INSERT INTO historia.pacjenci VALUES
(
'P123',
'Olga Nowacka'
);

--wypelnianie zabiegow

INSERT INTO historia.zabiegi VALUES
(
'Z500',
'Borowanie'
);
INSERT INTO historia.zabiegi VALUES
(
'Z496',
'Lakowanie'
);
INSERT INTO historia.zabiegi VALUES
(
'Z503',
'Usuwanie kamienia'
);

--wypelnianie wizyt
INSERT INTO historia.wizyty VALUES
(
'2020-03-12 10:00:00',
'P100',
'S1101'
);
INSERT INTO historia.wizyty VALUES
(
'2020-03-12 13:00:00',
'P105',
'S1101'
);
INSERT INTO historia.wizyty VALUES
(
'2020-03-14 10:00:00',
'P108',
'S1101'
);
INSERT INTO historia.wizyty VALUES
(
'2020-03-16 17:00:00',
'P108',
'S1024'
);
INSERT INTO historia.wizyty VALUES
(
'2020-03-18 9:00:00',
'P120',
'S1045'
);
INSERT INTO historia.wizyty VALUES
(
'2020-03-20 8:00:00',
'P130',
'S1034'
);
INSERT INTO historia.wizyty VALUES
(
'2020-03-12 15:00:00',
'P123',
'S1034'
);
Select * from historia.wizyty

--wypelnianie wykonanych zabiegow

INSERT INTO historia.wykonanezabiegi VALUES
(
'Z500',
'2020-03-12 10:00:00'
);

INSERT INTO historia.wykonanezabiegi VALUES
(
'Z496',
'2020-03-12 13:00:00'
);

INSERT INTO historia.wykonanezabiegi VALUES
(
'Z500',
'2020-03-14 10:00:00'
);

INSERT INTO historia.wykonanezabiegi VALUES
(
'Z503',
'2020-03-16 17:00:00'
);
INSERT INTO historia.wykonanezabiegi VALUES
(
'Z500',
'2020-03-18 9:00:00'
);
INSERT INTO historia.wykonanezabiegi VALUES
(
'Z496',
'2020-03-20 8:00:00'
);
INSERT INTO historia.wykonanezabiegi VALUES
(
'Z503',
'2020-03-12 15:00:00'
);


