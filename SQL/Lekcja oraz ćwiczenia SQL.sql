/* Ustawienie domyślnej bazy danych */
USE library;

/* Podstawowowe wyświetlenie danych */
-- Wyświetlenie wszystkiego
SELECT * FROM books;
-- Można pisać jakkolwiek, nawet jedno pod drugim. Liczą się słowa kluczowe z wielkich liter. Przykład na dole.
SELECT
      *
                  FROM
categories;

-- Wyświetlenie wybranej kolumny
SELECT author, title, publisher
FROM books;

-- Wyświetlenie unikatowych wierszy z SELECTA
SELECT DISTINCT publisher FROM books;

-- Ograniczenie ilości wyświetlanych wierszy
SELECT * FROM employees LIMIT 5;

-- Aliasy czyli "własna" nazwa kolumny
SELECT
	first_name AS imie,
    last_name AS nazwisko_klienta
FROM customers;

/*
1. Wszystko z rents
2. Imie, nazwisko, wynagrodzenie, data zatrudnienia z employees
3. title jako tytul, author jako id_autora z books
4. Unikatowe imiona pracownikow
5. Miasta z departments, bez powtorzen
*/

SELECT * FROM rents;
SELECT first_name, last_name, salary, hire_date FROM employees;
SELECT title AS tytul, author AS autor FROM books;
SELECT DISTINCT first_name FROM employees;
SELECT DISTINCT city FROM departments;

/*Sortowanie danych*/
-- Domyślne
SELECT * FROM books ORDER BY category;
SELECT * FROM books ORDER BY title;
SELECT * FROM books ORDER BY release_date;
SELECT * FROM categories ORDER BY description;

-- Sortowanie odwrotne
SELECT * FROM books ORDER BY publisher DESC;
SELECT * FROM books ORDER BY author DESC;
SELECT * FROM categories ORDER BY description DESC;

-- Sortowanie po więcej niż 1 kolumnie
SELECT * FROM employees ORDER BY department, salary DESC;

-- Sortowanie + LIMIT
SELECT * FROM books ORDER BY release_date DESC LIMIT 5;

/*
1. Ostatnie 10 wypożyczeń (rent_date) z tabeli rents
2. 3 najlepiej zarabiających pracowników o największyzm stażu (staż >> zarobki)
3. Kategorie po nazwie Z-A
4. Książki po wydawnictwie A-Z, dacie wydania od najmłodszej, ID autore rosnąco
5. Klientów po imieniu A-Z, nazwisku Z-A
6. Pracowników po wynagrodzeniu malejąco
*/

SELECT * FROM rents ORDER BY rent_date DESC LIMIT 10;
SELECT * FROM employees ORDER BY hire_date, salary DESC LIMIT 3;
SELECT * FROM categories ORDER BY name DESC;
SELECT * FROM books ORDER BY publisher, release_date DESC, author;
SELECT * FROM customers ORDER BY first_name, last_name DESC;
SELECT * FROM employees ORDER BY salary DESC;

/*Funkcje wbudowane*/
-- -- Funkcje tekstowe -- --
-- concat
SELECT concat('Ala ', 'ma ', 'kota') AS przyklad;
SELECT
	concat(first_name, ' ', last_name) AS klient
FROM customers;

-- upper/lower
SELECT
	title,
    upper(title) AS upper_title,
    lower(title) AS lower_title
FROM
	books;
    
-- substring
SELECT
	title AS baza,
    substring(title, 4) AS od_4_znaku,
	substring(title, 10) AS od_10_znaku,
	substring(title, 2, 5) AS od_2_znaku_dokladnie_piec
FROM
	books;

/*
1. Wyświetlić dwie kolumny z employees
	Piersza w schemacie: <imie> <nazwisko>
    Druga w schemacie: <oddzial> - <wynagrodzenie>
2. Wyświetlić imie klienta z wielkich, nazwisko z małych oraz email klienta
3. Wyświetlić od 3 DOKŁADNIE 2 znaki z nazwy oddziału oraz miasto z samych wielkich
*/

SELECT
	concat(first_name, ' ', last_name) AS pracownik,
    concat(department, ' - ', salary) AS oddział
FROM employees;

SELECT
	upper(first_name) AS fname,
	lower(last_name) AS lname,
    email
FROM customers;

SELECT substring(name, 3, 2) AS fragment, upper(city) AS miasto
FROM departments;

-- -- Funkcje daty i czasu -- --
-- now(), current_timestamp(), current_date(), current_time()
SELECT
	now(),
    current_date(),
    current_time(),
    current_timestamp();
    
-- day, month, year
SELECT
	day(now()),
    month(now()),
    year(now());
    
-- Daty podajemy w formacie stringa: YYYY-MM-DD
SELECT day('2023-06-01');

-- datediff
SELECT datediff('2023-06-18', '2023-06-01');
SELECT datediff('2023-06-01', '2023-06-018');

-- -- Funkcja length -- --
SELECT id, length(first_name), length(hire_date)
FROM employees;

/*
1. Oddzielnie: dzień, miesiąc, rok z daty zatrudnienia
2. Dlugość każdego tytułu oraz jego "staż" - jak stara jest książka w dniach
3. Miesiąc zatrudnienia pracownika
*/

SELECT
	day(hire_date),
    month(hire_date),
    year(hire_date)
FROM employees;

SELECT length(title), datediff(now(), release_date) FROM books;

SELECT
	month(hire_date)
FROM
	employees;
    
/* Filtrowanie/Selekcja */
-- Operatory arytmentyczne
SELECT *
FROM employees
WHERE salary > 10000;

SELECT * FROM employees WHERE month(hire_date) = 2;

-- Operator LIKE
-- % jako dowolna ilość dowolnych znaków
-- _ jako 1 dowolny znak (można powtarzać) np. __ <-- dokładnie 2 dowolne znaki itd.
SELECT * FROM books WHERE title LIKE '%zadania%';

-- AND | OR
SELECT * FROM employees WHERE salary <= 7000 AND department = 4;
SELECT * FROM books WHERE publisher = 'Helion' OR publisher = 'Bellona';
SELECT * FROM books WHERE category = 3 AND year(release_date) = 2020;
SELECT * FROM customers WHERE first_name LIKE 'A%' OR id > 5;

-- Obsługa NULLa ( IS NULL | IS NOT NULL )
SELECT * FROM categories WHERE description IS NULL;

-- Operator [NOT] BETWEEN... AND...
SELECT * FROM employees WHERE salary BETWEEN 8000 AND 10000;
-- To samo co wyżej ze znakiem =
SELECT * FROM employees WHERE salary >= 8000 AND salary <= 10000;

-- Operator [NOT] IN
SELECT * FROM book WHERE publisher = 'Helion' OR publisher = 'Bellona';
-- To samo co wyżej prościej
SELECT * FROM books WHERE publisher IN ('Helion', 'Bellona');

/*
1. Książki wydawnictwa MAG
2. Wypożyczenia z dowolnego lutego
3. Książki o tytule dłuższym niż 10 znaków
4. Pracowników z oddziału 5 oraz zatrudnionych w 2020
5. Kategorie o ID mniejszym niż 3 oraz zaczynającym się na literę B
6. Książki wydane w latach 2015-2019 (sam rok wystarczy)
7. Wypożyczenia, które nie zostały zwrócone
*/

SELECT * FROM books WHERE publisher = 'MAG';
SELECT * FROM rents WHERE month(rent_date) = 2;
SELECT * FROM books WHERE lenght(title) > 10;
SELECT * FROM employees WHERE department = 5 AND year(hire_date) = 2020;
SELECT * FROM categories WHERE id < 3 AND name LIKE 'B';
SELECT * FROM books WHERE year(release_date) BETWEEN 2015 AND 2019;
SELECT * FROM rents WHERE return_date IS NULL;

/* Łączenia tabel */
SELECT
	books.title,
	authors.first_name,
    authors.last_name,
    books.release_date
FROM
	books
JOIN
	authors ON books.author = authors.id;
    
SELECT
	customers.first_name,
    customers.last_name,
    books.title,
	rents.rent_date,
    rents.rent_date
FROM
	rents
JOIN
	customers ON rents.customer = customers.id
JOIN
	books ON books.id = rents.book;
    
/*
Wyświetlić:
imie, nazwisko, wynagrodzenie, nazwę oddziału, miasto pracownika
employees - first_name, last_name, salary
departments - name, city
*/

SELECT
    employees.first_name,
    employees.last_name,
    departments.name,
    departments.city
FROM
    employees
JOIN
    departments ON departments.id = employees.department;