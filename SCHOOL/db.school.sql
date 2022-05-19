CREATE DATABASE School;

CREATE TABLE Classes (
    Class_ID INT NOT NULL PRIMARY KEY,
    Class_name VARCHAR(225) NOT NULL
);

CREATE TABLE Students ( 
    Student_ID INT NOT NULL PRIMARY KEY,
    Student_Name VARCHAR(225),
    Class_ID INT FOREIGN KEY REFERENCES Classes(Class_ID)
);

CREATE TABLE Instructors (
    Instructor_ID INT PRIMARY KEY,
    Instructor_Name VARCHAR(225)
    Instructor_ID INT FOREIGN KEY REFERENCES Classes(Class_ID)
);

INSERT INTO Classes (Class_ID, Class_Name)

VALUES (
    1,'Software Developer Boot Camp'),
   (2,'C# Boot Camp');

INSERT INTO Students (Student_ID, Student_Name, Class_ID)

VALUES 
    (1,'Olivia Moore',2),
    (2,'Clive Babineaux',1),
    (3,'Ravi Chakrabarti',1),
    (4,'Major Lilywhite',1),
    (5,'Blaine McDonough',2),
    (6,'Peyton Charles',2);

INSERT INTO Instructors (Instructor_ID, Instructor_Name)

VALUES 
(1, 'Rose McIver'),
(2, 'Rahul Kohli'); 

SELECT Instructor_Name 
FROM Instructors;

SELECT Student_Name 
FROM Students
ORDER BY Student_Name;

SELECT * FROM Classes AS cla

INNER JOIN Students AS Stu
ON cla.Class_ID = stu.Class_ID

INNER JOIN Instructors AS Ins
ON cla.Class_ID = ins.Instructor_ID ;