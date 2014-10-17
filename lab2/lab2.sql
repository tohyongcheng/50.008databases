.mode column
.headers on

-- Question 1

SELECT email FROM student;

-- Question 2

SELECT DISTINCT email FROM student;

-- Question 3

SELECT name FROM student ORDER BY name DESC;

-- Question 4

-- SELECT s1.name FROM student s1, student s2 WHERE s1.name = s2.name AND s1.email <> s2.email;
SELECT name FROM student GROUP BY name HAVING COUNT(*)>1;

-- Question 5

SELECT DISTINCT name from student;
-- NO! IT IS NOT SORTED. WHY WHY!

-- Question 6
SELECT name FROM student s, copy c WHERE c.book = "978-0262033848" AND c.owner = s.email;

-- Question 7
SELECT name FROM student s WHERE email IN ( SELECT owner FROM copy WHERE book IN ( SELECT ISBN13 FROM book WHERE title LIKE "%Computer%" AND pages > 100));

-- Question 8
SELECT SUM(pages) FROM book WHERE ISBN13 IN ('978-0262033848', '978-0321295354');

-- Question 9
SELECT name FROM student WHERE email IN
(SELECT owner FROM copy WHERE book = "978-0262033848")
AND email IN
(SELECT owner FROM copy WHERE book <> "978-0262033848");


-- Question 10

SELECT name FROM student, loan WHERE loan.borrower = student.email AND loan.book = "978-0262033848";


-- SELECT name FROM student WHERE email IN (SELECT borrower FROM loan WHERE book = "978-0262033848");

-- Question 11

SELECT name FROM student, copy WHERE owner = email AND book = "978-0262033848" UNION
SELECT name FROM student, loan WHERE borrower = email AND loan.book = "978-0262033848";


-- Question 12

SELECT name FROM student
WHERE email IN (SELECT owner FROM copy WHERE book = "978-0262033848" )
OR email IN (SELECT borrower FROM loan WHERE book = "978-0262033848" );

-- Question 13

DELETE FROM loan;




