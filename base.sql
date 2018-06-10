clear screen;

prompt ;
prompt----------------------------------------;
prompt    REMOVING TAB
prompt----------------------------------------;
prompt ;

delete from PRODUCTS;
drop table PRODUCTS cascade constraints;

delete from XXX_CAT_PROD;
drop table XXX_CAT_PROD cascade constraints;

delete from WEBSITES;
drop table WEBSITES cascade constraints;

delete from CATEGORIES;
drop table CATEGORIES cascade constraints;

delete from XXX_SLI_PH;
drop table XXX_SLI_PH cascade constraints;

delete from XXX_GAL_PH;
drop table XXX_GAL_PH cascade constraints;

delete from SLIDERS;
drop table SLIDERS cascade constraints;

delete from PHOTOS;
drop table PHOTOS cascade constraints;

delete from GALLERIES;
drop table GALLERIES cascade constraints;

delete from CUSTOMERS;
drop table CUSTOMERS cascade constraints;

delete from MENUS;
drop table MENUS cascade constraints;

delete from TRANSACTIONS;
drop table TRANSACTIONS cascade constraints;

prompt ;
prompt--------------------------------------------------------------------------------;
prompt =============CREATION OF TAB=============;
prompt--------------------------------------------------------------------------------;
prompt ;

prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE CUSTOMERS;
prompt--------------------------------------------------------------------------------;
prompt ;
CREATE TABLE
CUSTOMERS
(
    CUS_ID           number(4)       NOT NULL,
    CUS_NAZWA        varchar2(30)    NOT NULL,
    CUSk_1_ADRESS    varchar2(20)    NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table CUSTOMERS
add constraint CSR_PK_CUSTOMERS
primary key (CUS_ID);

prompt ;
prompt----------------------------------------;
prompt Unique Key;
prompt----------------------------------------;
prompt ;
alter table CUSTOMERS
add constraint CSR_UQ_CUSTOMERS
unique (CUSk_1_ADRESS);

prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE CATEGORIES;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
CATEGORIES
(
    CATk_1_ID   number(4)       NOT NULL,
    CAT_NAME	varchar2(20)    NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table CATEGORIES
add constraint CSR_PK_CATEGORIES
primary key (CATk_1_ID);






prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE SLIDERS;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
SLIDERS
(
    SLIk_1_ID   number(4)     NOT NULL,
    SLI_NAME   varchar2(30)  NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table SLIDERS
add constraint CSR_PK_SLIDERS
primary key (SLIk_1_ID);




prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE PHOTOS;
prompt--------------------------------------------------------------------------------;
prompt ;
create table PHOTOS
(
	PHk_1_ID        number(4)       NOT NULL,
    PH_NAME    		varchar2(30)    NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table PHOTOS
add constraint CSR_PK_PHOTOS
primary key (PHk_1_ID);




prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE XXX_SLI_PH;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
XXX_SLI_PH
(
    XXX_ID_SLI_PH	number(4)   NOT NULL,
	SLI_ID   		number(4)   NOT NULL,
    PH_ID    		number(4)  	NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table XXX_SLI_PH
add constraint CSR_PK_XXX_SLI_PH
primary key (XXX_ID_SLI_PH);

prompt ;
prompt ----------------------------------;
prompt foreign key;
prompt ----------------------------------;
prompt ;
alter TABLE XXX_SLI_PH
add constraint CSR_FK_1_XXX_SLI_PH
foreign key (SLI_ID)
REFERENCES SLIDERS (SLIk_1_ID);

alter TABLE XXX_SLI_PH
add constraint CSR_FK_2_XXX_SLI_PH
foreign key (PH_ID)
REFERENCES PHOTOS (PHk_1_ID);






prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE GALLERIES;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
GALLERIES
(
    GALk_1_ID   number(4)     NOT NULL,
    GAL_NAME   varchar2(10)  NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table GALLERIES
add constraint CSR_PK_GALLERIES
primary key (GALk_1_ID);





prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE XXX_GAL_PH;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
XXX_GAL_PH
(
    XXX_ID_GAL_PH	number(4)   NOT NULL,
	GAL_ID   		number(4)   NOT NULL,
    PH_ID    		number(4)  	NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table XXX_GAL_PH
add constraint CSR_PK_XXX_GAL_PH
primary key (XXX_ID_GAL_PH);

prompt ;
prompt ----------------------------------;
prompt foreign key;
prompt ----------------------------------;
prompt ;
alter TABLE XXX_GAL_PH
add constraint CSR_FK_1_XXX_GAL_PH
foreign key (GAL_ID)
REFERENCES GALLERIES (GALk_1_ID);

alter TABLE XXX_GAL_PH
add constraint CSR_FK_2_XXX_GAL_PH
foreign key (PH_ID)
REFERENCES PHOTOS (PHk_1_ID);




prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE MENUS;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
MENUS
(
    MENUk_1_ID      number(4)       NOT NULL,
    MENU_POSITION   varchar2(10)    NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table MENUS
add constraint CSR_PK_MENU
primary key (MENUk_1_ID);





prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE WEBSITES;
prompt--------------------------------------------------------------------------------;
prompt ;
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
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table WEBSITES
add constraint CSR_PK_WEBSITES
primary key (WEB_ID);

prompt ;
prompt----------------------------------------;
prompt foreign key;
prompt----------------------------------------;
prompt ;
alter table WEBSITES add constraint CSR_FK_WEBSITES1
foreign key (SLI_ID)
references SLIDERS (SLIk_1_ID);

alter table WEBSITES add constraint CSR_FK_WEBSITES2
foreign key (MENU_ID)
references MENUS (MENUk_1_ID);

prompt ;
prompt----------------------------------------;
prompt Unique Key;
prompt----------------------------------------;
prompt ;
alter table WEBSITES
add constraint CSR_UQ_WEBSITES
unique (WEBk_1_LINK);




prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE PRODUCTS;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
PRODUCTS
(
    PRODk_1_ID      number(4)       NOT NULL,
    PROD_NAME       varchar2(40)    NOT NULL,
    PRODk_1_PRICE   number(4)       NOT NULL,
    WEB_LINK        varchar2(20)    NOT NULL,
    GAL_ID          number(4)       NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table PRODUCTS
add constraint CSR_PK_PRODUCTS
primary key (PRODk_1_ID);

prompt ;
prompt----------------------------------------;
prompt foreign key;
prompt----------------------------------------;
prompt ;
alter table PRODUCTS add constraint CSR_FK_PRODUCTS1
foreign key (WEB_LINK)
references WEBSITES (WEBk_1_LINK);


alter table PRODUCTS add constraint CSR_FK_PRODUCTS2
foreign key (GAL_ID)
references GALLERIES (GALk_1_ID);

prompt ;
prompt----------------------------------------;
prompt Unique Key;
prompt----------------------------------------;
prompt ;
alter table PRODUCTS
add constraint CSR_UQ_PRODUCTS
unique (PRODk_1_PRICE);

prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE XXX_CAT_PROD;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
XXX_CAT_PROD
(
    XXX_CAT_PROD_ID		number(4)   NOT NULL,
    CAT_ID				number(10)  NOT NULL,
	PROD_ID				number(4)	NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table XXX_CAT_PROD
add constraint CSR_PK_XXX_CAT_PROD
primary key (XXX_CAT_PROD_ID);

prompt ;
prompt ----------------------------------;
prompt foreign key;
prompt ----------------------------------;
prompt ;
alter TABLE XXX_CAT_PROD
add constraint CSR_FK_1_XXX_CAT_PROD
foreign key (CAT_ID)
REFERENCES CATEGORIES (CATk_1_ID);

alter TABLE XXX_CAT_PROD
add constraint CSR_FK_2_XXX_CAT_PROD
foreign key (PROD_ID)
REFERENCES PRODUCTS (PRODk_1_ID);


prompt ;
prompt--------------------------------------------------------------------------------;
prompt CREATE TABLE TRANSACTIONS;
prompt--------------------------------------------------------------------------------;
prompt ;
create table
TRANSACTIONS
(
    TR_ID       number(4)       NOT NULL,
    PROD_ID     number(5)       NOT NULL,
    CUS_ADRESS  varchar2(20)    NOT NULL,
    PROD_PRICE  NUMBER(5)       NOT NULL,
    TR_VALUE    number(4)       NOT NULL
);
--TABLSPACE STUDENT_DATA
prompt ;
prompt----------------------------------------;
prompt Primary Key;
prompt----------------------------------------;
prompt ;
alter table TRANSACTIONS
add constraint CSR_PK_TRANSACTIONS
primary key (TR_ID);

prompt ;
prompt----------------------------------------;
prompt foreign key;
prompt----------------------------------------;
prompt ;
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
prompt----------------------------------------;
prompt DESCRIBE;
prompt----------------------------------------;
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



prompt ;
prompt----------------------------------------;
prompt SEQUENCES;
prompt----------------------------------------;
prompt ;
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


prompt ;
prompt----------------------------------------;
prompt TRIGGERSS;
prompt----------------------------------------;
prompt ;
create or replace trigger T_BI_CUSTOMERS
before insert on CUSTOMERS
for each row
begin
    if :new.CUS_ID is NULL then
        SELECT SEQ_CUSTOMERS.nextval INTO :new.CUS_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_GALLERIES
before insert on GALLERIES
for each row
begin
    if :new.GALk_1_ID is NULL then
        SELECT SEQ_GALLERIES.nextval INTO :new.GALk_1_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_SLIDERS
before insert on SLIDERS
for each row
begin
    if :new.SLIk_1_ID is NULL then
        SELECT SEQ_SLIDERS.nextval INTO :new.SLIk_1_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_CATEGORIES
before insert on CATEGORIES
for each row
begin
    if :new.CATk_1_ID is NULL then
        SELECT SEQ_CATEGORIES.nextval INTO :new.CATk_1_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_MENUS
before insert on MENUS
for each row
begin
    if :new.MENUk_1_ID is NULL then
        SELECT SEQ_MENUS.nextval INTO :new.MENUk_1_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_WEBSITES
before insert on WEBSITES
for each row
begin
    if :new.WEB_ID is NULL then
        SELECT SEQ_WEBSITES.nextval INTO :new.WEB_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_PRODUCTS
before insert on PRODUCTS
for each row
begin
    if :new.PRODk_1_ID is NULL then
        SELECT SEQ_PRODUCTS.nextval INTO :new.PRODk_1_ID from dual;
    end if;
end;
/

create or replace trigger T_BI_PHOTOS
before insert on PHOTOS
for each row
begin
    if :new.PHk_1_ID is NULL then
        SELECT SEQ_PHOTOS.nextval INTO :new.PHk_1_ID from dual;
    end if;
end;
/
create or replace trigger T_BI_XXX_SLI_PH
before insert on XXX_SLI_PH
for each row
begin
    if :new.XXX_ID_SLI_PH is NULL then
        SELECT SEQ_XXX_SLI_PH.nextval INTO :new.XXX_ID_SLI_PH from dual;
    end if;
end;
/
create or replace trigger T_BI_XXX_GAL_PH
before insert on XXX_GAL_PH
for each row
begin
    if :new.XXX_ID_GAL_PH is NULL then
        SELECT SEQ_XXX_GAL_PH.nextval INTO :new.XXX_ID_GAL_PH from dual;
    end if;
end;
/

prompt ;
prompt----------------------------------------;
prompt INSERTS;
prompt----------------------------------------;
prompt ;

insert into CUSTOMERS
values('','Andrzej','38-230 Nowy Zmigrod');
insert into CUSTOMERS
values('','Janusz Nosacz','31-866 Krakow');
insert into CUSTOMERS
values('','Mikolaj Jaok','01-234 Warszawa');
insert into CUSTOMERS
values('','Bartosz Przybylowski','31-8636 Krakow');
insert into CUSTOMERS
values('','Stanislaw Przybyszewski','31-863 Krakow');
insert into CUSTOMERS
values('','Tadeusz MiciNski','31-864 Krakow');

insert into GALLERIES values('','shoes');
insert into GALLERIES values('','t-shirts');
insert into GALLERIES values('','balls');
insert into GALLERIES values('','rackets');
insert into GALLERIES values('','rackets');

insert into SLIDERS values('','ad1');
insert into SLIDERS values('','ed2');
insert into SLIDERS values('','info1');
insert into SLIDERS values('','shop photos');
insert into SLIDERS values('','info2');

insert into MENUS values('','bot');
insert into MENUS values('','left');
insert into MENUS values('','right');
insert into MENUS values('','top');

insert into WEBSITES
values('','mainpage','lorem ipsum','mainpage','1','3');
insert into WEBSITES
values('','product1','lorem ipsum','shop1','1','3');
insert into WEBSITES
values('','product2','lorem ipsum','shop2','1','3');
insert into WEBSITES
values('','product3','lorem ipsum','shop3','2','1');
insert into WEBSITES
values('','product4','lorem ipsum','shop4','4','2');
insert into WEBSITES
values('','product5','lorem ipsum','shop5','3','4');
insert into WEBSITES
values('','contact','adres','contact','4','4');

insert into PRODUCTS
values('','shoes','38','shop1','1');
insert into PRODUCTS
values('','t-shirts','45','shop2','2');
insert into PRODUCTS
values('','balls','29','shop3','3');
insert into PRODUCTS
values('','balls2','34','shop4','3');
insert into PRODUCTS
values('','tenis racket','100','shop5','4');

insert into PHOTOS values('','shoes');
insert into PHOTOS values('','files');
insert into PHOTOS values('','ad_shoes');
insert into PHOTOS values('','ad_balls');
insert into PHOTOS values('','ad_t-shirts');
insert into PHOTOS values('','ad_rackets');
insert into PHOTOS values('','shop photos');
insert into PHOTOS values('','info1');
insert into PHOTOS values('','info2');
insert into PHOTOS values('','info3');
insert into PHOTOS values('','product/ball1');
insert into PHOTOS values('','product/shoes');
insert into PHOTOS values('','product/t-shirt');
insert into PHOTOS values('','product/racket');

insert into CATEGORIES values('','sport shoes');
insert into CATEGORIES values('','sportswear');
insert into CATEGORIES values('','sport items');



commit;
