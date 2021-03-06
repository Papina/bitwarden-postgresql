CREATE OR REPLACE PROCEDURE "group_readbyid$tmp"(par_id uuid)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    DROP TABLE IF EXISTS Group_ReadById$TMPTBL;
    CREATE TEMP TABLE Group_ReadById$TMPTBL
    AS
    SELECT
        *
        FROM groupview
        WHERE id = par_Id;
END;
$procedure$
;
