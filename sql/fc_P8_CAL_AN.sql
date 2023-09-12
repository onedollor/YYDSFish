USE [Poker]
GO

/****** Object:  UserDefinedFunction [dbo].[fc_P8_CAL_AN]    Script Date: 9/12/2023 7:27:24 AM ******/
DROP FUNCTION IF EXISTS [dbo].[fc_P8_CAL_AN]
GO

/****** Object:  UserDefinedFunction [dbo].[fc_P8_CAL_AN]    Script Date: 9/12/2023 7:27:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fc_P8_CAL_AN]
(	
	@P_Win_Rate_Min float
   ,@P_Win_Rate_Max float
)
RETURNS TABLE 
AS
RETURN 
(
SELECT [P_C1_STR]
      ,[P_C2_STR]
      ,CASE WHEN [P_C1_STR]='A' 
           THEN 14
		   WHEN [P_C1_STR]='K'  
		   THEN 13
		   WHEN [P_C1_STR]='Q'  
		   THEN 12
		   WHEN [P_C1_STR]='J'  
		   THEN 11
		   WHEN [P_C1_STR]='T'  
		   THEN 10
		   ELSE CAST([P_C1_STR] AS INT)
	   END AS [P_C1_ORDER]
	  ,CASE WHEN [P_C2_STR]='A' 
           THEN 14
		   WHEN [P_C2_STR]='K'  
		   THEN 13
		   WHEN [P_C2_STR]='Q'  
		   THEN 12
		   WHEN [P_C2_STR]='J'  
		   THEN 11
		   WHEN [P_C2_STR]='T'
		   THEN 10
		   ELSE CAST([P_C2_STR] AS INT)
	   END AS [P_C2_ORDER]
      ,[Color]
      ,[Win]
      ,[Total]
      ,[Win_Rate_Threshold_Min]
      ,[Win_Rate_Threshold_3BB]
      ,[Win_Rate]
  FROM [Poker].[dbo].[vw_P8_CAL]
  where [Win_Rate] BETWEEN ISNULL(@P_Win_Rate_Min,0) AND ISNULL(@P_Win_Rate_Max,1)
)
GO


