CONNECT USER1/user@cienetdb;
EXECUTE admin13.set_client_ctx_pkg.set_client;
SELECT SYS_CONTEXT('CLI_CTX','CUSTOMER_ID') FROM DUAL;
SELECT SYS_CONTEXT('CLI_CTX','ROLE') FROM DUAL;
