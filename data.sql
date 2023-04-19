SELECT godziny.id_godziny, DATEPART(weekday,[dataa]) AS dzien_tygodnia, 
DATEPART(month,[dataa]) AS miesiac,
godziny.liczba_godzin, godziny.id_pracownika 
FROM rozliczenia.godziny;