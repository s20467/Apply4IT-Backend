insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (1, true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
            'DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1',
            'email1@email.com', true, 'imie1', 'nazwisko1', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);
insert into authority (name) values ('ROLE_ADMIN');
insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (2, true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
            'DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2',
            'email2@email.com', true, 'imie2', 'nazwisko2', '$2a$10$iAQ2bLCT/bNO4CS8VUSh8emMTwa0QMX1D32srzHhK9okrsR4pohwS', null);
insert into application (application_date, cv, offer_id, candidate_id) values ('2022-11-05', null, null, 2);
insert into application (application_date, cv, offer_id, candidate_id) values ('2022-11-05', null, null, 2);
insert into authority (name) values ('ROLE_USER');
insert into education (end_date, major, specialization, start_date, still_studying, university_name, user_id)
    values (null, 'KieruNEk1 KieruNEk1 KieruNEk1 KieruNEk1', 'Specjalizacja1 specjalizacja1 specjalizacja1', '2022-11-05', true, 'UniversitY1 UniversitY1 UniversitY1 UniversitY1', 2);
insert into education (end_date, major, specialization, start_date, still_studying, university_name, user_id)
    values ('2022-11-05', 'KieruNEk2 KieruNEk2 KieruNEk2 KieruNEk2', 'Specjalizacja2 specjalizacja2 specjalizacja2', '2022-11-05', false, 'UniversitY2 UniversitY2 UniversitY2 UniversitY2', 2);
insert into experience (company_name, description, end_date, job, start_date, still_working, user_id)
    values ('Company1 compANy1 companY1',
            'DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1DescripTION1 DescripTION1 DescripTION1 DescripTION1 DescripTION1',
            '2022-11-05', 'job1 JoB1 JOB1 JOB1 job1 job1', '2022-11-05', false, 2);
insert into experience (company_name, description, end_date, job, start_date, still_working, user_id)
    values ('Company2 compANy2 companY2',
            'DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2DescripTION2 DescripTION2 DescripTION2 DescripTION2 DescripTION2',
            '2022-11-05', 'job2 JoB2 JOB2 JOB2 job2 job2', '2022-11-05', false, 2);
insert into company (description, logo_photo, name)
    values ('descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1 descRIPTION1',
            null, 'cOmPaNy1 cOmPaNy1 cOmPaNy1');
insert into company (description, logo_photo, name)
    values ('descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2 descRIPTION2',
            null, 'cOmPaNy2');
insert into user (account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
            'DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3',
            'email3@email.com', true, 'imie3', 'nazwisko3', '$2a$10$SDDh8BnWIBkryGP1ps/7jOyW17/uSLAecmS/81PUsUHHfM0IE8Fda', null);
insert into application (application_date, cv, offer_id, candidate_id) values ('2022-11-05', null, null, 3);
insert into education (end_date, major, specialization, start_date, still_studying, university_name, user_id)
    values ('2022-11-05', 'KieruNEk3 KieruNEk3 KieruNEk3 KieruNEk3', 'Specjalizacja3 specjalizacja3 specjalizacja3', '2022-11-05', false, 'UniversitY3 UniversitY3 UniversitY3 UniversitY3', 3);
insert into experience (company_name, description, end_date, job, start_date, still_working, user_id)
    values ('Company3 compANy3 companY3',
            'DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3DescripTION3 DescripTION3 DescripTION3 DescripTION3 DescripTION3',
            null, 'job3 JoB3 JOB3 JOB3 job3 job3', '2022-11-05', true, 3);
insert into company (description, logo_photo, name) values ('desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3 desCRiption3', null, 'cOmPaNy3 cOmPaNy3');
insert into localization (name) values ('lOcAlIzAtIoN2');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
    values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 3, '2022-12-05', 3, '2022-11-05', 'DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3 DeScRiption3',
            'false', 1, 12000, 8000, true, 'tItLe3');
insert into category (title) values ('cAtEgOry2 cAtEgOry2');
insert into category (title) values ('cAtEgOry3');
insert into expectation (description, offer_id, required)
    values ('dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3 dESCRPtion3',
        1, false);
insert into user (account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (true, true, 'Miasto', 'Kraj', 'Ulica', 'ZIPCODE', '2022-11-05', true,
        'DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4DescripTION4 DescripTION4 DescripTION4 DescripTION4 DescripTION4',
        'email4@email.com', true, 'imie4', 'nazwisko4', '$2a$10$lill8ex1EzwXePPngmO3Xe95ZAEdOP4.9.KL/XLyz1AD2IOxdubCS', null);
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
    values ('Miasto miasto miasto miasto', 'Kraj kraj kraj kraj', 'Ulica ulica ulica ulica','ZIPZIPZIP' , 2, '2022-12-05', 2, '2022-11-05',
            'DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2DeScRiption2 DeScRiption2 DeScRiption2 DeScRiption2',
            true, 1, 24000, 12000, false, 'tItLe2 tItLe2');
insert into expectation (description, offer_id, required) values ('dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2 dESCripTIOn2dESCripTIOn2 dESCripTIOn2', 2, true);
insert into offer_advantage (description, offer_id) values ('dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3 dEsCrIpTION3', 2);
insert into localization (name) values ('lOcAlIzAtIoN1');
insert into offer (city, country, street, zip, user_id, closing_date, company_id, creation_date, description, first_job_possibility, localization_id, max_salary_pln, min_salary_pln, remote_possibility, title)
    values ('Miasto', 'Kraj', 'Ulica', 'ZIP', 2, '2022-12-05', 1, '2022-11-05',
            'DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1DeScRiption1 DeScRiption1 DeScRiption1 DeScRiption1',
            true, 2, 10000, 6000, true, 'tItLe1 tItLe1 tItLe1 tItLe1 tItLe1 tItLe1 tItLe1');
insert into category (title) values ('cAtEgOry1 cAtEgOry1 cAtEgOry1');
insert into expectation (description, offer_id, required) values ('dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1 dEsCrIption1', 3, false);
insert into offer_advantage (description, offer_id) values ('dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1 dEsCrIpTION1', 3);
insert into offer_advantage (description, offer_id) values ('dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2 dEsCrIpTION2dEsCrIpTION2', 3);
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
insert into recruiter (user_id, company_id) values (3, 2);
insert into saved_offer (user_id, offer_id) values (3, 1);
insert into offer_category (offer_id, job_category_id) values (1, 1);
insert into offer_category (offer_id, job_category_id) values (1, 2);
insert into saved_offer (user_id, offer_id) values (4, 3);
insert into saved_offer (user_id, offer_id) values (4, 2);
insert into saved_offer (user_id, offer_id) values (4, 1);
insert into offer_category (offer_id, job_category_id) values (2, 1);
insert into offer_category (offer_id, job_category_id) values (3, 3);