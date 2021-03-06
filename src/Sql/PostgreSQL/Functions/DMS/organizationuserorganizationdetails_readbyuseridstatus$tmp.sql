CREATE OR REPLACE PROCEDURE "organization_userorganizationdetails_readbyuseridstatus$tmp"(par_userid uuid, par_status numeric)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    DROP TABLE IF EXISTS OrganizationUserOrganizationDetails_ReadByUserIdStatus$TMPTBL;
    CREATE TEMP TABLE OrganizationUserOrganizationDetails_ReadByUserIdStatus$TMPTBL
    AS
    SELECT
        *
        FROM organization_userorganizationdetailsview
        WHERE userid = par_UserId AND (par_Status IS NULL OR status = par_Status);
END;
$procedure$
;
