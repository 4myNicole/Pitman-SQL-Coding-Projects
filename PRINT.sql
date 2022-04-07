PRINT 'Hello World'

DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5
PRINT CHAR(9) + 'I have ' + CONVERT(varchar(50),@var1) + CHAR(13) + 'dollars…' 
PRINT @var1 + @var2 

IF @var1 <= 3
   BEGIN
     PRINT 'Variable 1 is less than or equal to ' + CONVERT(varchar(5),@var1) + CHAR(13)
END
ELSE
   BEGIN
    PRINT 'Variable 1 is not less than or equal to ' + CONVERT(varchar(5),@var1) + CHAR(13)
END









/* NOTES
CHAR(13) moves next part down a line (enter key)
CHAR(9) indents the text (tab key)
@var1 + @var2 will add units as they are same data type and integers.
CONVERT(varchar(50),@var1) needs to be converted because its a different data type, need to convert to string

/*