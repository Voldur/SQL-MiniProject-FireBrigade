PROMPT
SET ECHO ON
Create or replace function cursor4
RETURN NUMBER
IS
CURSOR cur4 IS
    SELECT pracownik.pensja, adres.miasto from pracownik
    inner join osoba on pracownik.id_osoba = osoba.id_osoby
    inner join adres on adres.id_adres = osoba.id_adres
    Where adres.miasto='Choroszcz';
srednia NUMBER :=0;
l_prac NUMBER :=0;
buffor cur4%rowtype;
BEGIN
OPEN cur4;
LOOP
    FETCH cur4 INTO buffor;
    EXIT WHEN cur4%NOTFOUND;
    l_prac := l_prac + 1;
    srednia := srednia + buffor.pensja;
END LOOP;
CLOSE cur4;
RETURN srednia/l_prac;
END;
/
SET ECHO OFF
PROMPT