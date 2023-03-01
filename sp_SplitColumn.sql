CREATE PROCEDURE sp_SlpitColumn @Cadena VARCHAR(MAX),@Delimitador VARCHAR(1) 
AS
begin
	DECLARE @Columnas VARCHAR(MAX) = '';
    DECLARE @SQL VARCHAR(MAX) = '';
    DECLARE @NumColumnas INT = (SELECT COUNT(*) FROM STRING_SPLIT(@Cadena, @Delimitador));
    DECLARE @I INT = 1;
    
    WHILE @I <= @NumColumnas
    BEGIN
        SET @Columnas = CONCAT(@Columnas, '[', @I, '], ');
        SET @I = @I + 1;
    END
    
    SET @Columnas = LEFT(@Columnas, LEN(@Columnas) - 2);
    PRINT (@COLUMNAS)
    SET @SQL = CONCAT('SELECT * FROM (
						SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS N, value AS Valor
						FROM STRING_SPLIT('+CHAR(39)+ @Cadena+CHAR(39)+','+CHAR(39)+@Delimitador+CHAR(39)+') AS T
						) AS S
						PIVOT(
							MAX(Valor) FOR N IN (', @Columnas, '])
						) AS P'
					);
	--PRINT (@SQL)	
EXEC(@SQL)
;
END;