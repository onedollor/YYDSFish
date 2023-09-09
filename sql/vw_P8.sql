USE [Poker]
GO

DROP VIEW IF EXISTS dbo.vw_P8
Go

CREATE VIEW dbo.vw_P8
AS
SELECT RH.[HandID]
      ,P1_C1.[STR] AS P1_C1_STR
	  ,P1_C2.[STR] AS P1_C2_STR
      ,P2_C1.[STR] AS P2_C1_STR
	  ,P2_C2.[STR] AS P2_C2_STR
      ,P3_C1.[STR] AS P3_C1_STR
	  ,P3_C2.[STR] AS P3_C2_STR
      ,P4_C1.[STR] AS P4_C1_STR
	  ,P4_C2.[STR] AS P4_C2_STR
      ,P5_C1.[STR] AS P5_C1_STR
	  ,P5_C2.[STR] AS P5_C2_STR
      ,P6_C1.[STR] AS P6_C1_STR
	  ,P6_C2.[STR] AS P6_C2_STR
      ,P7_C1.[STR] AS P7_C1_STR
	  ,P7_C2.[STR] AS P7_C2_STR
      ,P8_C1.[STR] AS P8_C1_STR
	  ,P8_C2.[STR] AS P8_C2_STR
	  ,Flop_C1.[STR] AS Flop_C1_STR
	  ,Flop_C2.[STR] AS Flop_C2_STR
	  ,Flop_C3.[STR] AS Flop_C3_STR
	  ,Turn_C1.[STR] AS Turn_C1_STR
	  ,River_C1.[STR] AS River_C1_STR
	  ,RH.[Player_Count]
      ,RH.[P1_C1]
      ,RH.[P1_C2]
      ,RH.[P2_C1]
      ,RH.[P2_C2]
      ,RH.[P3_C1]
      ,RH.[P3_C2]
      ,RH.[P4_C1]
      ,RH.[P4_C2]
      ,RH.[P5_C1]
      ,RH.[P5_C2]
      ,RH.[P6_C1]
      ,RH.[P6_C2]
      ,RH.[P7_C1]
      ,RH.[P7_C2]
      ,RH.[P8_C1]
      ,RH.[P8_C2]
      ,RH.[P9_C1]
      ,RH.[P9_C2]
      ,RH.[P10_C1]
      ,RH.[P10_C2]
      ,RH.[Flop_B]
      ,RH.[Flop_C1]
      ,RH.[Flop_C2]
      ,RH.[Flop_C3]
      ,RH.[Turn_B]
      ,RH.[Turn_C1]
      ,RH.[River_B]
      ,RH.[River_C1]
      ,RH.[STR] AS HANDS_STR

	  ,[dbo].[fc_max_rank]([P1_C1],[P1_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P1_F_RK
	  ,[dbo].[fc_max_rank]([P2_C1],[P2_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P2_F_RK
	  ,[dbo].[fc_max_rank]([P3_C1],[P3_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P3_F_RK
	  ,[dbo].[fc_max_rank]([P4_C1],[P4_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P4_F_RK
	  ,[dbo].[fc_max_rank]([P5_C1],[P5_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P5_F_RK
	  ,[dbo].[fc_max_rank]([P6_C1],[P6_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P6_F_RK
	  ,[dbo].[fc_max_rank]([P7_C1],[P7_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P7_F_RK
	  ,[dbo].[fc_max_rank]([P8_C1],[P8_C2],[Flop_C1],[Flop_C2],[Flop_C3],NULL,NULL) AS P8_F_RK

	  ,[dbo].[fc_max_rank]([P1_C1],[P1_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P1_T_RK
	  ,[dbo].[fc_max_rank]([P2_C1],[P2_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P2_T_RK
	  ,[dbo].[fc_max_rank]([P3_C1],[P3_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P3_T_RK
	  ,[dbo].[fc_max_rank]([P4_C1],[P4_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P4_T_RK
	  ,[dbo].[fc_max_rank]([P5_C1],[P5_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P5_T_RK
	  ,[dbo].[fc_max_rank]([P6_C1],[P6_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P6_T_RK
	  ,[dbo].[fc_max_rank]([P7_C1],[P7_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P7_T_RK
	  ,[dbo].[fc_max_rank]([P8_C1],[P8_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],NULL) AS P8_T_RK

	  ,[dbo].[fc_max_rank]([P1_C1],[P1_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P1_R_RK
	  ,[dbo].[fc_max_rank]([P2_C1],[P2_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P2_R_RK
	  ,[dbo].[fc_max_rank]([P3_C1],[P3_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P3_R_RK
	  ,[dbo].[fc_max_rank]([P4_C1],[P4_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P4_R_RK
	  ,[dbo].[fc_max_rank]([P5_C1],[P5_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P5_R_RK
	  ,[dbo].[fc_max_rank]([P6_C1],[P6_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P6_R_RK
	  ,[dbo].[fc_max_rank]([P7_C1],[P7_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P7_R_RK
	  ,[dbo].[fc_max_rank]([P8_C1],[P8_C2],[Flop_C1],[Flop_C2],[Flop_C3],[Turn_C1],[River_C1]) AS P8_R_RK
  FROM [dbo].[T_RHand] RH
  JOIN [dbo].[T_Card] P1_C1
    ON RH.[P1_C1]=P1_C1.[CID]
  JOIN [dbo].[T_Card] P1_C2
    ON RH.[P1_C2]=P1_C2.[CID]
  JOIN [dbo].[T_Card] P2_C1
    ON RH.[P2_C1]=P2_C1.[CID]
  JOIN [dbo].[T_Card] P2_C2
    ON RH.[P2_C2]=P2_C2.[CID]
  JOIN [dbo].[T_Card] P3_C1
    ON RH.[P3_C1]=P3_C1.[CID]
  JOIN [dbo].[T_Card] P3_C2
    ON RH.[P3_C2]=P3_C2.[CID]
  JOIN [dbo].[T_Card] P4_C1
    ON RH.[P4_C1]=P4_C1.[CID]
  JOIN [dbo].[T_Card] P4_C2
    ON RH.[P4_C2]=P4_C2.[CID]
  JOIN [dbo].[T_Card] P5_C1
    ON RH.[P5_C1]=P5_C1.[CID]
  JOIN [dbo].[T_Card] P5_C2
    ON RH.[P5_C2]=P5_C2.[CID]
  JOIN [dbo].[T_Card] P6_C1
    ON RH.[P6_C1]=P6_C1.[CID]
  JOIN [dbo].[T_Card] P6_C2
    ON RH.[P6_C2]=P6_C2.[CID]
  JOIN [dbo].[T_Card] P7_C1
    ON RH.[P7_C1]=P7_C1.[CID]
  JOIN [dbo].[T_Card] P7_C2
    ON RH.[P7_C2]=P7_C2.[CID]
  JOIN [dbo].[T_Card] P8_C1
    ON RH.[P8_C1]=P8_C1.[CID]
  JOIN [dbo].[T_Card] P8_C2
    ON RH.[P8_C2]=P8_C2.[CID]
  JOIN [dbo].[T_Card] Flop_C1
    ON RH.[Flop_C1]=Flop_C1.[CID]
  JOIN [dbo].[T_Card] Flop_C2
    ON RH.[Flop_C2]=Flop_C2.[CID]
  JOIN [dbo].[T_Card] Flop_C3
    ON RH.[Flop_C3]=Flop_C3.[CID]
  JOIN [dbo].[T_Card] Turn_C1
    ON RH.[Turn_C1]=Turn_C1.[CID]
  JOIN [dbo].[T_Card] River_C1
    ON RH.[River_C1]=River_C1.[CID]
 WHERE 1=1
   AND RH.[Player_Count] = 8
;
GO
