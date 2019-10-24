CREATE OR REPLACE CONTEXT CLI_CTX USING set_client_ctx_pkg;
/
CREATE OR REPLACE PACKAGE set_client_ctx_pkg IS
    PROCEDURE set_client;
END;
/

CREATE OR REPLACE PACKAGE BODY set_client_ctx_pkg IS
    PROCEDURE set_client
    IS
        le_role VARCHAR(50);
        le_client_id VARCHAR2(10);

    BEGIN
        SELECT GRANTED_ROLE INTO LE_ROLE
        FROM DBA_ROLE_PRIVS
        WHERE (GRANTEE = SYS_CONTEXT('USERENV','SESSION_USER'))
                AND (GRANTED_ROLE LIKE 'ADMIN13_%');
        DBMS_SESSION.SET_CONTEXT('CLI_CTX','ROLE',le_role);
        IF le_role = 'ADMIN13_ROLE_CLIENT'
        THEN SELECT client_id INTO le_client_id
                FROM COPIECLIENTS
                WHERE client_id = SYS_CONTEXT('USERENV','SESSION_USER');
        ELSE le_client_id := NULL;
        END IF;
        DBMS_SESSION.SET_CONTEXT('CLI_CTX','CUSTOMER_ID',le_client_id);
    END set_client;
END set_client_ctx_pkg;
/

GRANT EXECUTE ON set_client_ctx_pkg to USER1, USER2, USER3, USER4, USER5, USER6, USER7;

