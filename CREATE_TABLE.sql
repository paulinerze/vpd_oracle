CREATE TABLE CLIENTS
( client_id VARCHAR2(10) NOT NULL,
  client_nom VARCHAR2(50) NOT NULL,
  client_prenom VARCHAR2(50) NOT NULL,
  adresse VARCHAR2(50) NOT NULL,
  code_postal NUMBER(5) NOT NULL,
  ville VARCHAR2(50) NOT NULL,
  pays VARCHAR2(50) NOT NULL,
  coord_bancaires VARCHAR2(50) NOT NULL,
  CONSTRAINT pk_client PRIMARY KEY (client_id)
);

INSERT INTO CLIENTS (client_id,client_nom,client_prenom,adresse,code_postal,ville,pays,coord_bancaires) VALUES ('USER1','COUTURIER','Stéphane','1, rue des six frères Ruellan',13300,'SALON-DE-PROVENCE','FRANCE','30001007941234567890185');
INSERT INTO CLIENTS (client_id,client_nom,client_prenom,adresse,code_postal,ville,pays,coord_bancaires) VALUES ('USER2','LEVASSEUR','Xavier','69, rue de l Epeule',97440,'SAINT-ANDRÉ','FRANCE','30004000031234567890143');
INSERT INTO CLIENTS (client_id,client_nom,client_prenom,adresse,code_postal,ville,pays,coord_bancaires) VALUES ('USER3','ROYER','Arlette','49, rue Grande Fusterie',91220,'BRÉTIGNY-SUR-ORGE','FRANCE','30006000011234567890189');

CREATE TABLE COPIECLIENTS AS SELECT * FROM CLIENTS; 


CREATE TABLE CHAMBRE
( chambre_id NUMBER(10) NOT NULL,
  numero_chambre NUMBER(3) NOT NULL,
  prix NUMBER(4) NOT NULL,
  disponible NUMBER(1) NOT NULL, -- 0 non, 1 oui
  capacite NUMBER(1) NOT NULL,
  CONSTRAINT pk_chambre PRIMARY KEY (chambre_id)
);

INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000001,101,80,1,2);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000002,102,90,1,3);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000003,103,50,0,2);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000004,201,80,1,2);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000005,202,100,1,4);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000006,203,120,0,4);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000007,301,85,1,2);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000008,302,95,1,2);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000009,303,200,1,3);
INSERT INTO CHAMBRE (chambre_id,numero_chambre,prix,disponible,capacite) VALUES (0000000010,304,150,0,2);
 

CREATE TABLE RESERVATION
( reservation_id NUMBER(10) NOT NULL,
  client_id VARCHAR2(10) NOT NULL,
  chambre_id NUMBER(10) NOT NULL,
  DATE_reservation DATE NOT NULL,
  DATE_debut DATE NOT NULL,
  DATE_fin DATE NOT NULL,
  prix_reservation NUMBER(10) NOT NULL,
  facture_id VARCHAR2(10),
  CONSTRAINT pk_reservation PRIMARY KEY (reservation_id)
  --CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES CLIENTS (client_id),
  --CONSTRAINT fk_copieclient FOREIGN KEY (client_id) REFERENCES COPIECLIENTS (client_id),
  --CONSTRAINT fk_chambre FOREIGN KEY (chambre_id) REFERENCES CHAMBRE (chambre_id)
);	

INSERT INTO RESERVATION (reservation_id,client_id,chambre_id,DATE_reservation,DATE_debut,DATE_fin,prix_reservation,facture_id) 
VALUES (0000000001,'USER2',0000000003,TO_DATE('2019 09 18 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 09 19 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 10 20 21:02:44', 'yyyy mm dd hh24:mi:ss'),1500,NULL);
INSERT INTO RESERVATION (reservation_id,client_id,chambre_id,DATE_reservation,DATE_debut,DATE_fin,prix_reservation,facture_id) 
VALUES (0000000002,'USER1',0000000006,TO_DATE('2019 09 18 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 09 19 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 10 15 21:02:44', 'yyyy mm dd hh24:mi:ss'),3600,NULL);
INSERT INTO RESERVATION (reservation_id,client_id,chambre_id,DATE_reservation,DATE_debut,DATE_fin,prix_reservation,facture_id) 
VALUES (0000000003,'USER1',0000000010,TO_DATE('2019 09 18 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 09 19 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 10 10 21:02:44', 'yyyy mm dd hh24:mi:ss'),3000,NULL);
INSERT INTO RESERVATION (reservation_id,client_id,chambre_id,DATE_reservation,DATE_debut,DATE_fin,prix_reservation,facture_id) 
VALUES (0000000004,'USER3',0000000005,TO_DATE('2019 07 18 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 07 02 21:02:44', 'yyyy mm dd hh24:mi:ss'),TO_DATE('2019 07 09 21:02:44', 'yyyy mm dd hh24:mi:ss'),200,'FA00000001');
 

COMMIT;
 
