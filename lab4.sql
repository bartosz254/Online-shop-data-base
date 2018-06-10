clear screen;
set serveroutput on;

prompt ;
prompt--------------------------------------------------------------------------------;
prompt SELEKTY;
prompt--------------------------------------------------------------------------------;
prompt ;

select MENUk_1_ID, MENU_POZYCJA from MENU;
select STR_ID, STR_NAZWA, SLI_ID, MENU_ID from STRONY;
select PRODk_1_ID, PROD_NAZWA, PRODk_1_CENA, GAL_ID, STR_LINK from PRODUKTY;

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

prompt ;
prompt----------------------------------------;
prompt SELEKTY WARUNKOWE;
prompt----------------------------------------;
prompt ;
select STR_ID, STR_NAZWA, SLI_ID, MENU_ID from STRONY where SLI_ID = 1 OR SLI_ID=3;
select PRODk_1_ID, PROD_NAZWA, PRODk_1_CENA, GAL_ID, STR_LINK 
    from PRODUKTY 
    where PROD_NAZWA LIKE 'pil%';

prompt ;
prompt----------------------------------------;
prompt SELEKTY WARUNKOWE WIELOKOLUMNOWE;
prompt----------------------------------------;
prompt ;
select PRODk_1_ID, PROD_NAZWA, SLI_ID, MENU_ID 
    from STRONY, PRODUKTY
    where GAL_ID BETWEEN 2 AND 4
    AND PRODk_1_CENA < 40;

prompt ;
prompt----------------------------------------;
prompt SELEKTY WARUNKOWE Z perspektywa;
prompt----------------------------------------;
prompt ;

drop view drogie;
create view drogie
as select *from PRODUKTY 
where PRODk_1_CENA > 40;
select *from drogie;

prompt ;
prompt----------------------------------------;
prompt SELEKTY TWORZENIE TABEL LACZACYCH;
prompt----------------------------------------;
prompt ;
/*
DROP TABLE XXX_SLI_ZD;

COLUMN SLI_NAZWA FORMAT A10
COLUMN ZD_NAZWA FORMAT A10
CREATE TABLE XXX_SLI_ZD
AS (select SLIDERY.SLIk_1_ID, SLIDERY.SLI_NAZWA, ZDJECIA.ZD_ID, ZDJECIA.ZD_NAZWA from SLIDERY, ZDJECIA
   where SLI_NAZWA LIKE 'REKLAM%' AND ZD_NAZWA LIKE 'reklama%'
   );
   
alter TABLE XXX_SLI_ZD
    ADD XXX_SLI_ZD_ID number(4);
create index IX_XXX_SLI_ZD ON XXX_SLI_ZD (XXX_SLI_ZD_ID);
describe XXX_SLI_ZD;
select *from XXX_SLI_ZD;


DROP TABLE XXX_GAL_ZD;
CREATE TABLE XXX_GAL_ZD
(
	GAL_NAZWA varchar2(20) not null,
	ZD_NAZWA VARCHAR2(20)  NOT NULL
);

describe XXX_GAL_ZD;
*/
create or replace procedure losuj_zdjecia(ile IN number)
is 
	licznik number(4);
	rand_number number(4,0);
	type ZNazwy is varray(10) of varchar2(30);
	zdjecie ZNazwy :=ZNazwy('buty', 'pilki', 'reklama_butow', 'reklama pilek', 'reklama koszulek');
	galeria ZNazwy := ZNazwy('BUTY', 'KOSZULKI', 'PILKI', 'RAKIETY', 'RAKIETY2');
	
begin

licznik :=1;
while licznik <ile+1
loop
rand_number :=ROUND(dbms_random.value(1,5),0);
insert into XXX_GAL_ZD(GAL_NAZWA, ZD_NAZWA) VALUES (zdjecie(rand_number), galeria(rand_number) );
licznik :=licznik+1;
end loop;
end;
/

begin 
	losuj_zdjecia(9);
end;
/
select *from XXX_GAL_ZD;

commit;