USE [Poker]
GO

DROP PROCEDURE IF EXISTS dbo.SP_Load_TC_P8_RHand
GO

CREATE PROCEDURE dbo.SP_Load_TC_P8_RHand
(@P_Thread_id int)
AS
BEGIN
	IF @P_Thread_id NOT IN (1,2)
		RETURN

	DROP TABLE IF EXISTS #tmp_TC_P8_RHand
	;

	CREATE TABLE #tmp_TC_P8_RHand(
		[HandID] [bigint] NOT NULL,
		[P1_C1_STR] [varchar](255) NOT NULL,
		[P1_C2_STR] [varchar](255) NOT NULL,
		[P2_C1_STR] [varchar](255) NOT NULL,
		[P2_C2_STR] [varchar](255) NOT NULL,
		[P3_C1_STR] [varchar](255) NOT NULL,
		[P3_C2_STR] [varchar](255) NOT NULL,
		[P4_C1_STR] [varchar](255) NOT NULL,
		[P4_C2_STR] [varchar](255) NOT NULL,
		[P5_C1_STR] [varchar](255) NOT NULL,
		[P5_C2_STR] [varchar](255) NOT NULL,
		[P6_C1_STR] [varchar](255) NOT NULL,
		[P6_C2_STR] [varchar](255) NOT NULL,
		[P7_C1_STR] [varchar](255) NOT NULL,
		[P7_C2_STR] [varchar](255) NOT NULL,
		[P8_C1_STR] [varchar](255) NOT NULL,
		[P8_C2_STR] [varchar](255) NOT NULL,
		[Flop_C1_STR] [varchar](255) NOT NULL,
		[Flop_C2_STR] [varchar](255) NOT NULL,
		[Flop_C3_STR] [varchar](255) NOT NULL,
		[Turn_C1_STR] [varchar](255) NOT NULL,
		[River_C1_STR] [varchar](255) NOT NULL,
		[Player_Count] [tinyint] NOT NULL,
		[P1_C1] [tinyint] NOT NULL,
		[P1_C2] [tinyint] NOT NULL,
		[P2_C1] [tinyint] NOT NULL,
		[P2_C2] [tinyint] NOT NULL,
		[P3_C1] [tinyint] NULL,
		[P3_C2] [tinyint] NULL,
		[P4_C1] [tinyint] NULL,
		[P4_C2] [tinyint] NULL,
		[P5_C1] [tinyint] NULL,
		[P5_C2] [tinyint] NULL,
		[P6_C1] [tinyint] NULL,
		[P6_C2] [tinyint] NULL,
		[P7_C1] [tinyint] NULL,
		[P7_C2] [tinyint] NULL,
		[P8_C1] [tinyint] NULL,
		[P8_C2] [tinyint] NULL,
		[P9_C1] [tinyint] NULL,
		[P9_C2] [tinyint] NULL,
		[P10_C1] [tinyint] NULL,
		[P10_C2] [tinyint] NULL,
		[Flop_B] [tinyint] NOT NULL,
		[Flop_C1] [tinyint] NOT NULL,
		[Flop_C2] [tinyint] NOT NULL,
		[Flop_C3] [tinyint] NOT NULL,
		[Turn_B] [tinyint] NOT NULL,
		[Turn_C1] [tinyint] NOT NULL,
		[River_B] [tinyint] NOT NULL,
		[River_C1] [tinyint] NOT NULL,
		[HANDS_STR] [varchar](255) NOT NULL,
		[P1_F_RK] [int] NULL,
		[P2_F_RK] [int] NULL,
		[P3_F_RK] [int] NULL,
		[P4_F_RK] [int] NULL,
		[P5_F_RK] [int] NULL,
		[P6_F_RK] [int] NULL,
		[P7_F_RK] [int] NULL,
		[P8_F_RK] [int] NULL,
		[P1_T_RK] [int] NULL,
		[P2_T_RK] [int] NULL,
		[P3_T_RK] [int] NULL,
		[P4_T_RK] [int] NULL,
		[P5_T_RK] [int] NULL,
		[P6_T_RK] [int] NULL,
		[P7_T_RK] [int] NULL,
		[P8_T_RK] [int] NULL,
		[P1_R_RK] [int] NULL,
		[P2_R_RK] [int] NULL,
		[P3_R_RK] [int] NULL,
		[P4_R_RK] [int] NULL,
		[P5_R_RK] [int] NULL,
		[P6_R_RK] [int] NULL,
		[P7_R_RK] [int] NULL,
		[P8_R_RK] [int] NULL
	)
	;

	DECLARE @V_Insert_Count bigint = 0
		   ,@V_Total_Insert_Count bigint = 0
	;

	WHILE @V_Insert_Count > 0 OR @V_Total_Insert_Count = 0
	BEGIN
	    INSERT INTO #tmp_TC_P8_RHand
				   ([HandID]
				   ,[P1_C1_STR]
				   ,[P1_C2_STR]
				   ,[P2_C1_STR]
				   ,[P2_C2_STR]
				   ,[P3_C1_STR]
				   ,[P3_C2_STR]
				   ,[P4_C1_STR]
				   ,[P4_C2_STR]
				   ,[P5_C1_STR]
				   ,[P5_C2_STR]
				   ,[P6_C1_STR]
				   ,[P6_C2_STR]
				   ,[P7_C1_STR]
				   ,[P7_C2_STR]
				   ,[P8_C1_STR]
				   ,[P8_C2_STR]
				   ,[Flop_C1_STR]
				   ,[Flop_C2_STR]
				   ,[Flop_C3_STR]
				   ,[Turn_C1_STR]
				   ,[River_C1_STR]
				   ,[Player_Count]
				   ,[P1_C1]
				   ,[P1_C2]
				   ,[P2_C1]
				   ,[P2_C2]
				   ,[P3_C1]
				   ,[P3_C2]
				   ,[P4_C1]
				   ,[P4_C2]
				   ,[P5_C1]
				   ,[P5_C2]
				   ,[P6_C1]
				   ,[P6_C2]
				   ,[P7_C1]
				   ,[P7_C2]
				   ,[P8_C1]
				   ,[P8_C2]
				   ,[P9_C1]
				   ,[P9_C2]
				   ,[P10_C1]
				   ,[P10_C2]
				   ,[Flop_B]
				   ,[Flop_C1]
				   ,[Flop_C2]
				   ,[Flop_C3]
				   ,[Turn_B]
				   ,[Turn_C1]
				   ,[River_B]
				   ,[River_C1]
				   ,[HANDS_STR]
				   ,[P1_F_RK]
				   ,[P2_F_RK]
				   ,[P3_F_RK]
				   ,[P4_F_RK]
				   ,[P5_F_RK]
				   ,[P6_F_RK]
				   ,[P7_F_RK]
				   ,[P8_F_RK]
				   ,[P1_T_RK]
				   ,[P2_T_RK]
				   ,[P3_T_RK]
				   ,[P4_T_RK]
				   ,[P5_T_RK]
				   ,[P6_T_RK]
				   ,[P7_T_RK]
				   ,[P8_T_RK]
				   ,[P1_R_RK]
				   ,[P2_R_RK]
				   ,[P3_R_RK]
				   ,[P4_R_RK]
				   ,[P5_R_RK]
				   ,[P6_R_RK]
				   ,[P7_R_RK]
				   ,[P8_R_RK])
		  SELECT TOP 100
				 [HandID]
				,[P1_C1_STR]
				,[P1_C2_STR]
				,[P2_C1_STR]
				,[P2_C2_STR]
				,[P3_C1_STR]
				,[P3_C2_STR]
				,[P4_C1_STR]
				,[P4_C2_STR]
				,[P5_C1_STR]
				,[P5_C2_STR]
				,[P6_C1_STR]
				,[P6_C2_STR]
				,[P7_C1_STR]
				,[P7_C2_STR]
				,[P8_C1_STR]
				,[P8_C2_STR]
				,[Flop_C1_STR]
				,[Flop_C2_STR]
				,[Flop_C3_STR]
				,[Turn_C1_STR]
				,[River_C1_STR]
				,[Player_Count]
				,[P1_C1]
				,[P1_C2]
				,[P2_C1]
				,[P2_C2]
				,[P3_C1]
				,[P3_C2]
				,[P4_C1]
				,[P4_C2]
				,[P5_C1]
				,[P5_C2]
				,[P6_C1]
				,[P6_C2]
				,[P7_C1]
				,[P7_C2]
				,[P8_C1]
				,[P8_C2]
				,[P9_C1]
				,[P9_C2]
				,[P10_C1]
				,[P10_C2]
				,[Flop_B]
				,[Flop_C1]
				,[Flop_C2]
				,[Flop_C3]
				,[Turn_B]
				,[Turn_C1]
				,[River_B]
				,[River_C1]
				,[HANDS_STR]
				,[P1_F_RK]
				,[P2_F_RK]
				,[P3_F_RK]
				,[P4_F_RK]
				,[P5_F_RK]
				,[P6_F_RK]
				,[P7_F_RK]
				,[P8_F_RK]
				,[P1_T_RK]
				,[P2_T_RK]
				,[P3_T_RK]
				,[P4_T_RK]
				,[P5_T_RK]
				,[P6_T_RK]
				,[P7_T_RK]
				,[P8_T_RK]
				,[P1_R_RK]
				,[P2_R_RK]
				,[P3_R_RK]
				,[P4_R_RK]
				,[P5_R_RK]
				,[P6_R_RK]
				,[P7_R_RK]
				,[P8_R_RK]
		  FROM [dbo].[vw_P8]
		 WHERE 1=1
		   AND [HandID] % 2 = (@P_Thread_id - 1)
		   AND [HandID] NOT IN (SELECT [HandID] FROM [dbo].[TC_P8_RHand])
		   AND [HandID] NOT IN (SELECT [HandID] FROM #tmp_TC_P8_RHand)
		 ;

		 SET @V_Insert_Count = @@ROWCOUNT
		 SET @V_Total_Insert_Count = @V_Total_Insert_Count + @V_Insert_Count

		 IF @V_Insert_Count>0
		 BEGIN
			 INSERT INTO [dbo].[TC_P8_RHand]
					   ([HandID]
					   ,[P1_C1_STR]
					   ,[P1_C2_STR]
					   ,[P2_C1_STR]
					   ,[P2_C2_STR]
					   ,[P3_C1_STR]
					   ,[P3_C2_STR]
					   ,[P4_C1_STR]
					   ,[P4_C2_STR]
					   ,[P5_C1_STR]
					   ,[P5_C2_STR]
					   ,[P6_C1_STR]
					   ,[P6_C2_STR]
					   ,[P7_C1_STR]
					   ,[P7_C2_STR]
					   ,[P8_C1_STR]
					   ,[P8_C2_STR]
					   ,[Flop_C1_STR]
					   ,[Flop_C2_STR]
					   ,[Flop_C3_STR]
					   ,[Turn_C1_STR]
					   ,[River_C1_STR]
					   ,[Player_Count]
					   ,[P1_C1]
					   ,[P1_C2]
					   ,[P2_C1]
					   ,[P2_C2]
					   ,[P3_C1]
					   ,[P3_C2]
					   ,[P4_C1]
					   ,[P4_C2]
					   ,[P5_C1]
					   ,[P5_C2]
					   ,[P6_C1]
					   ,[P6_C2]
					   ,[P7_C1]
					   ,[P7_C2]
					   ,[P8_C1]
					   ,[P8_C2]
					   ,[P9_C1]
					   ,[P9_C2]
					   ,[P10_C1]
					   ,[P10_C2]
					   ,[Flop_B]
					   ,[Flop_C1]
					   ,[Flop_C2]
					   ,[Flop_C3]
					   ,[Turn_B]
					   ,[Turn_C1]
					   ,[River_B]
					   ,[River_C1]
					   ,[HANDS_STR]
					   ,[P1_F_RK]
					   ,[P2_F_RK]
					   ,[P3_F_RK]
					   ,[P4_F_RK]
					   ,[P5_F_RK]
					   ,[P6_F_RK]
					   ,[P7_F_RK]
					   ,[P8_F_RK]
					   ,[P1_T_RK]
					   ,[P2_T_RK]
					   ,[P3_T_RK]
					   ,[P4_T_RK]
					   ,[P5_T_RK]
					   ,[P6_T_RK]
					   ,[P7_T_RK]
					   ,[P8_T_RK]
					   ,[P1_R_RK]
					   ,[P2_R_RK]
					   ,[P3_R_RK]
					   ,[P4_R_RK]
					   ,[P5_R_RK]
					   ,[P6_R_RK]
					   ,[P7_R_RK]
					   ,[P8_R_RK])
			   SELECT [HandID]
					   ,[P1_C1_STR]
					   ,[P1_C2_STR]
					   ,[P2_C1_STR]
					   ,[P2_C2_STR]
					   ,[P3_C1_STR]
					   ,[P3_C2_STR]
					   ,[P4_C1_STR]
					   ,[P4_C2_STR]
					   ,[P5_C1_STR]
					   ,[P5_C2_STR]
					   ,[P6_C1_STR]
					   ,[P6_C2_STR]
					   ,[P7_C1_STR]
					   ,[P7_C2_STR]
					   ,[P8_C1_STR]
					   ,[P8_C2_STR]
					   ,[Flop_C1_STR]
					   ,[Flop_C2_STR]
					   ,[Flop_C3_STR]
					   ,[Turn_C1_STR]
					   ,[River_C1_STR]
					   ,[Player_Count]
					   ,[P1_C1]
					   ,[P1_C2]
					   ,[P2_C1]
					   ,[P2_C2]
					   ,[P3_C1]
					   ,[P3_C2]
					   ,[P4_C1]
					   ,[P4_C2]
					   ,[P5_C1]
					   ,[P5_C2]
					   ,[P6_C1]
					   ,[P6_C2]
					   ,[P7_C1]
					   ,[P7_C2]
					   ,[P8_C1]
					   ,[P8_C2]
					   ,[P9_C1]
					   ,[P9_C2]
					   ,[P10_C1]
					   ,[P10_C2]
					   ,[Flop_B]
					   ,[Flop_C1]
					   ,[Flop_C2]
					   ,[Flop_C3]
					   ,[Turn_B]
					   ,[Turn_C1]
					   ,[River_B]
					   ,[River_C1]
					   ,[HANDS_STR]
					   ,[P1_F_RK]
					   ,[P2_F_RK]
					   ,[P3_F_RK]
					   ,[P4_F_RK]
					   ,[P5_F_RK]
					   ,[P6_F_RK]
					   ,[P7_F_RK]
					   ,[P8_F_RK]
					   ,[P1_T_RK]
					   ,[P2_T_RK]
					   ,[P3_T_RK]
					   ,[P4_T_RK]
					   ,[P5_T_RK]
					   ,[P6_T_RK]
					   ,[P7_T_RK]
					   ,[P8_T_RK]
					   ,[P1_R_RK]
					   ,[P2_R_RK]
					   ,[P3_R_RK]
					   ,[P4_R_RK]
					   ,[P5_R_RK]
					   ,[P6_R_RK]
					   ,[P7_R_RK]
					   ,[P8_R_RK]
				   FROM #tmp_TC_P8_RHand
				  WHERE 1=1
				    AND [HandID] NOT IN (SELECT [HandID] FROM [dbo].[TC_P8_RHand])
			 ;

			 TRUNCATE TABLE #tmp_TC_P8_RHand
			 ;
		 END

		 PRINT(@V_Insert_Count)
	END
END
GO
