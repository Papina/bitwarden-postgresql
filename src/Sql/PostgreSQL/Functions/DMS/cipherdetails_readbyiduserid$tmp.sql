CREATE OR REPLACE PROCEDURE "cipherdetails_readbyiduserid$tmp"(par_id uuid, par_userid uuid)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    PERFORM usercipherdetails(par_UserId);
    DROP TABLE IF EXISTS CipherDetails_ReadByIdUserId$TMPTBL;
    CREATE TEMP TABLE CipherDetails_ReadByIdUserId$TMPTBL
    AS
    SELECT
        *
        FROM usercipherdetails$tmptbl
        WHERE Id = par_Id
        ORDER BY Edit DESC NULLS FIRST
        LIMIT 1;
END;
$procedure$
;
