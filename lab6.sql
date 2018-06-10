clear screen;
create or replace procedure
    pPROD_update (name in varchar2, new_name in varchar2)
    is
        XPName PRODUCTS.PROD_NAME%TYPE;
        
        cursor PRODUCTS_cursor
        is
            select PROD_NAME
            from PRODUCTS
            where PROD_NAME=name
        for update of PROD_NAME;
        
        begin
            open PRODUCTS_cursor;
            loop
                fetch PRODUCTS_cursor into xPName;
                exit when
                    PRODUCTS_cursor%NOTFOUND or PRODUCTS_cursor%ROWCOUNT < 1;

                update PRODUCTS
                set PROD_NAME=new_name
                where current of PRODUCTS_cursor;
            
            end loop;
            close PRODUCTS_cursor;
        exception
            when others 
                then

                    dbms_output.put_line('Coursor not found');
            end;
/
select PROD_NAME from PRODUCTS;
/*
PROD_NAME
----------------------------------------
shoes
t-shirts
balls
balls2
tenis racket
*/
/
exec pPROD_update ('shoes', 'shoes(not available)');
/
select PROD_NAME from PRODUCTS;
/*
PROD_NAME
----------------------------------------
shoes(not available)
t-shirts
balls
balls2
tenis racket
*/