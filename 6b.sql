--1) zmiana varchara
SELECT * FROM ksiegowosc.pracownicy;
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon VARCHAR(16);
-- update polaczeniem concat
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT('+48',telefon);

--2)
SELECT CONCAT(
	SUBSTRING(telefon,4,3),'-',
	SUBSTRING(telefon,7,3),'-',
	SUBSTRING(telefon,10,3))
AS telefon FROM ksiegowosc.pracownicy;

--3)
SELECT TOP 1 UPPER(pracownicy.nazwisko) AS nazwisko, dlN = LEN(nazwisko) FROM ksiegowosc.pracownicy ORDER BY dlN DESC;

--4)
SELECT 
HASHBYTES('MD5',imie) AS imie, 
HASHBYTES('MD5',nazwisko) AS nazwisko, 
HASHBYTES('MD5',adres) AS adres, 
HASHBYTES('MD5',telefon) AS telefon,
HASHBYTES('MD5',CAST(kwota AS VARCHAR(12))) AS kwota FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensje pen ON wyn.id_pensji = pen.id_pensji;

--5)
SELECT p.imie AS imie, p.nazwisko AS nazw, pens.kwota AS pensja, prem.kwota AS premia FROM ksiegowosc.pracownicy p
LEFT OUTER JOIN ksiegowosc.wynagrodzenie wyn
ON wyn.id_pracownika = p.id_pracownika
LEFT OUTER JOIN ksiegowosc.pensje pens
ON pens.id_pensji = wyn.id_pensji
LEFT OUTER JOIN ksiegowosc.premie prem
ON prem.id_premii = wyn.id_premii;

--6)
SELECT CONCAT('Pracownik ', p.imie,' ',p.nazwisko, ' w dniu ', DATEPART(day,godz.dataa),'.',DATEPART(month,godz.dataa),'.',
DATEPART(year,godz.dataa),' otrzymal pensje calkowita na kwote ',pen.kwota+pre.kwota,
' zl, gdzie wynagrodzenie zasadnicze wynosilo ',pen.kwota,' zl, premia to ',pre.kwota,' zl a nadgodziny to ',
20*(30*godz.liczba_godzin - 160),' zl.') FROM ksiegowosc.pracownicy p JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
JOIN ksiegowosc.pensje pen ON pen.id_pensji = w.id_pensji
JOIN ksiegowosc.premie pre ON pre.id_premii = w.id_premii
JOIN ksiegowosc.godziny godz ON godz.id_pracownika= w.id_pracownika;