-- TASK 1: CREATE TABLES
-- Create the following tables with the specified columns:
-- Member Table:
-- Member_ID (Primary Key): int
-- First_Name: varchar(20)
-- Last_Name: varchar(20)
-- Member_Location: varchar(20)
-- Member_Age: int
CREATE DATABASE Assignment;

USE Assignment;

CREATE TABLE Member_tbl (
    Member_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Member_Location VARCHAR(20) NOT NULL,
    Member_Age INT NOT NULL
);

-- Vehicle Table:
-- Vehicle_Registration (Primary Key): varchar(10)
-- Vehicle_Make: varchar(10)
-- Vehicle_Model: varchar(10)
-- Member_ID (Foreign Key): int
CREATE TABLE Vehicle_tbl (
    Vehicle_Registration VARCHAR(20) NOT NULL PRIMARY KEY,
    Vehicle_Make VARCHAR(10) NOT NULL,
    Vehicle_Model VARCHAR(10),
    Member_ID INT NOT NULL
);

ALTER TABLE Vehicle_tbl
MODIFY COLUMN Vehicle_Make VARCHAR(20) NOT NULL;

ALTER TABLE Vehicle_tbl
MODIFY COLUMN Vehicle_Model VARCHAR(20) NOT NULL;

-- Engineer Table:
-- Engineer_ID (Primary Key): int
-- First_Name: varchar(20)
-- Last_Name: varchar(20)
CREATE TABLE Engineer_table (
    Engineer_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL
);

-- Breakdown Table:
-- Breakdown_ID (Primary Key): int
-- Vehicle_Registration (Foreign Key): varchar(10)
-- Engineer_ID (Foreign Key): int
-- Breakdown_Date: date
-- Breakdown_Time: time
-- Breakdown_Location: varchar(20)
CREATE TABLE Breakdown_tbl (
    Breakdown_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Vehicle_Registration VARCHAR(10) NOT NULL,
    Engineer_ID INT NOT NULL,
    Breakdown_Date DATE NOT NULL,
    Breakdown_Time TIME NOT NULL,
    Breakdown_Location VARCHAR(20) NOT NULL,
    FOREIGN KEY (Vehicle_Registration) REFERENCES Vehicle_tbl (Vehicle_Registration),
    FOREIGN KEY (Engineer_ID) REFERENCES Engineer_table (Engineer_ID)
);

-- Using the ALTER command, set the foreign keys.

ALTER TABLE Vehicle_tbl
ADD CONSTRAINT fk_member_vehicle FOREIGN KEY (Member_ID) REFERENCES Member_tbl (Member_ID);

ALTER TABLE Breakdown_tbl
ADD CONSTRAINT fk_vehicle_breakdown FOREIGN KEY (Vehicle_Registration) REFERENCES Vehicle_tbl (Vehicle_Registration);

ALTER TABLE Breakdown_tbl
ADD CONSTRAINT fk_engineer_breakdown FOREIGN KEY (Engineer_ID) REFERENCES Engineer_table (Engineer_ID);

-- TASK 2: INSERT DATA
-- Insert the following data into the tables:
-- Member Table:
-- 5 records
INSERT INTO
    Member_tbl (
        First_Name,
        Last_Name,
        Member_Location,
        Member_Age
    )
VALUES (
        'Harry',
        'Potter',
        'Godric\'s Hollow',
        40
    ),
    (
        'Hermione',
        'Granger',
        'London',
        40
    ),
    (
        'Ron',
        'Weasley',
        'Ottery St Catchpole',
        40
    ),
    (
        'Albus',
        'Dumbledore',
        'Hogwarts',
        150
    ),
    (
        'Severus',
        'Snape',
        'Spinner\'s End',
        58
    );

SELECT * FROM Member_tbl;

-- Vehicle Table:
-- 8 records
INSERT INTO
    Vehicle_tbl (
        Vehicle_Registration,
        Vehicle_Make,
        Vehicle_Model,
        Member_ID
    )
VALUES ('REG1234', 'AMC', 'Pacer', 1),
    ('REG5678', 'Citroën', 'SM', 2),
    (
        'REG9101',
        'DeLorean',
        'DMC-12',
        3
    ),
    (
        'REG1121',
        'Saab',
        'Sonett III',
        4
    ),
    (
        'REG3141',
        'Lancia',
        'Stratos',
        5
    ),
    (
        'REG5161',
        'Bricklin',
        'SV-1',
        1
    ),
    (
        'REG7181',
        'Studebaker',
        'Avanti',
        2
    ),
    (
        'REG9202',
        'Reliant',
        'Scimitar GTE',
        3
    );

SELECT * FROM Vehicle_tbl;
-- Engineer Table:
-- 3 records
INSERT INTO
    Engineer_table (First_Name, Last_Name)
VALUES ('Scotty', 'Scott'), -- First engineer: Star Trek
    ('Tony', 'Stark'), -- Second engineer: Iron Man
    ('Doc', 'Brown');
-- Third engineer: Back to the Future
SELECT * FROM Engineer_table;

-- Breakdown Table:
-- 12 records
-- Ensure there are 2 breakdowns on the same day
-- Ensure there are 3 breakdowns in the same month
-- Ensure at least 3 vehicles have broken down more than once
INSERT INTO
    Breakdown_tbl (
        Vehicle_Registration,
        Engineer_ID,
        Breakdown_Date,
        Breakdown_Time,
        Breakdown_Location
    )
VALUES (
        'REG1234',
        4,
        '2024-09-15',
        '10:00:00',
        'London'
    ),
    (
        'REG9101',
        5,
        '2024-09-15',
        '14:30:00',
        'Oxford'
    ),
    (
        'REG5161',
        4,
        '2024-09-20',
        '09:00:00',
        'Godrics Hollow'
    ),
    (
        'REG5678',
        6,
        '2024-09-20',
        '12:45:00',
        'Edinburgh'
    ),
    (
        'REG1121',
        5,
        '2024-10-05',
        '11:15:00',
        'Hogwarts'
    ),
    (
        'REG3141',
        6,
        '2024-10-10',
        '16:20:00',
        'Spinners End'
    ),
    (
        'REG7181',
        4,
        '2024-11-01',
        '08:50:00',
        'London'
    ),
    (
        'REG9202',
        5,
        '2024-11-02',
        '17:35:00',
        'Manchester'
    ),
    (
        'REG1234',
        4,
        '2024-12-15',
        '10:00:00',
        'London'
    ),
    (
        'REG9101',
        6,
        '2024-12-18',
        '14:30:00',
        'Oxford'
    ),
    (
        'REG5161',
        4,
        '2024-12-20',
        '09:00:00',
        'Godrics Hollow'
    ),
    (
        'REG5678',
        6,
        '2024-12-25',
        '12:45:00',
        'Edinburgh'
    );

SELECT * FROM Breakdown_tbl;
-- Task 3: Perform Queries
-- 1.	Retrieve the first 3 members from the Member table.
SELECT * FROM Member_tbl LIMIT 3;
-- 2.	Retrieve 3 members, skipping the first 2.
SELECT * FROM Member_tbl LIMIT 3 OFFSET 2;
-- 3.	Retrieve all vehicles whose Vehicle_Model starts with 'S'.
SELECT Vehicle_Model FROM vehicle_tbl WHERE Vehicle_Model LIKE '%S%';
-- 4.	Retrieve all breakdowns that occurred between '2023-01-01' and '2023-06-30'.
SELECT *
FROM Breakdown_tbl
WHERE
    Breakdown_Date BETWEEN '2023-01-01' AND '2023-06-30';
-- 5.	Retrieve details of vehicles with three Vehicle_Registration of you own choice in the list –  for example vehicles with registration 'ABC123', 'XYZ789', 'ANZ789'.
SELECT *
FROM vehicle_tbl
WHERE
    Vehicle_Registration = 'REG5678'
    OR vehicle_Registration = 'REG9202';
-- 6. Retrieve the number of breakdowns each vehicle has had.
SELECT
    Vehicle_Registration,
    COUNT(*) AS Breakdown_Count
FROM Breakdown_tbl
GROUP BY
    Vehicle_Registration;
-- 7. Retrieve all members sorted by Member_Age in descending order.
SELECT * FROM Member_tbl ORDER BY Member_Age DESC;
-- 8. Retrieve all vehicles that are either 'Toyota' make or 'Honda' make, and the model starts with 'C’.
SELECT *
FROM Vehicle_tbl
WHERE (
        Vehicle_Make = 'Toyota'
        OR Vehicle_Make = 'Honda'
    )
    AND Vehicle_Model LIKE 'C%';
-- 9. Retrieve all engineers who do not have any breakdowns assigned (use LEFT JOIN and IS NULL).
SELECT e.Engineer_ID, e.First_Name, e.Last_Name
FROM
    Engineer_table e
    LEFT JOIN Breakdown_tbl b ON e.Engineer_ID = b.Engineer_ID
WHERE
    b.Engineer_ID IS NULL;
-- 10. Retrieve all members aged between 25 and 40.
SELECT * FROM Member_tbl WHERE Member_Age BETWEEN 25 AND 40;
-- 11. Retrieve all members whose First_Name starts with 'J' and Last_Name contains 'son'.
SELECT *
FROM Member_tbl
WHERE
    First_Name LIKE 'J%'
    AND Last_Name LIKE '%son%';
-- 12. Retrieve the top 5 oldest members.
SELECT * FROM Member_tbl ORDER BY Member_Age DESC LIMIT 5;
-- 13. Retrieve all vehicle registrations in uppercase.
SELECT UPPER(Vehicle_Registration) AS Vehicle_Registration
FROM Vehicle_tbl;
-- 14. Retrieve the details of all members along with the vehicles they own.
SELECT *
FROM Member_tbl
    JOIN Vehicle_tbl ON Member_tbl.Member_ID = Vehicle_tbl.Member_ID;
-- 15. Retrieve all members and any associated vehicles, including members who do not own any vehicles.
SELECT *
FROM Member_tbl
    LEFT JOIN Vehicle_tbl ON Member_tbl.Member_ID = Vehicle_tbl.Member_ID;
-- 16. Retrieve all vehicles and the associated members, including vehicles that are not owned by any members.
SELECT *
FROM Vehicle_tbl
    LEFT JOIN Member_tbl ON Vehicle_tbl.Member_ID = Member_tbl.Member_ID;
-- 17. Retrieve the number of breakdowns each member has had.
SELECT Member_tbl.Member_ID, Member_tbl.First_Name, Member_tbl.Last_Name, COUNT(Breakdown_tbl.Breakdown_ID) AS Breakdown_Count
FROM
    Member_tbl
    JOIN Vehicle_tbl ON Member_tbl.Member_ID = Vehicle_tbl.Member_ID
    JOIN Breakdown_tbl ON Vehicle_tbl.Vehicle_Registration = Breakdown_tbl.Vehicle_Registration
GROUP BY
    Member_tbl.Member_ID;
-- 18. Retrieve all breakdowns along with member first name and last name that occurred for vehicles owned by members aged over 50.
SELECT Breakdown_tbl.*, Member_tbl.First_Name, Member_tbl.Last_Name
FROM
    Breakdown_tbl
    JOIN Vehicle_tbl ON Breakdown_tbl.Vehicle_Registration = Vehicle_tbl.Vehicle_Registration
    JOIN Member_tbl ON Vehicle_tbl.Member_ID = Member_tbl.Member_ID
WHERE
    Member_tbl.Member_Age > 50;