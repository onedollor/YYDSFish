USE [Poker]
GO

/****** Object:  StoredProcedure [dbo].[SP_Load_TC_P4_RHand]    Script Date: 9/12/2023 7:18:16 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Load_TC_P4_RHand]
GO

/****** Object:  StoredProcedure [dbo].[SP_Load_TC_P4_RHand]    Script Date: 9/12/2023 7:18:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Load_TC_P4_RHand]
(@P_Thread_id int)
AS
BEGIN
	IF @P_Thread_id NOT IN (0,1,2)
		RETURN

	DROP TABLE IF EXISTS #tmp_TC_P4_RHand
	;

	CREATE TABLE #tmp_TC_P4_RHand(
		[HandID] [bigint] NOT NULL,
		[P1_C1_STR] [varchar](255) NOT NULL,
		[P1_C2_STR] [varchar](255) NOT NULL,
		[P2_C1_STR] [varchar](255) NOT NULL,
		[P2_C2_STR] [varchar](255) NOT NULL,
		[P3_C1_STR] [varchar](255) NOT NULL,
		[P3_C2_STR] [varchar](255) NOT NULL,
		[P4_C1_STR] [varchar](255) NOT NULL,
		[P4_C2_STR] [varchar](255) NOT NULL,
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
		[P1_T_RK] [int] NULL,
		[P2_T_RK] [int] NULL,
		[P3_T_RK] [int] NULL,
		[P4_T_RK] [int] NULL,
		[P1_R_RK] [int] NULL,
		[P2_R_RK] [int] NULL,
		[P3_R_RK] [int] NULL,
		[P4_R_RK] [int] NULL
	)
	;

	DECLARE @V_Insert_Count bigint = 0
		   ,@V_Total_Insert_Count bigint = 0
	;

	WHILE @V_Insert_Count > 0 OR @V_Total_Insert_Count = 0
	BEGIN
	    INSERT INTO #tmp_TC_P4_RHand
				   ([HandID]
				   ,[P1_C1_STR]
				   ,[P1_C2_STR]
				   ,[P2_C1_STR]
				   ,[P2_C2_STR]
				   ,[P3_C1_STR]
				   ,[P3_C2_STR]
				   ,[P4_C1_STR]
				   ,[P4_C2_STR]
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
				   ,[P1_T_RK]
				   ,[P2_T_RK]
				   ,[P3_T_RK]
				   ,[P4_T_RK]
				   ,[P1_R_RK]
				   ,[P2_R_RK]
				   ,[P3_R_RK]
				   ,[P4_R_RK])
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
				,[P1_T_RK]
				,[P2_T_RK]
				,[P3_T_RK]
				,[P4_T_RK]
				,[P1_R_RK]
				,[P2_R_RK]
				,[P3_R_RK]
				,[P4_R_RK]
		  FROM [dbo].[vw_P4]
		 WHERE 1=1
		   AND (@P_Thread_id =0 OR [HandID] % 2 = (@P_Thread_id - 1))
		   AND [HandID] NOT IN (SELECT [HandID] FROM [dbo].[TC_P4_RHand])
		   AND [HandID] NOT IN (SELECT [HandID] FROM #tmp_TC_P4_RHand)
		 ;

		 SET @V_Insert_Count = @@ROWCOUNT
		 SET @V_Total_Insert_Count = @V_Total_Insert_Count + @V_Insert_Count

		 IF @V_Insert_Count>0
		 BEGIN
			 INSERT INTO [dbo].[TC_P4_RHand]
					   ([HandID]
					   ,[P1_C1_STR]
					   ,[P1_C2_STR]
					   ,[P2_C1_STR]
					   ,[P2_C2_STR]
					   ,[P3_C1_STR]
					   ,[P3_C2_STR]
					   ,[P4_C1_STR]
					   ,[P4_C2_STR]
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
					   ,[P1_T_RK]
					   ,[P2_T_RK]
					   ,[P3_T_RK]
					   ,[P4_T_RK]
					   ,[P1_R_RK]
					   ,[P2_R_RK]
					   ,[P3_R_RK]
					   ,[P4_R_RK])
			   SELECT [HandID]
					   ,[P1_C1_STR]
					   ,[P1_C2_STR]
					   ,[P2_C1_STR]
					   ,[P2_C2_STR]
					   ,[P3_C1_STR]
					   ,[P3_C2_STR]
					   ,[P4_C1_STR]
					   ,[P4_C2_STR]
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
					   ,[P1_T_RK]
					   ,[P2_T_RK]
					   ,[P3_T_RK]
					   ,[P4_T_RK]
					   ,[P1_R_RK]
					   ,[P2_R_RK]
					   ,[P3_R_RK]
					   ,[P4_R_RK]
				   FROM #tmp_TC_P4_RHand
				  WHERE 1=1
				    AND [HandID] NOT IN (SELECT [HandID] FROM [dbo].[TC_P4_RHand])
			 ;

			 TRUNCATE TABLE #tmp_TC_P4_RHand
			 ;
		 END

		 PRINT(@V_Insert_Count)
	END
END
GO


