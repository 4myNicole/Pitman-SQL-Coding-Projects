DECLARE @totalHab MONEY;
DECLARE @totalNut MONEY;
DECLARE @results MONEY;
SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
SET @results = (@totalHab + @totalNut)
PRINT ( 
    CONVERT(VARCHAR(50),@totalHab) + char(9) + ' - The Total Habitat Cost' + char(13) + 
    CONVERT(VARCHAR(50),@totalNut) + char(9) + ' The Total Nutrition Cost ' + char(13) + '---------' + char(13) +
    CONVERT(VARCHAR(50),@results)
    );