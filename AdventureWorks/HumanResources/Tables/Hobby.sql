CREATE TABLE [HumanResources].[Hobby] (
    [HobbyId] INT           IDENTITY (1, 1) NOT NULL,
    [Hobby]   NVARCHAR (50) NOT NULL,
    [Active]  BIT           CONSTRAINT [DF_Hobby_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Hobby] PRIMARY KEY CLUSTERED ([HobbyId] ASC)
);

