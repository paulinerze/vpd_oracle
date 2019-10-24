CREATE OR REPLACE FUNCTION admin13_auth_cli(schema_var IN VARCHAR2,table_var IN VARCHAR2)
RETURN VARCHAR2
IS
    le_role VARCHAR(50);
    return_val VARCHAR2(400);
BEGIN
    le_role := SYS_CONTEXT('CLI_CTX','ROLE');
    IF le_role = 'ADMIN13_ROLE_CLIENT'
    THEN return_val := 'CLIENT_ID=SYS_CONTEXT(''CLI_CTX'',''CUSTOMER_ID'')';
    END IF;
    RETURN return_val;
END;
/

BEGIN
    DBMS_RLS.ADD_POLICY (
        object_schema => 'ADMIN13',
        object_name => 'CLIENTS',
        policy_name => 'admin13_cli_policy',
        function_schema => 'ADMIN13',
        policy_function => 'admin13_auth_cli',
        statement_types => 'select, update'
    );
    DBMS_RLS.ENABLE_POLICY('ADMIN13', 'CLIENTS', 'admin13_cli_policy', TRUE);
END;
/

BEGIN
    DBMS_RLS.ADD_POLICY (
        object_schema => 'ADMIN13',
        object_name => 'RESERVATION',
        policy_name => 'admin13_res_policy',
        function_schema => 'ADMIN13',
        policy_function => 'admin13_auth_cli',
        statement_types => 'select'
    );
    DBMS_RLS.ENABLE_POLICY('ADMIN13', 'RESERVATION', 'admin13_res_policy', TRUE);
END;
/


COMMIT;
