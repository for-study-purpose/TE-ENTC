-- Create and use the library7 database
CREATE DATABASE IF NOT EXISTS library7;
USE library7;

-- 1. TABLE SETUP

-- Create the main table to hold book data
CREATE TABLE lib_audit (
    bookid INT,
    bookname VARCHAR(20),
    price INT
);

-- Create an audit table to log changes
CREATE TABLE lib_audit_record (
    bookid INT,
    bookname VARCHAR(20),
    price INT
);

-- Verify that tables were created
SHOW TABLES;


-- 2. INITIAL DATA AND DELETE TRIGGER

-- Insert initial data into the main table
INSERT INTO lib_audit (bookid, bookname, price) VALUES
(1, 'dbms', 200),
(2, 'eft',  300),
(3, 'mc',   100);

-- Show initial data
SELECT * FROM lib_audit;

-- Change the delimiter for trigger creation
DELIMITER $$

-- Create a trigger to log a record BEFORE it is deleted from lib_audit
CREATE TRIGGER before_delete_lib_audit
BEFORE DELETE ON lib_audit
FOR EACH ROW
BEGIN
    INSERT INTO lib_audit_record (bookid, bookname, price)
    VALUES (OLD.bookid, OLD.bookname, OLD.price);
END$$

-- Reset the delimiter
DELIMITER ;


-- =================================================================
-- 3. TESTING THE DELETE TRIGGER
-- =================================================================

-- Show the audit record table (it should be empty initially)
SELECT * FROM lib_audit_record;

-- Disable safe updates mode to allow deletes without a primary key in the WHERE clause
SET SQL_SAFE_UPDATES = 0;

-- Delete a row by bookid (this will trigger the logging)
DELETE FROM lib_audit WHERE bookid = 3;

-- Insert a new row and then delete it by bookname (this will also trigger logging)
INSERT INTO lib_audit (bookid, bookname, price) VALUES (4, 'CS', 350);
DELETE FROM lib_audit WHERE bookname = 'CS';

-- Show the audit record table to see the logged deletions
SELECT * FROM lib_audit_record;


-- 4. UPDATE TRIGGER AND TESTING

-- Change the delimiter for trigger creation
DELIMITER $$

-- Create a trigger to log the old version of a record BEFORE it is updated
CREATE TRIGGER before_update_lib_audit
BEFORE UPDATE ON lib_audit
FOR EACH ROW
BEGIN
    INSERT INTO lib_audit_record (bookid, bookname, price)
    VALUES (OLD.bookid, OLD.bookname, OLD.price);
END$$

-- Reset the delimiter
DELIMITER ;

-- Update a row in the main table (this will trigger the logging)
UPDATE lib_audit SET bookname = 'SS' WHERE bookid = 1;


-- 5. FINAL STATE VERIFICATION

-- Show the final state of the main table
SELECT * FROM lib_audit;

-- Show the final state of the audit table with all logged records
SELECT * FROM lib_audit_record;