USE [Poker]
GO

/****** Object:  Table [dbo].[TC_P3_RHand]    Script Date: 9/10/2023 10:04:06 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TC_P3_RHand]') AND type in (N'U'))
DROP TABLE [dbo].[TC_P3_RHand]
GO

/****** Object:  Table [dbo].[TC_P3_RHand]    Script Date: 9/10/2023 10:04:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TC_P3_RHand](
	[HandID] [bigint] NOT NULL,
	[P1_C1_STR] [varchar](255) NOT NULL,
	[P1_C2_STR] [varchar](255) NOT NULL,
	[P2_C1_STR] [varchar](255) NOT NULL,
	[P2_C2_STR] [varchar](255) NOT NULL,
	[P3_C1_STR] [varchar](255) NOT NULL,
	[P3_C2_STR] [varchar](255) NOT NULL,
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
	[P1_T_RK] [int] NULL,
	[P2_T_RK] [int] NULL,
	[P3_T_RK] [int] NULL,
	[P1_R_RK] [int] NULL,
	[P2_R_RK] [int] NULL,
	[P3_R_RK] [int] NULL,
) ON [PRIMARY]
GO

/****** Object:  Index [UIDX_TC_P8_RHand]    Script Date: 9/10/2023 10:05:01 AM ******/
CREATE UNIQUE CLUSTERED INDEX [UIDX_TC_P3_RHand] ON [dbo].[TC_P3_RHand]
(
	[HandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

