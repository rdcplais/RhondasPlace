CREATE TABLE [dbo].[CandleSize]
(
	[CandleSizeID]         INT                IDENTITY(1,1) NOT NULL,
	[CandleName]          NVARCHAR(50) NOT NULL,
	[AddDateTime]          DATETIME NOT NULL,
	[AddUserName]          NVARCHAR(50) NOT NULL,
	[LastUpdateTime]       DATETIME NOT NULL,
	[LastUpdateUserName]   NVARCHAR(50) NOT NULL,
	[Size]                 INT NOT NULL,
	[Unit]                 NVARCHAR(50) NOT NULL,
	[IsDeleted]            BIT NOT NULL,
	PRIMARY KEY CLUSTERED([CandleSizeID] ASC)
)
