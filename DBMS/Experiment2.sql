CREATE DATABASE IF NOT EXISTS TE_student;
USE TE_student;

CREATE TABLE TE_student (
    roll_no INT(5) PRIMARY KEY,
    name VARCHAR(30),
    email_id VARCHAR(30),
    mobile_no CHAR(10),
    course VARCHAR(20)
);

DESC TE_student;

ALTER TABLE TE_student MODIFY mobile_no VARCHAR(20);
ALTER TABLE TE_student CHANGE mobile_no Mobile_No VARCHAR(10);

INSERT INTO TE_student VALUES(7, 'Siddhi', 'siddhichaudhari678@gmail.com', '9134990874', 'CN');
INSERT INTO TE_student VALUES(9, 'Nikita', 'nikitadahake0811@gmail.com', '9970954156', 'CN');
INSERT INTO TE_student VALUES(10, 'Sanika', 'sanika09@gmail.com', '9134990874', 'CN');

SELECT * FROM TE_student;

DELETE FROM TE_student WHERE name = 'Sanika';
SELECT * FROM TE_student;

TRUNCATE TABLE TE_student;
SELECT * FROM TE_student;

DROP TABLE TE_student;

-- Re-creating table for view operations
CREATE TABLE TE_student (
    roll_no INT(5) PRIMARY KEY,
    name VARCHAR(30),
    email_id VARCHAR(30),
    Mobile_No CHAR(10),
    course VARCHAR(20)
);

INSERT INTO TE_student VALUES(7, 'Siddhi', 'siddhichaudhari678@gmail.com', '9134990874', 'CN');
INSERT INTO TE_student VALUES(9, 'Nikita', 'nikitadahake0811@gmail.com', '9970954156', 'CN');
INSERT INTO TE_student VALUES(10, 'Sanika', 'sanika09@gmail.com', '9134990874', 'CN');

CREATE VIEW v1 AS
SELECT roll_no, name
FROM TE_student
WHERE course = 'CN';

SELECT * FROM v1;

CREATE VIEW v2 AS
SELECT * FROM TE_student;

UPDATE v2 SET name = 'Smruti' WHERE roll_no = 7;
SELECT * FROM v2;

UPDATE TE_student SET name = 'Sakshi' WHERE roll_no = 9;
SELECT * FROM TE_student;

-- Creating and populating the 'studinfo' table
CREATE TABLE studinfo (
    roll_no INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(30),
    Mobile_no VARCHAR(10)
);

DESC studinfo;

INSERT INTO studinfo (Name, Mobile_no) VALUES ('Siddhi', '9078563909');
INSERT INTO studinfo (Name, Mobile_no) VALUES ('Nikita', '8976364090');
INSERT INTO studinfo (Name, Mobile_no) VALUES ('Sanika', '9980800909');

SELECT * FROM studinfo;