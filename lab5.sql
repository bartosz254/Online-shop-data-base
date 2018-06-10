clear screen;
create or replace procedure pSEQ_PROD_STR_insert(
	P_NAME 		in PRODUCTS.PROD_NAME%TYPE,
	P_CAT		in CATEGORIES.CATk_1_ID%TYPE,
	P_PRICE 	in PRODUCTS.PRODk_1_PRICE%TYPE,
	P_GALLERY 	in PRODUCTS.GAL_ID%TYPE
	)
	is
		P_ID	PRODUCTS.PRODk_1_ID%TYPE;
		W_ID	WEBSITES.WEB_ID%TYPE;
		C_ID	XXX_CAT_PROD.XXX_CAT_PROD_ID%TYPE;
		PRAGMA AUTONOMOUS_TRANSACTION;
	begin
			select SEQ_WEBSITES.nextval into W_ID from dual;
			--
			insert into WEBSITES(WEB_NAME, WEB_DESCRIPTION, WEBk_1_LINK, SLI_ID, MENU_ID)
			values('SHOP_'||P_NAME, 'descritpion of '||P_NAME, 'SHOP_'||P_NAME||'_'||P_ID, '1', '1');
			--
			select SEQ_WEBSITES.currval into W_ID from dual;
			--
			select SEQ_PRODUCTS.nextval into P_ID from dual;
			--
			insert into PRODUCTS(PROD_NAME, PRODk_1_PRICE, WEB_LINK, GAL_ID)
			values (P_NAME, P_PRICE, 'SHOP_'||P_NAME||'_'||P_ID, P_GALLERY);
			--
			select SEQ_PRODUCTS.currval into P_ID from dual;
			
			--
			insert into XXX_CAT_PROD(CAT_ID, PROD_ID)
			values (P_CAT,P_ID);

			--
			commit;
	end;
/
exec pSEQ_PROD_STR_insert('adidasy', 1, 2, 1);