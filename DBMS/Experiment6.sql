-- Create and use the library_db database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Create the borrower table to store book loan information
CREATE TABLE borrower (
    Roll_no INT PRIMARY KEY,
    name VARCHAR(20),
    Date_of_issue DATE,
    Name_of_book VARCHAR(20),
    Status CHAR(20)
);

-- Insert initial data into the borrower table
INSERT INTO borrower (Roll_no, name, Date_of_issue, Name_of_book, Status) VALUES
(1, 'abt', '2025-09-01', 'SEPM', 'I'),
(2, 'xyz', '2025-08-17', 'OOP', 'I'),
(3, 'pqr', '2025-06-29', 'DBMS', 'I'),
(4, 'def', '2025-08-30', 'DSA', 'I'),
(5, 'lmn', '2025-09-15', 'ADS', 'I');

-- Create the fine table to store calculated fines
CREATE TABLE fine (
    Roll_no INT,
    Return_Date DATE,
    Amount INT,
    FOREIGN KEY (Roll_no) REFERENCES borrower(Roll_no)
);

-- Change the delimiter to define the stored procedure
DELIMITER $$

-- Create the procedure to calculate the fine based on the return date
CREATE PROCEDURE calc_fine_lib(IN roll INT)
BEGIN
    -- Declare variables
    DECLARE fine1 INT;
    DECLARE noofdays INT;
    DECLARE issuedate DATE;

    -- Declare an exit handler for SQL exceptions
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'An SQL exception occurred. Please check the table definitions and data.' AS error_message;
    END;

    -- Get the issue date for the given roll number
    SELECT Date_of_issue INTO issuedate FROM borrower WHERE Roll_no = roll;

    -- Calculate the number of days the book has been held
    SELECT DATEDIFF(CURDATE(), issuedate) INTO noofdays;

    -- Calculate the fine based on the number of days
    IF noofdays > 30 THEN
        SET fine1 = ((noofdays - 30) * 50) + (15 * 5);
        INSERT INTO fine (Roll_no, Return_Date, Amount) VALUES (roll, CURDATE(), fine1);
    ELSEIF noofdays > 15 AND noofdays <= 30 THEN
        SET fine1 = (noofdays - 15) * 5;
        INSERT INTO fine (Roll_no, Return_Date, Amount) VALUES (roll, CURDATE(), fine1);
    ELSE
        -- No fine if returned within 15 days
        INSERT INTO fine (Roll_no, Return_Date, Amount) VALUES (roll, CURDATE(), 0);
    END IF;

    -- Update the borrower's status to 'Returned'
    UPDATE borrower SET Status = 'R' WHERE Roll_no = roll;

END$$

-- Reset the delimiter back to the default
DELIMITER ;

-- Call the procedure for each borrower to calculate their fine
CALL calc_fine_lib(1);
CALL calc_fine_lib(2);
CALL calc_fine_lib(3);
CALL calc_fine_lib(4);
CALL calc_fine_lib(5);

-- Display the contents of the borrower and fine tables to see the results
SELECT * FROM borrower;
SELECT * FROM fine;