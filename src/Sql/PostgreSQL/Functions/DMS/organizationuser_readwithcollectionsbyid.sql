CREATE OR REPLACE PROCEDURE vault_dbo.organizationuser_readwithcollectionsbyid(par_id uuid, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
    organizationuser_readbyid$refcur_1 refcursor;
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    CALL vault_dbo.organizationuser_readbyid(par_Id, p_refcur => organizationuser_readbyid$refcur_1);
    OPEN p_refcur FOR
    SELECT
        cu.collectionid AS id, cu.readonly
        FROM vault_dbo.organizationuser AS ou
        INNER JOIN vault_dbo.collectionuser AS cu
            ON ou.accessall = 0 AND cu.organizationuserid = ou.id
        WHERE organizationuserid = par_Id;
END;
$procedure$
;