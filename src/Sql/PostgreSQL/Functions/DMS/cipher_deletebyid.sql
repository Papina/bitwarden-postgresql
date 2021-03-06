CREATE OR REPLACE PROCEDURE cipher_deletebyid(par_id uuid)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
    var_UserId UUID;
    var_OrganizationId UUID;
    var_Attachments NUMERIC(1, 0);
BEGIN
    /*
    [7810 - Severity CRITICAL - PostgreSQL doesn't support the SET NOCOUNT. If need try another way to send message back to the client application.]
    SET NOCOUNT ON
    */
    SELECT
        userid, organizationid,
        CASE
            WHEN attachments IS NOT NULL THEN 1
            ELSE 0
        END
        INTO var_UserId, var_OrganizationId, var_Attachments
        FROM cipher
        WHERE id = par_Id
        LIMIT 1;
    DELETE FROM cipher
        WHERE id = par_Id;

    IF var_OrganizationId IS NOT NULL THEN
        IF var_Attachments = 1 THEN
            CALL organization_updatestorage(var_OrganizationId);
        END IF;
        CALL user_bumpaccountrevisiondatebycipherid(par_Id, var_OrganizationId);
    ELSE
        IF var_UserId IS NOT NULL THEN
            IF var_Attachments = 1 THEN
                CALL user_updatestorage(var_UserId);
            END IF;
            CALL user_bumpaccountrevisiondate(var_UserId);
        END IF;
    END IF;
END;
$procedure$
;
