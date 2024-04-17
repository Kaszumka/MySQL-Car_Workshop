-- foreign keys
ALTER TABLE USLUGA DROP FOREIGN KEY Slownik_Uslug_Specjalizacja_FK;
ALTER TABLE POJAZD DROP FOREIGN KEY Pojazd_Klient_FK;
ALTER TABLE WIZYTA DROP FOREIGN KEY Wizyta_Pojazd_FK;
ALTER TABLE WIZYTA DROP FOREIGN KEY Wizyta_Slownik_Statusu_FK;
ALTER TABLE PRACOWNIK DROP FOREIGN KEY Pracownik_Specjalizacja_FK;
ALTER TABLE WYKONANA_USLUGA DROP FOREIGN KEY Wykonana_Usluga_Wizyta_FK;
ALTER TABLE WYKONANA_USLUGA DROP FOREIGN KEY Wykonana_Usluga_Pracownik_FK;
ALTER TABLE WYKONANA_USLUGA DROP FOREIGN KEY Wykonana_Usluga_Slownik_Uslug_FK;
ALTER TABLE WYKONANA_USLUGA DROP FOREIGN KEY Wykonana_Usluga_Status_Uslugi_FK;
ALTER TABLE CZESCI_DO_WIZYTY DROP FOREIGN KEY Czesci_Do_Wizyty_CZESC_FK;
ALTER TABLE CZESCI_DO_WIZYTY DROP FOREIGN KEY Czesci_Do_Wizyty_Wizyta_FK;
ALTER TABLE CZESCI_DO_USLUGI DROP FOREIGN KEY Czesci_Do_Uslugi_Slownik_Uslug_FK;
ALTER TABLE CZESCI_DO_USLUGI DROP FOREIGN KEY Czesci_Do_Uslugi_CZESC_FK;
ALTER TABLE ZESTAW_USLUGA DROP FOREIGN KEY Zestaw_Usluga_FK;

-- primary keys, not null, auto_incremet
ALTER TABLE USLUGA DROP PRIMARY KEY;
ALTER TABLE POJAZD DROP PRIMARY KEY;
ALTER TABLE KLIENT DROP PRIMARY KEY;
ALTER TABLE WIZYTA DROP PRIMARY KEY;
ALTER TABLE CZESCI_DO_WIZYTY DROP PRIMARY KEY;
ALTER TABLE PRACOWNIK DROP PRIMARY KEY;
ALTER TABLE CZESC DROP PRIMARY KEY;
ALTER TABLE SPECJALIZACJA DROP PRIMARY KEY;
ALTER TABLE WYKONANA_USLUGA DROP PRIMARY KEY;
ALTER TABLE CZESCI_DO_USLUGI DROP PRIMARY KEY;
ALTER TABLE SLOWNIK_STATUSU DROP PRIMARY KEY;

-- UNIQUE constraints
ALTER TABLE USLUGA DROP INDEX Nazwa_uslugi;
ALTER TABLE POJAZD DROP INDEX Numer_Rejestracyjny;
ALTER TABLE KLIENT DROP INDEX Email;
ALTER TABLE CZESC DROP INDEX Numer_OEM;
ALTER TABLE SPECJALIZACJA DROP INDEX Nazwa;
ALTER TABLE SLOWNIK_STATUSU DROP INDEX Nazwa;
-- CHECK constraints 
ALTER TABLE PRACOWNIK DROP CONSTRAINT pesel; 
ALTER TABLE CZESC DROP CONSTRAINT wiecej_niz_zero; 
ALTER TABLE CZESC DROP CONSTRAINT Ile_Za; 
ALTER TABLE CZESC DROP CONSTRAINT cena; 
ALTER TABLE CZESCI_DO_USLUGI DROP CONSTRAINT Ilosc_Po;
ALTER TABLE WIZYTA DROP CONSTRAINT Status_Wi; 
ALTER TABLE WYKONANA_USLUGA DROP CONSTRAINT Status_Us;
ALTER TABLE USLUGA DROP CONSTRAINT pieniądze; 
ALTER TABLE USLUGA DROP CONSTRAINT spec ;
ALTER TABLE PRACOWNIK DROP CONSTRAINT spec_prac ;
ALTER TABLE CZESCI_DO_WIZYTY DROP CONSTRAINT Ilosc_Wy ;
