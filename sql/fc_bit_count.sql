USE [Poker]
GO

DROP FUNCTION IF EXISTS [dbo].[fc_bit_count]
GO

CREATE FUNCTION [dbo].[fc_bit_count]
(
	@P_Input BIGINT
)
RETURNS INT
AS
BEGIN
    DECLARE @V_BIT_COUNT INT = 0,
	        @V_BIT_POSITION INT = 0
	;

	WHILE @V_BIT_POSITION <= 62
	BEGIN
	    SET @V_BIT_COUNT = @V_BIT_COUNT + CASE WHEN @P_Input & POWER(CAST(2 AS BIGINT), @V_BIT_POSITION) > 0
		                                       THEN 1
											   ELSE 0 
										  END
		;

		SET @V_BIT_POSITION = @V_BIT_POSITION + 1
		;
	END

	RETURN @V_BIT_COUNT
END