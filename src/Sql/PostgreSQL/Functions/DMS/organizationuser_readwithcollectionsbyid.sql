CREATE OR REPLACE PROCEDURE organization_user_readwithcollectionsbyid(par_id uuid, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
    organization_user_readbyid$refcur_1 refcursor;
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    CALL organization_user_readbyid(par_Id, p_refcur => organization_user_readbyid$refcur_1);
    OPEN p_refcur FOR
    SELECT
        cu.collection_id AS id, cu.readonly
        FROM organization_user AS ou
        INNER JOIN collectionuser AS cu
            ON ou.accessall = 0 AND cu.organization_userid = ou.id
        WHERE organization_userid = par_Id;
END;
$procedure$
;
