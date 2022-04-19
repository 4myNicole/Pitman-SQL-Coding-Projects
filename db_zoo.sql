CREATE DATBASE db_zoo;

USE db_zoo;

CREATE TABLE tbl_animalia (
animalia_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),  
  
animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_animalia
(animalia_type)
VALUES
('vertebrate'), ('invertebrate');

CREATE TABLE tbl_class (
class_id INT PRIMARY KEY NOT NULL IDENTITY(100,1),
class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
(class_type)
VALUES
('bird'),
('reptilian'),
('mammal'),
('arthropod'),
('fish'),
('worm'),
('cnidaria'),
('echinoderm');

CREATE TABLE tbl_persons (
persons_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
persons_fname VARCHAR(50) NOT NULL, 
persons_lname VARCHAR(50) NOT NULL, 
persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
(persons_fname, persons_lname, persons_contact)
VALUES
('bob', 'belcher', '123-456-7890'),
('jimmy', 'pesto', '123-456-7890'),
('rudy', 'stieblitz', '123-456-7890'),
('logan', 'bush', '123-456-7890'),
('dottie', 'minerva', '123-456-7890')
;

UPDATE tbl_persons SET persons_fname = 'mars' WHERE persons_fname = 'bob';

DELETE FROM tbl_persons WHERE persons_lname = 'smith';

DROP TABLE tbl_persons; 

CREATE TABLE tbl_order (
order_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
order_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_care (
care_id VARCHAR(50) PRIMARY KEY NOT NULL,
care_type VARCHAR(50) NOT NULL,
care_specialist INT NOT NULL
); 

CREATE TABLE tbl_nutrition (
nutrition_id INT PRIMARY KEY NOT NULL IDENTITY(2200,1),
nutrition_type VARCHAR(50) NOT NULL,
nutrition_cost MONEY NOT NULL
);

CREATE TABLE tbl_habitat (
habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
habitat_type VARCHAR(50) NOT NULL,
habitat_cost MONEY NOT NULL
);

CREATE TABLE tbl_specialist (
specialist_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
specialist_fname VARCHAR(50) NOT NULL,
specialist_lname VARCHAR(50) NOT NULL,
specialist_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_order
(order_type)
VALUES
('carnivore'),
('herbivore'),
('omnivore')
;

INSERT INTO tbl_care
(care_id, care_type, care_specialist)
VALUES
('care_0', 'replace the straw', 1),
('care_1', 'repair or replace broken toys', 4),
('care_2', 'bottle feed vitamins', 1),
('care_3', 'human contact_pet subject', 2),
('care_4', 'clean up animal waste', 1),
('care_5', 'move subject to exercise pen', 3),
('care_6', 'drain and refill aquarium', 1),
('care_7', 'extensive dental work', 3)
;

INSERT INTO tbl_nutrition
(nutrition_type, nutrition_cost)
VALUES
('raw fish', 1500),
('living rodents', 600),
('mixture of fruits and rice', 800),
('warm bottle of milk', 600),
('syringe feed broth', 600),
('lard and seed mix', 300),
('aphids', 150),
('vitamins and marrow', 3500)
;

INSERT INTO tbl_habitat
(habitat_type, habitat_cost)
VALUES
('tundra', 40000),
('grassy gnoll with trees', 12000),
('10ft pond and rocks', 30000), 
('ice aquarium with snowy façade', 50000),
('short grass, shade and moat', 50000),
('netted forest atrium', 10000),
('jungle vines and winding branches', 15000),
('cliff with shaded cave', 15000)
;

INSERT INTO tbl_specialist
(specialist_fname, specialist_lname, specialist_contact)
VALUES
('spencer', 'reid', '123-456-7890'),
('jennifer', 'jareau', '123-456-0987'),
('emily', 'prentiss', '123-456-1234'),
('penelope', 'garcia', '123-456-4321'),
('derek', 'morgan', '123-456-5678')
;

CREATE TABLE tbl_species (
species_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
species_name VARCHAR(50) NOT NULL,
species_animalia INT  NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_class INT  NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_order INT  NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_habitat INT  NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_nutrition INT  NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE,
species_specialist INT  NOT NULL CONSTRAINT fk_specialist_id FOREIGN KEY REFERENCES tbl_specialist(specialist_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_species
(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
VALUES
('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
('panda', 1, 102, 3, 5006, 2202, 'care_4'),
('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
;

SELECT 
a1.species_name, a2.animalia_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
FROM tbl_species AS a1
INNER JOIN tbl_animalia AS a2 on a2.animalia_id = a1.species_animalia
INNER JOIN tbl_class AS a3 on a3.class_id = a1.species_class
INNER JOIN tbl_order AS a4 on a4.order_id = a1.species_order
INNER JOIN tbl_habitat AS a5 on a5.habitat_id = a1.species_habitat
INNER JOIN tbl_nutrition AS a6 on a6.nutrition_id = a1.species_nutrition
INNER JOIN tbl_care AS a7 on a7.care_id = a1.species_care
WHERE species_name = 'brown bear'
;





/*
NOTES

UPDATE tbl_class SET class_type = 'birds' WHERE class_type = 'bird'; -- change bird to birds perm

SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class; -- change bird to birds temp 

SELECT UPPER(class_type) FROM tlb_class WHERE class_type = 'bird'; -- puts result in uppercase

INT PRIMARY KEY NOT NULL IDENTITY(1,1),  -- (starting point, increment by 1)

INT  NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE -- fk is foreign key, reference tablename(tablecolumn), cascade: for when database is altered 

IF Exists (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_species)
DROP TABLE tbl_species, tbl_animals etc /* if tables exist, then drop/delete 
/*
