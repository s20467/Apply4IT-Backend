CREATE TABLE APPLICATION (
    ID INT NOT NULL AUTO_INCREMENT,
    OFFER_ID INT NOT NULL,
    USER_ID INT NOT NULL,
    APPLICATION_DATE DATE NOT NULL,
    CV BLOB NOT NULL,
    CONSTRAINT APPLICATION_PK PRIMARY KEY (ID)
);

CREATE TABLE AUTHORITY (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    CONSTRAINT AUTHORITY_PK PRIMARY KEY (ID)
);

CREATE TABLE CATEGORY (
    ID INT NOT NULL AUTO_INCREMENT,
    TITLE VARCHAR(255) NOT NULL,
    CONSTRAINT CATEGORY_PK PRIMARY KEY (ID)
);

CREATE TABLE COMPANY (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NULL,
    LOGO_PHOTO BLOB NULL,
    CONSTRAINT COMPANY_PK PRIMARY KEY (ID)
);

CREATE TABLE EDUCATION (
    ID INT NOT NULL AUTO_INCREMENT,
    START_DATE DATE NOT NULL,
    END_DATE DATE NULL,
    UNIVERSITY_NAME VARCHAR(255) NOT NULL,
    MAJOR VARCHAR(255) NOT NULL,
    SPECIALIZATION VARCHAR(255) NULL,
    USER_ID INT NOT NULL,
    CONSTRAINT EDUCATION_PK PRIMARY KEY (ID)
);

CREATE TABLE EXPECTATION (
    ID INT NOT NULL AUTO_INCREMENT,
    DESCRIPTION TEXT NULL,
    REQUIRED BOOL NOT NULL,
    OFFER_ID INT NOT NULL,
    CONSTRAINT EXPECTATION_PK PRIMARY KEY (ID)
);

CREATE TABLE EXPERIENCE (
    ID INT NOT NULL AUTO_INCREMENT,
    START_DATE INT NOT NULL,
    END_DATE INT NULL,
    JOB VARCHAR(255) NOT NULL,
    COMPANY_NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NULL,
    USER_ID INT NOT NULL,
    STILL_WORKING BOOL NOT NULL,
    CONSTRAINT EXPERIENCE_PK PRIMARY KEY (ID)
);

CREATE TABLE OFFER (
    ID INT NOT NULL AUTO_INCREMENT,
    TITLE VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NULL,
    REMOTE_POSSIBILITY BOOL NOT NULL,
    COMPANY_ID INT NOT NULL,
    CREATION_DATE DATE NOT NULL,
    CLOSING_DATE DATE NOT NULL,
    USER_ID INT NOT NULL,
    COUNTRY VARCHAR(255) NOT NULL,
    CITY VARCHAR(255) NOT NULL,
    ZIP VARCHAR(10) NOT NULL,
    STREET VARCHAR(255) NOT NULL,
    CONSTRAINT OFFER_PK PRIMARY KEY (ID)
);

CREATE TABLE OFFER_ADVANTAGE (
    ID INT NOT NULL AUTO_INCREMENT,
    DESCRIPTION TEXT NULL,
    OFFER_ID INT NOT NULL,
    CONSTRAINT OFFER_ADVANTAGE_PK PRIMARY KEY (ID)
);

CREATE TABLE OFFER_CATEGORY (
    OFFER_ID INT NOT NULL,
    JOB_CATEGORY_ID INT NOT NULL,
    CONSTRAINT OFFER_CATEGORY_PK PRIMARY KEY (OFFER_ID,JOB_CATEGORY_ID)
);

CREATE TABLE RECRUITER (
    USER_ID INT NOT NULL,
    COMPANY_ID INT NOT NULL,
    CONSTRAINT RECRUITER_PK PRIMARY KEY (USER_ID,COMPANY_ID)
);

CREATE TABLE SAVED_OFFER (
    USER_ID INT NOT NULL,
    OFFER_ID INT NOT NULL,
    CONSTRAINT SAVED_OFFER_PK PRIMARY KEY (USER_ID,OFFER_ID)
);

CREATE TABLE USER (
    ID INT NOT NULL AUTO_INCREMENT,
    PASSWORD VARCHAR(255) NOT NULL,
    FIRST_NAME VARCHAR(255) NOT NULL,
    LAST_NAME VARCHAR(255) NOT NULL,
    BIRTHDATE DATE NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    PHOTO BLOB NULL,
    DESCRIPTION TEXT NULL,
    COUNTRY VARCHAR(255) NOT NULL,
    CITY VARCHAR(255) NOT NULL,
    ZIP VARCHAR(10) NOT NULL,
    STREET VARCHAR(255) NOT NULL,
    ACCOUNT_NON_EXPIRED BOOL NOT NULL,
    ACCOUNT_NON_LOCKED BOOL NOT NULL,
    CREDENTIALS_NON_EXPIRED BOOL NOT NULL,
    ENABLED BOOL NOT NULL,
    CONSTRAINT USER_PK PRIMARY KEY (ID)
);

CREATE TABLE USER_AUTHORITY (
    AUTHORITY_ID INT NOT NULL,
    USER_ID INT NOT NULL,
    CONSTRAINT USER_AUTHORITY_PK PRIMARY KEY (AUTHORITY_ID,USER_ID)
);


ALTER TABLE APPLICATION ADD CONSTRAINT APPLICATION_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES OFFER (ID);

ALTER TABLE APPLICATION ADD CONSTRAINT APPLICATION_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);

ALTER TABLE EDUCATION ADD CONSTRAINT EDUCATION_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);

ALTER TABLE EXPECTATION ADD CONSTRAINT EXPECTATION_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES OFFER (ID);

ALTER TABLE EXPERIENCE ADD CONSTRAINT EXPERIENCE_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);

ALTER TABLE OFFER_ADVANTAGE ADD CONSTRAINT OFFER_ADVANTAGE_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES OFFER (ID);

ALTER TABLE OFFER ADD CONSTRAINT OFFER_COMPANY FOREIGN KEY (COMPANY_ID)
    REFERENCES COMPANY (ID);

ALTER TABLE OFFER ADD CONSTRAINT OFFER_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);

ALTER TABLE RECRUITER ADD CONSTRAINT RECRUITER_COMPANY FOREIGN KEY (COMPANY_ID)
    REFERENCES COMPANY (ID);

ALTER TABLE RECRUITER ADD CONSTRAINT RECRUITER_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);

ALTER TABLE SAVED_OFFER ADD CONSTRAINT SAVED_OFFER_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES OFFER (ID);

ALTER TABLE SAVED_OFFER ADD CONSTRAINT SAVED_OFFER_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);

ALTER TABLE OFFER_CATEGORY ADD CONSTRAINT TABLE_18_JOB_CATEGORY FOREIGN KEY (JOB_CATEGORY_ID)
    REFERENCES CATEGORY (ID);

ALTER TABLE OFFER_CATEGORY ADD CONSTRAINT TABLE_18_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES OFFER (ID);

ALTER TABLE USER_AUTHORITY ADD CONSTRAINT USER_AUTHORITY_AUTHORITY FOREIGN KEY (AUTHORITY_ID)
    REFERENCES AUTHORITY (ID);

ALTER TABLE USER_AUTHORITY ADD CONSTRAINT USER_AUTHORITY_USER FOREIGN KEY (USER_ID)
    REFERENCES USER (ID);