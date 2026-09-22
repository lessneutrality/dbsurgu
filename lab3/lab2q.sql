#1
SELECT * FROM reader;
#2
SELECT title, creation_date FROM book;
#3
SELECT * FROM book WHERE CAST(book.creation_date AS VARCHAR) LIKE '18%';
#4
SELECT * FROM book WHERE CAST(book.creation_date AS VARCHAR) BETWEEN '1917' AND '1991';
#5
SELECT * FROM reader WHERE phone_number = '+7-900-222-33-44';
#6
SELECT * FROM reader WHERE reader_name LIKE 'Ма%';
SELECT * FROM reader WHERE reader_name LIKE '%Ва%';
#7
UPDATE loan
SET actual_return_date = NULL
WHERE reader_id = 2;

SELECT * FROM loan WHERE actual_return_date IS NULL;
#8
SELECT title,creation_date FROM book ORDER BY title;
#9
INSERT INTO loan(reader_id,isbn,lend_date,expected_return_date,actual_return_date)
VALUES(1,'978-5-389-03713-7','2026-09-20','2026-09-27',NULL),(1,'978-5-04-116716-3','2026-09-21','2026-09-28',NULL);
SELECT * FROM loan WHERE actual_return_date IS NULL ORDER BY expected_return_date;
#10
SELECT * FROM book ORDER BY creation_date DESC LIMIT 3;#самые новые