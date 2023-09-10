USE [Poker]
GO

DROP TABLE IF EXISTS [dbo].[T_RHand]
;

CREATE TABLE [dbo].[T_RHand](
    [HandID] BIGINT IDENTITY(1,1) NOT NULL,
	[Player_Count] tinyint NOT NULL,
	[P1_C1] tinyint NOT NULL,
	[P1_C2] tinyint NOT NULL,
	[P2_C1] tinyint NOT NULL,
	[P2_C2] tinyint NOT NULL,
	[P3_C1] tinyint,
	[P3_C2] tinyint,
	[P4_C1] tinyint,
	[P4_C2] tinyint,
	[P5_C1] tinyint,
	[P5_C2] tinyint,
	[P6_C1] tinyint,
	[P6_C2] tinyint,
	[P7_C1] tinyint,
	[P7_C2] tinyint,
	[P8_C1] tinyint,
	[P8_C2] tinyint,
	[P9_C1] tinyint,
	[P9_C2] tinyint,
	[P10_C1] tinyint,
	[P10_C2] tinyint,
	[Flop_B] tinyint NOT NULL, 
	[Flop_C1] tinyint NOT NULL, 
	[Flop_C2] tinyint NOT NULL, 
	[Flop_C3] tinyint NOT NULL, 
	[Turn_B] tinyint NOT NULL, 
	[Turn_C1] tinyint NOT NULL, 
	[River_B] tinyint NOT NULL, 
	[River_C1] tinyint NOT NULL, 
	[STR] VARCHAR(255) NOT NULL
) ON [PRIMARY]
GO



