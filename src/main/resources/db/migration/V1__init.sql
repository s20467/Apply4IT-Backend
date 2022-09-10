-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-09-09 11:05:04.995

-- tables
-- Table: Address
CREATE TABLE Address (
    id int NOT NULL AUTO_INCREMENT,
    Country varchar(255) NOT NULL,
    City varchar(255) NOT NULL,
    Zip varchar(10) NOT NULL,
    Street varchar(255) NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (id)
);

-- Table: Application
CREATE TABLE Application (
    id int NOT NULL AUTO_INCREMENT,
    Offer_id int NOT NULL,
    User_id int NOT NULL,
    application_date date NOT NULL,
    CV blob NOT NULL,
    CONSTRAINT Application_pk PRIMARY KEY (id)
);

-- Table: Authority
CREATE TABLE Authority (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    CONSTRAINT Authority_pk PRIMARY KEY (id)
);

-- Table: Category
CREATE TABLE Category (
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (id)
);

-- Table: Company
CREATE TABLE Company (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description text NOT NULL,
    Logo_photo blob NULL,
    CONSTRAINT Company_pk PRIMARY KEY (id)
);

-- Table: Education
CREATE TABLE Education (
    id int NOT NULL AUTO_INCREMENT,
    start_date date NOT NULL,
    end_date date NULL,
    university_name varchar(255) NOT NULL,
    major varchar(255) NOT NULL,
    specialisation varchar(255) NULL,
    User_id int NOT NULL,
    CONSTRAINT Education_pk PRIMARY KEY (id)
);

-- Table: Expectation
CREATE TABLE Expectation (
    id int NOT NULL AUTO_INCREMENT,
    description text NOT NULL,
    required bool NOT NULL,
    Offer_id int NOT NULL,
    CONSTRAINT Expectation_pk PRIMARY KEY (id)
);

-- Table: Experience
CREATE TABLE Experience (
    id int NOT NULL AUTO_INCREMENT,
    start_date int NOT NULL,
    end_date int NULL,
    job varchar(255) NOT NULL,
    company_name varchar(255) NOT NULL,
    description text NOT NULL,
    User_id int NOT NULL,
    still_working bool NOT NULL,
    CONSTRAINT Experience_pk PRIMARY KEY (id)
);

-- Table: Offer
CREATE TABLE Offer (
    id int NOT NULL AUTO_INCREMENT,
    description text NOT NULL,
    Address_id int NOT NULL,
    Company_id int NOT NULL,
    creation_date date NOT NULL,
    closing_date date NOT NULL,
    User_id int NOT NULL,
    CONSTRAINT Offer_pk PRIMARY KEY (id)
);

-- Table: Offer_Advantage
CREATE TABLE Offer_Advantage (
    id int NOT NULL AUTO_INCREMENT,
    description text NOT NULL,
    Offer_id int NOT NULL,
    CONSTRAINT Offer_Advantage_pk PRIMARY KEY (id)
);

-- Table: Offer_Category
CREATE TABLE Offer_Category (
    Offer_id int NOT NULL,
    Job_Category_id int NOT NULL,
    CONSTRAINT Offer_Category_pk PRIMARY KEY (Offer_id,Job_Category_id)
);

-- Table: Recruiter
CREATE TABLE Recruiter (
    User_id int NOT NULL,
    Company_id int NOT NULL,
    CONSTRAINT Recruiter_pk PRIMARY KEY (User_id,Company_id)
);

-- Table: Saved_Offer
CREATE TABLE Saved_Offer (
    User_id int NOT NULL,
    Offer_id int NOT NULL,
    CONSTRAINT Saved_Offer_pk PRIMARY KEY (User_id,Offer_id)
);

-- Table: User
CREATE TABLE User (
    id int NOT NULL AUTO_INCREMENT,
    password varchar(20) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    birthdate date NOT NULL,
    email varchar(255) NOT NULL,
    Address_id int NOT NULL,
    Identifier varchar(255) NOT NULL,
    Photo blob NULL,
    Description text NULL,
    CONSTRAINT User_pk PRIMARY KEY (id)
);

-- Table: User_Authority
CREATE TABLE User_Authority (
    Authority_id int NOT NULL,
    User_id int NOT NULL,
    CONSTRAINT User_Authority_pk PRIMARY KEY (Authority_id,User_id)
);

-- foreign keys
-- Reference: Application_Offer (table: Application)
ALTER TABLE Application ADD CONSTRAINT Application_Offer FOREIGN KEY (Offer_id)
    REFERENCES Offer (id);

-- Reference: Application_User (table: Application)
ALTER TABLE Application ADD CONSTRAINT Application_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- Reference: Education_User (table: Education)
ALTER TABLE Education ADD CONSTRAINT Education_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- Reference: Expectation_Offer (table: Expectation)
ALTER TABLE Expectation ADD CONSTRAINT Expectation_Offer FOREIGN KEY (Offer_id)
    REFERENCES Offer (id);

-- Reference: Experience_User (table: Experience)
ALTER TABLE Experience ADD CONSTRAINT Experience_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- Reference: Offer_Address (table: Offer)
ALTER TABLE Offer ADD CONSTRAINT Offer_Address FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: Offer_Advantage_Offer (table: Offer_Advantage)
ALTER TABLE Offer_Advantage ADD CONSTRAINT Offer_Advantage_Offer FOREIGN KEY (Offer_id)
    REFERENCES Offer (id);

-- Reference: Offer_Company (table: Offer)
ALTER TABLE Offer ADD CONSTRAINT Offer_Company FOREIGN KEY (Company_id)
    REFERENCES Company (id);

-- Reference: Offer_User (table: Offer)
ALTER TABLE Offer ADD CONSTRAINT Offer_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- Reference: Recruiter_Company (table: Recruiter)
ALTER TABLE Recruiter ADD CONSTRAINT Recruiter_Company FOREIGN KEY (Company_id)
    REFERENCES Company (id);

-- Reference: Recruiter_User (table: Recruiter)
ALTER TABLE Recruiter ADD CONSTRAINT Recruiter_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- Reference: Saved_Offer_Offer (table: Saved_Offer)
ALTER TABLE Saved_Offer ADD CONSTRAINT Saved_Offer_Offer FOREIGN KEY (Offer_id)
    REFERENCES Offer (id);

-- Reference: Saved_Offer_User (table: Saved_Offer)
ALTER TABLE Saved_Offer ADD CONSTRAINT Saved_Offer_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- Reference: Table_18_Job_Category (table: Offer_Category)
ALTER TABLE Offer_Category ADD CONSTRAINT Table_18_Job_Category FOREIGN KEY (Job_Category_id)
    REFERENCES Category (id);

-- Reference: Table_18_Offer (table: Offer_Category)
ALTER TABLE Offer_Category ADD CONSTRAINT Table_18_Offer FOREIGN KEY (Offer_id)
    REFERENCES Offer (id);

-- Reference: User_Address (table: User)
ALTER TABLE User ADD CONSTRAINT User_Address FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: User_Authority_Authority (table: User_Authority)
ALTER TABLE User_Authority ADD CONSTRAINT User_Authority_Authority FOREIGN KEY (Authority_id)
    REFERENCES Authority (id);

-- Reference: User_Authority_User (table: User_Authority)
ALTER TABLE User_Authority ADD CONSTRAINT User_Authority_User FOREIGN KEY (User_id)
    REFERENCES User (id);

-- End of file.

