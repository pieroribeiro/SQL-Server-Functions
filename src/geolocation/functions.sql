GO
/****** Object:  UserDefinedFunction [dbo].[DISTANCIA]    Script Date: 04/02/2019 11:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[DISTANCIA](
	@lat1	FLOAT(53), 
	@long1	FLOAT(53), 
	@lat2	FLOAT(53), 
	@long2	FLOAT(53)
) 
RETURNS FLOAT(53)
AS
BEGIN
    DECLARE @d2r		FLOAT(53),
			@dlong		FLOAT(53),
			@dlat		FLOAT(53),
			@temp_sin	FLOAT(53),
			@temp_cos	FLOAT(53),
			@temp_sin2	FLOAT(53),
			@a			FLOAT(53),
			@c			FLOAT(53)

    SET @d2r		= 0.017453292519943295769236
    SET @dlong		= (@long2 - @long1) * @d2r
    SET @dlat		= (@lat2 - @lat1) * @d2r
    SET @temp_sin	= SIN(@dlat/2.0)
    SET @temp_cos	= COS(@lat1 * @d2r)
    SET @temp_sin2	= SIN(@dlong/2.0)
    SET @a			= (@temp_sin * @temp_sin) + (@temp_cos * @temp_cos) * (@temp_sin2 * @temp_sin2)
    SET @c			= 2.0 * ATN2(SQRT(@a), SQRT(1.0 - @a))

    RETURN 6368.1 * @c
END
