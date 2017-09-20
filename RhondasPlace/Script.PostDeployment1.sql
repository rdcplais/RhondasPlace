/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


MERGE INTO Scent AS Target
USING (VALUES 
        (1, 'Abercrombie', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 'None', 0,0), 
        (2, 'Amber Romance', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 'None', 0,0), 
        (3, 'Apple Cinnamon', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 'None', 0,0)
)
AS Source (ScentID, ScentName, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, Season, IsSeasonal, IsDeleted)
ON Target.ScentID = Source.ScentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (ScentName, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, Season, IsSeasonal, IsDeleted)
VALUES (ScentName, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, Season, IsSeasonal, IsDeleted);

MERGE INTO Lid AS Target
USING (VALUES 
(1, 'Bronze', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0),
(2, 'Gold', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0),
(3,'Silver', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0)
)
AS Source (LidID, LidDescription, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted)
ON Target.LidID = Source.LidID
WHEN NOT MATCHED BY TARGET THEN
INSERT (LidDescription, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted)
VALUES (LidDescription, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted);

MERGE INTO Image AS Target
USING (VALUES 
(1, ' ~\Images\Jar Candle2.png' , GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0),
(2, '~\Images\Jar Candle.jpg', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0),
(3, '~\Images\untitled.png', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0)
)
AS Source (ImageID, ImageURL, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted)
ON Target.ImageID = Source.ImageID
WHEN NOT MATCHED BY TARGET THEN
INSERT (ImageURL, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted)
VALUES (ImageURL, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted);

MERGE INTO CandleType AS Target
USING (VALUES 
(1, 'Jar',GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 'Jar', 0),
(2, 'Pillar', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 'Pillar', 0),
(3, 'Square', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 'Square', 0)
)
AS Source (CandleTypeID, CandleDescription, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, CandleType, IsDeleted)
ON Target.CandleTypeID = Source.CandleTypeID
WHEN NOT MATCHED BY TARGET THEN
INSERT (CandleDescription, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, CandleType, IsDeleted)
VALUES (CandleDescription, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, CandleType, IsDeleted);

MERGE INTO CandleSize AS Target
USING (VALUES 
(1, 'Jelly',GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 8, 'oz', 0),
(2, 'Classic', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 12, 'oz', 0),
(3, 'Classic', GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 16, 'oz', 0)
)
AS Source (CandleSizeID, CandleName, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, Size, Unit, IsDeleted)
ON Target.CandleSizeID = Source.CandleSizeID
WHEN NOT MATCHED BY TARGET THEN
INSERT (CandleName, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, Size, Unit, IsDeleted)
VALUES (CandleName, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, Size, Unit, IsDeleted);

MERGE INTO Candle AS Target 
USING (VALUES 
        (1, 1, 1, 1, 1, 1, GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0, 8.00), 
        (2, 2, 1, 2, 2, 1, GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0, 13.00), 
        (3, 3, 1, 3,3,  1, GETDATE(), 'rplaisance', GETDATE(), 'rplaisance', 0, 16.00)
) 
AS Source (CandleID, ImageID, CandleTypeID, CandleSizeID, ScentID, LidID, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted, Price) 
ON Target.CandleID = Source.CandleID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ImageID, CandleTypeID, CandleSizeID, ScentID, LidID, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted, Price) 
VALUES (ImageID, CandleTypeID, CandleSizeID, ScentID, LidID, AddDateTime, AddUserName, LastUpdateTime, LastUpdateUserName, IsDeleted, Price);

