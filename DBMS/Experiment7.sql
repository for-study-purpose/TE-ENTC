CREATE DATABASE IF NOT EXISTS assi7;
USE assi7;

-- Create the source table with old roll numbers
CREATE TABLE old_roll (
    roll INT,
    name VARCHAR(10)
);

-- Create the destination table with new roll numbers
CREATE TABLE new_roll (
    roll INT,
    name VARCHAR(10)
);

-- Verify that the tables were created
SHOW TABLES;

-- Insert data into the old_roll table
INSERT INTO old_roll (roll, name) VALUES
(4, 'smruti'),
(3, 'siya'),
(2, 'riya'),
(1, 'tanu');

-- Insert data into the new_roll table
INSERT INTO new_roll (roll, name) VALUES
(5, 'ruruja'),
(2, 'riya'),
(1, 'tanu');

-- Display the initial state of the tables before running the procedure
SELECT * FROM old_roll;
SELECT * FROM new_roll;

-- Change the delimiter for procedure creation
DELIMITER $$

CREATE PROCEDURE roll_list()
BEGIN
    -- Declare variables for cursor values
    DECLARE oldrollnumber INT;
    DECLARE oldname VARCHAR(10);
    DECLARE newrollnumber INT;
    DECLARE newname VARCHAR(10);
    
    -- Declare a flag to signal the end of a cursor loop
    DECLARE done INT DEFAULT FALSE;

    -- Declare the cursors for each table
    DECLARE c1 CURSOR FOR SELECT roll, name FROM old_roll;
    DECLARE c2 CURSOR FOR SELECT roll, name FROM new_roll;
    
    -- Declare a handler to set the 'done' flag when a cursor finds no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the outer cursor for the old_roll table
    OPEN c1;
    
    loop1: LOOP
        -- Fetch a record from the old_roll table
        FETCH c1 INTO oldrollnumber, oldname;
        
        -- If no more rows in old_roll, exit the outer loop
        IF done THEN
            LEAVE loop1;
        END IF;

        -- Open the inner cursor to scan the new_roll table for each old_roll record
        OPEN c2;
        
        loop2: LOOP
            -- Fetch a record from the new_roll table
            FETCH c2 INTO newrollnumber, newname;
            
            -- This block executes if the inner cursor (c2) reaches its end
            IF done THEN
                -- Insert the record from old_roll because no match was found
                INSERT INTO new_roll VALUES (oldrollnumber, oldname);
                -- IMPORTANT: Reset the 'done' flag before leaving the inner loop
                SET done = FALSE; 
                CLOSE c2;
                LEAVE loop2;
            END IF;
            
            -- If a matching roll number is found, leave the inner loop and check the next old_roll
            IF oldrollnumber = newrollnumber THEN
                CLOSE c2;
                LEAVE loop2;
            END IF;
        END LOOP loop2;
        
    END LOOP loop1;
    
    -- Close the outer cursor
    CLOSE c1;
END$$

-- Reset the delimiter
DELIMITER ;

-- Execute the stored procedure
CALL roll_list();

-- Show the final contents of the new_roll table
SELECT * FROM new_roll;