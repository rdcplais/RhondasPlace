CREATE TABLE [dbo].[Candle]
(
	[CandleID]             INT     IDENTITY(1,1) NOT NULL,
	[ImageID]              INT NOT NULL,
	[CandleTypeID]         INT NOT NULL,
	[CandleSizeID]         INT NOT NULL,
	[ScentID]              INT NOT NULL,
	[LidID]                INT NOT NULL,
	[AddDateTime]          DATETIME NOT NULL,
	[AddUserName]          NVARCHAR(50) NOT NULL,
	[LastUpdateTime]       DATETIME NOT NULL,
	[LastUpdateUserName]   NVARCHAR(50) NOT NULL,
	[IsDeleted]            BIT NOT NULL,
	[Price]                DECIMAL NOT NULL,
	PRIMARY KEY CLUSTERED([CandleID] ASC),
	CONSTRAINT [FK_dbo.Image_dbo.Image_ImageID] FOREIGN KEY ([ImageID])
	REFERENCES [dbo].[Image] ([ImageID]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.CandleType_dbo.CandleType_CandleTypeID] FOREIGN KEY ([CandleTypeID])
	REFERENCES [dbo].[CandleType] ([CandleTypeID]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.CandleSize_dbo.CandleSize_CandleSizeID] FOREIGN KEY ([CandleSizeID])
	REFERENCES [dbo].[CandleSize] ([CandleSizeID]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.Scent_dbo.Scent_ScentID] FOREIGN KEY ([ScentID])
	REFERENCES [dbo].[Scent] ([ScentID]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.Lid_dbo.Lid_LidID] FOREIGN KEY ([LidID])
	REFERENCES [dbo].[Lid] ([LidID]) ON DELETE CASCADE

)
