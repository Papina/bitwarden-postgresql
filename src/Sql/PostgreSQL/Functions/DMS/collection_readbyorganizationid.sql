CREATE OR REPLACE PROCEDURE collection_readbyorganizationid(par_organizationid uuid, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    OPEN p_refcur FOR
    SELECT
        *
        FROM collectionview
        WHERE organizationid = par_OrganizationId;
END;
$procedure$
;
