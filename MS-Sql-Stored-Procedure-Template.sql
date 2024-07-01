-- =============================================
-- Author:	[]
-- Create date: []
-- Description:	[]
-- =============================================

USE [DatabaseName]
GO
	SET ANSI_NULLS 		  ON
	SET QUOTED_IDENTIFIER 	  ON	
	SET ANSI_PADDING 	  ON
	SET ANSI_WARNINGS 	  ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = '[Stored Procedure Name]')
       EXEC('CREATE PROCEDURE dbo.[Stored Procedure Name] AS BEGIN SET NOCOUNT ON;END')

GO
ALTER PROCEDURE [Stored Procedure Name]
-- pass the parameters for the stored procedure here
	@variableName AS varchar(max) = NULL
AS
BEGIN
DECLARE @variable1 nvarchar(4000)


--Make sure drop temp tables
DROP TABLE #TempTable1,##TempTable2

END
GO
