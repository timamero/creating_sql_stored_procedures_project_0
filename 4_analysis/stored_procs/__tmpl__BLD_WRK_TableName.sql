USE [OFFICESUPPLIES]
GO
/****** Object:  StoredProcedure [dbo].[__tmpl__BLD_WRK_TableName]    Script Date: 4/6/2020 6:41:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	RAW -> WRK
-- Mod Date:
-- =============================================
ALTER PROC [dbo].[__tmpl__BLD_WRK_TableName]

AS
BEGIN

-- =============================================
-- CREATE TABLE
-- =============================================
IF OBJECT_ID('WRK_TableName') IS NOT NULL
DROP TABLE [WRK_TableName]

-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE [WRK_TableName]
(
	[Row Number]		INT IDENTITY(1,1)
	,[AAA]				VARCHAR(100)
	,[BBB]				VARCHAR(1000)
	,[DDD]				DATE
	,[EEE]				INT
	,[FFF]				FLOAT
)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_TableName]

-- =============================================
-- INSERT INTO
-- =============================================
INSERT INTO [WRK_TableName]
(		
	[AAA]				
	,[BBB]				
	,[DDD]				
	,[EEE]				
	,[FFF]						
)
SELECT
	[xAAA]				
	,[xBBB]				
	,[xDDD]				
	,[xEEE]				
	,[xFFF]	
FROM RAW_TableName_YYYYMMDD
--(x rows affected)

END

/* Checks:
SELECT * FROM RAW_TableName_YYYYMMDD

SELECT * FROM WRK_TableName

SELECT COUNT(*) FROM WRK_TableName

*/
