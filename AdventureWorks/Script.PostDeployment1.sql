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

IF ('$(Environment)' = 'dev')
BEGIN
MERGE INTO [HumanResources].[Hobby] AS target
using 
(	values
	 (N'Rugby', 1)
	,(N'Football', 1)
	,(N'Knitting', 1)
	,(N'Walking', 1)
	,(N'Hiking', 1)
	,(N'Baking', 1)
	,(N'Reading', 1)
)	as source ([Hobby], [Active])
	on target.Hobby= source.Hobby
WHEN NOT MATCHED BY TARGET THEN
	INSERT ( [Hobby], [Active])
	VALUES (Hobby, Active)
WHEN MATCHED THEN
	UPDATE SET 
		Target.Hobby = Source.Hobby,
		Target.Active = Source.Active
WHEN NOT MATCHED BY SOURCE THEN
	DELETE
;

END