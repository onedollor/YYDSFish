USE [Poker]
GO

DROP FUNCTION IF EXISTS [dbo].[fc_bigint_to_binary]
GO

CREATE FUNCTION [dbo].[fc_bigint_to_binary]
(
	@P_Input bigint
)
RETURNS varchar(255)
AS
BEGIN

	DECLARE @V_Output varchar(255) = ''

	WHILE @P_Input > 0 BEGIN

		SET @V_Output = @V_Output + CAST((@P_Input % 2) AS varchar)
		SET @P_Input = @P_Input / 2

	END

	RETURN RIGHT('0000000000000000000000000000000000000000000000000000000000000000'+REVERSE(@V_Output),64)

END