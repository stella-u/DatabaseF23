/*
  Stella Ullman
  Lab 02 Part 2: SQL Script
  CSC 362 Database Systems F23
*/

-- drops conflicting databases before creating new
DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
-- specifies that we want to write to the 'school' database
USE school; 

CREATE TABLE instructors (
    Primary Key (instructor_id), -- sets the title of our primary key
    instructor_id    INT AUTO_INCREMENT, -- a self-populating int value
    inst_first_name  VARCHAR(20),
    inst_last_name   VARCHAR(20),
    campus_phone  VARCHAR(20)
);

INSERT INTO instructors (inst_first_name, inst_last_name, campus_phone)
VALUES
('Kira', 'Bentley',  '363-9948'),
('Timothy', 'Ennis',  '527-4992'),
('Shannon', 'Black',  '336-5992'),
('Estela', 'Rosales',  '322-6992');

SELECT * FROM instructors; -- displays all data in table instructor