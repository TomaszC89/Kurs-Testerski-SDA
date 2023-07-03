CREATE DATABASE library;
-- Table: categories
CREATE TABLE library.categories (
  id            INT AUTO_INCREMENT,
  name          VARCHAR(32) NOT NULL UNIQUE,
  description   VARCHAR(64),
  PRIMARY KEY (id)
);

-- Table: authors
CREATE TABLE library.authors (
    id          INT AUTO_INCREMENT,
    first_name  VARCHAR(32) NOT NULL,
    last_name   VARCHAR(32) NOT NULL,
    PRIMARY KEY (id)
);

-- Table: books
CREATE TABLE library.books (
  id            INT AUTO_INCREMENT,
  title         VARCHAR(128) NOT NULL,
  category      INT NOT NULL,
  author        INT NOT NULL,
  publisher     VARCHAR(32) NOT NULL,
  release_date  DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (category) REFERENCES library.categories(id),
  FOREIGN KEY (author) REFERENCES library.authors(id)
);

-- Table: customers
CREATE TABLE library.customers (
  id           INT AUTO_INCREMENT,
  first_name   VARCHAR(32) NOT NULL,
  last_name    VARCHAR(32) NOT NULL,
  email        VARCHAR(64) NOT NULL UNIQUE,
  phone        VARCHAR(9),
  PRIMARY KEY (id)
);

-- Table: departments
CREATE TABLE library.departments (
	id 			INT AUTO_INCREMENT,
	name 		VARCHAR(64) NOT NULL UNIQUE,
	street 		VARCHAR(64) NOT NULL,
	postal_code VARCHAR(6) NOT NULL,
	city 		VARCHAR(64) NOT NULL,
	PRIMARY KEY (id)
);

-- Table: employees
CREATE TABLE library.employees (
    id          INT AUTO_INCREMENT,
    first_name  VARCHAR(32) NOT NULL,
    last_name   VARCHAR(32) NOT NULL,
    hire_date 	DATE NOT NULL,
    salary 		DECIMAL(7,2) NOT NULL,
	department 	INT NOT NULL,
    email		VARCHAR(64) NOT NULL UNIQUE,
	phone 		VARCHAR(9) NOT NULL UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (department) REFERENCES library.departments(id)
);

-- Rents
CREATE TABLE library.rents (
	id 			INT AUTO_INCREMENT,
	agent       INT NOT NULL,
	book     	INT NOT NULL,
	customer	INT NOT NULL,
	rent_date 	DATE NOT NULL,
	return_date DATE,
	PRIMARY KEY (ID),
	FOREIGN KEY (agent) REFERENCES library.employees(id),
    FOREIGN KEY (book) REFERENCES library.books(id),
    FOREIGN KEY (customer) REFERENCES library.customers(id)
);

INSERT INTO library.categories VALUES
    (1, 'Kryminał', 'Kryminały, sensacje, thrillery'),
    (2, 'Fantastyka', null),
    (3, 'Informatyka', 'Wszystko co związane ze światem IT'),
    (4, 'Biznes', 'Książki na temat rozwoju i biznesu'),
    (5, 'Biografia', null),
    (6, 'Horror', 'Dla ludzi o mocnych nerwach'),
    (7, 'Science Fiction', null);

-- Authors
INSERT INTO library.authors VALUES
    (1, 'Robert', 'Martin'),
    (2, 'Mirosław', 'Kubiak'),
    (3, 'John', 'Duckett'),
    (4, 'Remigiusz', 'Mróz'),
    (5, 'Max', 'Czornyj'),
    (6, 'Jo', 'Nesbo'),
    (7, 'Paolo', 'Roversi'),
    (8, 'Stephen', 'King'),
    (9, 'Michał', 'Godlewski'),
    (10, 'Paweł', 'Leśniak'),
    (11, 'Andrzej', 'Pilipiuk'),
    (12, 'Andrzej', 'Ziemiański'),
    (13, 'Joe', 'Abercrombie'),
    (14, 'Simon', 'Imenez'),
    (15, 'John', 'Brunner'),
    (16, 'Marko', 'Kloss'),
    (17, 'Ewa', 'Wilmanowicz'),
    (18, 'Kaludia', 'Pingot');

-- Books
INSERT INTO library.books VALUES
    (1, 'Czysty Agile. Powrót do podstaw', 3, 1, 'Helion', '2020-06-23'),
    (2, 'Czysta architektura. Struktura i design oprogramowania. Przewodnik dla profesjonalistów', 3, 1, 'Helion', '2018-05-11'),
    (3, 'Mistrz czystego kodu. Kodeks postępowania profesjonalnych programistów', 3, 1, 'Helion', '2013-10-28'),
    (4, 'Czysty kod. Podręcznik dobrego programisty', 3, 1, 'Helion', '2010-02-19'),
    (5, 'Python. Zadania z programowania. Przykładowe funkcyjne rozwiązania', 3, 2, 'Helion', '2021-05-21'),
    (6, 'Python. Zadania z programowania. Przykładowe imperatywne rozwiązania', 3, 2, 'Helion', '2021-05-21'),
    (7, 'Java. Zadania z programowania z przykładowymi rozwiązaniami. Wydanie III', 3, 2, 'Helion', '2020-08-07'),
    (8, 'C++. Zadania z programowania z przykładowymi rozwiązaniami. Wydanie III', 3, 2, 'Helion', '2020-07-28'),
    (9, 'C#. Zadania z programowania z przykładowymi rozwiązaniami. Wydanie III', 3, 2, 'Helion', '2021-08-17'),
    (10, 'HTML i CSS. Zaprojektuj i zbuduj witrynę WWW. Podręcznik Front-End Developera', 3, 3, 'Helion', '2017-12-21'),
    (11, 'JavaScript i jQuery. Interaktywne strony WWW dla każdego. Podręcznik Front-End Developera', 3, 3, 'Helion', '2015-04-27'),
    (12, 'Turkusowe szale', 1, 4, 'Bellona', '2017-03-16'),
    (13, 'Projekt Riese', 1, 4, 'Filia', '2022-01-26'),
    (14, 'Kat z Płaszowa', 1, 5, 'Filia', '2022-01-26'),
    (15, 'Obcy', 1, 5, 'Filia', '2022-02-23'),
    (16, 'Mord', 1, 5, 'Filia', '2021-09-29'),
    (17, 'Łowcy głów', 1, 6, 'Dolnośląskie', '2011-11-17'),
    (18, 'Zazdrość', 1, 6, 'Dolnośląskie', '2021-09-15'),
    (19, 'Zemsta', 1, 6, 'Dolnośląskie', '2022-02-23'),
    (20, 'Królestwo', 1, 6, 'Dolnośląskie', '2020-09-02'),
    (21, 'Nałóg', 1, 7, 'Świat Książki', '2022-02-09'),
    (22, 'Smętarz dla zwierzaków', 6, 8, 'Prószyński Media', '2019-04-23'),
    (23, 'Outsider', 6, 8, 'Prószyński Media', '2018-06-05'),
    (24, 'Śpiące królewny', 6, 8, 'Prószyński Media', '2017-10-24'),
    (25, 'Misery', 6, 8, 'Prószyński Media', '2011-01-21'),
    (26, 'Fałszywa przepowiednia', 6, 9, 'Oficynka', '2022-03-02'),
    (27, 'Wilczy zew', 6, 10, 'Wydawnictwo Nocą', '2021-06-02'),
    (28, 'Mumia', 6, 10, 'Wydawnictwo Nocą', '2022-02-23'),
    (29, 'Czarna góra', 2, 11, 'Fabryka Słów', '2021-02-24'),
    (30, 'Kuzynki. Wydanie 4', 2, 11, 'Fabryka Słów', '2012-06-01'),
    (31, 'Oko Jelenia. Sfera Armilarna', 2, 11, 'Fabryka Słów', '2011-07-15'),
    (32, 'Ucieczka z Festung Breslau', 2, 12, 'Fabryka Słów', '2022-03-11'),
    (33, 'Toy Wars', 2, 12, 'Fabryka Słów', '2017-08-18'),
    (34, 'Mądrość tłumu', 2, 13, 'MAG', '2022-03-23'),
    (35, 'Ostateczny argument. Cykl Pierwsze prawo. Księga 3', 2, 13, 'MAG', '2019-04-26'),
    (36, 'Nim zawisną. Cykl Pierwsze prawo. Księga 2', 2, 13, 'MAG', '2019-03-29'),
    (37, 'Ostrze. Cykl Pierwsze prawo. Księga 1', 2, 13, 'MAG', '2019-03-22'),
    (38, 'Kłopotliwy pokój. Cykl Pierwsze prawo', 2, 13, 'MAG', '2021-02-24'),
    (39, 'Szczypta nienawiści', 2, 13, 'MAG', '2019-11-29'),
    (40, 'Czerwona kraina', 2, 13, 'MAG', '2019-11-29'),
    (41, 'Bohaterowie', 2, 13, 'MAG', '2019-10-11'),
    (42, 'Ptaki, które zniknęły', 7, 14, 'MAG', '2022-02-28'),
    (43, 'Pułapka Tesli', 7, 12, 'Fabryka Słów', '2019-09-16'),
    (44, 'Zygzakowata orbita', 7, 15, 'MAG', '2022-01-14'),
    (45, 'Wszyscy na Zanzibarze', 7, 15, 'MAG', '2015-04-22'),
    (46, 'Uderzenie. Cykl Wojny Palladowe. Tom 2', 7, 16, 'Fabryka Słów', '2021-04-09'),
    (47, 'Wstrząsy wtórne. Cykl Wojny Palladowe. Tom 1', 7, 16, 'Fabryka Słów', '2020-10-02'),
    (48, 'Wpływowy menedżer. Strategie budowania przywództwa i reputacji', 4, 17, 'Onepress', '2021-07-20'),
    (49, 'Osobista reputacja. Jak budować markę w dobrym stylu', 4, 17, 'Onepress', '2019-10-10'),
    (50, 'Błękitny umysł. Myśl na odwrót, działaj na opak, poznaj nieznane!', 4, 18, 'Onepress', '2019-09-17');

-- Departments
INSERT INTO library.departments VALUES
	(1, 'Alpha', 'Wojska Polskiego 9/10', '00-002', 'Warszawa'),
	(2, 'Beta', 'Ostatnia 1', '90-003', 'Łódź'),
	(3, 'Gamma', 'Generała Andersa 11/16', '90-005', 'Łódź'),
	(4, 'Omega', 'Wodna 26', '81-045', 'Gdynia'),
    (5, 'Lambda', 'Sucha 62', '81-045', 'Gdynia'),
    (6, 'Epsilon', 'Krótka 1/12', '60-005', 'Poznań');

-- Employees
INSERT INTO library.employees VALUES
    (1, 'Jakub', 'Naczelny', '2019-01-01', 20000, 1, 'jan_naczelny@library.pl', '478325965'),
    (2, 'Ewa', 'Kowalska', '2019-01-01', 18500, 1, 'ewa_kowalska@library.pl', '777555999'),
    (3, 'Bartłomiej', 'Glowny', '2019-02-01', 15000, 2, 'bartlomiej_glowny@library.pl', '785417589'),
    (4, 'Ewa', 'Poboczna', '2019-02-15', 13500, 2, 'ewa_poboczna@library.pl', '359842741'),
    (5, 'Jakub', 'Lider', '2019-04-01', 10000, 2, 'jakub_lider@library.pl', '744155366'),
    (6, 'Mateusz', 'Mrozu', '2019-05-01', 9500, 3, 'mateusz_mrozu@library.pl', '875419639'),
    (7, 'Elżbieta', 'Nowak', '2019-05-01', 9500, 3,'elzbieta_nowak@library.pl', '799666333'),
    (8, 'Patryk', 'Niwim', '2019-06-01', 9800, 4, 'patryk_niwim@library.pl', '787454121'),
    (9, 'Adam', 'Morawiecki', '2019-08-10', 7500, 4, 'adam_morawiecki@library.pl', '777444155'),
    (10, 'Monika', 'Praktyczna', '2019-09-01', 7000, 4, 'monika_praktyczna@library.pl', '987632541'),
    (11, 'Natalia', 'Narutowicz', '2019-09-01', 6500, 4, 'natalia_narutowicz@library.pl', '455699855'),
    (12, 'Łukasz', 'Puknisz', '2019-10-01', 10200, 2, 'lukasz_puknisz@library.pl', '777444333'),
    (13, 'Tomasz', 'Pomasz', '2019-11-10', 8500, 2, 'tomasz_pomasz@library.pl', '122022022'),
    (14, 'Magdalena', 'Doktorska', '2019-11-15', 9850, 3, 'magdalena_doktorska@library.pl', '145230650'),
    (15, 'Mirosław', 'Zasadniczy', '2020-01-01', 9000, 3, 'miroslaw_zasadniczy@library.pl', '785420356'),
    (16, 'Paulina', 'Punktualna', '2020-01-01', 5000, 1, 'paulina_punktualna@library.pl', '789245632'),
    (17, 'Aleksander', 'Macedoński', '2020-03-15',8000, 3, 'aleksander_macedonski@library.pl', '190667322');

-- Customers
INSERT INTO library.customers VALUES
	(1, 'Adam', 'Nowak', 'adam.nowak@o3.pl', '159478632'),
	(2, 'Ewa', 'Kowalska', 'ewakowalska@tmail.com', '456789123'),
	(3, 'Aleksandra', 'Oczytana', 'ola_oczyt@fp.pl', '147258369'),
	(4, 'Jakub', 'Mol', 'j.mol@email.pl', '115332447'),
	(5, 'Dominik', 'Wersow', 'domino2@inlook.com', '751348962'),
    (6, 'Jakub', 'Książka', 'j.book@email.pl', '345890222'),
    (7, 'Dominika', 'Nazwisko', 'domini@poczta.eu', '890333671');

INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (1, 5, 22, 6, '2022-01-20', '2022-03-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (2, 2, 4, 5, '2021-10-27', '2021-12-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (3, 9, 16, 6, '2022-01-07', '2022-02-15');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (4, 13, 37, 2, '2022-01-29', '2022-03-03');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (5, 7, 8, 3, '2021-12-19', '2022-01-05');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (6, 14, 7, 5, '2021-12-26', '2022-01-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (7, 1, 7, 2, '2021-10-03', '2021-11-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (8, 10, 35, 6, '2021-12-01', '2021-12-15');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (9, 10, 3, 3, '2021-11-17', '2021-12-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (10, 10, 35, 4, '2021-10-09', '2021-11-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (11, 9, 35, 4, '2022-01-17', '2022-02-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (12, 6, 27, 5, '2021-12-09', '2021-12-25');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (13, 2, 43, 5, '2021-11-20', '2021-12-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (14, 3, 49, 1, '2022-01-07', '2022-02-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (15, 2, 31, 3, '2021-10-05', '2021-10-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (16, 14, 17, 1, '2021-10-29', '2021-12-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (17, 13, 5, 5, '2021-12-06', '2022-01-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (18, 2, 43, 6, '2021-12-30', '2022-01-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (19, 8, 6, 2, '2021-12-12', '2022-01-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (20, 2, 1, 3, '2022-01-24', '2022-03-03');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (21, 8, 30, 5, '2022-01-30', '2022-02-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (22, 5, 38, 3, '2021-10-30', '2021-11-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (23, 11, 17, 3, '2021-10-03', '2021-10-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (24, 13, 30, 3, '2021-10-05', '2021-11-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (25, 4, 27, 6, '2021-11-02', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (26, 10, 24, 6, '2021-12-09', '2022-01-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (27, 3, 20, 5, '2021-11-20', '2021-12-29');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (28, 16, 20, 5, '2021-11-04', '2021-12-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (29, 12, 38, 4, '2021-12-25', '2022-01-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (30, 13, 39, 3, '2022-01-29', '2022-02-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (31, 12, 3, 3, '2022-01-26', '2022-02-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (32, 6, 6, 5, '2021-12-25', '2022-01-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (33, 2, 48, 5, '2021-11-27', '2022-01-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (34, 6, 5, 6, '2021-11-01', '2021-11-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (35, 16, 5, 1, '2021-11-17', '2021-12-14');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (36, 17, 48, 5, '2021-12-30', '2022-01-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (37, 15, 6, 4, '2022-01-08', '2022-02-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (38, 9, 5, 5, '2021-11-09', '2021-12-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (39, 14, 5, 2, '2022-01-03', '2022-01-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (40, 3, 38, 5, '2021-11-06', '2021-12-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (41, 5, 43, 3, '2021-11-01', '2021-12-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (42, 3, 12, 1, '2021-11-14', '2021-12-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (43, 8, 16, 3, '2021-12-02', '2021-12-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (44, 16, 18, 4, '2022-01-26', '2022-02-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (45, 6, 18, 6, '2021-12-27', '2022-01-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (46, 14, 25, 5, '2022-01-26', '2022-02-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (47, 16, 25, 1, '2021-11-14', '2021-12-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (48, 6, 24, 1, '2021-10-27', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (49, 16, 9, 2, '2021-12-13', '2021-12-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (50, 12, 25, 2, '2021-11-05', '2021-12-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (51, 3, 11, 2, '2021-10-15', '2021-10-25');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (52, 9, 18, 5, '2021-10-29', '2021-11-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (53, 1, 12, 1, '2021-12-07', '2021-12-25');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (54, 1, 35, 3, '2021-11-09', '2021-12-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (55, 17, 37, 4, '2021-11-18', '2021-12-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (56, 12, 37, 3, '2021-12-04', '2021-12-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (57, 8, 31, 2, '2022-01-12', '2022-02-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (58, 6, 4, 6, '2021-11-23', '2022-01-01');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (59, 3, 4, 3, '2022-01-04', '2022-01-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (60, 9, 4, 5, '2021-10-03', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (61, 16, 30, 6, '2021-11-24', '2021-12-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (62, 14, 8, 5, '2022-01-07', '2022-02-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (63, 9, 48, 2, '2021-12-02', '2021-12-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (64, 3, 20, 1, '2022-01-06', '2022-02-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (65, 11, 1, 3, '2021-10-25', '2021-11-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (66, 13, 10, 6, '2021-11-24', '2021-12-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (67, 12, 47, 2, '2022-01-26', '2022-02-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (68, 7, 37, 4, '2022-01-08', '2022-01-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (69, 1, 49, 1, '2021-12-15', '2022-01-05');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (70, 14, 49, 6, '2021-10-18', '2021-11-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (71, 12, 7, 5, '2021-12-12', '2021-12-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (72, 3, 7, 1, '2021-10-25', '2021-11-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (73, 11, 38, 1, '2022-01-09', '2022-01-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (74, 7, 8, 6, '2021-10-09', '2021-10-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (75, 12, 8, 2, '2021-12-16', '2022-01-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (76, 4, 18, 6, '2021-10-27', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (77, 1, 20, 5, '2021-12-05', '2021-12-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (78, 6, 18, 6, '2021-10-29', '2021-11-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (79, 11, 18, 6, '2021-12-19', '2021-12-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (80, 9, 37, 6, '2021-10-04', '2021-10-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (81, 16, 20, 4, '2022-01-15', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (82, 9, 3, 1, '2021-12-13', '2021-12-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (83, 5, 41, 6, '2021-10-21', '2021-11-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (84, 16, 18, 4, '2021-12-26', '2022-01-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (85, 11, 30, 2, '2021-10-18', '2021-11-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (86, 10, 40, 3, '2022-01-02', '2022-02-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (87, 13, 39, 1, '2022-01-09', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (88, 6, 27, 3, '2021-10-02', '2021-11-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (89, 11, 27, 3, '2021-12-10', '2022-01-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (90, 17, 8, 3, '2021-12-08', '2022-01-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (91, 1, 11, 5, '2021-10-10', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (92, 7, 11, 5, '2021-12-17', '2021-12-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (93, 17, 11, 2, '2021-11-17', '2021-12-14');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (94, 12, 46, 3, '2021-12-28', '2022-01-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (95, 7, 7, 2, '2021-12-22', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (96, 6, 27, 3, '2021-12-14', '2022-01-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (97, 17, 48, 3, '2021-11-09', '2021-12-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (98, 17, 37, 2, '2021-12-05', '2021-12-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (99, 8, 1, 3, '2021-11-18', '2021-12-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (100, 16, 48, 6, '2021-12-13', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (101, 17, 3, 2, '2021-11-26', '2021-12-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (102, 14, 27, 5, '2021-12-04', '2022-01-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (103, 9, 1, 5, '2021-10-05', '2021-11-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (104, 10, 11, 3, '2021-11-13', '2021-12-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (105, 15, 12, 6, '2021-10-15', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (106, 9, 48, 1, '2021-12-13', '2022-01-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (107, 10, 3, 1, '2021-11-28', '2022-01-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (108, 3, 6, 1, '2021-10-14', '2021-11-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (109, 6, 30, 5, '2021-12-18', '2022-01-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (110, 14, 2, 4, '2021-10-14', '2021-10-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (111, 14, 6, 6, '2021-11-07', '2021-12-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (112, 4, 30, 3, '2021-11-09', '2021-12-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (113, 15, 47, 4, '2021-11-11', '2021-12-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (114, 11, 50, 6, '2021-11-24', '2022-01-01');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (115, 10, 17, 3, '2021-12-07', '2022-01-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (116, 8, 50, 1, '2022-01-15', '2022-01-25');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (117, 14, 12, 6, '2021-11-11', '2021-12-05');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (118, 2, 7, 5, '2022-01-26', '2022-03-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (119, 13, 11, 3, '2021-12-31', '2022-01-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (120, 2, 12, 2, '2021-12-24', '2022-01-14');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (121, 15, 10, 4, '2021-12-31', '2022-02-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (122, 12, 19, 3, '2021-11-04', '2021-12-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (123, 8, 48, 4, '2022-01-23', '2022-02-05');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (124, 4, 28, 6, '2022-01-03', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (125, 17, 27, 6, '2021-11-20', '2021-12-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (126, 3, 8, 5, '2021-10-24', '2021-12-02');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (127, 5, 5, 1, '2021-10-14', '2021-11-14');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (128, 15, 43, 1, '2021-11-05', '2021-11-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (129, 17, 41, 2, '2021-10-15', '2021-11-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (130, 3, 41, 5, '2022-01-10', '2022-02-15');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (131, 15, 40, 1, '2021-12-15', '2021-12-29');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (132, 3, 1, 1, '2021-12-18', '2022-01-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (133, 12, 33, 5, '2021-10-13', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (134, 14, 16, 3, '2021-10-28', '2021-11-29');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (135, 15, 4, 3, '2022-01-27', '2022-03-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (136, 13, 3, 6, '2021-10-14', '2021-11-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (137, 10, 41, 1, '2022-01-06', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (138, 9, 3, 3, '2021-10-05', '2021-11-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (139, 7, 3, 3, '2022-01-09', '2022-02-14');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (140, 15, 12, 6, '2022-01-27', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (141, 17, 33, 3, '2021-12-01', '2021-12-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (142, 13, 33, 5, '2021-12-26', '2022-01-25');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (143, 15, 29, 6, '2021-11-06', '2021-11-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (144, 12, 29, 3, '2021-12-30', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (145, 11, 46, 6, '2022-01-19', '2022-02-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (146, 16, 5, 2, '2021-10-30', '2021-11-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (147, 10, 10, 2, '2021-10-28', '2021-11-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (148, 16, 50, 6, '2021-12-02', '2022-01-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (149, 1, 29, 3, '2021-11-16', '2021-12-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (150, 1, 30, 2, '2021-12-29', '2022-01-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (151, 11, 30, 4, '2022-01-25', '2022-03-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (152, 4, 8, 1, '2022-01-01', '2022-01-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (153, 7, 31, 4, '2022-01-06', '2022-01-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (154, 1, 6, 3, '2022-01-07', '2022-02-05');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (155, 11, 9, 4, '2021-10-22', '2021-11-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (156, 15, 11, 1, '2021-10-21', '2021-11-29');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (157, 17, 37, 3, '2022-01-03', '2022-02-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (158, 9, 11, 3, '2022-01-02', '2022-01-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (159, 3, 12, 6, '2021-10-05', '2021-11-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (160, 5, 38, 4, '2021-11-11', '2021-12-01');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (161, 2, 33, 1, '2021-12-09', '2021-12-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (162, 6, 12, 6, '2021-11-20', '2021-12-15');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (163, 17, 48, 3, '2021-12-06', '2021-12-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (164, 12, 38, 2, '2021-12-10', '2022-01-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (165, 7, 23, 5, '2021-12-15', '2022-01-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (166, 13, 23, 4, '2021-12-11', '2022-01-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (167, 1, 39, 4, '2021-12-04', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (168, 3, 39, 5, '2022-01-02', '2022-02-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (169, 4, 2, 3, '2021-11-24', '2022-01-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (170, 14, 2, 1, '2021-11-09', '2021-12-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (171, 13, 41, 6, '2021-11-25', '2021-12-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (172, 16, 49, 1, '2021-10-24', '2021-11-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (173, 14, 30, 6, '2021-11-16', '2021-12-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (174, 11, 30, 4, '2022-01-01', '2022-02-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (175, 16, 1, 3, '2021-10-24', '2021-11-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (176, 14, 1, 4, '2021-12-28', '2022-01-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (177, 12, 48, 2, '2021-11-01', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (178, 16, 7, 4, '2022-01-10', '2022-02-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (179, 17, 35, 2, '2021-12-24', '2022-01-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (180, 5, 24, 3, '2021-10-07', '2021-11-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (181, 9, 22, 6, '2021-11-29', '2022-01-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (182, 9, 35, 5, '2021-12-02', '2021-12-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (183, 1, 22, 2, '2021-11-18', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (184, 3, 49, 5, '2021-11-14', '2021-11-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (185, 14, 36, 4, '2021-10-05', '2021-10-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (186, 5, 36, 3, '2022-01-18', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (187, 3, 46, 5, '2021-10-20', '2021-12-01');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (188, 7, 5, 6, '2021-10-15', '2021-11-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (189, 10, 12, 5, '2021-11-29', '2021-12-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (190, 16, 5, 5, '2021-12-14', '2022-01-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (191, 14, 10, 6, '2021-10-06', '2021-10-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (192, 7, 27, 4, '2021-10-17', '2021-11-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (193, 5, 24, 2, '2021-11-25', '2021-12-29');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (194, 7, 41, 1, '2021-12-13', '2021-12-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (195, 13, 45, 6, '2021-11-14', '2021-12-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (196, 13, 38, 2, '2021-10-06', '2021-10-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (197, 5, 10, 2, '2021-10-29', '2021-11-17');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (198, 12, 33, 3, '2021-12-08', '2022-01-15');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (199, 17, 7, 6, '2021-10-31', '2021-11-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (200, 6, 35, 3, '2021-12-30', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (201, 1, 35, 6, '2022-01-29', '2022-02-19');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (202, 1, 23, 6, '2021-10-05', '2021-10-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (203, 12, 33, 1, '2021-11-11', '2021-12-22');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (204, 15, 1, 4, '2021-12-06', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (205, 13, 7, 5, '2021-12-01', '2022-01-07');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (206, 5, 7, 5, '2021-11-21', '2021-12-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (207, 6, 5, 1, '2021-10-15', '2021-11-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (208, 7, 7, 2, '2021-12-12', '2022-01-12');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (209, 16, 43, 4, '2021-12-14', '2022-01-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (210, 1, 8, 6, '2021-10-21', '2021-10-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (211, 14, 24, 4, '2022-01-29', '2022-03-09');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (212, 12, 24, 3, '2022-01-07', '2022-02-10');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (213, 3, 18, 2, '2021-10-08', '2021-10-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (214, 12, 18, 5, '2021-12-06', '2021-12-29');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (215, 9, 8, 5, '2022-01-03', '2022-02-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (216, 10, 39, 1, '2021-12-17', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (217, 10, 47, 1, '2021-12-31', '2022-01-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (218, 1, 50, 1, '2021-10-19', '2021-11-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (219, 8, 36, 1, '2021-11-27', '2021-12-27');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (220, 9, 17, 2, '2021-11-14', '2021-12-20');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (221, 17, 18, 6, '2022-01-20', '2022-02-21');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (222, 7, 18, 3, '2021-11-15', null);
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (223, 15, 17, 1, '2021-11-04', '2021-12-15');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (224, 16, 41, 6, '2022-01-23', '2022-02-18');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (225, 11, 41, 2, '2021-10-16', '2021-11-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (226, 3, 17, 2, '2021-12-08', '2021-12-24');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (227, 6, 45, 3, '2021-12-16', '2022-01-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (228, 6, 1, 4, '2021-11-18', '2021-12-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (229, 13, 31, 6, '2022-01-15', '2022-02-05');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (230, 17, 50, 1, '2022-01-17', '2022-02-16');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (231, 15, 33, 1, '2021-11-28', '2021-12-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (232, 11, 6, 4, '2021-10-05', '2021-10-30');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (233, 9, 17, 4, '2021-12-05', '2022-01-03');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (234, 11, 17, 1, '2021-10-20', '2021-11-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (235, 4, 3, 5, '2021-10-08', '2021-10-28');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (236, 9, 7, 2, '2021-11-07', '2021-12-11');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (237, 16, 41, 3, '2021-12-11', '2021-12-26');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (238, 13, 41, 2, '2021-10-22', '2021-11-23');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (239, 9, 6, 1, '2022-01-17', '2022-03-01');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (240, 2, 6, 2, '2021-11-17', '2021-12-31');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (241, 1, 24, 4, '2021-10-21', '2021-11-13');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (242, 8, 24, 2, '2021-11-09', '2021-12-03');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (243, 9, 48, 5, '2021-11-29', '2022-01-06');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (244, 1, 6, 3, '2021-10-01', '2021-11-04');
INSERT INTO library.rents (id, agent, book, customer, rent_date, return_date) VALUES (245, 1, 6, 2, '2021-11-14', '2021-11-25');