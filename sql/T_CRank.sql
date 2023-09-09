USE [Poker]
GO

DROP TABLE IF EXISTS [dbo].[T_CRank]
;

CREATE TABLE [dbo].[T_CRank](
	[C1] tinyint NOT NULL,
	[C2] tinyint NOT NULL,
	[C3] tinyint NOT NULL,
	[C4] tinyint NOT NULL,
	[C5] tinyint NOT NULL,
    [R] int NOT NULL,
	[STR] VARCHAR(255) NOT NULL,
	CONSTRAINT PK_T_CRank PRIMARY KEY CLUSTERED (C1,C2,C3,C4,C5)
) ON [PRIMARY]
GO


