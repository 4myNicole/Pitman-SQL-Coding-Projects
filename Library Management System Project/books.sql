CREATE DATABASE Bookshops; 

-- CREATING TABLES 

CREATE TABLE LIBRARY_BRANCH (
    BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    BranchName VARCHAR(225) NOT NULL,
    Address VARCHAR(225) NOT NULL
);
CREATE TABLE PUBLISHER (
    PublisherName VARCHAR(225) NOT NULL PRIMARY KEY,
    Address VARCHAR(225),
    Phone VARCHAR(225)
);

CREATE TABLE BOOKS (
    BookID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(225) NOT NULL,
    PublisherName VARCHAR(225) NOT NULL FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_COPIES ( 
    BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
    BranchID INT NOT NULL FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
    Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOK_AUTHORS (
    BOOKID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
    AuthorName VARCHAR(225) NOT NULL
); 

CREATE TABLE BORROWER ( 
    CardNo INT NOT NULL PRIMARY KEY,
    Name VARCHAR(225) NOT NULL,
    Address VARCHAR(225) NOT NULL,
    Phone VARCHAR(225) NOT NULL
);

 CREATE TABLE BOOK_LOANS (
     BookID INT NOT NULL FOREIGN KEY REFERENCES BOOKS(BookID),
     BranchID INT NOT NULL FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
     CardNo INT NOT NULL FOREIGN KEY REFERENCES BORROWER(CardNo),
     DateOut DATE NOT NULL,
     DateDue DATE NOT NULL
 );


-- INSERTING INTO TABLES 

INSERT INTO LIBRARY_BRANCH (BranchName,Address)
VALUES 
('Amys authors', '22 harry potter street'),
('Callums collections','18 hobbiton road'),
('Brads books','31 star wars lane'),
('Sharpstown','16 tao street'),
('Archies artist books ','8 yorkshire road'),
('Lunas limericks','1 white socks lane')
;

INSERT INTO BORROWER (CardNo, Name, Address, Phone)
VALUES
(1,'Steve Weave','Batten Street','555-123-321'),
(2,'Elina Bobina','Gribute Lane','555-321-123'),
(3,'Kay Hay','Cannon Road','555-987-789'),
(4,'Giedre Diedre','Skaite Street','555-789-987'),
(5,'Alexey Flexy','Dusaev Lane','555-456-654'),
(6,'Michal Schmihal','Bogucki Terrace','555-654-456'),
(7,'Derek Boberick','Lo Lane','555-345-543'),
(8,'Aga Taga','Oles Road','555-543-345')
;

INSERT INTO PUBLISHER (PublisherName, Address, Phone)
VALUES
('Aries','123 Ram Street','356-532-753'),
('Taurus','321 Bull Avenue','934-854-038'),
('Gemini','234 Twin Lane','523-746-157'),
('Cancer','432 Crab Court','059-254-857'),
('Leo','456 Lion Lane','642-836-364'),
('Virgo','654 Virgin Way','073-267-637'),
('Libra','567 Scale Street','738-957-745'),
('Scorpio','765 Scorpion street','274-847-467'),
('Capricorn','876 Goat Road','384-375-374'),
('Pisces','678 Fish Lane','846-274-756')
;

INSERT INTO BOOKS (Title, PublisherName)
VALUES
('The Lost Tribe','Aries'),
('Virtue','Taurus'),
('The 1619 Project','Gemini'),
('Harrow','Cancer'),
('Reprieve','Leo'),
('My Body','Virgo'),
('Everything and Less','Libra'),
('Beautiful World','Scorpio'),
('Palmares','Capricorn'),
('Billy Summers','Pisces'),
('Harlem Shuffle','Cancer'),
('Matrix','Scorpio'),
('Falling','Pisces'),
('Somebodys Daughter','Gemini'),
('The Other Black Girl','Leo'),
('Appleseed','Pisces'),
('An Ordinary Age','Taurus'),
('The Atmospherians','Libra'),
('Third Eye Rising','Libra'),
('Last Call','Gemini')
;

INSERT INTO BOOK_AUTHORS (BookID,AuthorName)
VALUES
(1,'Honorée Fanonne Jeffers'),
(2,'Lucy Caldwell'),
(3,'Danya Kukafka'),
(4,'Sarah Vaughan'),
(5,'Diane Chamberlain'),
(6,'Lucy Caldwell'),
(7,'Danya Kukafka'),
(8,'Lizzie Pook'),
(9,'Honorée Fanonne Jeffers'),
(10,'Jennifer Egan'),
(11,'Hanya Yanagihara'),
(12,'Danya Kukafka'),
(13,'Lizzie Pook'),
(14,'Lucy Caldwell'),
(15,'Janice Hallett'),
(16,'Lizzie Pook'),
(17,'Hanya Yanagihara'),
(18,'Janice Hallett'),
(19,'Jennifer Egan'),
(20,'Janice Hallett')
;

INSERT INTO BOOK_COPIES (Number_Of_Copies, BookID, BranchID)
VALUES
(2,1,1),
(7,2,4),
(20,3,6),
(23,4,2),
(15,5,3),
(99,6,6),
(102,7,2),
(22,8,1),
(3,9,1),
(10,10,2),
(200,11,3),
(100,12,3),
(37,13,4),
(27,14,6),
(83,15,1),
(93,16,2),
(48,17,1),
(28,18,5),
(69,19,5),
(4,20,5)
;

INSERT INTO BOOK_LOANS (BookID,BranchID,CardNo, DateOut, DateDue)
VALUES 
(20,6,8,'2022-04-01','2022-04-15'),
(14,4,4,'2022-04-05','2022-04-19'),
(10,3,4,'2022-05-07','2022-05-21'),
(3,2,3,'2022-03-20','2022-04-03'),
(8,1,2,'2022-01-21','2022-02-04'),
(4,5,1,'2022-02-28','2022-03-14'),
(12,2,7,'2022-04-09','2022-04-23'),
(1,1,6,'2022-03-10','2022-03-24'),
(6,6,4,'2022-03-15','2022-03-29'),
(9,6,1,'2022-04-14','2022-04-28')
;

-- QUERYING TABLES 

SELECT * FROM ((BOOK_LOANS 
FULL OUTER JOIN BORROWER 
ON BOOK_LOANS.CardNo = BORROWER.CardNo)
FULL OUTER JOIN BOOKS 
ON BOOK_LOANS.BookID = BOOKS.BOOKID);

-- CREATING STORED PROCEDURE 1

USE Bookshops
GO
CREATE PROCEDURE dbo.uspLostTribeSharpstown
AS

SELECT cop.Number_Of_Copies, boo.Title, bra.BranchName
FROM BOOK_COPIES AS cop

INNER JOIN LIBRARY_BRANCH as bra
ON cop.BranchID = bra.BranchID

INNER JOIN BOOKS AS boo
ON cop.BookID = boo.BookID

WHERE boo.Title = 'The Lost Tribe'
AND bra.BranchName = 'Sharpstown' 

GO
EXEC dbo.uspLostTribeSharpstown;

-- CREATING STORED PROCEDURE 2

USE Bookshops
GO
CREATE PROCEDURE dbo.uspLostTribe
AS
SELECT cop.Number_Of_Copies, bra.BranchName
FROM BOOK_COPIES AS cop

INNER JOIN LIBRARY_BRANCH as bra
ON cop.BranchID = bra.BranchID

INNER JOIN BOOKS AS boo
ON cop.BookID = boo.BookID

WHERE boo.Title = 'The Lost Tribe'
ORDER BY bra.BranchName GO
EXEC dbo.usp dbo.uspLostTribe;

-- CREATING STORED PROCEDURE 3

USE Bookshops
GO
CREATE PROCEDURE dbo.uspNoBooks
AS
SELECT Name 
FROM BORROWER
WHERE CardNo NOT IN (SELECT CardNo FROM BOOK_LOANS)
GO
EXEC dbo.usp dbo.uspNoBooks
