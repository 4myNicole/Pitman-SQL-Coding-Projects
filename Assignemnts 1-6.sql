/* Assignment #1 */

SELECT * 
FROM tbl_habitat;

/* Assignment #2 */

SELECT species_name
FROM tbl_species
WHERE species_order = 3;

/* Assignment #3 */

SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600.00

/* Assignment #4 */

SELECT species_name
FROM tbl_nutrition
WHERE nutrition_id BETWEEN 2202 AND 2206

/* Assignment #5 */

SELECT sp.species_name AS 'Species Name', nu.nutrition_id AS 'Nutrition Type'
FROM tbl_species AS sp
INNER JOIN tbl_nutrition AS nu
ON nu.nutrition_id = sp.species_nutrition


/* Assignment #6 */

SELECT per.specialist_fname, per.specialist_lname, per.specialist_contact
FROM tbl_specialist AS per

INNER JOIN tbl_care as car
ON per.specialist_id = car.care_specialist

INNER JOIN tbl_species AS spe
ON car.care_id = spe.species_care

WHERE spe.species_name = 'penguin'
