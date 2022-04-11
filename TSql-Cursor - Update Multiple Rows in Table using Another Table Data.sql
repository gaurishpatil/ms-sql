-- =============================================
-- Author: []
-- Create date: []
-- Description:	[]
-- =============================================

USE [DatabaseName];

DECLARE @VARIABLE1 INT;
DECLARE @VARIABLE2 varchar(max);
DECLARE @VARIABLE3 NUMERIC(8,0);

DECLARE [CURSOR_NAME] CURSOR FOR
	SELECT @VARIABLE1
		, @VARIABLE2
		, @VARIABLE3		
	FROM [TABLE]
	WHERE [COLUMN_C] = 408 -- 
	ORDER BY COLUMN_A,COLUMN_B ASC;

BEGIN TRY;
BEGIN TRANSACTION;

OPEN [CURSOR_NAME];
FETCH NEXT FROM [CURSOR_NAME] INTO @VARIABLE1, @VARIABLE2, @VARIABLE3;
WHILE @@FETCH_STATUS = 0
BEGIN
	-- PRINT @VARIABLE1;
	UPDATE [TABLE_B] 
		SET [COLUMN_C] = @VARIABLE1
	WHERE [COLUMN_A] = [VALUE];

    FETCH NEXT FROM [CURSOR_NAME] INTO @VARIABLE1, @VARIABLE2, @VARIABLE3;
END

-- close and deallocate cursor
CLOSE [CURSOR_NAME];
DEALLOCATE [CURSOR_NAME];
ROLLBACK TRAN;
-- COMMIT;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

    -- Use RAISERROR inside the CATCH block to return error  
    -- information about the original error that caused  
    -- execution to jump to the CATCH block.  
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH