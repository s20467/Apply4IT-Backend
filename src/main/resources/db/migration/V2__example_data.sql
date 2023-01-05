ALTER TABLE application MODIFY COLUMN OFFER_ID INT;
ALTER TABLE application MODIFY COLUMN CANDIDATE_ID INT;
ALTER TABLE education MODIFY COLUMN USER_ID INT;
ALTER TABLE expectation MODIFY COLUMN OFFER_ID INT;
ALTER TABLE experience MODIFY COLUMN USER_ID INT;
ALTER TABLE offer MODIFY COLUMN COMPANY_ID INT;
ALTER TABLE offer MODIFY COLUMN USER_ID INT;
ALTER TABLE offer MODIFY COLUMN LOCALIZATION_ID INT;
ALTER TABLE offer_advantage MODIFY COLUMN OFFER_ID INT;



insert into category (id, title) values (1, 'Java');
insert into category (id, title) values (2, 'JavaScript');
insert into category (id, title) values (3, 'HTML');
insert into category (id, title) values (4, 'PHP');
insert into category (id, title) values (5, 'Ruby');
insert into category (id, title) values (6, 'Python');
insert into category (id, title) values (7, '.Net');
insert into category (id, title) values (8, 'Scala');
insert into category (id, title) values (9, 'Kotlin');
insert into category (id, title) values (10, 'QA');
insert into category (id, title) values (11, 'DevOps');
insert into category (id, title) values (12, 'Admin');
insert into category (id, title) values (13, 'UI');
insert into category (id, title) values (14, 'Architektura');
insert into category (id, title) values (15, 'Aplikacje mobilne');
insert into category (id, title) values (16, 'C/C++');
insert into category (id, title) values (17, 'Analityka');
insert into category (id, title) values (18, 'Bezpieczeństwo cyfrowe');
insert into category (id, title) values (19, 'Data Science');
insert into category (id, title) values (20, 'Bazy Danych');
insert into category (id, title) values (21, 'Zarządzanie projektem');
insert into category (id, title) values (22, 'Inne');


insert into localization (id, name) values (1, 'Warszawa');
insert into localization (id, name) values (2, 'Kraków');
insert into localization (id, name) values (3, 'Poznań');
insert into localization (id, name) values (4, 'Wrocław');
insert into localization (id, name) values (5, 'Bydgoszcz');
insert into localization (id, name) values (6, 'Szczecin');
insert into localization (id, name) values (7, 'Gdańsk');
insert into localization (id, name) values (8, 'Lublin');
insert into localization (id, name) values (9, 'Katowice');
insert into localization (id, name) values (10, 'Częstochowa');
insert into localization (id, name) values (11, 'Olsztyn');
insert into localization (id, name) values (12, 'Białystok');
insert into localization (id, name) values (13, 'Brak');


insert into authority (id, name) values (1, 'ROLE_ADMIN');
insert into authority (id, name) values (2, 'ROLE_USER');


insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (1, true, true, 'Warszawa', 'Polska', 'Złota 59', '00-120', '1990-11-05', true,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            'email1@email.com', true, 'Jan', 'Nowak', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);
insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (2, true, true, 'Warszawa', 'Polska', 'Złota 59', '00-120', '1990-11-05', true,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'email2@email.com', true, 'Jan', 'Kowalski', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);
insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (3, true, true, 'Warszawa', 'Polska', 'Złota 59', '00-120', '1990-11-05', true,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            'email3@email.com', true, 'Krzysztof', 'Nowak', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);
insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (4, true, true, 'Warszawa', 'Polska', 'Złota 59', '00-120', '1990-11-05', true,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'email4@email.com', true, 'Zbigniew', 'Kowalski', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);
insert into user (id, account_non_expired, account_non_locked, city, country, street, zip, birthdate, credentials_non_expired, description, email, enabled, first_name, last_name, password, photo)
    values (5, true, true, 'Warszawa', 'Polska', 'Złota 59', '00-120', '1990-11-05', true,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            'email5@email.com', true, 'Andrzej', 'Kowalski', '$2a$10$2hSRODp9DODQOl.61Zxd2eB6WwSSk7U183EpFQk1aPoFfHGgfATOK', null);


insert into user_authority (authority_id, user_id) values (1, 1);
insert into user_authority (authority_id, user_id) values (2, 2);
insert into user_authority (authority_id, user_id) values (2, 3);
insert into user_authority (authority_id, user_id) values (2, 4);
insert into user_authority (authority_id, user_id) values (2, 5);


insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2019-10-01', null, 'Informatyka', 'Bazy danych', true, 'Politechnika Warszawska', 1);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2018-10-01', '2022-02-01', 'Informatyka', 'Data science', false, 'Politechnika Warszawska', 2);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2022-03-01', null, 'Informatyka - studia magisterskie', 'Data science', true, 'Politechnika Warszawska', 2);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2018-10-01', '2022-02-01', 'Informatyka', 'Bazy danych', false, 'Politechnika Warszawska', 3);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2018-10-01', '2022-02-01', 'Informatyka', 'Bazy danych', false, 'Politechnika Warszawska', 4);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2022-03-01', null, 'Informatyka - studia magisterskie', 'Bazy danych', true, 'Politechnika Warszawska', 4);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2018-10-01', '2022-02-01', 'Informatyka', 'Bazy danych', false, 'Politechnika Warszawska', 5);
insert into education (start_date, end_date, major, specialization, still_studying, university_name, user_id)
    values ('2022-03-01', null, 'Informatyka - studia magisterskie', 'Bazy danych', true, 'Politechnika Warszawska', 5);


insert into experience (company_name, job, start_date, end_date, still_working, user_id, description)
    values ('Codex', 'Junior python developer', '2020-11-05', '2022-03-01', false, 2,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.');
insert into experience (company_name, job, start_date, end_date, still_working, user_id, description)
    values ('Softonix', 'Junior JavaScript developer', '2021-01-01', null, true, 3,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.');
insert into experience (company_name, job, start_date, end_date, still_working, user_id, description)
    values ('Codex', 'Cybersecurity intern', '2020-11-05', '2021-03-01', false, 4,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.');
insert into experience (company_name, job, start_date, end_date, still_working, user_id, description)
    values ('Softonix', 'Junior cybersecurity consultant', '2022-01-01', null, true, 4,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.');
insert into experience (company_name, job, start_date, end_date, still_working, user_id, description)
    values ('Codex', 'Java intern', '2020-11-05', '2021-03-01', false, 5,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.');
insert into experience (company_name, job, start_date, end_date, still_working, user_id, description)
    values ('Softonix', 'Junior java developer', '2022-01-01', null, true, 5,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan cum vitae arcu cursus. Feugiat nunc aenean venenatis est montes. Id eget vitae, risus, ultrices quis purus ut at.');


insert into company (id, description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values (1, 'Jesteśmy młodą i rozwijającą się firmą. Mamy wielkie plany i wielkie ambicje. Zajmujemy się tworzeniem oprogramowania i systemów analizujących dane dla firm z branży handlowej. Wierzymy, że nasze działania mogą zmieniać świat na lepsze i jeśli chciałbyś robić to z nami, dołącz do nas.',
        true, 'codeworks@email.com', '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',
        'CodeWorks', 1, 'Polska', 'Warszawa', '00-120', 'Złota');
insert into company (id, description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values (2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        true, 'techlabs@email.com', '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',
        'Techlabs', 2, 'Polska', 'Warszawa', '00-120', 'Złota');
insert into company (id, description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values (3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        true, 'techtopia@email.com', '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',
        'Techtopia', 3, 'Polska', 'Warszawa', '00-120', 'Złota');
insert into company (id, description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values (4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        true, 'codely@email.com', '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',
        'Codely', 4, 'Polska', 'Warszawa', '00-120', 'Złota');
insert into company (id, description, enabled, contact_email, logo_photo, name, user_id, country, city, zip, street)
    values (5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        true, 'softex@email.com', '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',
        'Softex', 5, 'Polska', 'Warszawa', '00-120', 'Złota');


insert into recruiter (user_id, company_id) values (2, 1);
insert into recruiter (user_id, company_id) values (2, 4);
insert into recruiter (user_id, company_id) values (2, 5);
insert into recruiter (user_id, company_id) values (3, 1);
insert into recruiter (user_id, company_id) values (3, 2);
insert into recruiter (user_id, company_id) values (3, 3);


insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (1, 'Junior data scientist', 2, 1, '2023-01-03', '2023-03-10', 1, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
            'Poszukujemy młodych, początkujących programistów, matematyków i inżynierów gotowych wspomóc nas w naszych projektach. Jeśli uczenie maszynowe i ogólnopojęte data science są dla ciebie interesującym zagadnieniem, a także nie brakuje ci zapału by wciąż się rozwijać zapraszamy do aplikowania :)');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (2, 'Junior java developer', 3, 1, '2023-01-02', '2023-03-10', 8, 5000, 11500, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (3, 'Junior scala developer', 2, 1, '2023-01-01', '2023-03-10', 1, 4500, 10000, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (4, 'Junior .Net developer', 3, 1, '2023-01-01', '2023-03-10', 8, 6000, 12500, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (5, 'Junior database admin', 2, 1, '2023-01-01', '2023-03-10', 1, 5500, 11000, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (6, 'Junior kotlin developer', 3, 1, '2023-01-01', '2023-03-10', 8, 4000, 10500, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (7, 'Junior UI designer', 2, 1, '2023-01-01', '2023-03-10', 1, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (8, 'Junior data scientist', 3, 2, '2023-01-01', '2023-03-10', 2, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (9, 'Junior java developer', 3, 2, '2023-01-01', '2023-03-10', 7, 5000, 11500, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (10, 'Junior scala developer', 3, 2, '2023-01-01', '2023-03-10', 2, 4500, 10000, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (11, 'Junior .Net developer', 3, 2, '2023-01-01', '2023-03-10', 7, 6000, 12500, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (12, 'Junior project manager', 3, 2, '2023-01-01', '2023-03-10', 2, 5500, 11000, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (13, 'Junior kotlin developer', 3, 2, '2023-01-01', '2023-03-10', 2, 4000, 10500, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (14, 'Junior cybersecurity consultant', 3, 2, '2023-01-01', '2023-03-10', 7, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (15, 'Junior data scientist', 3, 3, '2023-01-01', '2023-03-10', 3, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (16, 'Junior python developer', 3, 3, '2023-01-01', '2023-03-10', 3, 5000, 11500, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (17, 'Junior JavaScript developer', 3, 3, '2023-01-01', '2023-03-10', 6, 4500, 10000, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (18, 'Junior .Net developer', 3, 3, '2023-01-01', '2023-03-10', 3, 6000, 12500, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (19, 'Junior project manager', 3, 3, '2023-01-01', '2023-03-10', 6, 5500, 11000, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (20, 'Junior mobile app developer', 3, 3, '2023-01-01', '2023-03-10', 3, 4000, 10500, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (21, 'Junior cybersecurity consultant', 3, 3, '2023-01-01', '2023-03-10', 6, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (22, 'Junior QA', 2, 4, '2023-01-01', '2023-03-10', 4, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (23, 'Junior python developer', 2, 4, '2023-01-01', '2023-03-10', 4, 5000, 11500, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (24, 'Junior ruby developer', 2, 4, '2023-01-01', '2023-03-10', 4, 4500, 10000, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (25, 'Junior network admin', 2, 4, '2023-01-01', '2023-03-10', 4, 6000, 12500, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (26, 'Junior devops', 2, 4, '2023-01-01', '2023-03-10', 5, 5500, 11000, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (27, 'Junior C/C++ developer', 2, 4, '2023-01-01', '2023-03-10', 5, 4000, 10500, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (28, 'Junior cybersecurity consultant', 2, 4, '2023-01-01', '2023-03-10', 5, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (29, 'Junior QA', 2, 5, '2023-01-01', '2023-03-10', 9, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (30, 'Junior python developer', 2, 5, '2023-01-01', '2023-03-10', 9, 5000, 11500, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (31, 'Junior ruby developer', 2, 5, '2023-01-01', '2023-03-10', 9, 4500, 10000, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (32, 'Junior network admin', 2, 5, '2023-01-01', '2023-03-10', 9, 6000, 12500, true, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (33, 'Junior devops', 2, 5, '2023-01-01', '2023-03-10', 9, 5500, 11000, true, false, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (34, 'Junior C/C++ developer', 2, 5, '2023-01-01', '2023-03-10', 9, 4000, 10500, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
insert into offer (id, title, user_id, company_id, creation_date, closing_date, localization_id, min_salary_pln, max_salary_pln, first_job_possibility, remote_possibility, country, city, zip, street, description)
    values (35, 'Junior cybersecurity consultant', 2, 5, '2023-01-01', '2023-03-10', 9, 6500, 12000, false, true, 'Polska', 'Warszawa', '00-120', 'Złota',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');


insert into offer_category (offer_id, job_category_id) values (1, 19);
insert into offer_category (offer_id, job_category_id) values (1, 17);
insert into offer_category (offer_id, job_category_id) values (1, 6);

insert into offer_category (offer_id, job_category_id) values (2, 1);
insert into offer_category (offer_id, job_category_id) values (2, 8);
insert into offer_category (offer_id, job_category_id) values (2, 9);
insert into offer_category (offer_id, job_category_id) values (2, 20);

insert into offer_category (offer_id, job_category_id) values (3, 8);
insert into offer_category (offer_id, job_category_id) values (3, 9);
insert into offer_category (offer_id, job_category_id) values (3, 1);
insert into offer_category (offer_id, job_category_id) values (3, 20);

insert into offer_category (offer_id, job_category_id) values (4, 7);
insert into offer_category (offer_id, job_category_id) values (4, 20);

insert into offer_category (offer_id, job_category_id) values (5, 20);
insert into offer_category (offer_id, job_category_id) values (5, 12);

insert into offer_category (offer_id, job_category_id) values (6, 9);
insert into offer_category (offer_id, job_category_id) values (6, 15);
insert into offer_category (offer_id, job_category_id) values (6, 1);
insert into offer_category (offer_id, job_category_id) values (6, 8);

insert into offer_category (offer_id, job_category_id) values (7, 13);
insert into offer_category (offer_id, job_category_id) values (7, 3);
insert into offer_category (offer_id, job_category_id) values (7, 2);

insert into offer_category (offer_id, job_category_id) values (8, 19);
insert into offer_category (offer_id, job_category_id) values (8, 17);
insert into offer_category (offer_id, job_category_id) values (8, 6);

insert into offer_category (offer_id, job_category_id) values (9, 1);
insert into offer_category (offer_id, job_category_id) values (9, 8);
insert into offer_category (offer_id, job_category_id) values (9, 9);
insert into offer_category (offer_id, job_category_id) values (9, 20);

insert into offer_category (offer_id, job_category_id) values (10, 8);
insert into offer_category (offer_id, job_category_id) values (10, 9);
insert into offer_category (offer_id, job_category_id) values (10, 1);
insert into offer_category (offer_id, job_category_id) values (10, 20);

insert into offer_category (offer_id, job_category_id) values (11, 7);
insert into offer_category (offer_id, job_category_id) values (11, 20);

insert into offer_category (offer_id, job_category_id) values (12, 21);

insert into offer_category (offer_id, job_category_id) values (13, 9);
insert into offer_category (offer_id, job_category_id) values (13, 15);
insert into offer_category (offer_id, job_category_id) values (13, 1);
insert into offer_category (offer_id, job_category_id) values (13, 8);

insert into offer_category (offer_id, job_category_id) values (14, 18);
insert into offer_category (offer_id, job_category_id) values (14, 11);
insert into offer_category (offer_id, job_category_id) values (14, 12);

insert into offer_category (offer_id, job_category_id) values (15, 19);
insert into offer_category (offer_id, job_category_id) values (15, 17);
insert into offer_category (offer_id, job_category_id) values (15, 6);

insert into offer_category (offer_id, job_category_id) values (16, 6);
insert into offer_category (offer_id, job_category_id) values (16, 20);

insert into offer_category (offer_id, job_category_id) values (17, 2);
insert into offer_category (offer_id, job_category_id) values (17, 3);
insert into offer_category (offer_id, job_category_id) values (17, 13);

insert into offer_category (offer_id, job_category_id) values (18, 7);
insert into offer_category (offer_id, job_category_id) values (18, 20);

insert into offer_category (offer_id, job_category_id) values (19, 21);

insert into offer_category (offer_id, job_category_id) values (20, 15);
insert into offer_category (offer_id, job_category_id) values (20, 9);
insert into offer_category (offer_id, job_category_id) values (20, 1);

insert into offer_category (offer_id, job_category_id) values (21, 18);
insert into offer_category (offer_id, job_category_id) values (21, 11);
insert into offer_category (offer_id, job_category_id) values (21, 12);

insert into offer_category (offer_id, job_category_id) values (22, 10);
insert into offer_category (offer_id, job_category_id) values (22, 1);

insert into offer_category (offer_id, job_category_id) values (23, 6);
insert into offer_category (offer_id, job_category_id) values (23, 20);

insert into offer_category (offer_id, job_category_id) values (24, 5);
insert into offer_category (offer_id, job_category_id) values (24, 20);

insert into offer_category (offer_id, job_category_id) values (25, 12);

insert into offer_category (offer_id, job_category_id) values (26, 11);
insert into offer_category (offer_id, job_category_id) values (26, 12);

insert into offer_category (offer_id, job_category_id) values (27, 16);
insert into offer_category (offer_id, job_category_id) values (27, 20);

insert into offer_category (offer_id, job_category_id) values (28, 6);
insert into offer_category (offer_id, job_category_id) values (28, 20);

insert into offer_category (offer_id, job_category_id) values (29, 10);
insert into offer_category (offer_id, job_category_id) values (29, 1);

insert into offer_category (offer_id, job_category_id) values (30, 6);
insert into offer_category (offer_id, job_category_id) values (30, 20);

insert into offer_category (offer_id, job_category_id) values (31, 5);
insert into offer_category (offer_id, job_category_id) values (31, 20);

insert into offer_category (offer_id, job_category_id) values (32, 12);

insert into offer_category (offer_id, job_category_id) values (33, 11);
insert into offer_category (offer_id, job_category_id) values (33, 12);

insert into offer_category (offer_id, job_category_id) values (34, 16);
insert into offer_category (offer_id, job_category_id) values (34, 20);

insert into offer_category (offer_id, job_category_id) values (35, 6);
insert into offer_category (offer_id, job_category_id) values (35, 20);

insert into expectation (offer_id, required, order_number, description)
    values (1, true, 0, 'Skończony 3 rok studiów');
insert into expectation (offer_id, required, order_number, description)
    values (1, true, 1, 'Podstawowa znajomość języka python');
insert into expectation (offer_id, required, order_number, description)
    values (1, false, 2, 'Podstawowa znajomość matematycznych i algorytmicznych zagadnień związanych z uczeniem maszynowym');
insert into expectation (offer_id, required, order_number, description)
    values (1, true, 3, 'Biegłe posługiwanie się językiem angielskim');
insert into expectation (offer_id, required, order_number, description)
    values (1, true, 4, 'Chęć nauki');

insert into offer_advantage (offer_id, order_number, description)
    values (1, 0, 'Możliwość rozwoju i zdobycia pierwszego komercyjnego doświadczenia');
insert into offer_advantage (offer_id, order_number, description)
    values (1, 1, 'Młody i rozwijający się zespół');
insert into offer_advantage (offer_id, order_number, description)
    values (1, 2, 'Ciekawe projekty. Zarówno te nowe jak i te już rozwijane.');

insert into expectation (offer_id, required, order_number, description)
values (2, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (2, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (2, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (2, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (2, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (2, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (2, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (2, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (3, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (3, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (3, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (3, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (3, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (3, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (3, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (3, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (3, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (4, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (4, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (4, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (4, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (4, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (4, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (4, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (4, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (4, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (5, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (5, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (5, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (5, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (5, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (5, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (5, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (5, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (5, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (6, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (6, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (6, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (6, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (6, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (6, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (6, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (6, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (6, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (7, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (7, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (7, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (7, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (7, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (7, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (7, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (7, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (7, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (8, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (8, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (8, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (8, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (8, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (8, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (8, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (8, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (8, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (9, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (9, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (9, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (9, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (9, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (9, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (9, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (9, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (9, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (10, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (10, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (10, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (10, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (10, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (10, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (10, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (10, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (10, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (11, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (11, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (11, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (11, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (11, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (11, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (11, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (11, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (11, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (12, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (12, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (12, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (12, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (12, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (12, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (12, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (12, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (12, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (13, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (13, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (13, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (13, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (13, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (13, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (13, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (13, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (13, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (14, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (14, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (14, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (14, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (14, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (14, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (14, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (14, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (14, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (15, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (15, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (15, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (15, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (15, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (15, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (15, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (15, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (15, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (16, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (16, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (16, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (16, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (16, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (16, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (16, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (16, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (16, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (17, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (17, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (17, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (17, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (17, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (17, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (17, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (17, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (17, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (18, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (18, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (18, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (18, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (18, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (18, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (18, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (18, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (18, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (19, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (19, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (19, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (19, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (19, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (19, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (19, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (19, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (19, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (20, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (20, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (20, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (20, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (20, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (20, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (20, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (20, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (20, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (21, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (21, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (21, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (21, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (21, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (21, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (21, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (21, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (21, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (22, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (22, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (22, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (22, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (22, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (22, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (22, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (22, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (22, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (23, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (23, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (23, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (23, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (23, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (23, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (23, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (23, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (23, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (24, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (24, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (24, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (24, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (24, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (24, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (24, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (24, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (24, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (25, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (25, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (25, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (25, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (25, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (25, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (25, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (25, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (25, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (26, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (26, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (26, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (26, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (26, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (26, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (26, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (26, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (26, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (27, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (27, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (27, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (27, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (27, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (27, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (27, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (27, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (27, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (28, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (28, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (28, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (28, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (28, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (28, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (28, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (28, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (28, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (29, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (29, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (29, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (29, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (29, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (29, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (29, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (29, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (29, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (30, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (30, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (30, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (30, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (30, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (30, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (30, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (30, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (30, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (31, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (31, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (31, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (31, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (31, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (31, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (31, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (31, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (31, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (32, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (32, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (32, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (32, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (32, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (32, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (32, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (32, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (32, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (33, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (33, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (33, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (33, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (33, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (33, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (33, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (33, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (33, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (34, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (34, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (34, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (34, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (34, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (34, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (34, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (34, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (34, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');

insert into expectation (offer_id, required, order_number, description)
values (35, false, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
insert into expectation (offer_id, required, order_number, description)
values (35, true, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into expectation (offer_id, required, order_number, description)
values (35, false, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
insert into expectation (offer_id, required, order_number, description)
values (35, true, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim');
insert into expectation (offer_id, required, order_number, description)
values (35, false, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim');

insert into offer_advantage (offer_id, order_number, description)
values (35, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam');
insert into offer_advantage (offer_id, order_number, description)
values (35, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua');
insert into offer_advantage (offer_id, order_number, description)
values (35, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod');
insert into offer_advantage (offer_id, order_number, description)
values (35, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna');


insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 1, 1);
insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 1, 2);
insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 1, 3);
insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 1, 4);
insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 1, 5);
insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 2, 4);
insert into application (application_date, cv, offer_id, candidate_id) values ('2023-01-04', null, 2, 5);


ALTER TABLE application MODIFY COLUMN OFFER_ID INT NOT NULL;
ALTER TABLE application MODIFY COLUMN CANDIDATE_ID INT NOT NULL;
ALTER TABLE education MODIFY COLUMN USER_ID INT NOT NULL;
ALTER TABLE expectation MODIFY COLUMN OFFER_ID INT NOT NULL;
ALTER TABLE experience MODIFY COLUMN USER_ID INT NOT NULL;
ALTER TABLE offer MODIFY COLUMN COMPANY_ID INT NOT NULL;
ALTER TABLE offer MODIFY COLUMN USER_ID INT NOT NULL;
ALTER TABLE offer MODIFY COLUMN LOCALIZATION_ID INT NOT NULL;
ALTER TABLE offer_advantage MODIFY COLUMN OFFER_ID INT NOT NULL;