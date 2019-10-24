prompt ____________________________________________________________________;
prompt Affichage des rôles créés (appuyer sur une touche pour continuer);
accept temp default '100';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE LIKE 'ADMIN13_%';

CONNECT USER1/user@cienetdb;
EXECUTE admin13.set_client_ctx_pkg.set_client;

prompt ____________________________________________________________________;
prompt Affichage du contexte pour le USER1 rôle client (appuyer sur une touche pour continuer);
accept temp default '100';

SELECT SYS_CONTEXT('CLI_CTX','CUSTOMER_ID') FROM DUAL;
SELECT SYS_CONTEXT('CLI_CTX','ROLE') FROM DUAL;

prompt ____________________________________________________________________;
prompt Selection sur client par USER1 rôle client (appuyer sur une touche pour continuer);
accept temp default '100';

SELECT * FROM ADMIN13.CLIENTS;

prompt ____________________________________________________________________;
prompt Update sur client par USER1 rôle client (appuyer sur une touche pour continuer);
accept temp default '100';
UPDATE ADMIN13.CLIENTS SET ADRESSE = '2 chemin de la houssiniere';
SELECT * FROM ADMIN13.CLIENTS;

prompt ____________________________________________________________________;
prompt Selection sur reservation par USER1 rôle client (appuyer sur une touche pour continuer);
accept temp default '100';

SELECT * FROM ADMIN13.RESERVATION;

prompt ____________________________________________________________________;
prompt Selection sur la vue des chambres libres par USER1 rôle client(appuyer sur une touche pour continuer);
accept temp default '100';

SELECT * FROM ADMIN13.VCHAMBRES_LIBRES;

prompt ____________________________________________________________________;
prompt Selection sur la vue des réservations avec facture par USER6 rôle directeur financier (appuyer sur une touche pour continuer);
accept temp default '100';

CONNECT USER6/user@cienetdb;
SELECT * FROM ADMIN13.VRESERVATIONS_AVEC_FACT;