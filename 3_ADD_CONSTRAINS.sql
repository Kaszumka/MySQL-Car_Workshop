-- primary keys, not null, auto_incremet
ALTER TABLE USLUGA ADD CONSTRAINT Usluga PRIMARY KEY (ID);

ALTER TABLE POJAZD ADD CONSTRAINT Pojazd_PK PRIMARY KEY(Vin);

ALTER TABLE KLIENT ADD CONSTRAINT Klient_PK PRIMARY KEY (ID);

ALTER TABLE WIZYTA ADD CONSTRAINT Wizyta_PK PRIMARY KEY (ID);

ALTER TABLE CZESCI_DO_WIZYTY ADD CONSTRAINT Czesci_Wizyta_PK PRIMARY KEY (Wizyta, SKU);

ALTER TABLE PRACOWNIK ADD CONSTRAINT Pracownik_PK PRIMARY KEY (Pesel);

ALTER TABLE CZESC ADD CONSTRAINT CZESC_PK PRIMARY KEY (SKU);

ALTER TABLE SPECJALIZACJA ADD CONSTRAINT Specjalizacja_PK PRIMARY KEY (ID);

ALTER TABLE WYKONANA_USLUGA ADD CONSTRAINT Wykonana_Usluga_PK PRIMARY KEY (Wizyta, Usluga);

ALTER TABLE CZESCI_DO_USLUGI ADD CONSTRAINT Czesci_Do_Uslugi_PK PRIMARY KEY (Usluga, SKU);

ALTER TABLE SLOWNIK_STATUSU ADD CONSTRAINT Slownik_Statusu_PK PRIMARY KEY (ID);

-- foreign keys
ALTER TABLE USLUGA ADD CONSTRAINT Slownik_Uslug_Specjalizacja_FK FOREIGN KEY (Specjalizacja) REFERENCES SPECJALIZACJA(ID);
ALTER TABLE POJAZD ADD CONSTRAINT Pojazd_Klient_FK FOREIGN KEY (Wlasciciel) REFERENCES KLIENT(ID);
ALTER TABLE WIZYTA ADD CONSTRAINT Wizyta_Pojazd_FK FOREIGN KEY (Pojazd) REFERENCES POJAZD(Vin);
ALTER TABLE WIZYTA ADD CONSTRAINT Wizyta_Slownik_Statusu_FK FOREIGN KEY (Status_wizyty) REFERENCES SLOWNIK_STATUSU(ID);
ALTER TABLE PRACOWNIK ADD CONSTRAINT Pracownik_Specjalizacja_FK FOREIGN KEY (Specjalizacja) REFERENCES SPECJALIZACJA(ID);
ALTER TABLE WYKONANA_USLUGA ADD CONSTRAINT Wykonana_Usluga_Wizyta_FK FOREIGN KEY (Wizyta) REFERENCES WIZYTA(ID);
ALTER TABLE WYKONANA_USLUGA ADD CONSTRAINT Wykonana_Usluga_Pracownik_FK FOREIGN KEY (Pracownik) REFERENCES PRACOWNIK(Pesel);
ALTER TABLE WYKONANA_USLUGA ADD CONSTRAINT Wykonana_Usluga_Slownik_Uslug_FK FOREIGN KEY (Usluga) REFERENCES USLUGA(ID);
ALTER TABLE WYKONANA_USLUGA ADD CONSTRAINT Wykonana_Usluga_Status_Uslugi_FK FOREIGN KEY (Status_Uslugi) REFERENCES SLOWNIK_STATUSU(ID);
ALTER TABLE CZESCI_DO_WIZYTY ADD CONSTRAINT Czesci_Do_Wizyty_CZESC_FK FOREIGN KEY (SKU) REFERENCES CZESC(SKU);
ALTER TABLE CZESCI_DO_WIZYTY ADD CONSTRAINT Czesci_Do_Wizyty_Wizyta_FK FOREIGN KEY (Wizyta) REFERENCES WIZYTA(ID);
ALTER TABLE CZESCI_DO_USLUGI ADD CONSTRAINT Czesci_Do_Uslugi_Slownik_Uslug_FK FOREIGN KEY (Usluga) REFERENCES USLUGA(ID);
ALTER TABLE CZESCI_DO_USLUGI ADD CONSTRAINT Czesci_Do_Uslugi_CZESC_FK FOREIGN KEY (SKU) REFERENCES CZESC(SKU);
ALTER TABLE ZESTAW_USLUGA ADD CONSTRAINT Zestaw_Usluga_FK FOREIGN KEY (ID_Usluga) REFERENCES USLUGA(ID);

-- UNIQUE constraints
ALTER TABLE USLUGA ADD UNIQUE (Nazwa_uslugi);
ALTER TABLE POJAZD ADD UNIQUE (Numer_Rejestracyjny);
ALTER TABLE KLIENT ADD UNIQUE (Email);
ALTER TABLE CZESC ADD UNIQUE (Numer_OEM);
ALTER TABLE SPECJALIZACJA ADD UNIQUE (Nazwa);
ALTER TABLE SLOWNIK_STATUSU ADD UNIQUE (Nazwa);
-- CHECK constraints
ALTER TABLE PRACOWNIK ADD CONSTRAINT pesel CHECK (Pesel REGEXP '^[0-9]+$'); #Sprawdza czy wpisany Pesel ma 11 cyfr

ALTER TABLE CZESC ADD CONSTRAINT wiecej_niz_zero CHECK (Ilosc_Na_Stanie >= 0);  #Sprawdza czy ilosc na stanie jest nieujemna

ALTER TABLE CZESC ADD CONSTRAINT Ile_Za CHECK (Ile_Zamowionych >= 0); #Sprawdza czy ilosc zamówionych jest nieujemna

ALTER TABLE CZESC ADD CONSTRAINT cena CHECK (Cena >= 0); #Sprawdza czy cena jest nieujemna

ALTER TABLE CZESCI_DO_USLUGI ADD CONSTRAINT Ilosc_Po CHECK (Ilosc_Potrzebnych >= 0); #Sprawdza czy ilosc potrzebnych częsci jest nieujemna

ALTER TABLE WIZYTA ADD CONSTRAINT Status_Wi CHECK (0<Status_Wizyty<=4); #Sprawdza czy status wizyty nie jest różny od możliwych opcji

ALTER TABLE WYKONANA_USLUGA ADD CONSTRAINT Status_Us CHECK (1<=Status_Uslugi<=3); #Sprawdza czy status usługi nie jest różny od możliwych opcji

ALTER TABLE USLUGA ADD CONSTRAINT pieniądze CHECK (Cena_Minimalna<Cena_Maksymalna); #Sprawdza czy Cena minimalna jest mniejsza od Ceny Maksymalnej

ALTER TABLE USLUGA ADD CONSTRAINT spec CHECK (1<=Specjalizacja<=10); #Sprawdza czy Specjalizacja uslugi nie jest różna od możliwych opcji

ALTER TABLE PRACOWNIK ADD CONSTRAINT spec_prac CHECK (1<=Specjalizacja<=10); #Sprawdza czy Specjalizacja pracownika nie jest różna od możliwych opcji

ALTER TABLE CZESCI_DO_WIZYTY ADD CONSTRAINT  Ilosc_Wy CHECK (Ilosc_Wykorzystanych > 0); #Sprawdza czy ilosc potrzebnych częsci jest nieujemna