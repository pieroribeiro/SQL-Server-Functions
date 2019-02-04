

/****** Object:  StoredProcedure [dbo].[PRGetReionalByLocation]    Script Date: 04/02/2019 11:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRGetReionalByLocation](
	@my_lat		DECIMAL(18,8) = '',
	@my_long	DECIMAL(18,8) = ''
)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN
	DECLARE @regional	VARCHAR(250)
	DECLARE @lat		DECIMAL(18,8)
	DECLARE @long		DECIMAL(18,8)
	DECLARE @TMPTABLE TABLE ([vcND_regional] varchar(250), [inNR_Distancia_km] NUMERIC(22,2))
	DECLARE @distancia NUMERIC(22,2)

	DECLARE location_cursor CURSOR FOR SELECT [vcND_Regional], [inNR_Latitude], [inNR_Longitude] FROM [TBSBT_Emissoras_Localizacao] (NOLOCK)  
	OPEN location_cursor; 
	FETCH NEXT FROM location_cursor INTO @regional, @lat, @long;  
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		SET @distancia = (SELECT [dbo].[DISTANCIA](@lat, @long, @my_lat, @my_long))
		INSERT INTO @TMPTABLE(
			[vcND_regional],
			[inNR_Distancia_km]
		)VALUES(
			@regional,
			@distancia
		)	

		FETCH NEXT FROM location_cursor INTO @regional, @lat, @long;  
	END  
  
	CLOSE location_cursor;
	DEALLOCATE location_cursor;
	
	SELECT TOP 1 * FROM @TMPTABLE
	ORDER BY
		[inNR_Distancia_km] ASC
END