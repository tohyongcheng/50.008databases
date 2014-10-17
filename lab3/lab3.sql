.mode column
.headers on

-- Question 1
SELECT COUNT(*) FROM copy;

-- Question 2
SELECT book, COUNT(*) FROM copy GROUP BY book;

-- Question 3

SELECT book, quantity
FROM (SELECT book, COUNT(*) as quantity FROM copy WHERE available = 1 GROUP BY book)
WHERE quantity = (SELECT MAX(quantity) FROM (SELECT book, COUNT(*) as quantity FROM copy WHERE available = 1 GROUP BY book));

-- Question 4
SELECT DISTINCT student.name FROM loan INNER JOIN student ON loan.borrower = student.email WHERE loan.book IN (SELECT ISBN13 FROM book WHERE authors LIKE "%Charles Dickens%");

-- Question 5

SELECT COUNT(*) FROM book WHERE authors LIKE "%Charles Dickens%";

-- Question 6

SELECT name FROM student
INNER JOIN (
  SELECT borrower, COUNT(*) as quantity FROM (
    SELECT borrower, book
      FROM loan
      WHERE loan.book IN
        (SELECT ISBN13 FROM book WHERE authors = "Charles Dickens")
      GROUP BY borrower, book
    )
  GROUP BY borrower
) n1
ON student.email = n1.borrower WHERE (n1.quantity = (SELECT COUNT(*) as quantity FROM book WHERE authors = "Charles Dickens"));


-- Question 7

SELECT name from student WHERE NOT EXISTS
(SELECT * FROM Book WHERE authors = "Charles Dickens" AND ISBN13 NOT IN (SELECT book FROM loan WHERE borrower = student.email ));


-- Question 8

SELECT name FROM student
INNER JOIN (
  SELECT borrower, COUNT(*) as quantity FROM (
    SELECT borrower, book
      FROM loan
      WHERE loan.book IN
        (SELECT ISBN13 FROM book WHERE authors = "C. J. Date")
      GROUP BY borrower, book
    )
  GROUP BY borrower
) n1
ON student.email = n1.borrower WHERE (n1.quantity = (SELECT COUNT(*) as quantity FROM book WHERE authors = "C. J. Date"));


SELECT name from student WHERE NOT EXISTS
(SELECT * FROM Book WHERE authors = "C. J. Date" AND ISBN13 NOT IN (SELECT book FROM loan WHERE borrower = student.email ));


-- There are 0 results for the first query, but 100 results for the second query. The first query is right, and the second query gives 100 results because we are finding the students who are not in the group that have not borrowed books by C. J. Date. Since there are no books by C J Date, then the statement fails because the students who have not borrowed any C J Books are all the students.



-- Question 9
CREATE VIEW copy_cs AS
SELECT * FROM copy where owner IN (SELECT email from student WHERE department="Computer Science");

CREATE VIEW loan_cs AS
SELECT * FROM loan where owner IN (SELECT email from student WHERE department="Computer Science");

SELECT COUNT(*) FROM copy_cs;  # returned 284
SELECT COUNT(*) FROM copy;     # returned 1244

SELECT COUNT(*) FROM loan_cs;  # returned 1136
SELECT COUNT(*) FROM loan;     # returned 3976


-- Question 10
CREATE TRIGGER propagate AFTER UPDATE ON student
FOR EACH ROW
BEGIN
  UPDATE loan SET borrower = NEW.email WHERE borrower = OLD.email;
END;