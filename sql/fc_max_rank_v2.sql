USE [Poker]
GO

/****** Object:  UserDefinedFunction [dbo].[fc_max_rank_v2]    Script Date: 9/11/2023 8:54:58 AM ******/
DROP FUNCTION IF EXISTS [dbo].[fc_max_rank_v2]
GO

/****** Object:  UserDefinedFunction [dbo].[fc_max_rank_v2]    Script Date: 9/11/2023 8:54:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[fc_max_rank_v2]
(
	@p_c1 tinyint
   ,@p_c2 tinyint
   ,@p_f1 tinyint
   ,@p_f2 tinyint
   ,@p_f3 tinyint
   ,@p_turn tinyint
   ,@p_river tinyint
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @V_RK INT = 0
	;

	DECLARE @V_T_BITMASK TABLE 
	(
	  BITMASK BIGINT
	);

	INSERT INTO @V_T_BITMASK
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_turn)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_c2) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	UNION ALL
	SELECT POWER(CAST(2 AS BIGINT),@p_f1) | POWER(CAST(2 AS BIGINT),@p_f2) | POWER(CAST(2 AS BIGINT),@p_f3) | POWER(CAST(2 AS BIGINT),@p_turn) | POWER(CAST(2 AS BIGINT),@p_river)
	;

	SELECT @V_RK = MAX([R])
	  FROM [dbo].[T_CRank] R
	  JOIN @V_T_BITMASK BM
	    ON R.BITMASK = BM.BITMASK
	 WHERE 1=1
	;

	RETURN @V_RK

END
GO


