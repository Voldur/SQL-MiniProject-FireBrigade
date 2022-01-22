SET ECHO ON
DROP TABLE adres CASCADE CONSTRAINTS;
DROP TABLE stanowisko CASCADE CONSTRAINTS;
DROP TABLE zmiana CASCADE CONSTRAINTS;
DROP TABLE sprzet CASCADE CONSTRAINTS;
DROP TABLE jednostka CASCADE CONSTRAINTS;
DROP TABLE jurysdykcja CASCADE CONSTRAINTS;
DROP TABLE rodzaj CASCADE CONSTRAINTS;
DROP TABLE pojazd CASCADE CONSTRAINTS;
DROP TABLE wyposazenie CASCADE CONSTRAINTS;
DROP TABLE osoba CASCADE CONSTRAINTS;
DROP TABLE pracownik CASCADE CONSTRAINTS;
DROP TABLE status CASCADE CONSTRAINTS;
DROP TABLE zgloszenie CASCADE CONSTRAINTS;
CREATE TABLE adres(
ID_adres INTEGER PRIMARY KEY NOT NULL,
miasto VARCHAR2(30) NOT NULL,
ulica VARCHAR2(30) NOT NULL,
nr INTEGER NOT NULL
);
CREATE TABLE stanowisko(
ID_stanowisko INTEGER PRIMARY KEY NOT NULL,
nazwa VARCHAR2(20) NOT NULL,
opis VARCHAR2(200)
);
CREATE TABLE zmiana(
ID_zmiana INTEGER PRIMARY KEY NOT NULL,
numer_zmiany INTEGER NOT NULL,
dzien DATE NOT NULL
);
CREATE TABLE sprzet(
ID_item INTEGER PRIMARY KEY NOT NULL,
nazwa VARCHAR2(30) NOT NULL,
opis VARCHAR2(200),
ilosc INTEGER
);
CREATE TABLE jednostka(
ID_jednostka INTEGER PRIMARY KEY NOT NULL,
nazwa VARCHAR2(200) NOT NULL,
ID_adres INTEGER,
CONSTRAINT ID_adres_jed
    FOREIGN KEY (ID_adres)
    REFERENCES adres(ID_adres)
);
CREATE TABLE jurysdykcja(
ID_teren INTEGER PRIMARY KEY NOT NULL,
powieszchnia VARCHAR2(25) NOT NULL,
ID_jednostka INTEGER,
CONSTRAINT ID_jednostka_jur
    FOREIGN KEY (ID_jednostka)
    REFERENCES jednostka(ID_jednostka)
);
CREATE TABLE rodzaj(
ID_rodzaj INTEGER PRIMARY KEY NOT NULL,
nazwa VARCHAR2(50) NOT NULL,
opis VARCHAR2(200)
);
CREATE TABLE pojazd(
ID_pojazd INTEGER PRIMARY KEY NOT NULL,
typ VARCHAR2(100) NOT NULL,
model VARCHAR2(40) NOT NULL,
rejestracja VARCHAR2(20) NOT NULL,
miejsca INTEGER NOT NULL
);
CREATE TABLE wyposazenie(
ID_wyposazenie INTEGER PRIMARY KEY NOT NULL,
ID_pojazd INTEGER,
ID_item INTEGER,
ilosc INTEGER NOT NULL,
CONSTRAINT ID_pojazd_wyp
    FOREIGN KEY (ID_pojazd)
    REFERENCES pojazd(ID_pojazd),
CONSTRAINT ID_item_wyp
    FOREIGN KEY (ID_item)
    REFERENCES sprzet(ID_item)
);
CREATE TABLE osoba(
ID_osoby INTEGER PRIMARY KEY NOT NULL,
imie VARCHAR2(20) NOT NULL,
nazwisko  VARCHAR2(20) NOT NULL,
pesel NVARCHAR2(11) UNIQUE,
telefon NVARCHAR2(12) UNIQUE,
ID_adres INTEGER,
CONSTRAINT ID_adres_oso
    FOREIGN KEY (ID_adres)
    REFERENCES adres(ID_adres)
);
CREATE TABLE pracownik(
ID_pracownik INTEGER PRIMARY KEY NOT NULL,
ID_osoba INTEGER,
ID_pojazd INTEGER,
ID_zmiana INTEGER,
ID_stanowisko INTEGER,
ID_jednostka INTEGER,
pensja INTEGER,
starz INTEGER,
CONSTRAINT ID_osoba_prac
    FOREIGN KEY (ID_osoba)
    REFERENCES osoba(ID_osoby),
CONSTRAINT ID_pojazd_prac
    FOREIGN KEY (ID_pojazd)
    REFERENCES pojazd(ID_pojazd),
CONSTRAINT ID_zmiana_prac
    FOREIGN KEY (ID_zmiana)
    REFERENCES zmiana(ID_zmiana),
CONSTRAINT ID_stanowisko_prac
    FOREIGN KEY (ID_stanowisko)
    REFERENCES stanowisko(ID_stanowisko),
CONSTRAINT ID_jednostka_prac
    FOREIGN KEY (ID_jednostka)
    REFERENCES jednostka(ID_jednostka)
);
CREATE TABLE status(
ID_status INTEGER PRIMARY KEY NOT NULL,
status_zgloszenia VARCHAR2(20) NOT NULL CONSTRAINT CHK_status CHECK (status_zgloszenia='W trakcie' OR status_zgloszenia='Zakonczony'),
data_rozpoczecia DATE,
data_zakonczenia DATE,
ID_pojazd INTEGER,
CONSTRAINT ID_pojazd_sta
    FOREIGN KEY (ID_pojazd)
    REFERENCES pojazd(ID_pojazd)
);
CREATE TABLE zgloszenie(
ID_zgloszenie INTEGER PRIMARY KEY NOT NULL,
data_zgloszenia DATE NOT NULL,
ID_status INTEGER,
ID_osoba INTEGER,
ID_rodzaj INTEGER,
ID_adres INTEGER,
CONSTRAINT ID_status_zgl
    FOREIGN KEY (ID_status)
    REFERENCES status(ID_status),
CONSTRAINT ID_osoba_zgl
    FOREIGN KEY (ID_osoba)
    REFERENCES osoba(ID_osoby),
CONSTRAINT ID_rodzaj_zgl
    FOREIGN KEY (ID_rodzaj)
    REFERENCES rodzaj(ID_rodzaj),
CONSTRAINT ID_adres_zgl
    FOREIGN KEY (ID_adres)
    REFERENCES adres(ID_adres)
);
INSERT INTO adres VALUES(1, 'Kielce', 'Sandomierska', '1');
INSERT INTO adres VALUES(2, 'Warszawa', 'Jerozolimskie', '14');
INSERT INTO adres VALUES(3, 'Radom', 'Radomska', '1234');
INSERT INTO adres VALUES(4, 'Bydgoszcz', 'Bumsiowa', '23');
INSERT INTO adres VALUES(5, 'Krakow', 'Jana Pawła II', '53');
INSERT INTO adres VALUES(6, 'Pacanow', 'Kwasowa', '432');
INSERT INTO adres VALUES(7, 'Łomża', 'Bazaltowa', '35');
INSERT INTO adres VALUES(8, 'Nowy Sącz', 'Księciów Polskich', '60');
INSERT INTO adres VALUES(9, 'Piotrków', 'Piotrowska', '3');
INSERT INTO adres VALUES(10, 'Szczecin', 'Berlińska', '125');
INSERT INTO adres VALUES(11, 'Przemków', 'Piorunowa', '69');
INSERT INTO adres VALUES(12, 'Łódź', 'Gospody', '15');
INSERT INTO adres VALUES(13, 'Kielce', 'Domaszowice', '83');
INSERT INTO adres VALUES(14, 'Warszawa', 'Kobyłka', '93');
INSERT INTO adres VALUES(15, 'Poznań', 'Packowa', '73');
INSERT INTO adres VALUES(16, 'Białystok', 'Szkolna', '17');
INSERT INTO adres VALUES(17, 'Choroszcz', 'plac Brodowicza','1');
INSERT INTO adres VALUES(18, 'Szydłowiec', 'Rynek Wielki','1');
INSERT INTO adres VALUES(19, 'Choroszcz', 'plac Brodowicza','1');
INSERT INTO adres VALUES(20, 'Gorzów', 'Mostowa','3');
INSERT INTO adres VALUES(21, 'Choroszcz', 'plac Brodowicza','1');
INSERT INTO adres VALUES(22, 'Jelenia Góra','Piłsudskiego','14');
INSERT INTO adres VALUES(23, 'Wejherowo', 'Rzeźnicka','12');
INSERT INTO adres VALUES(24, 'Zakopane', 'Stanisława Witkiewicza','8');
INSERT INTO adres VALUES(25, 'Wisła', 'Jawornik','74');
INSERT INTO adres VALUES(26, 'Tarnów', 'Plac Kazimierza Wielkiego','3');
INSERT INTO adres VALUES(27, 'Białystok', 'Warszawska','59');
INSERT INTO adres VALUES(28, 'Sopot', 'Bohaterów Monte Cassino','17');
INSERT INTO adres VALUES(29, 'Wrocław', 'Ruska','62');
INSERT INTO adres VALUES(30, 'Lipinki Łużyckie', 'Główna','6');
INSERT INTO stanowisko VALUES(1, 'Komendant', 'Komendant powiatowy strazy pożarnej');
INSERT INTO stanowisko VALUES(2, 'Jednostka ratownicza', 'Jednostka ratownicza z wykwalifikowanym personelem');
INSERT INTO stanowisko VALUES(3, 'Zastępca komendanta', 'Zastępca komendanta powiatowego straży pożarnej');
INSERT INTO stanowisko VALUES(4, 'Wydział szkoleniowy', 'Wydział szkoleniowy nowych jednostek straży pożarnej');
INSERT INTO stanowisko VALUES(5, 'Wydział kadrowy', 'Stanowisko kadrowe w straży pożarnej');
INSERT INTO zmiana VALUES(1, 1, DATE'2020-12-31');
INSERT INTO zmiana VALUES(2, 2, DATE'2020-12-31');
INSERT INTO zmiana VALUES(3, 3, DATE'2020-12-31');
INSERT INTO zmiana VALUES(4, 1, DATE'2021-01-01');
INSERT INTO zmiana VALUES(5, 2, DATE'2021-01-01');
INSERT INTO zmiana VALUES(6, 3, DATE'2021-01-01');
INSERT INTO zmiana VALUES(7, 1, DATE'2021-01-02');
INSERT INTO zmiana VALUES(8, 2, DATE'2021-01-02');
INSERT INTO zmiana VALUES(9, 3, DATE'2021-01-02');
INSERT INTO zmiana VALUES(10, 1, DATE'2021-01-03');
INSERT INTO zmiana VALUES(11, 2, DATE'2021-01-03');
INSERT INTO zmiana VALUES(12, 3, DATE'2021-01-03');
INSERT INTO zmiana VALUES(13, 1, DATE'2021-01-04');
INSERT INTO zmiana VALUES(14, 2, DATE'2021-01-04');
INSERT INTO zmiana VALUES(15, 3, DATE'2012-01-04');
INSERT INTO sprzet VALUES(1, 'Gasnica', 'Słuzy do gaszenia pożarów', 4);
INSERT INTO sprzet VALUES(2, 'Siekiera', 'Używane podczas gaszenia pożarów', 6);
INSERT INTO sprzet VALUES(3, 'Hełm strażacki', 'Zapewnia bezpieczeństwo głowy', 8);
INSERT INTO sprzet VALUES(4, 'Kurtka strażacka', 'Zapewnia bezpieczeństwo tułowia', 8);
INSERT INTO sprzet VALUES(5, 'Spodnie strażackie', 'Zapewnia bezpieczeństwo nóg', 8);
INSERT INTO sprzet VALUES(6, 'Koc materialowy', 'Ogrzewa ciało', 3);
INSERT INTO sprzet VALUES(7, 'Koc termoizolacyjny', 'Wstrzymuje ciepło ciała', 6);
INSERT INTO sprzet VALUES(8, 'Rękawice strażackie', 'Zapewnia bezpieczeństwo dłoniom', 8);
INSERT INTO sprzet VALUES(9, 'Maska tlenowa', 'Pomaga oddychać gdy nie ma powietrza', 8);
INSERT INTO sprzet VALUES(10, 'Butla tlenowa', 'Trzyma tlen dla maski tlenowej', 8);
INSERT INTO sprzet VALUES(11, 'Filtr do maski', 'Filtr do maski gazowej', 8);
INSERT INTO sprzet VALUES(12, 'Drabina krótka', 'Drabina krótka 10m', 1);
INSERT INTO sprzet VALUES(13, 'Drabina długa', 'Drabina długa 30m', 1);
INSERT INTO sprzet VALUES(14, 'Plandeka', 'Łapie spadające ciała', 2);
INSERT INTO sprzet VALUES(15, 'Nożyce', 'Przecina metal', 3);
INSERT INTO jednostka VALUES(1, 'Pierwsza jednostka straży pożarnej w Kielcach', 1);
INSERT INTO jednostka VALUES(2, 'Pierwsza jednostka straży pożarnej w Warszawie', 2);
INSERT INTO jednostka VALUES(3, 'Piąta jednostka lotnicza Radom', 3);
INSERT INTO jednostka VALUES(4, 'Jednostka straży pożarnej im. Marka Bizona', 4);
INSERT INTO jurysdykcja VALUES(1, '100 km^', 1);
INSERT INTO jurysdykcja VALUES(2, '15 km', 2);
INSERT INTO jurysdykcja VALUES(3, '35 km', 3);
INSERT INTO jurysdykcja VALUES(4, '59 km', 4);
INSERT INTO rodzaj VALUES(1, 'Pożar mały', 'Wybuch ognia w rejonie na jedną jednostkę straży');
INSERT INTO rodzaj VALUES(2, 'Pożar średni', 'Wybuch ognia w rejonie na dwie jednostki straży');
INSERT INTO rodzaj VALUES(3, 'Pożar duży', 'Wybuch ognia w rejonie na ponad dwie jednostki straży');
INSERT INTO rodzaj VALUES(4, 'Wyciek gazu', 'Wyciek gazu propan butan w rejonie');
INSERT INTO rodzaj VALUES(5, 'Wybuch gazu', 'Wybuch gazu propan butan w rejonie');
INSERT INTO rodzaj VALUES(6, 'Wypadek mały', 'Wypadek samochodowy z zapotrzebowaniem jednej jednostki straży');
INSERT INTO rodzaj VALUES(7, 'Wypadek duży', 'Duży wypadek samochodowy na dwie jednostki straży');
INSERT INTO rodzaj VALUES(8, 'Karambol', 'Wypadek samochodowy o dużej skali potencjalnych rannych');
INSERT INTO rodzaj VALUES(9, 'Kot na drzewie', 'Kot na drzewie o małym priorytecie ratowniczym');
INSERT INTO rodzaj VALUES(10, 'Pożar na polu', 'Pożar na polu spowodowany ogniem na suchej powierzchni');
INSERT INTO rodzaj VALUES(11, 'Pożar w lesie', 'Pożar w lesie');
INSERT INTO rodzaj VALUES(12, 'Alarm bombowy', 'Zgłoszenie bomby w miejscu publicznym');
INSERT INTO rodzaj VALUES(13, 'Wybuch bombowy', 'Wybuch materiałów wybuchowych w miejscu publicznym');
INSERT INTO rodzaj VALUES(14, 'Próba samobójcza', 'Zgłoszenie próby samobójczej w miejscu publicznym');
INSERT INTO rodzaj VALUES(15, 'Fałszywy alarm', 'Fałszywe wezwanie straży pożarnej');
INSERT INTO pojazd VALUES(1, 'Samochód ratowniczo – gaśniczy z autopompą', 'MANN', 'BD-12345', 7);
INSERT INTO pojazd VALUES(2, 'Samochód ratowniczo – gaśniczy z autopompą', 'SCANIA', 'BD-PL123', 12);
INSERT INTO pojazd VALUES(3, 'Samochód ratowniczo – gaśniczy z autopompą', 'SOLARIS', 'BD-7312A', 4);
INSERT INTO pojazd VALUES(4, 'Samochód ratowniczo – gaśniczy z autopompą', 'JELCZ', 'BD-420BC', 9);
INSERT INTO pojazd VALUES(5, 'Samochód ratowniczo – gaśniczy specjalny', 'MANN', 'BD-LEOPA', 2);
INSERT INTO pojazd VALUES(6, 'Samochód ratowniczo – gaśniczy specjalny', 'SCANIA', 'BD-WW213', 4);
INSERT INTO pojazd VALUES(7, 'Samochód ratowniczo – gaśniczy specjalny', 'MERCEDES BENZ', 'BD-38313', 8);
INSERT INTO pojazd VALUES(8, 'Samochód ratowniczo – gaśniczy specjalny', 'TOYOTA', 'BD-75058', 7);
INSERT INTO pojazd VALUES(9, 'Samochód z drabiną ilub podnośnikiem hydraulicznym', 'MANN', 'BD-PLOKS', 6);
INSERT INTO pojazd VALUES(10, 'Samochód z drabiną ilub podnośnikiem hydraulicznym', 'SOLARIS', 'BD-STONK', 3);
INSERT INTO pojazd VALUES(11, 'Drabina mechaniczna', 'MANN', 'BD-SZK17', 9);
INSERT INTO pojazd VALUES(12, 'Samochód zaopatrzeniowy', 'TOYOTA', 'BD-00007', 5);
INSERT INTO pojazd VALUES(13, 'Samochód zaopatrzeniowy', 'MANN', 'BD-BLA932', 4);
INSERT INTO pojazd VALUES(14, 'Samochód do przewozu osób', 'POLONEZ', 'BD-KIK23', 4);
INSERT INTO pojazd VALUES(15, 'Samochód ratownictwa technicznego', 'TOYOTA', 'BD-13484', 5);
INSERT INTO osoba VALUES(1, 'Szymon', 'Smiglarski', '09876543210', '48123123123', 1);
INSERT INTO osoba VALUES(2, 'Jacek', 'Placek', '05241857828', '6514024707', 2);
INSERT INTO osoba VALUES(3, 'Kacper', 'Wanatio', '69032896632', '38795315540', 3);
INSERT INTO osoba VALUES(4, 'Marek', 'Bizon', '86060762825', '103788939276', 4);
INSERT INTO osoba VALUES(5, 'Dobromir', 'Kaskada', '51070447976', '550538830484', 5);
INSERT INTO osoba VALUES(6, 'Dorota', 'Dorotowska', '94041577784', '369928071099', 6);
INSERT INTO osoba VALUES(7, 'Zbigniew', 'Lomnik', '82082186252', '14359049883638', 7);
INSERT INTO osoba VALUES(8, 'Wojciech', 'Suchodolski', '61051743955', '99857648647', 8);
INSERT INTO osoba VALUES(9, 'Adam', 'Wujek', '89081775434', '6636323302', 9);
INSERT INTO osoba VALUES(10, 'Piotr', 'Piotrowski', '62083088395', '75559634108973', 10);
INSERT INTO osoba VALUES(11, 'Ewa', 'Kowalska', '57071391542', '09926266999664', 11);
INSERT INTO osoba VALUES(12, 'Janusz', 'Polski', '00310412379', '76029877535', 12);
INSERT INTO osoba VALUES(13, 'Jerzy', 'Kiler', '75112146128', '44056717232', 13);
INSERT INTO osoba VALUES(14, 'Jakub', 'Konserwator', '51122341351', '5802977310', 14);
INSERT INTO osoba VALUES(15, 'Krzysztof', 'Kononowicz', '00321001821', '857191091', 15);
INSERT INTO osoba VALUES(16, 'Marcin', 'Gortat', '91073146861', '576897234', 16);
INSERT INTO osoba VALUES(17, 'Franek', 'Dolas', '71080537139', '435098123', 17);
INSERT INTO osoba VALUES(18, 'Kristoffer', 'Klauss', '00262866833', '187908765', 18);
INSERT INTO osoba VALUES(19, 'Justin', 'Hutzler', '58031767953', '187209567', 19);
INSERT INTO osoba VALUES(20, 'Lorenz', 'Moser', '59040624226', '1874428481', 20);
INSERT INTO osoba VALUES(21, 'Jan', 'Sobieski', '60021247139', '170616960', 21);
INSERT INTO osoba VALUES(22, 'Jadwiga', 'Jagiellonka', '79021538832', '140814311', 22);
INSERT INTO osoba VALUES(23, 'Andrzej', 'Lepper', '87020726332', '195420110', 23);
INSERT INTO osoba VALUES(24, 'Adam', 'Małysz', '81041099152', '197720221', 24);
INSERT INTO osoba VALUES(25, 'Kamil', 'Stoch', '71050278213', '198720221', 25);
INSERT INTO osoba VALUES(26, 'Dawid', 'Kubacki', '48022868134', '199020221', 26);
INSERT INTO osoba VALUES(27, 'Piotr', 'Żyła', '80020484598', '198720222', 27);
INSERT INTO osoba VALUES(28, 'Johann', 'Bach', '03261414373', '168517501', 28);
INSERT INTO osoba VALUES(29, 'Jan', 'Łośrodo', '68723518312', '197020201', 29);
INSERT INTO osoba VALUES(30, 'Jarosław', 'Mexicano', '6509313981', '789235711', 30);
INSERT INTO pracownik VALUES(1, 1, 1, 1, 1, 1, 4000, 5);
INSERT INTO pracownik VALUES(2, 2, 2, 2, 2, 2, 4000, 5);
INSERT INTO pracownik VALUES(3, 3, 9, 3, 2, 3, 4000, 5);
INSERT INTO pracownik VALUES(4, 4, 12, 1, 2, 4, 4000, 5);
INSERT INTO pracownik VALUES(5, 5, 15, 2, 3, 1, 4000, 5);
INSERT INTO pracownik VALUES(6, 6, 1, 3, 4, 2, 4000, 5);
INSERT INTO pracownik VALUES(7, 7, 14, 1, 5, 3, 4000, 5);
INSERT INTO status VALUES(1, 'Zakonczony', DATE'2020-12-30', DATE'2020-12-31', 1);
INSERT INTO status VALUES(2, 'Zakonczony', DATE'2020-01-31', DATE'2020-02-01', 1);
INSERT INTO status VALUES(3, 'Zakonczony', DATE'2001-09-11', DATE'2001-09-12', 1);
INSERT INTO status VALUES(4, 'Zakonczony', DATE'2020-10-24', DATE'2020-10-24', 1);
INSERT INTO status VALUES(5, 'Zakonczony', DATE'2020-06-30', DATE'2020-06-30', 1);
INSERT INTO status VALUES(6, 'Zakonczony', DATE'2019-12-30', DATE'2019-12-31', 1);
INSERT INTO status VALUES(7, 'Zakonczony', DATE'2016-05-04', DATE'2016-05-04', 1);
INSERT INTO status VALUES(8, 'Zakonczony', DATE'2018-12-30', DATE'2015-12-31', 1);
INSERT INTO status VALUES(9, 'Zakonczony', DATE'2013-02-17', DATE'2013-02-17', 1);
INSERT INTO status VALUES(10, 'Zakonczony', DATE'2021-09-01', DATE'2021-09-01', 1);
INSERT INTO status VALUES(11, 'Zakonczony', DATE'2017-07-24', DATE'2017-07-24', 1);
INSERT INTO status VALUES(12, 'Zakonczony', DATE'2021-12-31', DATE'2022-01-01', 1);
INSERT INTO status VALUES(13, 'W trakcie', DATE'2022-01-01', NULL, 1);
INSERT INTO status VALUES(14, 'W trakcie', DATE'2022-01-02', NULL, 1);
INSERT INTO status VALUES(15, 'W trakcie', DATE'2022-01-02', NULL, 1);
INSERT INTO zgloszenie VALUES(1, DATE'2022-01-01', 13, 1, 15, 1);
INSERT INTO zgloszenie VALUES(2, DATE'2013-02-17', 9, 2, 2, 2);
INSERT INTO zgloszenie VALUES(3, DATE'2020-10-24', 4, 3, 15, 3);
insert into wyposazenie values(1,1,1,1);
insert into wyposazenie values(2,2,2,1);
insert into wyposazenie values(3,3,3,1);
insert into wyposazenie values(4,4,4,1);
insert into wyposazenie values(5,5,5,1);
insert into wyposazenie values(6,6,6,1);
insert into wyposazenie values(7,7,7,1);
insert into wyposazenie values(8,8,8,1);
insert into wyposazenie values(9,9,9,1);
insert into wyposazenie values(10,10,10,1);
insert into wyposazenie values(11,11,11,1);
insert into wyposazenie values(12,12,12,1);
insert into wyposazenie values(13,13,13,1);
insert into wyposazenie values(14,14,14,1);
insert into wyposazenie values(15,15,15,1);
COMMIT;
SET ECHO OFF
