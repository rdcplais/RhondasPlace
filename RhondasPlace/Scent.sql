CREATE TABLE [dbo].[Scent]
(
	[ScentID]               INT             IDENTITY(1,1)  NOT NULL,
	[ScentName]             VARCHAR(50) NOT NULL,
	[AddDateTime]           DATETIME NOT NULL,
	[AddUserName]           NVARCHAR(50) NOT NULL,
	[LastUpdateTime]        DATETIME NOT NULL,
	[LastUpdateUserName]    NVARCHAR(50) NOT NULL,
	[Season]                NVARCHAR(50) NOT NULL,
	[IsSeasonal]            BIT NOT NULL,
	[IsDeleted]             BIT NOT NULL,
	PRIMARY KEY CLUSTERED ([ScentID] ASC)
)
