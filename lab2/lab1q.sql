#1
CREATE TABLE reader(
    reader_id SERIAL PRIMARY KEY,
    reader_name VARCHAR(255),
    phone_number VARCHAR(16)
);

CREATE TABLE book(
    ISBN VARCHAR(17) PRIMARY KEY,
    title VARCHAR(255),
    creation_date DATE
);

CREATE TABLE loan(
    loan_id SERIAL PRIMARY KEY,
    reader_id INT REFERENCES reader(reader_id),
    ISBN VARCHAR(17) REFERENCES book(ISBN),
    lend_date DATE,
    expected_return_date DATE,
    actual_return_date DATE
);

CREATE TABLE author(
    author_id SERIAL PRIMARY KEY,
    initials VARCHAR(255)
);

CREATE TABLE authorship(
    author_id INT REFERENCES author(author_id),
    ISBN VARCHAR(17) REFERENCES book(ISBN)
);

#2
INSERT INTO reader (reader_name, phone_number)
VALUES('Анна Петрова','+7-900-111-22-33'),('Иван Соколов','+7-900-222-33-44'),('Мария Ким','+7-900-333-44-55'),('Олег Васильев','+7-900-444-55-66');

INSERT INTO book(ISBN, title, creation_date)
VALUES('978-5-17-118366-8','Мастер и Маргарита','1967-09-15'),('978-5-389-06256-6','Преступление и наказание','1866-09-15'),('978-5-04-116716-3','Война и мир','1869-09-15'),('978-5-699-12014-7','Золотой теленок','1931-09-15'),('978-5-389-03713-7','Пикник на обочине','1972-09-15');

INSERT INTO author(initials)
VALUES('Михаил Булгаков'),('Федор Достоевский'),('Лев Толстой'),('Илья Ильф'),('Евгений Петров'),('Аркадий Стругацкий'),('Борис Стругацкий');

INSERT INTO authorship (author_id,ISBN)
VALUES (1,'978-5-17-118366-8'),(2,'978-5-389-06256-6'),(3,'978-5-04-116716-3'),(4,'978-5-699-12014-7'),(5,'978-5-699-12014-7'),(6,'978-5-389-03713-7'),(7,'978-5-389-03713-7');

INSERT INTO loan(reader_id,isbn,lend_date,expected_return_date,actual_return_date)
VALUES(1,'978-5-17-118366-8','2026-09-13','2026-09-20',NULL),(2,'978-5-389-06256-6','2026-09-12','2026-09-19',NULL),(3,'978-5-04-116716-3','2026-09-10','2026-09-17','2026-09-12'),(4,'978-5-04-116716-3','2026-09-15','2026-09-22','2026-09-21'),(4,'978-5-699-12014-7','2026-09-15','2026-09-22','2026-09-21'),(3,'978-5-389-03713-7','2026-09-16','2026-09-23','2026-09-19'),(3,'978-5-04-116716-3','2026-09-17','2026-09-24','2026-09-21');

#4
UPDATE reader
SET phone_number = '+7-922-111-22-33'
WHERE reader_id = 1;

UPDATE loan
SET actual_return_date = '2026-09-20'
WHERE reader_id = 2;

DELETE FROM loan
WHERE reader_id = 1;