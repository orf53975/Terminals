USE [{DATABASE_NAME}]
GO
/****** Object:  StoredProcedure [dbo].[InsertCredentials]    Script Date: 12/10/2012 22:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCredentials]
	(
  @Name nvarchar(255),
  @UserName nvarchar(255),
  @Domain nvarchar(255),
  @EncryptedPassword nvarchar(max)
	)
AS
  declare @CredentialsBaseId int  
  
  insert into CredentialBase 
  (UserName, Domain, EncryptedPassword)
  values  
  (@UserName, @Domain, @EncryptedPassword)

  set @CredentialsBaseId = SCOPE_IDENTITY()

  insert into Credentials 
  (Name, Id)
  values  
  (@Name, @CredentialsBaseId)

select @CredentialsBaseId as Id
GO
