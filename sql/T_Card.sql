USE [Poker]
GO

DROP TABLE IF EXISTS [dbo].[T_Card]
;

CREATE TABLE [dbo].[T_Card](
	[CID] tinyint NOT NULL,
	[STR] VARCHAR(255) NOT NULL,
	CONSTRAINT PK_T_Card PRIMARY KEY CLUSTERED (CID)
) ON [PRIMARY]
GO


