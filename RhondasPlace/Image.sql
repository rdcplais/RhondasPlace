CREATE TABLE [dbo].[Image]
(
	[ImageID]              INT IDENTITY(1,1) NOT NULL,
	[ImageURL]             VARCHAR(100) NOT NULL,
	[AddDateTime]          DATETIME NOT NULL,
	[AddUserName]          NVARCHAR(50) NOT NULL,
	[LastUpdateTime]       DATETIME NOT NULL,
	[LastUpdateUserName]   NVARCHAR(50) NOT NULL,
	[IsDeleted]            BIT NOT NULL,
	PRIMARY KEY CLUSTERED ([ImageID] ASC)

)
