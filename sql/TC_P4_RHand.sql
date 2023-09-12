USE [Poker]
GO

/****** Object:  Table [dbo].[TC_P4_RHand]    Script Date: 9/12/2023 6:56:07 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TC_P4_RHand]') AND type in (N'U'))
DROP TABLE [dbo].[TC_P4_RHand]
GO

/****** Object:  Table [dbo].[TC_P4_RHand]    Script Date: 9/12/2023 6:56:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TC_P4_RHand](
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
) ON [PRIMARY]
GO


