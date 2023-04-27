
--zad1
CREATE DATABASE firma;
--zad2
CREATE SCHEMA ksiegowosc;
--zad4
CREATE TABLE ksiegowosc.pracownicy 
(
id_pracownika INT PRIMARY KEY NOT NULL,
imie VARCHAR(30) NOT NULL,
nazwisko VARCHAR(40) NOT NULL,
adres VARCHAR(75) NOT NULL,
telefon VARCHAR(12)
);


CREATE TABLE ksiegowosc.godziny (
id_godziny INT PRIMARY KEY NOT NULL,
dataa DATE NOT NULL,
liczba_godzin INT,
id_pracownika INT NOT NULL
CONSTRAINT id_pracownika_fk FOREIGN KEY  (id_pracownika) 
REFERENCES ksiegowosc.pracownicy (id_pracownika));

CREATE TABLE ksiegowosc.pensje (
id_pensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(30) NOT NULL,
kwota MONEY);

CREATE TABLE ksiegowosc.premie (
id_premii INT PRIMARY KEY NOT NULL,
rodzaj VARCHAR(30) NOT NULL,
kwota MONEY);

CREATE TABLE ksiegowosc.wynagrodzenie (
id_wynagrodzenie INT PRIMARY KEY,
dataa DATE NOT NULL,
id_pracownika INT NOT NULL,
id_godziny INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT NOT NULL
CONSTRAINT id_pracownika_fk_wynagrodzenie FOREIGN KEY  (id_pracownika) 
REFERENCES ksiegowosc.pracownicy (id_pracownika),
CONSTRAINT id_godziny_fk FOREIGN KEY  (id_godziny) 
REFERENCES ksiegowosc.godziny (id_godziny),
CONSTRAINT id_pensji_fk FOREIGN KEY  (id_pensji) 
REFERENCES ksiegowosc.pensje (id_pensji),
CONSTRAINT id_premii_fk FOREIGN KEY  (id_premii) 
REFERENCES ksiegowosc.premie (id_premii)
);

EXEC sys.sp_addextendedproperty
@name = N'Tabela pracownicy - opis',
@value = N'ID, imie, nazwisko, adres i numer telefonu ',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pracownicy';
GO

EXEC sys.sp_addextendedproperty
@name = N'Tabela- godziny pracy',
@value = N'Zanotowane przepracowane godziny',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'godziny';
GO

EXEC sys.sp_addextendedproperty
@name = N'Tabela premie - opis',
@value = N'ID premii, jej rodzaj oraz kwota premii',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'premie';
GO

EXEC sys.sp_addextendedproperty
@name = N'Tabela pensje - opis',
@value = N'ID pensji, stanowisko oraz kwota pensji',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pensje';
GO

EXEC sys.sp_addextendedproperty
@name = N'Tabela wynagrodzenie - opis',
@value = N'Jest to tabela pomocnicza ktora laczy pracownikow z ich pensja i premia, tworzac wynagrodzenie',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'wynagrodzenie';
GO


SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.wynagrodzenie');















--zad5
INSERT INTO ksiegowosc.pracownicy VALUES
(
1,
'Jan',
'W¹troba',
'ul. Mariañska 90 47-404 Racibórz',
'664628170'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
2,
'Patryk',
'Majewski',
'ul. Marsza³ka Pi³sudskiego Józefa 121 50-048 Wroc³aw',
'+48768458233'
)
INSERT INTO ksiegowosc.pracownicy VALUES
(
3,
'Dorota',
'Duda',
'ul. Kasztelañska 99 91-503 £ódŸ',
'+48996846952'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
4,
'Ryszard',
'Kowalczyk',
'ul. Do¿ynkowa 13 44-207 Rybnik',
'654976766'
);


INSERT INTO ksiegowosc.pracownicy VALUES
(
5,
'Andrzej',
'Szczepañski',
'ul. Œwie¿a 135 54-060 Wroc³aw',
'+48600432543'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
6,
'Krystian',
'Ostrowski',
'Al. Spó³dzielczoœci Pracy 56 20-160 Lublin',
'775988354'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
7,
'Sylwester',
'Krochmal',
'ul. Profesora ¯uka Tomasza 5 70-880 Szczecin',
'657334755'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
8,
'Seweryn',
'Krajewski',
'ul. Kowalska 66 47-400 Racibórz',
'+48455764434'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
9,
'Pawe³',
'Tomaszewski',
'ul. Ksiêdza P³onki Emanuela 67 44-337 Jastrzêbie-Zdrój',
'+48344245246'
);

INSERT INTO ksiegowosc.pracownicy VALUES
(
10,
'Adrianna',
'Jach',
'ul. S³oneczników 42 75-813 Koszalin',
'788467456'
);

Select * FROM ksiegowosc.pracownicy

INSERT INTO ksiegowosc.premie VALUES
(
1,
'pracownik miesiaca',
750
);
INSERT INTO ksiegowosc.premie VALUES
(
2,
'dojazdy',
500
);
INSERT INTO ksiegowosc.premie VALUES
(
3,
'remontowa',
600
);
INSERT INTO ksiegowosc.premie VALUES
(
4,
'przedswiateczna',
300
);
INSERT INTO ksiegowosc.premie VALUES
(
5,
'rodzicielska',
800
);
INSERT INTO ksiegowosc.premie VALUES
(
6,
'motywacyjna',
500
);
INSERT INTO ksiegowosc.premie VALUES
(
7,
'okazjonalna',
350
);
INSERT INTO ksiegowosc.premie VALUES
(
8,
'wakacyjna',
555
);
INSERT INTO ksiegowosc.premie VALUES
(
9,
'rozwojowa',
450
);
INSERT INTO ksiegowosc.premie VALUES
(
10,
'urlopowa',
460
);

SELECT * FROM ksiegowosc.premie

INSERT INTO ksiegowosc.pensje VALUES
(
1,
'CEO',
4600
);

INSERT INTO ksiegowosc.pensje VALUES
(
2,
'Ksiegowy',
3600
);

INSERT INTO ksiegowosc.pensje VALUES
(
3,
'PR',
3800
);

INSERT INTO ksiegowosc.pensje VALUES
(
4,
'HR',
3450
);

INSERT INTO ksiegowosc.pensje VALUES
(
5,
'Recepcja',
3200
);

INSERT INTO ksiegowosc.pensje VALUES
(
6,
'EXPORT',
4100
);

INSERT INTO ksiegowosc.pensje VALUES
(
7,
'IT',
4300
);

INSERT INTO ksiegowosc.pensje VALUES
(
8,
'Magazyn',
3800
);

INSERT INTO ksiegowosc.pensje VALUES
(
9,
'Tranzyt I',
4000
);

INSERT INTO ksiegowosc.pensje VALUES
(
10,
'Tranzyt II',
4000
);

SELECT * FROM ksiegowosc.pensje



INSERT INTO ksiegowosc.godziny VALUES
(
1,
'2023-04-18',
6,
1
);

INSERT INTO ksiegowosc.godziny VALUES
(
2,
'2023-04-18',
7,
2
);

INSERT INTO ksiegowosc.godziny VALUES
(
3,
'2023-04-18',
7,
3
);

INSERT INTO ksiegowosc.godziny VALUES
(
4,
'2023-04-18',
8,
4
);

INSERT INTO ksiegowosc.godziny VALUES
(
5,
'2023-04-19',
8,
5
);

INSERT INTO ksiegowosc.godziny VALUES
(
6,
'2023-04-18',
6,
6
);

INSERT INTO ksiegowosc.godziny VALUES
(
7,
'2023-04-18',
9,
7
);

INSERT INTO ksiegowosc.godziny VALUES
(
8,
'2023-04-19',
4,
8
);

INSERT INTO ksiegowosc.godziny VALUES
(
9,
'2023-04-18',
12,
9
);

INSERT INTO ksiegowosc.godziny VALUES
(
10,
'2023-04-19',
12,
10
);

SELECT * FROM ksiegowosc.godziny

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
10,
'2023-04-19',
10,
10,
10,
10
);


INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
9,
'2023-04-18',
9,
9,
9,
9
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
8,
'2023-04-19',
8,
8,
8,
8
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
7,
'2023-04-18',
7,
7,
7,
7
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
6,
'2023-04-18',
6,
6,
6,
6
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
5,
'2023-04-19',
5,
5,
5,
5
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
4,
'2023-04-18',
4,
4,
4,
4
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
3,
'2023-04-18',
3,
3,
3,
3
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
2,
'2023-04-18',
2,
2,
2,
2
);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(
1,
'2023-04-18',
1,
1,
1,
1
);


SELECT * FROM ksiegowosc.wynagrodzenie





--zad6
--a
SELECT pracownicy.id_pracownika, pracownicy.nazwisko
FROM ksiegowosc.pracownicy;

--b
SELECT pracownicy.id_pracownika
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje
ON wynagrodzenie.id_pensji = pensje.id_pensji
WHERE kwota > 1000;

--c
SELECT prac.id_pracownika
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.premie pre
ON wyn.id_premii = pre.id_premii
JOIN ksiegowosc.pensje pen
ON wyn.id_pensji = pen.id_pensji
WHERE pre.kwota = 0 AND pen.kwota > 2000;

--d
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';

--e
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

--f
SELECT prac.imie, prac.nazwisko,
nadgodziny = 24*godz.liczba_godzin - 160
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.godziny godz
ON wyn.id_godziny = godz.id_godziny;

--g
SELECT prac.imie, prac.nazwisko
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensje pen
ON pen.id_pensji = wyn.id_pensji
WHERE pen.kwota BETWEEN 1500 AND 3000;

--h
SELECT prac.imie, prac.nazwisko
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.godziny godz
ON wyn.id_godziny = godz.id_godziny
JOIN ksiegowosc.premie pre
ON pre.id_premii = wyn.id_premii
WHERE 30*godz.id_godziny - 160 > 0 AND pre.kwota = 0;

--i
SELECT prac.imie, prac.nazwisko, pen.kwota
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensje pen
ON pen.id_pensji = wyn.id_pensji
ORDER BY pen.kwota ASC;

--j
SELECT prac.imie, prac.nazwisko, pen.kwota,
pensja_i_premia = pen.kwota + pre.kwota
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensje pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premie pre
ON pre.id_premii = wyn.id_premii
ORDER BY pen.kwota+pre.kwota DESC;

--k
SELECT pen.stanowisko, COUNT(prac.nazwisko) AS iloœæ_pracowników
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensje pen
ON pen.id_pensji = wyn.id_pensji
GROUP BY pen.stanowisko;

--l
SELECT
stanowisko = 'CEO',
AVG(kwota) AS œrednia_pensji, 
MIN(kwota) AS minimalna_pensja, 
MAX(kwota) AS maksymalna_pensja
FROM ksiegowosc.pensje
WHERE pensje.stanowisko = 'CEO';

--m
SELECT SUM(pen.kwota + pre.kwota)
FROM ksiegowosc.wynagrodzenie wyn
JOIN ksiegowosc.pensje pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premie pre
ON pre.id_premii = wyn.id_premii;

--n
SELECT pen.stanowisko, 
SUM(pen.kwota + pre.kwota) AS Suma_wynagrodzeñ
FROM ksiegowosc.pensje pen
JOIN ksiegowosc.wynagrodzenie wyn
ON wyn.id_pensji = pen.id_pensji
JOIN ksiegowosc.premie pre
ON pre.id_premii = wyn.id_premii
GROUP BY pen.stanowisko;

--o
SELECT pen.stanowisko, 
COUNT(pre.kwota) AS iloœæ_premii
FROM ksiegowosc.pensje pen
JOIN ksiegowosc.wynagrodzenie wyn
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premie pre
ON pre.id_premii = wyn.id_premii
GROUP BY pen.stanowisko;

--p
DELETE prac 
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensje pen
ON pen.id_pensji = wyn.id_pensji
WHERE pen.kwota < 1200;

