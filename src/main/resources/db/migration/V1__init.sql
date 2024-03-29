CREATE TABLE application (
    ID INT NOT NULL AUTO_INCREMENT,
    OFFER_ID INT NOT NULL,
    CANDIDATE_ID INT NOT NULL,
    APPLICATION_DATE DATE NOT NULL,
    CV MEDIUMBLOB,
    CONSTRAINT APPLICATION_PK PRIMARY KEY (ID)
);

CREATE TABLE authority (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    CONSTRAINT AUTHORITY_PK PRIMARY KEY (ID)
);

CREATE TABLE category (
    ID INT NOT NULL AUTO_INCREMENT,
    TITLE VARCHAR(255) NOT NULL,
    CONSTRAINT CATEGORY_PK PRIMARY KEY (ID)
);

CREATE TABLE company (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NULL,
    LOGO_PHOTO MEDIUMTEXT NULL,
    COUNTRY VARCHAR(255) NOT NULL,
    CITY VARCHAR(255) NOT NULL,
    ZIP VARCHAR(15) NOT NULL,
    STREET VARCHAR(255) NOT NULL,
    CONTACT_EMAIL VARCHAR(255) NOT NULL,
    USER_ID INT NOT NULL,
    ENABLED BOOL NOT NULL,
    CONSTRAINT COMPANY_PK PRIMARY KEY (ID)
);

CREATE TABLE education (
    ID INT NOT NULL AUTO_INCREMENT,
    START_DATE DATE NOT NULL,
    END_DATE DATE NULL,
    UNIVERSITY_NAME VARCHAR(255) NOT NULL,
    MAJOR VARCHAR(255) NOT NULL,
    SPECIALIZATION VARCHAR(255) NULL,
    USER_ID INT NOT NULL,
    STILL_STUDYING BOOL NOT NULL,
    CONSTRAINT EDUCATION_PK PRIMARY KEY (ID)
);

CREATE TABLE expectation (
    ID INT NOT NULL AUTO_INCREMENT,
    DESCRIPTION TEXT NULL,
    REQUIRED BOOL NOT NULL,
    ORDER_NUMBER INT NOT NULL,
    OFFER_ID INT NOT NULL,
    CONSTRAINT EXPECTATION_PK PRIMARY KEY (ID)
);

CREATE TABLE experience (
    ID INT NOT NULL AUTO_INCREMENT,
    START_DATE DATE NOT NULL,
    END_DATE DATE NULL,
    JOB VARCHAR(255) NOT NULL,
    COMPANY_NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NULL,
    USER_ID INT NOT NULL,
    STILL_WORKING BOOL NOT NULL,
    CONSTRAINT EXPERIENCE_PK PRIMARY KEY (ID)
);

CREATE TABLE localization (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    CONSTRAINT LOCALIZATION_PK PRIMARY KEY (ID)
);

CREATE TABLE offer (
    ID INT NOT NULL AUTO_INCREMENT,
    TITLE VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT NULL,
    REMOTE_POSSIBILITY BOOL NOT NULL,
    COMPANY_ID INT NOT NULL,
    CREATION_DATE DATE NOT NULL,
    CLOSING_DATE DATE NOT NULL,
    MIN_SALARY_PLN INT NOT NULL,
    MAX_SALARY_PLN INT NOT NULL,
    FIRST_JOB_POSSIBILITY BOOL NOT NULL,
    USER_ID INT NOT NULL,
    LOCALIZATION_ID INT NOT NULL,
    COUNTRY VARCHAR(255) NOT NULL,
    CITY VARCHAR(255) NOT NULL,
    ZIP VARCHAR(15) NOT NULL,
    STREET VARCHAR(255) NOT NULL,
    CONSTRAINT OFFER_PK PRIMARY KEY (ID)
);

CREATE TABLE offer_advantage (
    ID INT NOT NULL AUTO_INCREMENT,
    DESCRIPTION TEXT NULL,
    OFFER_ID INT NOT NULL,
    ORDER_NUMBER INT NOT NULL,
    CONSTRAINT OFFER_ADVANTAGE_PK PRIMARY KEY (ID)
);

CREATE TABLE offer_category (
    OFFER_ID INT NOT NULL,
    JOB_CATEGORY_ID INT NOT NULL,
    CONSTRAINT OFFER_CATEGORY_PK PRIMARY KEY (OFFER_ID,JOB_CATEGORY_ID)
);

CREATE TABLE recruiter (
    USER_ID INT NOT NULL,
    COMPANY_ID INT NOT NULL,
    CONSTRAINT RECRUITER_PK PRIMARY KEY (USER_ID,COMPANY_ID)
);

CREATE TABLE saved_offer (
    USER_ID INT NOT NULL,
    OFFER_ID INT NOT NULL,
    CONSTRAINT SAVED_OFFER_PK PRIMARY KEY (USER_ID,OFFER_ID)
);

CREATE TABLE user (
    ID INT NOT NULL AUTO_INCREMENT,
    PASSWORD VARCHAR(255) NOT NULL,
    FIRST_NAME VARCHAR(255) NOT NULL,
    LAST_NAME VARCHAR(255) NOT NULL,
    BIRTHDATE DATE NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    PHOTO MEDIUMTEXT NULL,
    DESCRIPTION TEXT NULL,
    COUNTRY VARCHAR(255) NOT NULL,
    CITY VARCHAR(255) NOT NULL,
    ZIP VARCHAR(15) NOT NULL,
    STREET VARCHAR(255) NOT NULL,
    ACCOUNT_NON_EXPIRED BOOL NOT NULL,
    ACCOUNT_NON_LOCKED BOOL NOT NULL,
    CREDENTIALS_NON_EXPIRED BOOL NOT NULL,
    ENABLED BOOL NOT NULL,
    CONSTRAINT USER_PK PRIMARY KEY (ID)
);

CREATE TABLE user_authority (
    AUTHORITY_ID INT NOT NULL,
    USER_ID INT NOT NULL,
    CONSTRAINT USER_AUTHORITY_PK PRIMARY KEY (AUTHORITY_ID,USER_ID)
);


ALTER TABLE application ADD CONSTRAINT APPLICATION_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES offer (ID);

ALTER TABLE application ADD CONSTRAINT APPLICATION_USER FOREIGN KEY (CANDIDATE_ID)
    REFERENCES user (ID);

ALTER TABLE company ADD CONSTRAINT COMPANY_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);

ALTER TABLE education ADD CONSTRAINT EDUCATION_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);

ALTER TABLE expectation ADD CONSTRAINT EXPECTATION_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES offer (ID);

ALTER TABLE experience ADD CONSTRAINT EXPERIENCE_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);

ALTER TABLE offer_advantage ADD CONSTRAINT OFFER_ADVANTAGE_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES offer (ID);

ALTER TABLE offer ADD CONSTRAINT OFFER_COMPANY FOREIGN KEY (COMPANY_ID)
    REFERENCES company (ID);

ALTER TABLE offer ADD CONSTRAINT OFFER_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);

ALTER TABLE offer ADD CONSTRAINT OFFER_LOCALIZATION FOREIGN KEY (LOCALIZATION_ID)
    REFERENCES localization (ID);

ALTER TABLE recruiter ADD CONSTRAINT RECRUITER_COMPANY FOREIGN KEY (COMPANY_ID)
    REFERENCES company (ID);

ALTER TABLE recruiter ADD CONSTRAINT RECRUITER_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);

ALTER TABLE saved_offer ADD CONSTRAINT SAVED_OFFER_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES offer (ID);

ALTER TABLE saved_offer ADD CONSTRAINT SAVED_OFFER_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);

ALTER TABLE offer_category ADD CONSTRAINT OFFER_CATEGORY_CATEGORY FOREIGN KEY (JOB_CATEGORY_ID)
    REFERENCES category (ID);

ALTER TABLE offer_category ADD CONSTRAINT OFFER_CATEGORY_OFFER FOREIGN KEY (OFFER_ID)
    REFERENCES offer (ID);

ALTER TABLE user_authority ADD CONSTRAINT USER_AUTHORITY_AUTHORITY FOREIGN KEY (AUTHORITY_ID)
    REFERENCES authority (ID);

ALTER TABLE user_authority ADD CONSTRAINT USER_AUTHORITY_USER FOREIGN KEY (USER_ID)
    REFERENCES user (ID);