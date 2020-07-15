CREATE OR REPLACE PROCEDURE "user_readbyemail$tmp"(par_email character varying)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    DROP TABLE IF EXISTS User_ReadByEmail$TMPTBL;
    CREATE TEMP TABLE User_ReadByEmail$TMPTBL
    AS
    SELECT
        *
        FROM userview
        WHERE LOWER(email) = LOWER(par_Email);
END;
$procedure$
;
