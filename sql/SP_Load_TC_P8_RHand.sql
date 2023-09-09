-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.SP_Load_TC_P8_RHand
AS
BEGIN

	DECLARE @V_Insert_Count bigint = 0
		   ,@V_Total_Insert_Count bigint = 0
	;

	WHILE @V_Insert_Count > 0 OR @V_Total_Insert_Count = 0
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
		 WHERE [HandID] NOT IN (SELECT [HandID] FROM [dbo].[TC_P8_RHand])
		 ;

		 SET @V_Insert_Count = @@ROWCOUNT
		 SET @V_Total_Insert_Count = @V_Total_Insert_Count + @V_Insert_Count

		 PRINT(@V_Insert_Count)
	END
END
GO
