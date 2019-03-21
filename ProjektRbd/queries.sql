--EXAMPLE QUERIES

--1 Wybierz wszystkie dane z tabeli zajecia, gdzie id nauczyciela jest rowne 10.
select * from zajecia
where nauczyciel_osoba_idosoba = 10; 

--2 Wybierz zajecia, ktorych czas trwania jest rowny 1h, a id ucznia w nich uczeszczajacego jest wieksze niz 1.
select Idzajecia from zajecia
where Czastrwania = 1 and Uczen_osoba_idosoba > 1; 

--3 Wypisz wszystkie osoby o nazwisku Ciapala, posortuj majelaco.
select * from uczen
join osoba on osoba.idosoba = uczen.osoba_idosoba
where nazwisko = 'Ciapala'
order by dataurodzenia DESC; 

--4 Wypisz nauczycieli, ktorych stopien naukowy to DOKTOR.
select osoba_idosoba from nauczyciel 
join stopiennaukowy on nauczyciel.stopienidstopiennaukowy = stopiennaukowy.idstopiennaukowy
where stopien = 'DOKTOR';

--5 Wypisz nazwy instumentow, przy ktorych cena zajec ich prowadzenia jest wieksza niz 50zl. Nie uwzgledniaj zajec ze SKRZYPIEC
select nazwa from instrument
join cenazajec on cenazajec.instrument_idinstrument = instrument.idinstrument
where cena_zajec > 50 and nazwa != 'SKRZYPCE'; 

--6 Wypisz dane z WyspecjalizowanieSali, sposrod sal znajdujacych sie na 1 pietrze. Posortuj po numerze sal
select * from wyspecjalizowaniesali 
join salamuzyczna on salamuzyczna.idsala = wyspecjalizowaniesali.salamuzyczna_idsala
where pietro = 1
order by numer; 

--7 Wskaz dyrektora razem z imieniem i nazwiskiem.
select * from nauczyciel
join osoba on osoba.idosoba = nauczyciel.osoba_idosoba
where czydyrektor = 1; 

--8 Sprawdz, czy istnieja zajecia w sali o id 2, gdzie czas ich trwania jest mniejszy niz 3h
select * from zajecia 
where salamuzyczna_idsala = 2 and czastrwania < 3;

--9 Wypisz Imie i nazwisko nauczyciela, ktory gra na perkusji
select imie, nazwisko from osoba 
join nauczyciel on nauczyciel.osoba_idosoba = osoba.idosoba
join instrument on nauczyciel.instrument_idinstrument = instrument.idinstrument
where nazwa = 'PERKUSJA'; 

--10 Wypisz uczniow, ktorzy maja na nazwisko Juraszek lub ucza sie gry na flecie
select * from uczen
join osoba on uczen.osoba_idosoba = osoba.idosoba
join zajecia on zajecia.uczen_osoba_idosoba = uczen.osoba_idosoba
join cenazajec on zajecia.cena_instrument_idinstrument = cenazajec.instrument_idinstrument
join instrument on cenazajec.instrument_idinstrument = instrument.idinstrument
where nazwisko = 'Juraszek' or nazwa = 'FLET'; 


