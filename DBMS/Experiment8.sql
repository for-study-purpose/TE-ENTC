-- Create and switch to the new database
CREATE DATABASE IF NOT EXISTS exam;
USE exam;

-- Define, populate, and update the student marks table

-- Create the table to hold student marks
CREATE TABLE stud_marks (
    roll_no INT PRIMARY KEY,
    name CHAR(10),
    total_marks INT
);

-- Insert initial records into the table
INSERT INTO stud_marks (roll_no, name, total_marks) VALUES
(101, 'Siya', 940),
(102, 'Riya', 356),
(103, 'priya', 450),
(104, 'rutu', 675),
(105, 'Smruti', 1300),
(106, 'simran', 250);

-- Update specific records after initial insertion
UPDATE stud_marks SET total_marks = 830 WHERE roll_no = 103;
UPDATE stud_marks SET total_marks = 750 WHERE roll_no = 106;

-- Create the table to store the calculated results
CREATE TABLE result1 (
    roll_no INT,
    name CHAR(30),
    class CHAR(50)
);


-- Stored Procedure and Function Definitions

-- Change delimiter for procedure creation
DELIMITER $$

-- Create a procedure to determine the class/grade based on marks
CREATE PROCEDURE proc_grade1(IN marks INT, OUT class CHAR(50))
BEGIN
    IF marks <= 1500 AND marks >= 990 THEN
        SET class = 'DISTINCTION';
    END IF;
    IF marks <= 989 AND marks >= 900 THEN
        SET class = 'FIRST CLASS';
    END IF;
    IF marks <= 899 AND marks >= 825 THEN
        SET class = 'HIGHER SECOND CLASS';
    END IF;
    IF marks <= 824 AND marks >= 750 THEN
        SET class = 'SECOND CLASS';
    END IF;
    IF marks <= 749 AND marks >= 650 THEN
        SET class = 'PASS CLASS';
    END IF;
    IF marks < 650 THEN
        SET class = 'FAIL';
    END IF;
END$$

-- Change delimiter for function creation
DELIMITER $$

-- Create a function that uses the procedure to insert a result row
CREATE FUNCTION find_result1(roll_in INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE fmarks INT;
    DECLARE stud_name CHAR(10);
    DECLARE grade CHAR(50); -- Match the size of the OUT parameter and table column

    -- Get student details from the marks table
    SELECT total_marks, name INTO fmarks, stud_name
    FROM stud_marks WHERE roll_no = roll_in;

    -- Call the procedure to get the grade
    CALL proc_grade1(fmarks, grade);

    -- Insert the calculated result into the result1 table
    INSERT INTO result1 (roll_no, name, class) VALUES (roll_in, stud_name, grade);

    RETURN roll_in;
END$$

-- Reset the delimiter to default
DELIMITER ;


-- Script Execution and Final Output

-- Call the function for each student to populate the result1 table
-- The SELECT statements will display the returned roll number for each call
SELECT find_result1(101);
SELECT find_result1(102);
SELECT find_result1(103);
SELECT find_result1(104);
SELECT find_result1(105);
SELECT find_result1(106);

-- Display all initial student marks
SELECT * FROM stud_marks;

-- Display the final populated result table
SELECT * FROM result1;