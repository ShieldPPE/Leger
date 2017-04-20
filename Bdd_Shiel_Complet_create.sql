-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-14 10:05:03.493

-- tables
-- Table: Bon_de_commande
CREATE TABLE Bon_de_commande (
    commande_id int NOT NULL AUTO_INCREMENT,
    commandefacture_id int NOT NULL,
    commandedate_livraison varchar(255) NOT NULL,
    commandebondecommande_id int NOT NULL,
    CONSTRAINT Bon_de_commande_pk PRIMARY KEY (commande_id)
);

-- Table: Bon_de_livraison
CREATE TABLE Bon_de_livraison (
    id_livraison int NOT NULL AUTO_INCREMENT,
    date_livraison date NOT NULL,
    adresse_livraison varchar(255) NOT NULL,
    cp_livraison int NOT NULL,
    ville_livraison varchar(255) NOT NULL,
    CONSTRAINT Bon_de_livraison_pk PRIMARY KEY (id_livraison)
);

-- Table: Bon_de_sortie
CREATE TABLE Bon_de_sortie (
    id_bondesortie int NOT NULL AUTO_INCREMENT,
    date_produit date NOT NULL,
    CONSTRAINT Bon_de_sortie_pk PRIMARY KEY (id_bondesortie)
);

-- Table: Bon_details
CREATE TABLE Bon_details (
    bondetails_id int NOT NULL AUTO_INCREMENT,
    bondetailslignedevis_id int NOT NULL,
    CONSTRAINT Bon_details_pk PRIMARY KEY (bondetails_id)
);

-- Table: Categorie
CREATE TABLE Categorie (
    cat_id int(11) NOT NULL,
    cat_nom varchar(255) NOT NULL,
    CONSTRAINT Categorie_pk PRIMARY KEY (cat_id)
);

-- Table: Client
CREATE TABLE Client (
    client_id int NOT NULL AUTO_INCREMENT,
    client_nom int NOT NULL,
    client_prenom int NOT NULL,
    client_immat int NOT NULL,
    client_voiture int NOT NULL,
    client_avatar int NOT NULL,
    client_kilometrage int NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY (client_id)
);

-- Table: Commandes
CREATE TABLE Commandes (
    id_commandes int NOT NULL AUTO_INCREMENT,
    id_client int NOT NULL,
    date_commandes int NOT NULL,
    adresse_commandes int NOT NULL,
    commandepiece_id int NOT NULL,
    CONSTRAINT Commandes_pk PRIMARY KEY (id_commandes)
);

-- Table: Concession
CREATE TABLE Concession (
    conc_id int(11) NOT NULL AUTO_INCREMENT,
    conc_nom varchar(100) NOT NULL,
    conc_adresse varchar(255) NOT NULL,
    conc_cp int(5) NOT NULL,
    conc_tel int(10) NOT NULL,
    conc_email varchar(100) NOT NULL,
    CONSTRAINT Concession_pk PRIMARY KEY (conc_id)
);

-- Table: ConcessionVoiture
CREATE TABLE ConcessionVoiture (
    concvoit_voit_id int(11) NOT NULL,
    concvoit_conc_id int(11) NOT NULL,
    CONSTRAINT ConcessionVoiture_pk PRIMARY KEY (concvoit_voit_id,concvoit_conc_id)
);

-- Table: Devis
CREATE TABLE Devis (
    devis_id int NOT NULL AUTO_INCREMENT,
    devisclient_id int NOT NULL,
    devisdate_envoie varchar(255) NOT NULL,
    devisdate_validation date NOT NULL,
    devis_montant int NOT NULL,
    CONSTRAINT Devis_pk PRIMARY KEY (devis_id)
);

-- Table: Employe
CREATE TABLE Employe (
    emp_id int NOT NULL AUTO_INCREMENT,
    emp_numero int NOT NULL,
    emp_nom varchar(255) NOT NULL,
    emp_prenom varchar(255) NOT NULL,
    emp_qualification varchar(255) NOT NULL,
    emp_concesID int NOT NULL,
    emp_garageID int NOT NULL,
    CONSTRAINT Employe_pk PRIMARY KEY (emp_id)
);

-- Table: EmployeConcession
CREATE TABLE EmployeConcession (
    employeconcession_emp_id int NOT NULL,
    employeconcession_conc_id int NOT NULL,
    CONSTRAINT EmployeConcession_pk PRIMARY KEY (employeconcession_emp_id,employeconcession_conc_id)
);

-- Table: EmployeGarage
CREATE TABLE EmployeGarage (
    employegarage_emp_id int NOT NULL,
    employegarage_gar_id int NOT NULL,
    CONSTRAINT EmployeGarage_pk PRIMARY KEY (employegarage_gar_id)
);

-- Table: Facture
CREATE TABLE Facture (
    facture_id int NOT NULL,
    facture_adresse int NOT NULL,
    facturebondecommande_id int NOT NULL,
    facture_produit int(11) NOT NULL,
    CONSTRAINT Facture_pk PRIMARY KEY (facture_id)
);

-- Table: Garage
CREATE TABLE Garage (
    gar_id int NOT NULL AUTO_INCREMENT,
    gar_adresse varchar(255) NOT NULL,
    gar_cp varchar(5) NOT NULL,
    gar_ville int NOT NULL,
    CONSTRAINT Garage_pk PRIMARY KEY (gar_id)
);

-- Table: Ligne_commande
CREATE TABLE Ligne_commande (
    id_commandes int NOT NULL AUTO_INCREMENT,
    id_pieces int NOT NULL,
    date_commandes date NOT NULL,
    lignecommandepiece_id int NOT NULL,
    CONSTRAINT Ligne_commande_pk PRIMARY KEY (id_commandes)
);

-- Table: Ligne_devis
CREATE TABLE Ligne_devis (
    lignedevis_id int NOT NULL AUTO_INCREMENT,
    lignedevisdevis_id int NOT NULL,
    ligneproduit_id int NOT NULL,
    ligne_quantite int NOT NULL,
    ligne_prixHT int NOT NULL,
    ligne_TVA int NOT NULL,
    CONSTRAINT Ligne_devis_pk PRIMARY KEY (lignedevis_id)
);

-- Table: Pieces
CREATE TABLE Pieces (
    id_pieces int NOT NULL AUTO_INCREMENT,
    nom_pieces varchar(255) NOT NULL,
    stock_pieces int NOT NULL,
    id_livraison int NOT NULL,
    prixHT_produits int NOT NULL,
    TVA_produits int NOT NULL,
    CONSTRAINT Pieces_pk PRIMARY KEY (id_pieces)
);

-- Table: Prestation_type
CREATE TABLE Prestation_type (
    pre_id int NOT NULL AUTO_INCREMENT,
    pre_type varchar(255) NOT NULL,
    CONSTRAINT Prestation_type_pk PRIMARY KEY (pre_id)
);

-- Table: Produit
CREATE TABLE Produit (
    prod_id int(11) NOT NULL,
    prod_titre varchar(255) NOT NULL,
    prod_description varchar(255) NOT NULL,
    prod_prix int(11) NOT NULL,
    prod_stock int NOT NULL,
    prod_category varchar(255) NOT NULL,
    prod_voi_id int(11) NOT NULL,
    CONSTRAINT Produit_pk PRIMARY KEY (prod_id)
);

-- Table: ProduitLigne_Devis
CREATE TABLE ProduitLigne_Devis (
    ProduitLigne_Devis_prod_id int NOT NULL,
    ProduitLigne_Devis_lignedevis_id int NOT NULL,
    CONSTRAINT ProduitLigne_Devis_pk PRIMARY KEY (ProduitLigne_Devis_prod_id,ProduitLigne_Devis_lignedevis_id)
);

-- Table: Rendez_vous
CREATE TABLE Rendez_vous (
    rdv_id int NOT NULL AUTO_INCREMENT,
    rdv_date varchar(255) NOT NULL,
    rdv_voiture varchar(255) NOT NULL,
    rdv_garage int NOT NULL,
    rdv_prestation varchar(255) NOT NULL,
    rdv_client int NOT NULL,
    rdvprestationtype_id int NOT NULL,
    CONSTRAINT Rendez_vous_pk PRIMARY KEY (rdv_id)
);

-- Table: Retours
CREATE TABLE Retours (
    id_retours int NOT NULL AUTO_INCREMENT,
    id_pieces int NOT NULL,
    CONSTRAINT Retours_pk PRIMARY KEY (id_retours)
);

-- Table: Utilisateur
CREATE TABLE Utilisateur (
    util_id int(11) NOT NULL,
    util_username varchar(255) NOT NULL,
    util_email varchar(255) NOT NULL,
    util_password varchar(255) NOT NULL,
    CONSTRAINT Utilisateur_pk PRIMARY KEY (util_id)
);

-- Table: Voiture
CREATE TABLE Voiture (
    voit_id int(11) NOT NULL AUTO_INCREMENT,
    voit_numserie int(11) NOT NULL,
    voit_type varchar(50) NOT NULL,
    voit_modele varchar(50) NOT NULL,
    voit_annee int(11) NOT NULL,
    voit_carburant varchar(20) NOT NULL,
    voit_nbrplace int(11) NOT NULL,
    voit_couleur varchar(50) NOT NULL,
    CONSTRAINT Voiture_pk PRIMARY KEY (voit_id)
);

-- foreign keys
-- Reference: Bon_de_commande_Bon_details (table: Bon_de_commande)
ALTER TABLE Bon_de_commande ADD CONSTRAINT Bon_de_commande_Bon_details FOREIGN KEY Bon_de_commande_Bon_details (commandebondecommande_id)
    REFERENCES Bon_details (bondetails_id);

-- Reference: Bon_details_Ligne_devis (table: Bon_details)
ALTER TABLE Bon_details ADD CONSTRAINT Bon_details_Ligne_devis FOREIGN KEY Bon_details_Ligne_devis (bondetailslignedevis_id)
    REFERENCES Ligne_devis (lignedevis_id);

-- Reference: Commandes_Client (table: Commandes)
ALTER TABLE Commandes ADD CONSTRAINT Commandes_Client FOREIGN KEY Commandes_Client (id_client)
    REFERENCES Client (client_id);

-- Reference: Commandes_Pieces (table: Commandes)
ALTER TABLE Commandes ADD CONSTRAINT Commandes_Pieces FOREIGN KEY Commandes_Pieces (commandepiece_id)
    REFERENCES Pieces (id_pieces);

-- Reference: ConcessionVoiture_Concession (table: ConcessionVoiture)
ALTER TABLE ConcessionVoiture ADD CONSTRAINT ConcessionVoiture_Concession FOREIGN KEY ConcessionVoiture_Concession (concvoit_conc_id)
    REFERENCES Concession (conc_id);

-- Reference: ConcessionVoiture_Voiture (table: ConcessionVoiture)
ALTER TABLE ConcessionVoiture ADD CONSTRAINT ConcessionVoiture_Voiture FOREIGN KEY ConcessionVoiture_Voiture (concvoit_voit_id)
    REFERENCES Voiture (voit_id);

-- Reference: Devis_Client (table: Devis)
ALTER TABLE Devis ADD CONSTRAINT Devis_Client FOREIGN KEY Devis_Client (devisclient_id)
    REFERENCES Client (client_id);

-- Reference: EmployeConcession_Concession (table: EmployeConcession)
ALTER TABLE EmployeConcession ADD CONSTRAINT EmployeConcession_Concession FOREIGN KEY EmployeConcession_Concession (employeconcession_conc_id)
    REFERENCES Concession (conc_id);

-- Reference: EmployeConcession_Employe (table: EmployeConcession)
ALTER TABLE EmployeConcession ADD CONSTRAINT EmployeConcession_Employe FOREIGN KEY EmployeConcession_Employe (employeconcession_emp_id)
    REFERENCES Employe (emp_id);

-- Reference: EmployeGarage_Employe (table: EmployeGarage)
ALTER TABLE EmployeGarage ADD CONSTRAINT EmployeGarage_Employe FOREIGN KEY EmployeGarage_Employe (employegarage_emp_id)
    REFERENCES Employe (emp_id);

-- Reference: EmployeGarage_Garage (table: EmployeGarage)
ALTER TABLE EmployeGarage ADD CONSTRAINT EmployeGarage_Garage FOREIGN KEY EmployeGarage_Garage (employegarage_gar_id)
    REFERENCES Garage (gar_id);

-- Reference: Facture_Bon_de_commande (table: Facture)
ALTER TABLE Facture ADD CONSTRAINT Facture_Bon_de_commande FOREIGN KEY Facture_Bon_de_commande (facturebondecommande_id)
    REFERENCES Bon_de_commande (commande_id);

-- Reference: Ligne_commande_Commandes (table: Ligne_commande)
ALTER TABLE Ligne_commande ADD CONSTRAINT Ligne_commande_Commandes FOREIGN KEY Ligne_commande_Commandes (id_commandes)
    REFERENCES Commandes (id_commandes);

-- Reference: Ligne_commande_Pieces (table: Ligne_commande)
ALTER TABLE Ligne_commande ADD CONSTRAINT Ligne_commande_Pieces FOREIGN KEY Ligne_commande_Pieces (id_pieces)
    REFERENCES Pieces (id_pieces);

-- Reference: Ligne_devis_Devis (table: Ligne_devis)
ALTER TABLE Ligne_devis ADD CONSTRAINT Ligne_devis_Devis FOREIGN KEY Ligne_devis_Devis (lignedevisdevis_id)
    REFERENCES Devis (devis_id);

-- Reference: Ligne_devis_ProduitLigne_Devis (table: Ligne_devis)
ALTER TABLE Ligne_devis ADD CONSTRAINT Ligne_devis_ProduitLigne_Devis FOREIGN KEY Ligne_devis_ProduitLigne_Devis (lignedevis_id)
    REFERENCES ProduitLigne_Devis (ProduitLigne_Devis_lignedevis_id);

-- Reference: Pieces_Bon_de_livraison (table: Pieces)
ALTER TABLE Pieces ADD CONSTRAINT Pieces_Bon_de_livraison FOREIGN KEY Pieces_Bon_de_livraison (id_livraison)
    REFERENCES Bon_de_livraison (id_livraison);

-- Reference: Pieces_Bon_de_sortie (table: Pieces)
ALTER TABLE Pieces ADD CONSTRAINT Pieces_Bon_de_sortie FOREIGN KEY Pieces_Bon_de_sortie (id_pieces)
    REFERENCES Bon_de_sortie (id_bondesortie);

-- Reference: Pieces_Retours (table: Pieces)
ALTER TABLE Pieces ADD CONSTRAINT Pieces_Retours FOREIGN KEY Pieces_Retours (id_pieces)
    REFERENCES Retours (id_pieces);

-- Reference: Produit_ProduitLigne_Devis (table: Produit)
ALTER TABLE Produit ADD CONSTRAINT Produit_ProduitLigne_Devis FOREIGN KEY Produit_ProduitLigne_Devis (prod_id)
    REFERENCES ProduitLigne_Devis (ProduitLigne_Devis_prod_id);

-- Reference: Produit_Voiture (table: Produit)
ALTER TABLE Produit ADD CONSTRAINT Produit_Voiture FOREIGN KEY Produit_Voiture (prod_voi_id)
    REFERENCES Voiture (voit_id);

-- Reference: Rendez_vous_Client (table: Rendez_vous)
ALTER TABLE Rendez_vous ADD CONSTRAINT Rendez_vous_Client FOREIGN KEY Rendez_vous_Client (rdv_client)
    REFERENCES Client (client_id);

-- Reference: Rendez_vous_Garage (table: Rendez_vous)
ALTER TABLE Rendez_vous ADD CONSTRAINT Rendez_vous_Garage FOREIGN KEY Rendez_vous_Garage (rdv_garage)
    REFERENCES Garage (gar_id);

-- Reference: Rendez_vous_Prestation_type (table: Rendez_vous)
ALTER TABLE Rendez_vous ADD CONSTRAINT Rendez_vous_Prestation_type FOREIGN KEY Rendez_vous_Prestation_type (rdvprestationtype_id)
    REFERENCES Prestation_type (pre_id);

-- End of file.

