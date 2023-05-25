--Create schema test;

--tworzenie bazy
CREATE DATABASE geologia;
CREATE SCHEMA geol;


--tworzenie tabelek
CREATE TABLE geol.eon(id_eon INT primary key,neon varchar(30));
CREATE TABLE geol.era( id_era INT primary key, nera varchar(30),
		id_eon INT,
		Foreign key (id_eon) REFERENCES geol.eon(id_eon));
 CREATE TABLE geol.okres(id_okres INT primary key, nokres varchar(30),
		id_era INT,
		 FOREIGN KEY (id_era) REFERENCES geol.era(id_era));
CREATE TABLE geol.epoka( id_epoka INT primary key, nepoka varchar(30),
		id_okres INT,
		FOREIGN KEY (id_okres) REFERENCES geol.okres(id_okres));
CREATE TABLE geol.pietro(id_pietro INT primary key, npietro varchar(30),
		id_epoka INT,
		 FOREIGN KEY (id_epoka) REFERENCES geol.epoka(id_epoka));


--wypelnianie pietra
INSERT INTO geol.pietro VALUES (1,'megalaj',22);
INSERT INTO geol.pietro VALUES(2,'nortgryp',22);
INSERT INTO geol.pietro VALUES(3,'grenland',22);
INSERT INTO geol.pietro VALUES(4,'tarant',21);
INSERT INTO geol.pietro VALUES(5,'chiban',21);
INSERT INTO geol.pietro VALUES(6,'kalabr',21);
INSERT INTO geol.pietro VALUES(7,'gelas',21);
INSERT INTO geol.pietro VALUES(8,'piacent',20);
INSERT INTO geol.pietro VALUES(9,'zankl',20);
INSERT INTO geol.pietro VALUES(10,'messyn',19);
INSERT INTO geol.pietro VALUES(11,'torton',19);
INSERT INTO geol.pietro VALUES(12,'serrawal',19);
INSERT INTO geol.pietro VALUES(13,'lang',19);
INSERT INTO geol.pietro VALUES(14,'burdyga',19);
INSERT INTO geol.pietro VALUES(15,'akwitan',19);
INSERT INTO geol.pietro VALUES(16,'szat',18);
INSERT INTO geol.pietro VALUES(17,'rupel',18);
INSERT INTO geol.pietro VALUES(18,'priabon',17);
INSERT INTO geol.pietro VALUES(19,'barton',17);
INSERT INTO geol.pietro VALUES(20,'lutet',17);
INSERT INTO geol.pietro VALUES(21,'iprez',17);
INSERT INTO geol.pietro VALUES(22,'tanet',16);
INSERT INTO geol.pietro VALUES(23,'zeland',16);
INSERT INTO geol.pietro VALUES(24,'dan',16);
INSERT INTO geol.pietro VALUES(25,'mastrycht',15);
INSERT INTO geol.pietro VALUES(26,'kampan',15);
INSERT INTO geol.pietro VALUES(27,'santon',15);
INSERT INTO geol.pietro VALUES(28,'koniak',15);
INSERT INTO geol.pietro VALUES(29,'turon',15);
INSERT INTO geol.pietro VALUES(30,'cenoman',15);
INSERT INTO geol.pietro VALUES(31,'alb',14);
INSERT INTO geol.pietro VALUES(32,'apt',14);
INSERT INTO geol.pietro VALUES(33,'barrem',14);
INSERT INTO geol.pietro VALUES(34,'hoteryw',14);
INSERT INTO geol.pietro VALUES(35,'walanzyn',14);
INSERT INTO geol.pietro VALUES(36,'berrias',14);
INSERT INTO geol.pietro VALUES(37,'tyton',13);
INSERT INTO geol.pietro VALUES(38,'kimeryd',13);
INSERT INTO geol.pietro VALUES(39,'oksford',13);
INSERT INTO geol.pietro VALUES(40,'kelowej',12);
INSERT INTO geol.pietro VALUES(41,'baton',12);
INSERT INTO geol.pietro VALUES(42,'bajos',12);
INSERT INTO geol.pietro VALUES(43,'aalen',12);
INSERT INTO geol.pietro VALUES(44,'toark',11);
INSERT INTO geol.pietro VALUES(45,'pliensbach',11);
INSERT INTO geol.pietro VALUES(46,'synemur',11);
INSERT INTO geol.pietro VALUES(47,'hettang',11);
INSERT INTO geol.pietro VALUES(48,'retyk',10);
INSERT INTO geol.pietro VALUES(49,'noryk',10);
INSERT INTO geol.pietro VALUES(50,'karnik',10);
INSERT INTO geol.pietro VALUES(51,'ladyn',9);
INSERT INTO geol.pietro VALUES(52,'anizyk',9);
INSERT INTO geol.pietro VALUES(53,'olenek',8);
INSERT INTO geol.pietro VALUES(54,'ind',8);
INSERT INTO geol.pietro VALUES(55,'czangsing',7);
INSERT INTO geol.pietro VALUES(56,'wucziaping',7);
INSERT INTO geol.pietro VALUES(57,'kapitan',7);
INSERT INTO geol.pietro VALUES(58,'word',7);
INSERT INTO geol.pietro VALUES(59,'road',7);
INSERT INTO geol.pietro VALUES(60,'kungur',6);
INSERT INTO geol.pietro VALUES(61,'artinsk',6);
INSERT INTO geol.pietro VALUES(62,'sakmar',6);
INSERT INTO geol.pietro VALUES(63,'assel',6);
INSERT INTO geol.pietro VALUES(64,'gzel',5);
INSERT INTO geol.pietro VALUES(65,'kasimow',5);
INSERT INTO geol.pietro VALUES(66,'moskow',5);
INSERT INTO geol.pietro VALUES(67,'baszkir',5);
INSERT INTO geol.pietro VALUES(68,'serpuchow',4);
INSERT INTO geol.pietro VALUES(69,'wizen',4);
INSERT INTO geol.pietro VALUES(70,'turnej',4);
INSERT INTO geol.pietro VALUES(71,'famen',3);
INSERT INTO geol.pietro VALUES(72,'fran',3);
INSERT INTO geol.pietro VALUES(73,'zywet',2);
INSERT INTO geol.pietro VALUES(74,'eifel',2);
INSERT INTO geol.pietro VALUES(75,'ems',1);
INSERT INTO geol.pietro VALUES(76,'prag',1);
INSERT INTO geol.pietro VALUES(77,'lochkow',1);
--select * from geol.pietro


--wypelnianie epoki
INSERT INTO geol.epoka VALUES(1, 'dolny', 1);
INSERT INTO geol.epoka VALUES(2, 'srodkowy', 1);
INSERT INTO geol.epoka VALUES(3, 'gorny', 1);
INSERT INTO geol.epoka VALUES(4, 'dolny', 2);
INSERT INTO geol.epoka VALUES(5, 'gorny', 2);
INSERT INTO geol.epoka VALUES(6, 'dolny', 3);
INSERT INTO geol.epoka VALUES(7, 'gorny', 3);
INSERT INTO geol.epoka VALUES(8, 'dolny', 4);
INSERT INTO geol.epoka VALUES(9, 'srodkowy', 4);
INSERT INTO geol.epoka VALUES(10, 'gorny', 4);
INSERT INTO geol.epoka VALUES(11, 'dolna', 5);
INSERT INTO geol.epoka VALUES(12, 'srodkowa', 5);
INSERT INTO geol.epoka VALUES(13, 'gorna', 5);
INSERT INTO geol.epoka VALUES(14, 'dolna', 6);
INSERT INTO geol.epoka VALUES(15, 'gorna', 6);
INSERT INTO geol.epoka VALUES(16, 'paleocen', 7);
INSERT INTO geol.epoka VALUES(17, 'eocen', 7);
INSERT INTO geol.epoka VALUES(18, 'oligocen', 7);
INSERT INTO geol.epoka VALUES(19, 'miocen', 8);
INSERT INTO geol.epoka VALUES(20, 'pliocen', 8);
INSERT INTO geol.epoka VALUES(21, 'plejstocen', 9);
INSERT INTO geol.epoka VALUES(22, 'holocen', 9);
--select * from geol.epoka


--wypelnianie okresu
INSERT INTO geol.okres VALUES(1, 'dewon',1);
INSERT INTO geol.okres VALUES(2, 'karbon',1);
INSERT INTO geol.okres VALUES(3, 'perm',1);
INSERT INTO geol.okres VALUES(4, 'trias',2);
INSERT INTO geol.okres VALUES(5, 'jura',2);
INSERT INTO geol.okres VALUES(6, 'kreda',2);
INSERT INTO geol.okres VALUES(7, 'palogen',3);
INSERT INTO geol.okres VALUES(8, 'neogen',3);
INSERT INTO geol.okres VALUES(9, 'czwartorzad',3);
--select * from geol.okres


--wypelnianie ery
INSERT INTO geol.era VALUES(1,'paleozoik',1);
INSERT INTO geol.era VALUES(2,'mezozoik',1);
INSERT INTO geol.era VALUES(3,'kenozoik',1);
--select * from geol.era


--wypelnianie eonu
INSERT INTO geol.eon VALUES(1,'fanerozoik');

--select * from geol.eon;


 CREATE TABLE geol.chrono AS (SELECT * FROM geol.pietro NATURAL JOIN geol.epoka NATURAL
JOIN geol.okres NATURAL JOIN geol.era NATURAL JOIN geol.eon);

ALTER TABLE geol.chrono ADD PRIMARY KEY(ID_pietro);

--stworzenie tabel milion i dziesiec
CREATE TABLE dziesiec(cyfra INT,bit INT);
CREATE TABLE milion(liczba INT,cyfra INT, bit INT);
--wypelnianie dziesiatki
INSERT INTO dziesiec VALUES (0,1);
INSERT INTO dziesiec VALUES (1,1);
INSERT INTO dziesiec VALUES (2,1);
INSERT INTO dziesiec VALUES (3,1);
INSERT INTO dziesiec VALUES (4,1);
INSERT INTO dziesiec VALUES (5,1);
INSERT INTO dziesiec VALUES (6,1);
INSERT INTO dziesiec VALUES (7,1);
INSERT INTO dziesiec VALUES (8,1);
INSERT INTO dziesiec VALUES (9,1);
select * from dziesiec;

--wypelnianie miliona
INSERT INTO milion
select a1.cyfra+10*a2.cyfra+100*a3.cyfra+1000*a4.cyfra
+10000*a5.cyfra+10000*a6.cyfra as liczba, a1.cyfra as cyfra, a1.bit as bit
from dziesiec a1, dziesiec a2, dziesiec a3, dziesiec a4, dziesiec a5, dziesiec a6;



--INSERT INTO milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
--+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
--FROM dziesiec a1, dziesiec a2, dziesiec a3, dziesiec a4, dziesiec a5, dziesiec
--a6 ;

Select * from geol.epoka;
--ZAPYTANIE 1
SELECT COUNT(*) FROM milion INNER JOIN geol.chrono ON
(mod(milion.liczba,77)=(geol.chrono.id_pietro));
--ZAPYTANIE 2
SELECT COUNT(*) FROM milion INNER JOIN geol.pietro ON
(mod(milion.liczba,77)=geol.pietro.id_pietro) NATURAL JOIN geol.epoka NATURAL JOIN
geol.okres NATURAL JOIN geol.era NATURAL JOIN geol.eon;
--ZAPYTANIE 3
SELECT COUNT(*) FROM milion WHERE mod(milion.liczba,77)=
(SELECT id_pietro FROM geol.chrono WHERE mod(milion.liczba,77)=(id_pietro));
--ZAPYTANIE 4
SELECT COUNT(*) FROM milion WHERE mod(milion.liczba,77) in
(SELECT geol.pietro.id_pietro FROM geol.pietro NATURAL JOIN geol.epoka NATURAL JOIN geol.okres NATURAL JOIN geol.era NATURAL JOIN geol.eon);

create index indexEon on geol.eon(id_eon);
create index indexEra on geol.era(id_era, id_eon);
create index indexOkres on geol.okres(id_okres, id_era);
create index indexEpoka on geol.epoka(id_epoka, id_okres);
create index indexPietro on geol.pietro(id_pietro, id_epoka);
create index indexLiczba on milion(liczba);
create index indexTabela on geol.chrono(id_pietro, id_epoka, id_era, id_okres,id_eon);


drop index geol.indexEon;
drop index geol.indexEra;
drop index geol.indexOkres;
drop index geol.indexEpoka;
drop index geol.indexPietro;
drop index indexLiczba;
drop index geol.indexTabela;