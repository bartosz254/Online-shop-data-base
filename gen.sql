DROP SEQUENCE SEQ_PH_GENERATOR;
CREATE SEQUENCE SEQ_PH_GENERATOR INCREMENT BY 1 START WITH 1 MAXVALUE 999999 MINVALUE 1;

CREATE or REPLACE PROCEDURE PH_insert(n IN number)
	IS
		counter		number(2);
		offset 		number(6);
		BEGIN
			counter := 1;
			SELECT SEQ_PH_GENERATOR.nextval INTO offset FROM dual;
			WHILE counter < n + 1
			LOOP
				INSERT INTO PHOTOS(PH_NAME)
				VALUES('photo'||(counter));
				counter := counter +1;
			END LOOP;
		END;
	/
	
BEGIN
	PH_insert(10);
END;
/
/*
  PHK_1_ID PH_NAME
---------- ------------------------------
         1 shoes
         2 files
         3 ad_shoes
         4 ad_balls
         5 ad_t-shirts
         6 ad_rackets
         7 shop photos
         8 info1
         9 info2
        10 info3
        11 product/ball1

  PHK_1_ID PH_NAME
---------- ------------------------------
        12 product/shoes
        13 product/t-shirt
        14 product/racket
        15 photo1
        16 photo2
        17 photo1
        18 photo2
        19 photo3
        20 photo4
        21 photo5
        22 photo6
*/