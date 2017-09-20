CREATE TABLE [dbo].[CandleType]
(
	[CandleTypeID]             INT                IDENTITY(1,1) NOT NULL,
	[CandleDescription]          NVARCHAR(50) NOT NULL,
	[AddDateTime]          DATETIME NOT NULL,
	[AddUserName]          NVARCHAR(50) NOT NULL,
	[LastUpdateTime]       DATETIME NOT NULL,
	[LastUpdateUserName]   NVARCHAR(50) NOT NULL,
	[CandleType]           NVARCHAR(50) NOT NULL,
	[IsDeleted]            BIT NOT NULL,
	PRIMARY KEY CLUSTERED([CandleTypeID] ASC)
)
