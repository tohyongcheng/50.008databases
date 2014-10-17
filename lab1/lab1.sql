.mode column
.headers on

-- question 1
CREATE TABLE Books (
  title TEXT NOT NULL,
  format CHAR(20) CHECK (format='hardcover' OR format='paperback'),
  page_count INTEGER,
  authors CHAR(50),
  publisher CHAR(50),
  year INTEGER,
  edition CHAR(50),
  isbn10 CHAR(12) NOT NULL,
  isbn13 CHAR(15) NOT NULL,
  PRIMARY KEY (isbn10,isbn13)
);

-- question 2
INSERT into Books (title,format,page_count,authors,publisher,year,edition,isbn10,isbn13)
VALUES ('Database Management Systems', 'hardcover', 1104, "Raghu Ramakrishnan, Johannes Gehrke", "McGraw-Hill", 2002, "3rd edition", "0072465638", "978-0072465631" );


-- question 3
INSERT into Books (title,format,page_count,authors,publisher,year,edition,isbn10,isbn13)
VALUES ("A Guide to Ingres: A User's Guide to the Ingres Product (A Relational Database Management System With Built-in Application Development Facilities F)", 'hardcover', 398, "C. J. Date", "Addison-Wesley", 1987, "Repr. with corrections edition", "020106006X", "978-0201060065" );

INSERT into Books (title,format,page_count,authors,publisher,year,edition,isbn10,isbn13)
VALUES ('Fundamentals of Database Management Systems', 'hardcover', 416, "Mark L. Gillenson", "Wiley", 2011, "2nd edition", "0470624701", "978-0470624708" );

INSERT into Books (title,format,page_count,authors,publisher,year,edition,isbn10,isbn13)
VALUES ('Distributed Database Management Systems: A Practical Approach', 'hardcover', 728, "Saeed K. Rahimi, Frank S. Haug", "Wiley-IEEE Computer Society Pr", 2010, "1st edition", "047040745X", "978-0470407455" );

INSERT into Books (title,format,page_count,authors,publisher,year,edition,isbn10,isbn13)
VALUES ('Database Management Systems-Designing & Building Business Applications', 'hardcover', 424, "Gerald V Post", "McGraw-Hill/Irwin", 2004, "3rd edition", "0072973129", "978-0072973129" );

INSERT into Books (title,format,page_count,authors,publisher,year,edition,isbn10,isbn13)
VALUES ('Database Management Systems', 'paperback', 310, "P.S. Gill", "I K International Publishing House", 2011, "2nd edition", "9381141215", "978-9381141212" );

-- question 4
SELECT * FROM Books;

-- question 5
UPDATE Books
SET authors="Christopher J. Date"
WHERE authors="C. J. Date";

-- question 6
SELECT title,authors,publisher,year,edition,isbn10,isbn13 FROM Books;

-- question 7
SELECT authors FROM Books;

-- question 8
SELECT title,authors FROM Books WHERE title LIKE "Database Management Systems";

-- question 9
ALTER TABLE Books ADD language CHAR(30) DEFAULT "english";

-- question 10
DELETE FROM Books WHERE authors LIKE "C% J% Date";

-- question 11
DROP TABLE Books;