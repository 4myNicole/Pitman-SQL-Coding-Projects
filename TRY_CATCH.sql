DECLARE @animalName varchar(50)
DECLARE @errorString varchar(100)
DECLARE @results AS varchar(5)


SET @errorString = 'There are no ' +@animalName+ '''s found at this zoo.'

BEGIN TRY
SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
IF @results = 0
BEGIN
       RAISERROR(@errorString, 16,1) /*sev code levels*/
       RETURN
END
ELSE IF @results = 1
BEGIN
SELECT 
a1.species_name, a2.animalia_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
FROM tbl_species AS a1
INNER JOIN tbl_animalia AS a2 on a2.animalia_id = a1.species_animalia
INNER JOIN tbl_class AS a3 on a3.class_id = a1.species_ class
INNER JOIN tbl_order AS a4 on a4. order_id = a1.species_order
INNER JOIN tbl_habitat AS a5 on a5.habitat_id = a1.species_ habitat
INNER JOIN tbl_nutrition AS a6 on a6. nutrition_id = a1.species_nutrition
INNER JOIN tbl_care AS a7 on a7.care_id = a1.species_care
WHERE species_name = @animalName
;
END
END TRY

BEGIN CATCH
     SELECT @errorString = ERROR_MESSAGE()
     RAISERROR (@errorString, 10, 1)
END CATCH