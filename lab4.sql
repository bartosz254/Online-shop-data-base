clear screen;
set serveroutput on;

PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT SELEKTY;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;

SELECT MENUk_1_ID, MENU_POZYCJA from MENU;
SELECT STR_ID, STR_NAZWA, SLI_ID, MENU_ID from STRONY;
SELECT PRODk_1_ID, PROD_NAZWA, PRODk_1_CENA, GAL_ID, STR_LINK from PRODUKTY;

/*
    STR_ID STR_NAZWA                          SLI_ID    MENU_ID
---------- ------------------------------ ---------- ----------
         1 strona glowna                           1          3
         2 produkt1                                1          3
         3 produkt2                                1          3
         4 produkt3                                2          1
         5 produkt4                                4          2
         6 produkt5                                3          4
         7 kontakt                                 4          4

*/

PROMPT ;
PROMPT----------------------------------------;
PROMPT SELEKTY WARUNKOWE;
PROMPT----------------------------------------;
PROMPT ;
SELECT STR_ID, STR_NAZWA, SLI_ID, MENU_ID from STRONY WHERE SLI_ID = 1 OR SLI_ID=3;
SELECT PRODk_1_ID, PROD_NAZWA, PRODk_1_CENA, GAL_ID, STR_LINK 
    from PRODUKTY 
    WHERE PROD_NAZWA LIKE 'pil%';

PROMPT ;
PROMPT----------------------------------------;
PROMPT SELEKTY WARUNKOWE WIELOKOLUMNOWE;
PROMPT----------------------------------------;
PROMPT ;
SELECT PRODk_1_ID, PROD_NAZWA, SLI_ID, MENU_ID 
    FROM STRONY, PRODUKTY
    WHERE GAL_ID BETWEEN 2 AND 4
    AND PRODk_1_CENA < 40;

PROMPT ;
PROMPT----------------------------------------;
PROMPT SELEKTY WARUNKOWE Z perspektywa;
PROMPT----------------------------------------;
PROMPT ;

drop view drogie;
CREATE VIEW drogie
AS SELECT *FROM PRODUKTY 
WHERE PRODk_1_CENA > 40;
select *from drogie;

PROMPT ;
PROMPT----------------------------------------;
PROMPT SELEKTY TWORZENIE TABEL LACZACYCH;
PROMPT----------------------------------------;
PROMPT ;
/*
DROP TABLE XXX_SLI_ZD;

COLUMN SLI_NAZWA FORMAT A10
COLUMN ZD_NAZWA FORMAT A10
CREATE TABLE XXX_SLI_ZD
AS (SELECT SLIDERY.SLIk_1_ID, SLIDERY.SLI_NAZWA, ZDJECIA.ZD_ID, ZDJECIA.ZD_NAZWA FROM SLIDERY, ZDJECIA
   WHERE SLI_NAZWA LIKE 'REKLAM%' AND ZD_NAZWA LIKE 'reklama%'
   );
   
ALTER TABLE XXX_SLI_ZD
    ADD XXX_SLI_ZD_ID number(4);
CREATE INDEX IX_XXX_SLI_ZD ON XXX_SLI_ZD (XXX_SLI_ZD_ID);
DESCRIBE XXX_SLI_ZD;
SELECT *FROM XXX_SLI_ZD;


DROP TABLE XXX_GAL_ZD;
CREATE TABLE XXX_GAL_ZD
(
	GAL_NAZWA varchar2(20) not null,
	ZD_NAZWA VARCHAR2(20)  NOT NULL
);

describe XXX_GAL_ZD;
*/
CREATE or REPLACE PROCEDURE losuj_zdjecia(ile IN number)
IS 
	licznik number(4);
	rand_number number(4,0);
	type ZNazwy is varray(10) of varchar2(30);
	zdjecie ZNazwy :=ZNazwy('buty', 'pilki', 'reklama_butow', 'reklama pilek', 'reklama koszulek');
	galeria ZNazwy := ZNazwy('BUTY', 'KOSZULKI', 'PILKI', 'RAKIETY', 'RAKIETY2');
	
BEGIN

licznik :=1;
while licznik <ile+1
LOOP
rand_number :=ROUND(dbms_random.value(1,5),0);
INSERT INTO XXX_GAL_ZD(GAL_NAZWA, ZD_NAZWA) VALUES (zdjecie(rand_number), galeria(rand_number) );
licznik :=licznik+1;
END LOOP;
END;
/

BEGIN 
	losuj_zdjecia(9);
END;
/
SELECT *FROM XXX_GAL_ZD;

commit;