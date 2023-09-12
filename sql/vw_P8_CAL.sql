USE [Poker]
GO

/****** Object:  View [dbo].[vw_P8_CAL]    Script Date: 9/12/2023 7:04:07 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_P8_CAL]
GO

/****** Object:  View [dbo].[vw_P8_CAL]    Script Date: 9/12/2023 7:04:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_P8_CAL]
AS
SELECT base.[P_C1_STR]
      ,base.[P_C2_STR]
	  ,base.Color
	  ,SUM(base.Win) AS Win
	  ,SUM(base.Total) AS Total
      ,1/8.0 as Win_Rate_Threshold_Min
	  ,1/5.0 as Win_Rate_Threshold_3BB
      ,SUM(base.Win) / cast(SUM(base.Total) as float) as Win_Rate
  FROM (
		SELECT CASE WHEN [P1_C1] % 13 < [P1_C2] % 13 
		            THEN SUBSTRING([P1_C1_STR],1,1) 
					ELSE SUBSTRING([P1_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P1_C1] % 13 < [P1_C2] % 13 
		            THEN SUBSTRING([P1_C2_STR],1,1)
					ELSE SUBSTRING([P1_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P1_C1_STR],3,1) = SUBSTRING([P1_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN 1=1
			             AND [P1_R_RK] > [P2_R_RK]
						 AND [P1_R_RK] > [P3_R_RK]
						 AND [P1_R_RK] > [P4_R_RK]
						 AND [P1_R_RK] > [P5_R_RK]
						 AND [P1_R_RK] > [P6_R_RK]
						 AND [P1_R_RK] > [P7_R_RK]
						 AND [P1_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P1_C1] % 13 < [P1_C2] % 13 
		            THEN SUBSTRING([P1_C1_STR],1,1) 
					ELSE SUBSTRING([P1_C2_STR],1,1)
			   END
			  ,CASE WHEN [P1_C1] % 13 < [P1_C2] % 13 
		            THEN SUBSTRING([P1_C2_STR],1,1)
					ELSE SUBSTRING([P1_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P1_C1_STR],3,1) = SUBSTRING([P1_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
        UNION ALL
		SELECT CASE WHEN [P2_C1] % 13 < [P2_C2] % 13 
		            THEN SUBSTRING([P2_C1_STR],1,1) 
					ELSE SUBSTRING([P2_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P2_C1] % 13 < [P2_C2] % 13 
		            THEN SUBSTRING([P2_C2_STR],1,1)
					ELSE SUBSTRING([P2_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P2_C1_STR],3,1) = SUBSTRING([P2_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P2_R_RK] > [P1_R_RK] 
			             AND 1=1
						 AND [P2_R_RK] > [P3_R_RK]
						 AND [P2_R_RK] > [P4_R_RK]
						 AND [P2_R_RK] > [P5_R_RK]
						 AND [P2_R_RK] > [P6_R_RK]
						 AND [P2_R_RK] > [P7_R_RK]
						 AND [P2_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P2_C1] % 13 < [P2_C2] % 13 
		            THEN SUBSTRING([P2_C1_STR],1,1) 
					ELSE SUBSTRING([P2_C2_STR],1,1)
			   END
			  ,CASE WHEN [P2_C1] % 13 < [P2_C2] % 13 
		            THEN SUBSTRING([P2_C2_STR],1,1)
					ELSE SUBSTRING([P2_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P2_C1_STR],3,1) = SUBSTRING([P2_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
        UNION ALL
		SELECT CASE WHEN [P3_C1] % 13 < [P3_C2] % 13 
		            THEN SUBSTRING([P3_C1_STR],1,1) 
					ELSE SUBSTRING([P3_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P3_C1] % 13 < [P3_C2] % 13 
		            THEN SUBSTRING([P3_C2_STR],1,1)
					ELSE SUBSTRING([P3_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P3_C1_STR],3,1) = SUBSTRING([P3_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P3_R_RK] > [P1_R_RK] 
			             AND [P3_R_RK] > [P2_R_RK]
						 AND 1=1
						 AND [P3_R_RK] > [P4_R_RK]
						 AND [P3_R_RK] > [P5_R_RK]
						 AND [P3_R_RK] > [P6_R_RK]
						 AND [P3_R_RK] > [P7_R_RK]
						 AND [P3_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P3_C1] % 13 < [P3_C2] % 13 
		            THEN SUBSTRING([P3_C1_STR],1,1) 
					ELSE SUBSTRING([P3_C2_STR],1,1)
			   END
			  ,CASE WHEN [P3_C1] % 13 < [P3_C2] % 13 
		            THEN SUBSTRING([P3_C2_STR],1,1)
					ELSE SUBSTRING([P3_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P3_C1_STR],3,1) = SUBSTRING([P3_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
		  UNION ALL
		SELECT CASE WHEN [P4_C1] % 13 < [P4_C2] % 13 
		            THEN SUBSTRING([P4_C1_STR],1,1) 
					ELSE SUBSTRING([P4_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P4_C1] % 13 < [P4_C2] % 13 
		            THEN SUBSTRING([P4_C2_STR],1,1)
					ELSE SUBSTRING([P4_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P4_C1_STR],3,1) = SUBSTRING([P4_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P4_R_RK] > [P1_R_RK] 
			             AND [P4_R_RK] > [P2_R_RK]
						 AND [P4_R_RK] > [P3_R_RK]
						 AND 1=1
						 AND [P4_R_RK] > [P5_R_RK]
						 AND [P4_R_RK] > [P6_R_RK]
						 AND [P4_R_RK] > [P7_R_RK]
						 AND [P4_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P4_C1] % 13 < [P4_C2] % 13 
		            THEN SUBSTRING([P4_C1_STR],1,1) 
					ELSE SUBSTRING([P4_C2_STR],1,1)
			   END
			  ,CASE WHEN [P4_C1] % 13 < [P4_C2] % 13 
		            THEN SUBSTRING([P4_C2_STR],1,1)
					ELSE SUBSTRING([P4_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P4_C1_STR],3,1) = SUBSTRING([P4_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
		  UNION ALL
		SELECT CASE WHEN [P5_C1] % 13 < [P5_C2] % 13 
		            THEN SUBSTRING([P5_C1_STR],1,1) 
					ELSE SUBSTRING([P5_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P5_C1] % 13 < [P5_C2] % 13 
		            THEN SUBSTRING([P5_C2_STR],1,1)
					ELSE SUBSTRING([P5_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P5_C1_STR],3,1) = SUBSTRING([P5_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P5_R_RK] > [P1_R_RK] 
			             AND [P5_R_RK] > [P2_R_RK]
						 AND [P5_R_RK] > [P3_R_RK]
						 AND [P5_R_RK] > [P4_R_RK]
						 AND 1=1
						 AND [P5_R_RK] > [P6_R_RK]
						 AND [P5_R_RK] > [P7_R_RK]
						 AND [P5_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P5_C1] % 13 < [P5_C2] % 13 
		            THEN SUBSTRING([P5_C1_STR],1,1) 
					ELSE SUBSTRING([P5_C2_STR],1,1)
			   END
			  ,CASE WHEN [P5_C1] % 13 < [P5_C2] % 13 
		            THEN SUBSTRING([P5_C2_STR],1,1)
					ELSE SUBSTRING([P5_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P5_C1_STR],3,1) = SUBSTRING([P5_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
		  UNION ALL
		SELECT CASE WHEN [P6_C1] % 13 < [P6_C2] % 13 
		            THEN SUBSTRING([P6_C1_STR],1,1) 
					ELSE SUBSTRING([P6_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P6_C1] % 13 < [P6_C2] % 13 
		            THEN SUBSTRING([P6_C2_STR],1,1)
					ELSE SUBSTRING([P6_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P6_C1_STR],3,1) = SUBSTRING([P6_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P6_R_RK] > [P1_R_RK] 
			             AND [P6_R_RK] > [P2_R_RK]
						 AND [P6_R_RK] > [P3_R_RK]
						 AND [P6_R_RK] > [P4_R_RK]
						 AND [P6_R_RK] > [P5_R_RK]
						 AND 1=1
						 AND [P6_R_RK] > [P7_R_RK]
						 AND [P6_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P6_C1] % 13 < [P6_C2] % 13 
		            THEN SUBSTRING([P6_C1_STR],1,1) 
					ELSE SUBSTRING([P6_C2_STR],1,1)
			   END
			  ,CASE WHEN [P6_C1] % 13 < [P6_C2] % 13 
		            THEN SUBSTRING([P6_C2_STR],1,1)
					ELSE SUBSTRING([P6_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P6_C1_STR],3,1) = SUBSTRING([P6_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
		  UNION ALL
		SELECT CASE WHEN [P7_C1] % 13 < [P7_C2] % 13 
		            THEN SUBSTRING([P7_C1_STR],1,1) 
					ELSE SUBSTRING([P7_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P7_C1] % 13 < [P7_C2] % 13 
		            THEN SUBSTRING([P7_C2_STR],1,1)
					ELSE SUBSTRING([P7_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P7_C1_STR],3,1) = SUBSTRING([P7_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P7_R_RK] > [P1_R_RK] 
			             AND [P7_R_RK] > [P2_R_RK]
						 AND [P7_R_RK] > [P3_R_RK]
						 AND [P7_R_RK] > [P4_R_RK]
						 AND [P7_R_RK] > [P5_R_RK]
						 AND [P7_R_RK] > [P6_R_RK]
						 AND 1=1
						 AND [P7_R_RK] > [P8_R_RK]
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P7_C1] % 13 < [P7_C2] % 13 
		            THEN SUBSTRING([P7_C1_STR],1,1) 
					ELSE SUBSTRING([P7_C2_STR],1,1)
			   END
			  ,CASE WHEN [P7_C1] % 13 < [P7_C2] % 13 
		            THEN SUBSTRING([P7_C2_STR],1,1)
					ELSE SUBSTRING([P7_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P7_C1_STR],3,1) = SUBSTRING([P7_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
		  UNION ALL
		SELECT CASE WHEN [P8_C1] % 13 < [P8_C2] % 13 
		            THEN SUBSTRING([P8_C1_STR],1,1) 
					ELSE SUBSTRING([P8_C2_STR],1,1)
			   END AS [P_C1_STR]
			  ,CASE WHEN [P8_C1] % 13 < [P8_C2] % 13 
		            THEN SUBSTRING([P8_C2_STR],1,1)
					ELSE SUBSTRING([P8_C1_STR],1,1) 
			   END AS [P_C2_STR]
			  ,CASE WHEN SUBSTRING([P8_C1_STR],3,1) = SUBSTRING([P8_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END AS Color
			  ,SUM(CASE WHEN [P8_R_RK] > [P1_R_RK] 
			             AND [P8_R_RK] > [P2_R_RK]
						 AND [P8_R_RK] > [P3_R_RK]
						 AND [P8_R_RK] > [P4_R_RK]
						 AND [P8_R_RK] > [P5_R_RK]
						 AND [P8_R_RK] > [P6_R_RK]
						 AND [P8_R_RK] > [P7_R_RK]
						 AND 1=1
						THEN 1
						ELSE 0
				   END) AS Win
			  ,COUNT(*) AS Total
		  FROM [dbo].[TC_P8_RHand]
		  GROUP BY 
			   CASE WHEN [P8_C1] % 13 < [P8_C2] % 13 
		            THEN SUBSTRING([P8_C1_STR],1,1) 
					ELSE SUBSTRING([P8_C2_STR],1,1)
			   END
			  ,CASE WHEN [P8_C1] % 13 < [P8_C2] % 13 
		            THEN SUBSTRING([P8_C2_STR],1,1)
					ELSE SUBSTRING([P8_C1_STR],1,1) 
			   END
			  ,CASE WHEN SUBSTRING([P8_C1_STR],3,1) = SUBSTRING([P8_C2_STR],3,1)
					THEN 's'
					ELSE 'o'
			   END
	  ) base
  GROUP BY 
       base.[P_C1_STR]
      ,base.[P_C2_STR]
	  ,base.Color
  --ORDER BY Win_Rate DESC
GO


