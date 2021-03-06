CREATE OR REPLACE PROCEDURE "organization_readbyuserid$tmp"(par_userid uuid)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    DROP TABLE IF EXISTS Organization_ReadByUserId$TMPTBL;
    CREATE TEMP TABLE Organization_ReadByUserId$TMPTBL
    AS
    SELECT
        o.*
        FROM organizationview AS o
        INNER JOIN organization_user AS ou
            ON o.id = ou.organizationid
        WHERE ou.userid = par_UserId;
END;
$procedure$
;
