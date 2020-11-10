-- Création des tables --
-- Création de la table Employé
-- Salaire_Annuel représente le salaire annuel de l'employé en question.
CREATE TABLE Employe(
	Employe_ID int NOT NULL,
	Employe_nom varchar(50) NOT NULL,
	Employe_Role varchar(50),
	Salaire_Annuel int,
	Date_de_Naissance date,
	CONSTRAINT Employe_pk PRIMARY KEY (Employe_ID)
);

-- Création de la table Hôpital
-- Directeur_ID représente l'identifiant de l'employé qui est directeur 
-- dans l'hôpital correspondant.
CREATE TABLE Hopital(
	Hopital_ID int NOT NULL,
	Hopital_nom varchar(50)  NOT NULL,
	Directeur_ID int,
	Hopital_adresse varchar(255),
	Ville varchar(255),
	CONSTRAINT Hopital_pk PRIMARY KEY (Hopital_ID),
    CONSTRAINT fk_Employe
	FOREIGN KEY (Directeur_ID)
	REFERENCES Employe(Employe_ID)
);

-- Création de la table intermédiaire entre Hôpital et Employé
CREATE TABLE HopitalEmploye(
    Employe_ID int NOT NULL,
    Hopital_ID int NOT NULL,
    CONSTRAINT fk_Hopital
	    FOREIGN KEY (Hopital_ID)
	    REFERENCES Hopital(Hopital_ID)
        ON DELETE CASCADE,
    CONSTRAINT fk_Employe
	    FOREIGN KEY (Employe_ID)
	    REFERENCES Employe(Employe_ID)
        ON DELETE CASCADE
);

-- Création de la table Département
CREATE TABLE Departement(
	Departement_ID int NOT NULL,
	Hopital_ID int NOT NULL,
	Departement_nom varchar(50) NOT NULL,
	Departement_head_ID int,
	CONSTRAINT Departement_Hopital_pk PRIMARY KEY (Departement_ID, Hopital_ID),
	CONSTRAINT fk_Hopital
	    FOREIGN KEY (Hopital_ID)
	    REFERENCES Hopital(Hopital_ID),
	CONSTRAINT fk_Departement_head_ID
	    FOREIGN KEY (Departement_Head_ID)
	    REFERENCES Employe(Employe_ID)
);

-- Création de la table intermédiaire entre Département et Employé
CREATE TABLE EmployeDepartement(
    Employe_ID int NOT NULL,
    Departement_ID int NOT NULL,
	Hopital_ID int NOT NULL,
	CONSTRAINT pk_EmployeDepartement PRIMARY KEY (Employe_ID, Departement_ID, Hopital_ID),
	CONSTRAINT fk_departement 
	    FOREIGN KEY (Departement_ID, Hopital_ID)
	    REFERENCES Departement(Departement_ID, Hopital_ID)
        ON DELETE CASCADE,
    CONSTRAINT fk_Employe
	    FOREIGN KEY (Employe_ID)
	    REFERENCES Employe(Employe_ID)
        ON DELETE CASCADE
);

-- Création de la table Produit
-- Produit_prix représente le prix unitaire par produit
CREATE TABLE Produit(
	Produit_ID int,
	Produit_nom varchar(50),
	Produit_prix float NOT NULL,
    CONSTRAINT Produit_pk PRIMARY KEY (Produit_ID)
);

-- Création de la table Inventaire des produits par hôpital
-- Quantité représente la quantité du produit qui existe dans un hôpital donné
CREATE TABLE Inventaire(
	Produit_ID int,
	Hopital_ID int,
	Quantite float NOT NULL,
    CONSTRAINT Produit_Hopital_pk PRIMARY KEY (Produit_ID, Hopital_ID)
);

-- Populate Tables --

INSERT INTO Employe VALUES (101, 'Al E.Gater','Directeur', 180000, '1958-12-01');
INSERT INTO Employe VALUES (102, 'Jean Couteau','Pharmacien', 120000, '1990-01-17');
INSERT INTO Employe VALUES (103, 'Margaret Cervantes', 'Infirmière', 90000, '1988-02-15');
INSERT INTO Employe VALUES (104, 'Margaret Cervantes', 'Infirmière', 95000, '2000-04-21');
INSERT INTO Employe VALUES (105, 'Olivier Irving','Médecin', 320000, '1978-12-11');
INSERT INTO Employe VALUES (106, 'Adam Clemons','Médecin', 350000, '1977-02-12');
INSERT INTO Employe VALUES (107, 'Patricia Knights','Médecin', 280000, '1990-03-21');
INSERT INTO Employe VALUES (108, 'Margaret Cervantes', 'Infirmière', 90000, '1983-04-21');
INSERT INTO Employe VALUES (109, 'Olivier Irving','Médecin', 320000, '1981-05-17');
INSERT INTO Employe VALUES (110, 'Adam Clemons','Médecin', 350000,'1945-06-16');


INSERT INTO Employe VALUES (201, 'Elie Phant','Directeur', 195000, '1967-07-13');
INSERT INTO Employe VALUES (202, 'Alessia Cope','Pharmacien', 105000, '1957-12-18');
INSERT INTO Employe VALUES (203, 'Elie Phant','Directeur', 195000, '1952-11-18');
INSERT INTO Employe VALUES (204, 'India Bruce', 'Infirmière', 100000,'1939-10-21');
INSERT INTO Employe VALUES (205, 'Iram Sutherland', 'Infirmier', 80000, '1998-09-13');
INSERT INTO Employe VALUES (206, 'Lexi-Mai Baldwin','Médecin', 320000, '1998-08-23');
INSERT INTO Employe VALUES (207, 'Ulysse Doyle','Médecin', 220000,'1999-09-14');
INSERT INTO Employe VALUES (208, 'Polly Austin','Médecin', 260000, '1949-10-21');
INSERT INTO Employe VALUES (209, 'India Bruce', 'Infirmière', 100000, '1928-08-15');
INSERT INTO Employe VALUES (210, 'Iram Sutherland', 'Infirmier', 80000, '1978-07-12');
INSERT INTO Employe VALUES (211, 'Lexi-Mai Baldwin','Médecin', 180000,'1971-06-14');

INSERT INTO Hopital VALUES (1, 'Blue Hopital', 101, '205 Blue Street', 'Blueville');
INSERT INTO Hopital VALUES (2, 'Red Hopital', 201, '205 Red Street', 'redville');

INSERT INTO HopitalEmploye VALUES (101, 1);
INSERT INTO HopitalEmploye VALUES (102, 1);
INSERT INTO HopitalEmploye VALUES (103, 1);
INSERT INTO HopitalEmploye VALUES (104, 1);
INSERT INTO HopitalEmploye VALUES (105, 1);
INSERT INTO HopitalEmploye VALUES (106, 1);
INSERT INTO HopitalEmploye VALUES (107, 1);
INSERT INTO HopitalEmploye VALUES (108, 1);
INSERT INTO HopitalEmploye VALUES (109, 1);
INSERT INTO HopitalEmploye VALUES (110, 1);

INSERT INTO HopitalEmploye VALUES (201, 2);
INSERT INTO HopitalEmploye VALUES (202, 2);
INSERT INTO HopitalEmploye VALUES (203, 2);
INSERT INTO HopitalEmploye VALUES (204, 2);
INSERT INTO HopitalEmploye VALUES (205, 2);
INSERT INTO HopitalEmploye VALUES (206, 2);
INSERT INTO HopitalEmploye VALUES (207, 2);
INSERT INTO HopitalEmploye VALUES (208, 2);
INSERT INTO HopitalEmploye VALUES (209, 2);
INSERT INTO HopitalEmploye VALUES (210, 2);
INSERT INTO HopitalEmploye VALUES (211, 2);

INSERT INTO Departement VALUES (1,1,'Direction',101);
INSERT INTO Departement VALUES (2,1,'Psychiatry',105);
INSERT INTO Departement VALUES (3,1,'Neurology',105);
INSERT INTO Departement VALUES (4,1,'Pediatry',105);

INSERT INTO Departement VALUES (1,2,'Direction', 201);
INSERT INTO Departement VALUES (2,2,'Psychiatry', 205);
INSERT INTO Departement VALUES (3,2,'Neurology', 206);
INSERT INTO Departement VALUES (4,2,'Pediatry', 207);

INSERT INTO EmployeDepartement VALUES (101, 1, 1);
INSERT INTO EmployeDepartement VALUES (102, 2, 1);
INSERT INTO EmployeDepartement VALUES (103, 3, 1);
INSERT INTO EmployeDepartement VALUES (104, 3, 1);
INSERT INTO EmployeDepartement VALUES (105, 2, 1);
INSERT INTO EmployeDepartement VALUES (106, 3, 1);
INSERT INTO EmployeDepartement VALUES (107, 4, 1);
INSERT INTO EmployeDepartement VALUES (108, 3, 1);
INSERT INTO EmployeDepartement VALUES (109, 2, 1);
INSERT INTO EmployeDepartement VALUES (110, 1, 1);

INSERT INTO EmployeDepartement VALUES (201, 1, 1);
INSERT INTO EmployeDepartement VALUES (202, 4, 1);
INSERT INTO EmployeDepartement VALUES (203, 1, 1);
INSERT INTO EmployeDepartement VALUES (204, 2, 1);
INSERT INTO EmployeDepartement VALUES (205, 3, 1);
INSERT INTO EmployeDepartement VALUES (206, 2, 1);
INSERT INTO EmployeDepartement VALUES (207, 3, 1);
INSERT INTO EmployeDepartement VALUES (208, 4, 1);
INSERT INTO EmployeDepartement VALUES (209, 2, 1);
INSERT INTO EmployeDepartement VALUES (210, 3, 1);
INSERT INTO EmployeDepartement VALUES (211, 2, 1);

INSERT INTO Produit VALUES (10001, 'Aspirin', 0.1);
INSERT INTO Produit VALUES (10002, 'Mask', 0.5);
INSERT INTO Produit VALUES (10003, 'Gloves', 0.3);
INSERT INTO Produit VALUES (10004, 'IRM machine', 50000);
INSERT INTO Produit VALUES (10005, 'Plaster', 0.1);
INSERT INTO Produit VALUES (10006, 'Triangular bandages', 0.3);
INSERT INTO Produit VALUES (10007, 'Tweezers', 7);
INSERT INTO Produit VALUES (10008, 'Medical Thermometer', 12);

INSERT INTO Inventaire VALUES (10001,1,10000);
INSERT INTO Inventaire VALUES (10002,1,10000);
INSERT INTO Inventaire VALUES (10003,1,10000);
INSERT INTO Inventaire VALUES (10004,1,2);
INSERT INTO Inventaire VALUES (10005,1,12000);
INSERT INTO Inventaire VALUES (10006,1,6000);
INSERT INTO Inventaire VALUES (10007,1,2000);
INSERT INTO Inventaire VALUES (10008,1,800);

INSERT INTO Inventaire VALUES (10001,2,9000);
INSERT INTO Inventaire VALUES (10002,2,14000);
INSERT INTO Inventaire VALUES (10003,2,8000);
INSERT INTO Inventaire VALUES (10004,2,4);
INSERT INTO Inventaire VALUES (10005,2,8100);
INSERT INTO Inventaire VALUES (10006,2,7500);
INSERT INTO Inventaire VALUES (10007,2,1800);
INSERT INTO Inventaire VALUES (10008,2,600);
