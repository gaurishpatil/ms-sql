-- =============================================
-- Author:	[]
-- Create date: []
-- Description:	[]
-- =============================================

USE [DatabaseName]
GO
	SET ANSI_NULLS 		  ON
	SET QUOTED_IDENTIFIER ON	
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.[Function Name]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT')) 
BEGIN
    EXECUTE('
        CREATE FUNCTION dbo.[Function Name]() RETURNS VARCHAR(10) AS BEGIN RETURN 123 END 
    ')
END 
GO

ALTER FUNCTION dbo.[Function Name](@variable1 INT, @variable2 DATE)
	RETURNS VARCHAR(10) AS
BEGIN
-- DECLARE @variable1 INT, @variable2 DATE
-- SELECT @variable1=75, @variable1='2020-09-25'

END
GO