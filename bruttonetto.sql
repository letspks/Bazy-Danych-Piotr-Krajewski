SELECT pensje.id_pensji, pensje.stanowisko, id_premii,
pensje.kwota AS kwota_brutto, kwota_netto = 0.72*[kwota]
FROM rozliczenia.pensje;
