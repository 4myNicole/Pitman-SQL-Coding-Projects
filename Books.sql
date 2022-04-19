CREATE DATBASE db_books;

USE db_books;

CREATE TABLE tbl_booktitles (
book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),  
book_title VARCHAR(255) NOT NULL
book_pages INT NOT NULL
book_cost MONEY NOT NULL
);

INSERT INTO tbl_booktitles
(book_title, book_pages, book_cost)
VALUES
('Charlie and the Chocolate Factory', 176, 10), 
('Harry Potter and the Prisoner of Azkaban', 317, 15),
('The Lightning Thief', 128, 13),
('Animal Farm', 112, 17),
('The Lord of the Rings', 1137, 20)
;


CREATE TABLE tbl_author (
author_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
author_fname VARCHAR(50) NOT NULL, 
author_lname VARCHAR(50) NOT NULL, 
author_contact VARCHAR(50) NOT NULL,
author_type INT  NOT NULL CONSTRAINT fk_type_id FOREIGN KEY REFERENCES tbl_booktitles(book_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_author
(author_fname, author_lname, author_contact)
VALUES
('Roald', 'Dahl', '098-765-4321'),
('Joanne', 'Rowling', '098-765-4321'),
('Rick', 'Riordan', '456-123-7890'),
('George', 'Orwell', '987-345-2423'),
('John', 'Tolkien', '765-338-9301')
;

SELECT * 
FROM tbl_author AS auth

INNER JOIN tbl_booktitles AS titl
ON auth.author_id ON titl.book_id

WHERE book_pages > 150;