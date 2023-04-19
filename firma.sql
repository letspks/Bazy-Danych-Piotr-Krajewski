CREATE DATABASE firma;
CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy 
(
id_pracownika INT PRIMARY KEY NOT NULL,
imie VARCHAR(30) NOT NULL,
nazwisko VARCHAR(40) NOT NULL,
adres VARCHAR(75) NOT NULL,
telefon VARCHAR(12)
);

ALTER TABLE rozliczenia.pracownicy
ALTER COLUMN nazwisko VARCHAR(40) NOT NULL;

CREATE TABLE rozliczenia.godziny (
id_godziny INT PRIMARY KEY NOT NULL,
dataa DATE NOT NULL,
liczba_godzin INT,
id_pracownika INT NOT NULL
CONSTRAINT id_pracownika_fk FOREIGN KEY  (id_pracownika) 
REFERENCES rozliczenia.pracownicy (id_pracownika));

CREATE TABLE rozliczenia.pensje (
id_pensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(30) NOT NULL,
kwota MONEY,
id_premii INT 
CONSTRAINT id_premii_fk FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie (id_premii));

CREATE TABLE rozliczenia.premie (
id_premii INT PRIMARY KEY NOT NULL,
rodzaj VARCHAR(30) NOT NULL,
kwota MONEY);

INSERT INTO rozliczenia.pracownicy VALUES
(
1,
'Jan',
'W¹troba',
'ul. Mariañska 90 47-404 Racibórz',
'664628170'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
2,
'Patryk',
'Majewski',
'ul. Marsza³ka Pi³sudskiego Józefa 121 50-048 Wroc³aw',
'+48768458233'
)
INSERT INTO rozliczenia.pracownicy VALUES
(
3,
'Dorota',
'Duda',
'ul. Kasztelañska 99 91-503 £ódŸ',
'+48996846952'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
4,
'Ryszard',
'Kowalczyk',
'ul. Do¿ynkowa 13 44-207 Rybnik',
'654976766'
);


INSERT INTO rozliczenia.pracownicy VALUES
(
5,
'Andrzej',
'Szczepañski',
'ul. Œwie¿a 135 54-060 Wroc³aw',
'+48600432543'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
6,
'Krystian',
'Ostrowski',
'Al. Spó³dzielczoœci Pracy 56 20-160 Lublin',
'775988354'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
7,
'Sylwester',
'Krochmal',
'ul. Profesora ¯uka Tomasza 5 70-880 Szczecin',
'657334755'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
8,
'Seweryn',
'Krajewski',
'ul. Kowalska 66 47-400 Racibórz',
'+48455764434'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
9,
'Pawe³',
'Tomaszewski',
'ul. Ksiêdza P³onki Emanuela 67 44-337 Jastrzêbie-Zdrój',
'+48344245246'
);

INSERT INTO rozliczenia.pracownicy VALUES
(
10,
'Adrianna',
'Jach',
'ul. S³oneczników 42 75-813 Koszalin',
'788467456'
);

Select * FROM rozliczenia.pracownicy

INSERT INTO rozliczenia.premie VALUES
(
1,
'pracownik miesiaca',
750
);
INSERT INTO rozliczenia.premie VALUES
(
2,
'dojazdy',
500
);
INSERT INTO rozliczenia.premie VALUES
(
3,
'remontowa',
600
);
INSERT INTO rozliczenia.premie VALUES
(
4,
'przedswiateczna',
300
);
INSERT INTO rozliczenia.premie VALUES
(
5,
'rodzicielska',
800
);
INSERT INTO rozliczenia.premie VALUES
(
6,
'motywacyjna',
500
);
INSERT INTO rozliczenia.premie VALUES
(
7,
'okazjonalna',
350
);
INSERT INTO rozliczenia.premie VALUES
(
8,
'wakacyjna',
555
);
INSERT INTO rozliczenia.premie VALUES
(
9,
'rozwojowa',
450
);
INSERT INTO rozliczenia.premie VALUES
(
10,
'motywacyjna',
460
);

SELECT * FROM rozliczenia.premie

INSERT INTO rozliczenia.pensje VALUES
(
1,
'CEO',
4600,
1
);

INSERT INTO rozliczenia.pensje VALUES
(
2,
'Ksiegowy',
3600,
2
);

INSERT INTO rozliczenia.pensje VALUES
(
3,
'PR',
3800,
3
);

INSERT INTO rozliczenia.pensje VALUES
(
4,
'HR',
3450,
4
);

INSERT INTO rozliczenia.pensje VALUES
(
5,
'Recepcja',
3200,
5
);

INSERT INTO rozliczenia.pensje VALUES
(
6,
'EXPORT',
4100,
6
);

INSERT INTO rozliczenia.pensje VALUES
(
7,
'IT',
4300,
7
);

INSERT INTO rozliczenia.pensje VALUES
(
8,
'Magazyn',
3800,
8
);

INSERT INTO rozliczenia.pensje VALUES
(
9,
'Tranzyt I',
4000,
9
);

INSERT INTO rozliczenia.pensje VALUES
(
10,
'Tranzyt II',
4000,
10
);

SELECT * FROM rozliczenia.pensje



INSERT INTO rozliczenia.godziny VALUES
(
1,
'2023-04-18',
6,
1
);

INSERT INTO rozliczenia.godziny VALUES
(
2,
'2023-04-18',
7,
2
);

INSERT INTO rozliczenia.godziny VALUES
(
3,
'2023-04-18',
7,
3
);

INSERT INTO rozliczenia.godziny VALUES
(
4,
'2023-04-18',
8,
4
);

INSERT INTO rozliczenia.godziny VALUES
(
5,
'2023-04-19',
8,
5
);

INSERT INTO rozliczenia.godziny VALUES
(
6,
'2023-04-18',
6,
6
);

INSERT INTO rozliczenia.godziny VALUES
(
7,
'2023-04-18',
9,
7
);

INSERT INTO rozliczenia.godziny VALUES
(
8,
'2023-04-19',
4,
8
);

INSERT INTO rozliczenia.godziny VALUES
(
9,
'2023-04-18',
12,
9
);

INSERT INTO rozliczenia.godziny VALUES
(
10,
'2023-04-19',
12,
10
);

SELECT * FROM rozliczenia.godziny