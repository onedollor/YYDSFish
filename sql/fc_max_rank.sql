USE [Poker]
GO

/****** Object:  UserDefinedFunction [dbo].[fc_max_rank]    Script Date: 9/9/2023 2:22:38 PM ******/
DROP FUNCTION IF EXISTS [dbo].[fc_max_rank]
GO

/****** Object:  UserDefinedFunction [dbo].[fc_max_rank]    Script Date: 9/9/2023 2:22:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fc_max_rank]
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

	SELECT @V_RK = MAX([R])
	  FROM [Poker].[dbo].[T_CRank]	
	 WHERE 1=1
	   AND [C1] IN (@p_c1,@p_c2,@p_f1,@p_f2,@p_f3,@p_turn,@p_river)
	   AND [C2] IN (@p_c1,@p_c2,@p_f1,@p_f2,@p_f3,@p_turn,@p_river)
	   AND [C3] IN (@p_c1,@p_c2,@p_f1,@p_f2,@p_f3,@p_turn,@p_river)
	   AND [C4] IN (@p_c1,@p_c2,@p_f1,@p_f2,@p_f3,@p_turn,@p_river)
	   AND [C5] IN (@p_c1,@p_c2,@p_f1,@p_f2,@p_f3,@p_turn,@p_river)
	;

	RETURN @V_RK

END
GO


