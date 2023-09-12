USE [Poker]
GO

/****** Object:  Table [dbo].[T_RHand_3MAX]    Script Date: 9/10/2023 10:02:59 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_RHand_3MAX]') AND type in (N'U'))
DROP TABLE [dbo].[T_RHand_3MAX]
GO

/****** Object:  Table [dbo].[T_RHand_3MAX]    Script Date: 9/10/2023 10:02:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_RHand_3MAX](
	[HandID] [bigint] IDENTITY(1,1) NOT NULL,
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
	[STR] [varchar](255) NOT NULL
) ON [PRIMARY]
GO


