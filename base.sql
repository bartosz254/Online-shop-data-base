CLEAR SCREEN;

PROMPT ;
PROMPT----------------------------------------;
PROMPT    REMOVING TAB
PROMPT----------------------------------------;
PROMPT ;

DELETE FROM PRODUCTS;
drop table PRODUCTS CASCADE constraints;

DELETE FROM XXX_CAT_PROD;
drop table XXX_CAT_PROD CASCADE constraints;

DELETE FROM WEBSITES;
drop table WEBSITES CASCADE constraints;

DELETE FROM CATEGORIES;
drop table CATEGORIES CASCADE constraints;

DELETE FROM XXX_SLI_PH;
drop table XXX_SLI_PH CASCADE constraints;

DELETE FROM XXX_GAL_PH;
drop table XXX_GAL_PH CASCADE constraints;

DELETE FROM SLIDERS;
drop table SLIDERS CASCADE constraints;

DELETE FROM PHOTOS;
drop table PHOTOS CASCADE constraints;

DELETE FROM GALLERIES;
drop table GALLERIES CASCADE constraints;

DELETE FROM CUSTOMERS;
drop table CUSTOMERS CASCADE constraints;

DELETE FROM MENUS;
drop table MENUS CASCADE constraints;

DELETE FROM TRANSACTIONS;
drop table TRANSACTIONS CASCADE constraints;

PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT =============CREATION OF TAB=============;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;

PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE CUSTOMERS;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
CREATE TABLE
CUSTOMERS
(
    CUS_ID           number(4)       NOT NULL,
    CUS_NAZWA        varchar2(30)    NOT NULL,
    CUSk_1_ADRESS    varchar2(20)    NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table CUSTOMERS
add constraint CSR_PK_CUSTOMERS
primary key (CUS_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Unique Key;
PROMPT----------------------------------------;
PROMPT ;
alter table CUSTOMERS
add constraint CSR_UQ_CUSTOMERS
unique (CUSk_1_ADRESS);

PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE CATEGORIES;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
CATEGORIES
(
    CATk_1_ID   number(4)       NOT NULL,
    CAT_NAME	varchar2(20)    NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table CATEGORIES
add constraint CSR_PK_CATEGORIES
primary key (CATk_1_ID);






PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE SLIDERS;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
SLIDERS
(
    SLIk_1_ID   number(4)     NOT NULL,
    SLI_NAME   varchar2(30)  NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table SLIDERS
add constraint CSR_PK_SLIDERS
primary key (SLIk_1_ID);




PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE PHOTOS;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table PHOTOS
(
	PHk_1_ID        number(4)       NOT NULL,
    PH_NAME    		varchar2(30)    NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PHOTOS
add constraint CSR_PK_PHOTOS
primary key (PHk_1_ID);




PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE XXX_SLI_PH;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
XXX_SLI_PH
(
    XXX_ID_SLI_PH	number(4)   NOT NULL,
	SLI_ID   		number(4)   NOT NULL,
    PH_ID    		number(4)  	NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XXX_SLI_PH
add constraint CSR_PK_XXX_SLI_PH
primary key (XXX_ID_SLI_PH);

PROMPT ;
PROMPT ----------------------------------;
PROMPT FOREIGN KEY;
PROMPT ----------------------------------;
PROMPT ;
ALTER TABLE XXX_SLI_PH
ADD CONSTRAINT CSR_FK_1_XXX_SLI_PH
FOREIGN KEY (SLI_ID)
REFERENCES SLIDERS (SLIk_1_ID);

ALTER TABLE XXX_SLI_PH
ADD CONSTRAINT CSR_FK_2_XXX_SLI_PH
FOREIGN KEY (PH_ID)
REFERENCES PHOTOS (PHk_1_ID);






PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE GALLERIES;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
GALLERIES
(
    GALk_1_ID   number(4)     NOT NULL,
    GAL_NAME   varchar2(10)  NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table GALLERIES
add constraint CSR_PK_GALLERIES
primary key (GALk_1_ID);





PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE XXX_GAL_PH;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
XXX_GAL_PH
(
    XXX_ID_GAL_PH	number(4)   NOT NULL,
	GAL_ID   		number(4)   NOT NULL,
    PH_ID    		number(4)  	NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XXX_GAL_PH
add constraint CSR_PK_XXX_GAL_PH
primary key (XXX_ID_GAL_PH);

PROMPT ;
PROMPT ----------------------------------;
PROMPT FOREIGN KEY;
PROMPT ----------------------------------;
PROMPT ;
ALTER TABLE XXX_GAL_PH
ADD CONSTRAINT CSR_FK_1_XXX_GAL_PH
FOREIGN KEY (GAL_ID)
REFERENCES GALLERIES (GALk_1_ID);

ALTER TABLE XXX_GAL_PH
ADD CONSTRAINT CSR_FK_2_XXX_GAL_PH
FOREIGN KEY (PH_ID)
REFERENCES PHOTOS (PHk_1_ID);




PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE MENUS;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
MENUS
(
    MENUk_1_ID      number(4)       NOT NULL,
    MENU_POSITION   varchar2(10)    NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table MENUS
add constraint CSR_PK_MENU
primary key (MENUk_1_ID);





PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE WEBSITES;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
WEBSITES
(
    WEB_ID      		number(4)       NOT NULL,
    WEB_NAME	   		varchar2(30)    NOT NULL,
    WEB_DESCRIPTION   	varchar2(50),
    WEBk_1_LINK 		varchar2(50)    NOT NULL,
    SLI_ID      		number(4)       NOT NULL,
    MENU_ID     		number(4)       NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WEBSITES
add constraint CSR_PK_WEBSITES
primary key (WEB_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WEBSITES add constraint CSR_FK_WEBSITES1
foreign key (SLI_ID)
references SLIDERS (SLIk_1_ID);

alter table WEBSITES add constraint CSR_FK_WEBSITES2
foreign key (MENU_ID)
references MENUS (MENUk_1_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Unique Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WEBSITES
add constraint CSR_UQ_WEBSITES
unique (WEBk_1_LINK);




PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE PRODUCTS;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
PRODUCTS
(
    PRODk_1_ID      number(4)       NOT NULL,
    PROD_NAME       varchar2(20)    NOT NULL,
    PRODk_1_PRICE   number(4)       NOT NULL,
    WEB_LINK        varchar2(20)    NOT NULL,
    GAL_ID          number(4)       NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PRODUCTS
add constraint CSR_PK_PRODUCTS
primary key (PRODk_1_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PRODUCTS add constraint CSR_FK_PRODUCTS1
foreign key (WEB_LINK)
references WEBSITES (WEBk_1_LINK);


alter table PRODUCTS add constraint CSR_FK_PRODUCTS2
foreign key (GAL_ID)
references GALLERIES (GALk_1_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Unique Key;
PROMPT----------------------------------------;
PROMPT ;
alter table PRODUCTS
add constraint CSR_UQ_PRODUCTS
unique (PRODk_1_PRICE);

PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE XXX_CAT_PROD;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
XXX_CAT_PROD
(
    XXX_CAT_PROD_ID		number(4)   NOT NULL,
    CAT_ID				number(10)  NOT NULL,
	PROD_ID				number(4)	NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XXX_CAT_PROD
add constraint CSR_PK_XXX_CAT_PROD
primary key (XXX_CAT_PROD_ID);

PROMPT ;
PROMPT ----------------------------------;
PROMPT FOREIGN KEY;
PROMPT ----------------------------------;
PROMPT ;
ALTER TABLE XXX_CAT_PROD
ADD CONSTRAINT CSR_FK_1_XXX_CAT_PROD
FOREIGN KEY (CAT_ID)
REFERENCES CATEGORIES (CATk_1_ID);

ALTER TABLE XXX_CAT_PROD
ADD CONSTRAINT CSR_FK_2_XXX_CAT_PROD
FOREIGN KEY (PROD_ID)
REFERENCES PRODUCTS (PRODk_1_ID);


PROMPT ;
PROMPT--------------------------------------------------------------------------------;
PROMPT CREATE TABLE TRANSACTIONS;
PROMPT--------------------------------------------------------------------------------;
PROMPT ;
create table
TRANSACTIONS
(
    TR_ID       number(4)       NOT NULL,
    PROD_ID     NUMBER(5)       NOT NULL,
    CUS_ADRESS  varchar2(20)    NOT NULL,
    PROD_PRICE   NUMBER(5)       NOT NULL,
    TR_VALUE    number(4)       NOT NULL
);
--TABLSPACE STUDENT_DATA
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table TRANSACTIONS
add constraint CSR_PK_TRANSACTIONS
primary key (TR_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table TRANSACTIONS add constraint CSR_FK_TRANSACTIONS1
foreign key (PROD_ID)
references PRODUCTS (PRODk_1_Id);

alter table TRANSACTIONS add constraint CSR_FK_TRANSACTIONS2
foreign key (CUS_ADRESS)
references CUSTOMERS (CUSk_1_ADRESS);

alter table TRANSACTIONS add constraint CSR_FK_TRANSACTIONS3
foreign key (PROD_PRICE)
references PRODUCTS (PRODk_1_PRICE);



/*
PROMPT----------------------------------------;
PROMPT DESCRIBE;
PROMPT----------------------------------------;
describe WEBSITES;
describe PRODUCTS;
describe TRANSACTIONS;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 WEB_ID                                    NOT NULL NUMBER(4)
 WEB_NAME                                  NOT NULL VARCHAR2(30)
 WEB_DESCRIPTION                                    VARCHAR2(50)
 WEBK_1_LINK                               NOT NULL VARCHAR2(30)
 SLI_ID                                    NOT NULL NUMBER(4)
 MENU_ID                                   NOT NULL NUMBER(4)

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PRODK_1_ID                                NOT NULL NUMBER(4)
 PROD_NAME                                 NOT NULL VARCHAR2(20)
 PRODK_1_PRICE                             NOT NULL NUMBER(4)
 WEB_LINK                                  NOT NULL VARCHAR2(20)
 GAL_ID                                    NOT NULL NUMBER(4)

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TR_ID                                     NOT NULL NUMBER(4)
 PROD_ID                                   NOT NULL NUMBER(5)
 CUS_ADRESS                                NOT NULL VARCHAR2(20)
 PROD_PRICE                                NOT NULL NUMBER(5)
 TR_VALUE                                  NOT NULL NUMBER(4)
*/
--



PROMPT ;
PROMPT----------------------------------------;
PROMPT SEQUENCES;
PROMPT----------------------------------------;
PROMPT ;
drop sequence SEQ_PRODUCTS;
create sequence SEQ_PRODUCTS increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_CUSTOMERS;
create sequence SEQ_CUSTOMERS increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_PHOTOS;
create sequence SEQ_PHOTOS increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_SLIDERS;
create sequence SEQ_SLIDERS increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_GALLERIES;
create sequence SEQ_GALLERIES increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_XXX_SLI_PH;
create sequence SEQ_XXX_SLI_PH increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_XXX_GAL_PH;
create sequence SEQ_XXX_GAL_PH increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_XXX_CAT_PROD;
create sequence SEQ_XXX_CAT_PROD increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_CATEGORIES;
create sequence SEQ_CATEGORIES increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_MENUS;
create sequence SEQ_MENUS increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_WEBSITES;
create sequence SEQ_WEBSITES increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--
drop sequence SEQ_TRANSACTIONS;
create sequence SEQ_TRANSACTIONS increment by 1 start with 1
maxvalue 9999999999 minvalue 1;
--


PROMPT ;
PROMPT----------------------------------------;
PROMPT TRIGGERSS;
PROMPT----------------------------------------;
PROMPT ;
create or replace trigger T_BI_CUSTOMERS
before insert on CUSTOMERS
for each row
begin
    if :new.CUS_ID is NULL then
        SELECT SEQ_CUSTOMERS.nextval INTO :new.CUS_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_GALLERIES
before insert on GALLERIES
for each row
begin
    if :new.GALk_1_ID is NULL then
        SELECT SEQ_GALLERIES.nextval INTO :new.GALk_1_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_SLIDERS
before insert on SLIDERS
for each row
begin
    if :new.SLIk_1_ID is NULL then
        SELECT SEQ_SLIDERS.nextval INTO :new.SLIk_1_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_CATEGORIES
before insert on CATEGORIES
for each row
begin
    if :new.CATk_1_ID is NULL then
        SELECT SEQ_CATEGORIES.nextval INTO :new.CATk_1_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_MENUS
before insert on MENUS
for each row
begin
    if :new.MENUk_1_ID is NULL then
        SELECT SEQ_MENUS.nextval INTO :new.MENUk_1_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_WEBSITES
before insert on WEBSITES
for each row
begin
    if :new.WEB_ID is NULL then
        SELECT SEQ_WEBSITES.nextval INTO :new.WEB_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_PRODUCTS
before insert on PRODUCTS
for each row
begin
    if :new.PRODk_1_ID is NULL then
        SELECT SEQ_PRODUCTS.nextval INTO :new.PRODk_1_ID FROM dual;
    end if;
end;
/

create or replace trigger T_BI_PHOTOS
before insert on PHOTOS
for each row
begin
    if :new.PHk_1_ID is NULL then
        SELECT SEQ_PHOTOS.nextval INTO :new.PHk_1_ID FROM dual;
    end if;
end;
/
create or replace trigger T_BI_XXX_SLI_PH
before insert on XXX_SLI_PH
for each row
begin
    if :new.XXX_ID_SLI_PH is NULL then
        SELECT SEQ_XXX_SLI_PH.nextval INTO :new.XXX_ID_SLI_PH FROM dual;
    end if;
end;
/
create or replace trigger T_BI_XXX_GAL_PH
before insert on XXX_GAL_PH
for each row
begin
    if :new.XXX_ID_GAL_PH is NULL then
        SELECT SEQ_XXX_GAL_PH.nextval INTO :new.XXX_ID_GAL_PH FROM dual;
    end if;
end;
/

PROMPT ;
PROMPT----------------------------------------;
PROMPT INSERTS;
PROMPT----------------------------------------;
PROMPT ;

INSERT INTO CUSTOMERS
VALUES('','Andrzej','38-230 Nowy Zmigrod');
INSERT INTO CUSTOMERS
VALUES('','Janusz Nosacz','31-866 Krakow');
INSERT INTO CUSTOMERS
VALUES('','Mikolaj Jaok','01-234 Warszawa');
INSERT INTO CUSTOMERS
VALUES('','Bartosz Przybylowski','31-8636 Krakow');
INSERT INTO CUSTOMERS
VALUES('','Stanislaw Przybyszewski','31-863 Krakow');
INSERT INTO CUSTOMERS
VALUES('','Tadeusz MiciNski','31-864 Krakow');

INSERT INTO GALLERIES VALUES('','shoes');
INSERT INTO GALLERIES VALUES('','t-shirts');
INSERT INTO GALLERIES VALUES('','balls');
INSERT INTO GALLERIES VALUES('','rackets');
INSERT INTO GALLERIES VALUES('','rackets');

INSERT INTO SLIDERS VALUES('','ad1');
INSERT INTO SLIDERS VALUES('','ed2');
INSERT INTO SLIDERS VALUES('','info1');
INSERT INTO SLIDERS VALUES('','shop photos');
INSERT INTO SLIDERS VALUES('','info2');

INSERT INTO MENUS VALUES('','bot');
INSERT INTO MENUS VALUES('','left');
INSERT INTO MENUS VALUES('','right');
INSERT INTO MENUS VALUES('','top');

INSERT INTO WEBSITES
VALUES('','mainpage','lorem ipsum','mainpage','1','3');
INSERT INTO WEBSITES
VALUES('','product1','lorem ipsum','shop1','1','3');
INSERT INTO WEBSITES
VALUES('','product2','lorem ipsum','shop2','1','3');
INSERT INTO WEBSITES
VALUES('','product3','lorem ipsum','shop3','2','1');
INSERT INTO WEBSITES
VALUES('','product4','lorem ipsum','shop4','4','2');
INSERT INTO WEBSITES
VALUES('','product5','lorem ipsum','shop5','3','4');
INSERT INTO WEBSITES
VALUES('','contact','adres','contact','4','4');

INSERT INTO PRODUCTS
VALUES('','shoes','38','shop1','1');
INSERT INTO PRODUCTS
VALUES('','t-shirts','45','shop2','2');
INSERT INTO PRODUCTS
VALUES('','balls','29','shop3','3');
INSERT INTO PRODUCTS
VALUES('','balls2','34','shop4','3');
INSERT INTO PRODUCTS
VALUES('','tenis racket','100','shop5','4');

INSERT INTO PHOTOS VALUES('','shoes');
INSERT INTO PHOTOS VALUES('','files');
INSERT INTO PHOTOS VALUES('','ad_shoes');
INSERT INTO PHOTOS VALUES('','ad_balls');
INSERT INTO PHOTOS VALUES('','ad_t-shirts');
INSERT INTO PHOTOS VALUES('','ad_rackets');
INSERT INTO PHOTOS VALUES('','shop photos');
INSERT INTO PHOTOS VALUES('','info1');
INSERT INTO PHOTOS VALUES('','info2');
INSERT INTO PHOTOS VALUES('','info3');
INSERT INTO PHOTOS VALUES('','product/ball1');
INSERT INTO PHOTOS VALUES('','product/shoes');
INSERT INTO PHOTOS VALUES('','product/t-shirt');
INSERT INTO PHOTOS VALUES('','product/racket');

INSERT INTO CATEGORIES VALUES('','sport shoes');
INSERT INTO CATEGORIES VALUES('','sportswear');
INSERT INTO CATEGORIES VALUES('','sport items');



commit;
