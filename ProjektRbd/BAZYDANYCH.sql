-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-01-26 15:39:12.08

-- tables
-- Table: CenaZajec
CREATE TABLE CenaZajec (
    Instrument_IdInstrument integer  NOT NULL,
    Cena_Zajec integer  NOT NULL,
    CONSTRAINT CenaZajec_pk PRIMARY KEY (Instrument_IdInstrument)
) ;

-- Table: Instrument
CREATE TABLE Instrument (
    IdInstrument integer  NOT NULL,
    Nazwa varchar2(50)  NOT NULL,
    CONSTRAINT Instrument_pk PRIMARY KEY (IdInstrument)
) ;

-- Table: Nauczyciel
CREATE TABLE Nauczyciel (
    Osoba_IdOsoba integer  NOT NULL,
    Instrument_IdInstrument integer  NOT NULL,
    StopienIdStopienNaukowy integer  NOT NULL,
    CzyDyrektor integer  NOT NULL,
    CONSTRAINT Nauczyciel_pk PRIMARY KEY (Osoba_IdOsoba)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    IdOsoba integer  NOT NULL,
    Imie varchar2(50)  NOT NULL,
    Nazwisko varchar2(50)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (IdOsoba)
) ;

-- Table: SalaMuzyczna
CREATE TABLE SalaMuzyczna (
    IdSala integer  NOT NULL,
    Pietro varchar2(50)  NOT NULL,
    Numer varchar2(50)  NOT NULL,
    CONSTRAINT SalaMuzyczna_pk PRIMARY KEY (IdSala)
) ;

-- Table: StopienNaukowy
CREATE TABLE StopienNaukowy (
    IdStopienNaukowy integer  NOT NULL,
    Stopien varchar2(50)  NOT NULL,
    CONSTRAINT StopienNaukowy_pk PRIMARY KEY (IdStopienNaukowy)
) ;

-- Table: Uczen
CREATE TABLE Uczen (
    Osoba_IdOsoba integer  NOT NULL,
    DataUrodzenia date  NOT NULL,
    CONSTRAINT Uczen_pk PRIMARY KEY (Osoba_IdOsoba)
) ;

-- Table: WyspecjalizowanieSali
CREATE TABLE WyspecjalizowanieSali (
    IdWyspecjalizowanie integer  NOT NULL,
    Instrument_IdInstrument integer  NOT NULL,
    SalaMuzyczna_IdSala integer  NOT NULL,
    CONSTRAINT WyspecjalizowanieSali_pk PRIMARY KEY (IdWyspecjalizowanie)
) ;

-- Table: Zajecia
CREATE TABLE Zajecia (
    IdZajecia integer  NOT NULL,
    Data date  NOT NULL,
    Godzina timestamp  NOT NULL,
    CzasTrwania varchar2(50)  NOT NULL,
    Uczen_Osoba_IdOsoba integer  NOT NULL,
    Nauczyciel_Osoba_IdOsoba integer  NOT NULL,
    Cena_Instrument_IdInstrument integer  NOT NULL,
    SalaMuzyczna_IdSala integer  NOT NULL,
    CONSTRAINT Zajecia_pk PRIMARY KEY (IdZajecia)
) ;

-- foreign keys
-- Reference: CenaZajec_Instrument (table: CenaZajec)
ALTER TABLE CenaZajec ADD CONSTRAINT CenaZajec_Instrument
    FOREIGN KEY (Instrument_IdInstrument)
    REFERENCES Instrument (IdInstrument);

-- Reference: Nauczyciel_Instrument (table: Nauczyciel)
ALTER TABLE Nauczyciel ADD CONSTRAINT Nauczyciel_Instrument
    FOREIGN KEY (Instrument_IdInstrument)
    REFERENCES Instrument (IdInstrument);

-- Reference: Nauczyciel_Osoba (table: Nauczyciel)
ALTER TABLE Nauczyciel ADD CONSTRAINT Nauczyciel_Osoba
    FOREIGN KEY (Osoba_IdOsoba)
    REFERENCES Osoba (IdOsoba);

-- Reference: Nauczyciel_StopienNaukowy (table: Nauczyciel)
ALTER TABLE Nauczyciel ADD CONSTRAINT Nauczyciel_StopienNaukowy
    FOREIGN KEY (StopienIdStopienNaukowy)
    REFERENCES StopienNaukowy (IdStopienNaukowy);

-- Reference: Uczen_Osoba (table: Uczen)
ALTER TABLE Uczen ADD CONSTRAINT Uczen_Osoba
    FOREIGN KEY (Osoba_IdOsoba)
    REFERENCES Osoba (IdOsoba);

-- Reference: Wyspecjalizowanie_Instrument (table: WyspecjalizowanieSali)
ALTER TABLE WyspecjalizowanieSali ADD CONSTRAINT Wyspecjalizowanie_Instrument
    FOREIGN KEY (Instrument_IdInstrument)
    REFERENCES Instrument (IdInstrument);

-- Reference: Wyspecjalizowanie_SalaMuzyczna (table: WyspecjalizowanieSali)
ALTER TABLE WyspecjalizowanieSali ADD CONSTRAINT Wyspecjalizowanie_SalaMuzyczna
    FOREIGN KEY (SalaMuzyczna_IdSala)
    REFERENCES SalaMuzyczna (IdSala);

-- Reference: Zajecia_CenaZajec (table: Zajecia)
ALTER TABLE Zajecia ADD CONSTRAINT Zajecia_CenaZajec
    FOREIGN KEY (Cena_Instrument_IdInstrument)
    REFERENCES CenaZajec (Instrument_IdInstrument);

-- Reference: Zajecia_Nauczyciel (table: Zajecia)
ALTER TABLE Zajecia ADD CONSTRAINT Zajecia_Nauczyciel
    FOREIGN KEY (Nauczyciel_Osoba_IdOsoba)
    REFERENCES Nauczyciel (Osoba_IdOsoba);

-- Reference: Zajecia_SalaMuzyczna (table: Zajecia)
ALTER TABLE Zajecia ADD CONSTRAINT Zajecia_SalaMuzyczna
    FOREIGN KEY (SalaMuzyczna_IdSala)
    REFERENCES SalaMuzyczna (IdSala);

-- Reference: Zajecia_Uczen (table: Zajecia)
ALTER TABLE Zajecia ADD CONSTRAINT Zajecia_Uczen
    FOREIGN KEY (Uczen_Osoba_IdOsoba)
    REFERENCES Uczen (Osoba_IdOsoba);

-- End of file.

