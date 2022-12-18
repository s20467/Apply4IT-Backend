ALTER TABLE APPLICATION MODIFY COLUMN OFFER_ID INT;
ALTER TABLE APPLICATION MODIFY COLUMN CANDIDATE_ID INT;
ALTER TABLE EDUCATION MODIFY COLUMN USER_ID INT;
ALTER TABLE EXPECTATION MODIFY COLUMN OFFER_ID INT;
ALTER TABLE EXPERIENCE MODIFY COLUMN USER_ID INT;
ALTER TABLE OFFER MODIFY COLUMN COMPANY_ID INT;
ALTER TABLE OFFER MODIFY COLUMN USER_ID INT;
ALTER TABLE OFFER MODIFY COLUMN LOCALIZATION_ID INT;
ALTER TABLE OFFER_ADVANTAGE MODIFY COLUMN OFFER_ID INT;


insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (1, true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
            'DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1',
            'email1@email.com', true, 'imie1', 'nazwisko1', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values ('descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1',
        true, 'contactemail@email.com', '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',
        'cOmPaNy1 cOmPaNy1 cOmPaNy1', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values ('descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2',
        true, 'contactemail@email.com', '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',
        'cOmPaNy2', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3',
        true, 'contactemail@email.com', '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',
        'cOmPaNy3 cOmPaNy3', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3',
        true, 'contactemail@email.com', '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',
        'cOmPaNy3 cOmPaNy3', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3',
        true, 'contactemail@email.com', null, 'cOmPaNy3 cOmPaNy3', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3',
        true, 'contactemail@email.com', null, 'cOmPaNy3 cOmPaNy3', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3',
        true, 'contactemail@email.com', null, 'cOmPaNy3 cOmPaNy3', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into company (description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3',
        false, 'contactemail@email.com', null, 'Locked Company', 1, 'Kraj', 'Miasto', 'Zip', 'Ulica');
insert into authority (name) values ('ROLE_ADMIN');
insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (2, true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
            'DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2',
            'email2@email.com', true, 'imie2', 'nazwisko2', '$2a$10$iAQ2bLCT/bNO4CS8VUSh8emMTwa0QMX1D32srzHhK9okrsR4pohwS', null);
insert into application (application_date, cv, offer_id, candidate_id) values ('2022-11-05', null, null, 2);
insert into application (application_date, cv, offer_id, candidate_id) values ('2022-11-05', null, null, 2);
insert into authority (name) values ('ROLE_USER');
insert into education (end_date, major, specialization, start_date, still_studying, university_name, user_id)
    values (null, 'KieruNEk1 KieruNEk1 KieruNEk1 KieruNEk1', 'Specjalizacja1 specjalizacja1 specjalizacja1', '2022-11-04', true, 'UniversitY1 UniversitY1 UniversitY1 UniversitY1', 2);
insert into education (end_date, major, specialization, start_date, still_studying, university_name, user_id)
    values ('2022-11-05', 'KieruNEk2 KieruNEk2 KieruNEk2 KieruNEk2', 'Specjalizacja2 specjalizacja2 specjalizacja2', '2022-11-05', false, 'UniversitY2 UniversitY2 UniversitY2 UniversitY2', 2);
insert into experience (company_name, description, end_date, job, start_date, still_working, user_id)
    values ('Firma',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.',
            '2022-11-05', 'Nazwa stanowiska', '2022-11-05', false, 2);
insert into experience (company_name, description, end_date, job, start_date, still_working, user_id)
    values ('Company2 compANy2 companY2',
            'DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2',
            '2022-11-05', 'job2 JoB2 JOB2 JOB2 job2 job2', '2022-11-05', false, 2);
insert into user (account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
            'DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3',
            'email3@email.com', true, 'imie3', 'nazwisko3', '$2a$10$SDDh8BnWIBkryGP1ps/7jOyW17/uSLAecmS/81PUsUHHfM0IE8Fda', null);
insert into application (application_date, cv, offer_id, candidate_id) values ('2022-11-05', null, null, 3);
insert into education (end_date, major, specialization, start_date, still_studying, university_name, user_id)
    values ('2022-11-05', 'KieruNEk3 KieruNEk3 KieruNEk3 KieruNEk3', 'Specjalizacja3 specjalizacja3 specjalizacja3', '2022-11-04', false, 'UniversitY3 UniversitY3 UniversitY3 UniversitY3', 3);
insert into experience (company_name, description, end_date, job, start_date, still_working, user_id)
    values ('Company3 compANy3 companY3',
            'DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3',
            null, 'job3 JoB3 JOB3 JOB3 job3 job3', '2022-11-05', true, 3);
insert into localization (name) values ('Kraków');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
    values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 3, '2022-12-06', 3, '2022-11-06', 'DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3',
            false, 1, 12000, 8000, true, 'tItLe3');
insert into category (title) values ('Data Science');
insert into category (title) values ('Administracja bazami danych');
insert into expectation (description, offer_id, required, order_number)
    values ('dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3',
        1, false, 0);
insert into user (account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
        'DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4',
        'email4@email.com', true, 'imie4', 'nazwisko4', '$2a$10$lill8ex1EzwXePPngmO3Xe95ZAEdOP4.9.KL/XLyz1AD2IOxdubCS', null);
insert into user (account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
values (true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
        'DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5DescripTION5 DescripTION5 DescripTION5 DescripTION5 DescripTION5',
        'email5@email.com', true, 'imie5', 'nazwisko5', '$2a$10$lill8ex1EzwXePPngmO3Xe95ZAEdOP4.9.KL/XLyz1AD2IOxdubCS', null);
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
    values ('Miasto miasto miasto miasto', 'Kraj kraj kraj kraj', 'Ulica ulica ulica ulica','ZIPZIPZIP' , 2, '2022-12-07', 2, '2022-11-07',
            'DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2',
            true, 1, 24000, 12000, false, 'Junior java developer Junior java developer');
insert into expectation (description, offer_id, required, order_number) values ('dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2dESCripTIOn2 dESCripTIOn2', 2, true, 1);
insert into offer_advantage (description, order_number, offer_id) values ('dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3', 0, 2);
insert into localization (name) values ('Warszawa');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
    values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-06',
            'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
            true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-07',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-08',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior java developerr');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-09',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-10',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2023-12-05', 1, '2022-11-05',
        'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
        true, 2, 10000, 6000, true, 'Junior data science engineer');

insert into category (title) values ('Java');
insert into expectation (description, offer_id, required, order_number) values ('dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1', 3, false, 2);
insert into offer_advantage (description, order_number, offer_id) values ('dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1', 1, 3);
insert into offer_advantage (description, order_number, offer_id) values ('dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2dEsCrIpTION2', 2, 3);
update application set application_date='2022-11-05', cv=null, offer_id=3, candidate_id=2 where id=1;
update application set application_date='2022-11-05', cv=null, offer_id=3, candidate_id=2 where id=2;
update application set application_date='2022-11-05', cv=null, offer_id=3, candidate_id=3 where id=3;
insert into user_authority (authority_id, user_id) values (1, 1);
insert into recruiter (user_id, company_id) values (2, 1);
insert into saved_offer (user_id, offer_id) values (2, 3);
insert into saved_offer (user_id, offer_id) values (2, 2);
insert into user_authority (authority_id, user_id) values (2, 2);
insert into user_authority (authority_id, user_id) values (2, 3);
insert into user_authority (authority_id, user_id) values (2, 4);
insert into user_authority (authority_id, user_id) values (2, 5);
insert into recruiter (user_id, company_id) values (3, 2);
insert into saved_offer (user_id, offer_id) values (3, 1);
insert into offer_category (offer_id, job_category_id) values (1, 1);
insert into offer_category (offer_id, job_category_id) values (1, 2);
insert into saved_offer (user_id, offer_id) values (4, 3);
insert into saved_offer (user_id, offer_id) values (4, 2);
insert into saved_offer (user_id, offer_id) values (4, 1);
insert into offer_category (offer_id, job_category_id) values (2, 1);
insert into offer_category (offer_id, job_category_id) values (3, 3);



ALTER TABLE APPLICATION MODIFY COLUMN OFFER_ID INT NOT NULL;
ALTER TABLE APPLICATION MODIFY COLUMN CANDIDATE_ID INT NOT NULL;
ALTER TABLE EDUCATION MODIFY COLUMN USER_ID INT NOT NULL;
ALTER TABLE EXPECTATION MODIFY COLUMN OFFER_ID INT NOT NULL;
ALTER TABLE EXPERIENCE MODIFY COLUMN USER_ID INT NOT NULL;
ALTER TABLE OFFER MODIFY COLUMN COMPANY_ID INT NOT NULL;
ALTER TABLE OFFER MODIFY COLUMN USER_ID INT NOT NULL;
ALTER TABLE OFFER MODIFY COLUMN LOCALIZATION_ID INT NOT NULL;
ALTER TABLE OFFER_ADVANTAGE MODIFY COLUMN OFFER_ID INT NOT NULL; 