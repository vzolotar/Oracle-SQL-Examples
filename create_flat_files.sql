CREATE OR REPLACE PROCEDURE
TT_PROD_BKUP IS
FIRST_FILE UTL_FILE.FILE_TYPE;
CURSOR C1 IS 
SELECT * FROM TT_PRODUCT;
BEGIN
DBMS_OUTPUT.ENABLE(1000000);
FIRST_FILE := UTL_FILE.FOPEN('C:\APPS\TTT\TTT_DB_BACKUP_TXT\','TT_PRODUCT.TXT','W');
UTL_FILE.FCLOSE(FIRST_FILE);
FIRST_FILE := UTL_FILE.FOPEN('C:\APPS\TTT\TTT_DB_BACKUP_TXT\','TT_PRODUCT.TXT','W');
FOR C1_REC IN C1 LOOP
utl_file.put_line(first_file, to_char(c1_rec.pr_id)||'^'||c1_rec.pr_name||'^'
||to_char(c1_rec.pr_price)||'^'||to_char(c1_rec.pr_srt_date)||'^'
||to_char(c1_rec.pr_end_date)||'^'||c1_rec.pr_lock_date||'^'
||c1_rec.pr_ar_code||'^'||c1_rec.pr_dept||'^'||c1_rec.pr_iTT_year||'^'
||c1_rec.pr_disc);
END LOOP;
UTL_FILE.FCLOSE(FIRST_FILE);
END TT_PROD_BKUP ;
